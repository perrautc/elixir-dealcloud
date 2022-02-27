defmodule Dealcloud.Impl.Auth do
  @moduledoc false
  alias Dealcloud.Auth

  @spec token(Dealcloud.Auth.t()) :: Dealcloud.Auth.t()
  def token(config = %Auth{client_id: client_id, client_secret: client_secret}) do
    %{
      "scope" => "data user_management exchange api provider_sync",
      "grant_type" => "client_credentials",
      "client_id" => client_id,
      "client_secret" => client_secret
    }
    |> make_request(config)
  end

  @spec refresh(Dealcloud.Auth.t()) :: Dealcloud.Auth.t()
  def refresh(
        config = %Auth{
          client_id: client_id,
          client_secret: client_secret,
          refresh_token: refresh_token
        }
      ) do
    %{
      "refresh_token" => refresh_token,
      "grant_type" => "refresh_token",
      "client_id" => client_id,
      "client_secret" => client_secret
    }
    |> make_request(config)
  end

  defp make_request(body, config) do
    url = "#{config.site}/#{config.token_url}"

    {:ok, r} =
      HTTPoison.request(:post, url, URI.encode_query(body), %{
        "Content-Type" => "application/x-www-form-urlencoded"
      })

    r |> process_status_code(config)
  end

  defp process_status_code(response = %{body: body, status_code: status_code}, config) do
    case status_code do
      200 ->
        body
        |> Poison.decode!()
        |> config(config)

      500 ->
        token(config)

      400 ->
        token(config)

      _ ->
        raise(response)
    end
  end

  defp config(body, config) do
    %{
      config
      | access_token: body["access_token"],
        expires_in: body["expires_in"],
        refresh_token: body["refresh_token"],
        token_type: body["token_type"]
    }
  end
end
