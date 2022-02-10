defmodule Dealcloud.Impl.Management do
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
end
