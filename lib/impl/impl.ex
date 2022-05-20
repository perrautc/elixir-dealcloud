defmodule Dealcloud.Impl do
  @moduledoc false
  defstruct [:requestType, :url, :config, params: %{}, body: [], data: []]

  @type t :: %__MODULE__{
          requestType: atom,
          url: String.t(),
          config: Dealcloud.Auth,
          params: %{},
          body: list | %{},
          data: list
        }
  def get(id, config) when is_integer(id), do: get(%{}, config)

  def get(query, config), do: any(:get, [], query, config)
  def delete(id, config) when is_integer(id), do: get(%{}, config)

  def delete(query, config), do: any(:delete, [], query, config)

  def post(body, params, config), do: any(:post, body, params, config)

  def post(body, config), do: post(body, %{}, config)

  def put(body, params, config), do: any(:put, body, params, config)
  def put(body, config), do: put(body, %{}, config)
  def patch(body, params, config), do: any(:patch, body, params, config)
  def patch(body, config), do: patch(body, %{}, config)

  defp any(requestType, body, params, config) do
    %__MODULE__{
      body: body,
      params: params,
      requestType: requestType,
      config: config
    }
  end

  defp headers(config) do
    %{
      "Authorization" => "Bearer #{config.access_token}",
      "Accept" => "Application/json; Charset=utf-8",
      "Content-Type" => "application/json; charset=utf-8"
    }
  end

  defp to_params(map) when map == %{}, do: []

  defp to_params(%{__struct__: _} = params), do: Map.to_list(params) |> tl()

  defp to_params(params), do: Map.to_list(params)

  def make_request(
        p = %{
          config: config,
          requestType: requestType,
          url: url,
          body: body,
          params: params
        },
        dataProcessor \\ &process_data/2
      ) do
    case Req.request(
           requestType,
           url,
           body: body,
           headers: headers(config),
           params: to_params(params)
         ) do
      {:ok, response} ->
        process_status_code(response, p, dataProcessor)

      response ->
        response
    end
  end

  defp process_status_code(response, %{config: config} = p, dataProcessor) do
    case response.status do
      200 ->
        response.body |> dataProcessor.(p)

      204 ->
        :ok

      429 ->
        Process.sleep(500)
        make_request(p, dataProcessor)

      401 ->
        config = Dealcloud.Auth.refresh(config)
        make_request(%{p | config: config}, dataProcessor)

      _ ->
        {:error, response}
    end
  end

  defp process_data(body, _p), do: {:ok, body}
  def url(parts), do: Enum.join(parts, "/")
end
