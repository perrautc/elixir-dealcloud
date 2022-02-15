defmodule Dealcloud.Impl.Management do
  alias Dealcloud.Impl

  @moduledoc """
  Management contains all of the apis needed to work with users

  With these APIs you are able to:
  1. Create Users
  2. Update users ~> change users names, active/inactive, change email addresses, change user permissions
  3. Delete users
  4. Get User groups
  5. Get user group details
  6. Get user activities
  7. Get proxy assignments
  8. Create proxy assignments
  """
  def url(p = %{config: config}, name) do
    %{p | url: "#{config.site}/#{config.user_url}/#{name}"}
  end

  def url(p, extra, name) do
    p = url(p, name)
    %{p | url: p.url <> extra}
  end

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
      url: ([config.site, config.schema_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def put(paths, body, params, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :put,
      params: params,
      body: body,
      config: config,
      url: ([config.site, config.schema_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
  end

  def delete(paths, config, dataProcessor \\ &process_data/2) do
    %Dealcloud.Impl{
      requestType: :delete,
      params: %{},
      body: nil,
      config: config,
      url: ([config.site, config.schema_url] ++ paths) |> Impl.url()
    }
    |> Impl.make_request(dataProcessor)
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
