defmodule Dealcloud.Impl.Schema do
  alias Dealcloud.Impl
  @moduledoc false

  def get(paths, config) do
    %Dealcloud.Impl{
      requestType: :get,
      params: %{},
      config: config,
      url: ([config.site, config.schema_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request()
  end

  def get(paths, params, config) do
    %Dealcloud.Impl{
      requestType: :get,
      params: params,
      config: config,
      url: ([config.site, config.schema_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request()
  end

  def post(paths, body, config) do
    %Dealcloud.Impl{
      requestType: :post,
      params: %{},
      body: body,
      config: config,
      url: ([config.site, config.schema_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request()
  end
end
