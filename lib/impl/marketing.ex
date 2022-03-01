defmodule Dealcloud.Impl.Marketing do
  alias Dealcloud.Impl
  @moduledoc false

  def get(paths, params, config) do
    %Dealcloud.Impl{
      requestType: :get,
      params: params,
      config: config,
      url: ([config.site, config.marketing_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request()
  end
  def patch(paths, body, config) do
    %Dealcloud.Impl{
      requestType: :patch,
      body: body,
      config: config,
      url: ([config.site, config.marketing_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request()
  end

  def post(paths, body, config) do
    %Dealcloud.Impl{
      requestType: :post,
      body: body,
      config: config,
      url: ([config.site, config.marketing_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request()
  end
end
