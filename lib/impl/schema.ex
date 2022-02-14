defmodule Dealcloud.Impl.Schema do
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

  def get(paths, config) do
        %Dealcloud.Impl{
      requestType: :get,
      params: %{},
      config: config,
      url:  [config.site, config.schema_url] ++ paths |> Impl.url
    } |> Impl.make_request(&Impl.process_data/2)
  end
  def post(paths, body, config) do
    %Dealcloud.Impl{
      requestType: :post,
      params: %{},
      body: body,
      config: config,
      url:  [config.site, config.schema_url] ++ paths |> Impl.url
    } |> Impl.make_request(&Impl.process_data/2)
  end
end
