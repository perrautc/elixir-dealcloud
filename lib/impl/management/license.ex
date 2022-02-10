defmodule Dealcloud.Impl.Management.License do
  alias Dealcloud.Auth
  alias Dealcloud.Impl
  @name "userlicense"
  @spec get(integer, Auth.t()) :: any
  def get(userId, config) do
    Impl.get(userId, config)
    |> url("/#{userId}")
    |> Impl.make_request(&process_data/2)
  end

  def licenses(query, c) do
    Impl.get(query, c)
    |> url("s")
    |> Impl.make_request(&process_data/2)
  end

  def licenses(config) do
    %Dealcloud.Management.UserQuery{} |> licenses(config)
  end

  @spec put(UserLicense.t(), Auth.t()) :: :ok
  def put(userLicense, config) do
    Impl.put(userLicense, config)
    |> url()
    |> Impl.make_request(&process_data/2)
  end

  defp url(p = %{config: config}) do
    %{p | url: "#{config.site}/#{config.user_url}/#{@name}"}
  end

  defp url(p, extra) do
    p = url(p)
    %{p | url: p.url <> extra}
  end

  defp process_data([], p), do: p.data

  defp process_data(body, _p = %{params: params, requestType: :get})
       when params == %{} do
    [body]
  end

  defp process_data(body, p = %{data: data, params: params, requestType: :get}) do
    %{p | params: %{params | pageNumber: params.pageNumber + 1}, data: data ++ body}
    |> Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body
end
