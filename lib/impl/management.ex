defmodule Dealcloud.Impl.Management do
  alias Dealcloud.Impl

  @moduledoc false

  def get(paths, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :get,
      params: params,
      config: config,
      url: ([config.site, config.user_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def post(paths, body, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :post,
      params: params,
      body: body,
      config: config,
      url: ([config.site, config.user_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def put(paths, body, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :put,
      params: params,
      body: body,
      config: config,
      url: ([config.site, config.user_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def delete(paths, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :delete,
      params: %{},
      body: nil,
      config: config,
      url: ([config.site, config.user_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  defp process_data("[]", p), do: {:ok, p.data}

  defp process_data(body, _p = %{params: params, requestType: :get})
       when params == %{} do
    {:ok, [body]}
  end

  defp process_data(body, p = %{data: data, params: params, requestType: :get}) do
    %{p | params: %{params | pageNumber: params.pageNumber + 1}, data: data ++ body}
    |> Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: {:ok, body}
end
