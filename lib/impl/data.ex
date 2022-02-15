defmodule Dealcloud.Impl.Data do
  alias Dealcloud.Impl

  @moduledoc """
  Data contains all apis needed to work with data in dealcloud

  With these APIs you are able to:
  1. Create, Update, Get, Delete records
  2. Create, Update, Get, Delete files
  """
  def url(p = %{config: config}) do
    %{p | url: "#{config.site}/#{config.data_url}"}
  end

  def get(paths, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :get,
      params: params,
      config: config,
      url: ([config.site, config.data_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def post(paths, body, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :post,
      params: params,
      body: body,
      config: config,
      url: ([config.site, config.data_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def put(paths, body, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :put,
      params: params,
      body: body,
      config: config,
      url: ([config.site, config.data_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def patch(paths, body, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :patch,
      params: params,
      body: body,
      config: config,
      url: ([config.site, config.data_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def delete(paths, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :delete,
      params: %{},
      body: nil,
      config: config,
      url: ([config.site, config.data_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  defp process_data(%{"rows" => rows}, p) when rows == [], do: p.data

  defp process_data(%{"rows" => rows}, p = %{data: data, params: params}) do
    %{p | params: %{params | skip: p.params.skip + params.limit}, data: data ++ rows}
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body
end
