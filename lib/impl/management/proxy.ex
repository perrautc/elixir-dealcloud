defmodule Dealcloud.Impl.Management.Proxy do
  alias Dealcloud.Management.{ProxyQuery, Proxy}
  alias Dealcloud.Auth
  alias Dealcloud.Impl

  @name "proxy"

  @spec get(ProxyQuery.t(), Auth.t()) :: List.t()
  def get(query, config) do
    Impl.get(query, config)
    |> url()
    |> Impl.make_request(&process_data/2)
  end

  @spec post(Proxy.t(), Auth.t()) :: List.t()
  def post(body, config) do
    Impl.post(body, config)
    |> url()
    |> Impl.make_request(&process_data/2)
  end

  defp url(p = %{config: config}) do
    %{p | url: "#{config.site}/#{config.user_url}/user/#{@name}"}
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
