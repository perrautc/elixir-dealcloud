defmodule Dealcloud.Impl.Management.Group do
  alias Dealcloud.Management.{UserQuery}
  alias Dealcloud.Auth
  alias Dealcloud.Impl

  @name "group"
  @spec get(integer, Auth.t()) :: any
  def get(groupId, config) do
    Impl.get(groupId, config)
    |> url("/#{groupId}")
    |> Impl.make_request(&process_data/2)
  end

  @spec groups(Dealcloud.Auth.t()) :: any
  def groups(c) do
    groups(%UserQuery{}, c)
  end

  defp groups(query, c) do
    Impl.get(query, c)
    |> url()
    |> Impl.make_request(&process_data/2)
  end

  defp url(p = %{config: config}) do
    %{p | url: "#{config.site}/#{config.user_url}/user/#{@name}"}
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
