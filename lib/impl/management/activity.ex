defmodule Dealcloud.Impl.Management.Activity do
  alias Dealcloud.Impl

  @name "activity"

  def post(body, query, config) do
    Impl.post(body, query, config)
    |> url()
    |> Impl.make_request(&process_data/2)
  end

  def post(body, config) do
    post(body, %Dealcloud.Management.UserQuery{}, config)
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
