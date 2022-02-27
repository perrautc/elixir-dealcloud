defmodule Dealcloud.Management do
  alias Dealcloud.Impl.Management

  @type user :: %Dealcloud.Management.User{}
  @type query :: %Dealcloud.Management.Query{}
  @type proxy :: %Dealcloud.Management.Proxy{}
  @type proxyQuery :: %Dealcloud.Management.ProxyQuery{}
  @type license :: %Dealcloud.Management.License{}
  @type activityQuery :: %Dealcloud.Management.ActivityQuery{}
  @moduledoc """
  Management contains all of the apis needed to work with users

  With these APIs you are able to:
  1. Get Users, ~> By email, By modified data, by Id
  2. Create Users
  3. Update users ~> change users names, active/inactive, change email addresses, change user permissions
  4. Delete users
  5. Get User groups
  6. Get user group details
  7. Get user activities
  8. Get proxy assignments
  9. Create proxy assignments
  """
  @doc """
  Takes a query containing either the user's email address or a dateTime, attempts to
  find the user or return all user modified since the dateTime provided

  ## Examples
      iex> Dealcloud.Management.get_user(%Dealcloud.Management.Query{email: "test@email.com"}, Dealcloud.Auth)
    or
      iex> Dealcloud.Management.get_user(%Dealcloud.Management.Query{ModifiedSince: "2019-07-15T15:53:00.050Z"}, Dealcloud.Auth)
  """
  @spec get_user(Dealcloud.Management.Query, Dealcloud.Auth) :: any
  defdelegate get_user(param, config), to: Management.User, as: :get

  @doc """
  Takes a integer representing the user's Id and returns the user

  ## Examples
      iex> Dealcloud.Management.user_get_by_id(1, Dealcloud.Auth)
  """
  @spec user_get_by_id(integer, Dealcloud.Auth) :: any
  defdelegate user_get_by_id(param, config), to: Management.User, as: :get_by_id

  @doc """
  Takes a list of integers representing the user's Id and returns the users

  ## Examples
      Dealcloud.Management.get_by_ids([1,2,3], Dealcloud.Auth)
  """
  @spec get_by_ids(list(integer), Dealcloud.Auth) :: any
  defdelegate get_by_ids(param, config), to: Management.User, as: :get_by_ids

  @doc """
  Takes a list of `Dealcloud.Management.user()` and creates them as new

  ## Examples
      Dealcloud.Management.create_users([%User{ firstName: "James", lastName: "King", email: "kingj@basketball.com"}], Dealcloud.Auth)
  """
  @spec create_users(list(User), Dealcloud.Auth) :: any
  defdelegate create_users(body, config), to: Management.User, as: :post

  @doc """
  Takes a list of `Dealcloud.Management.user()` and updates them

  ## Examples
      Dealcloud.Management.update_users([%User{ id: 1, firstName: "James", lastName: "King", email: "kingj@basketball.com"}], Dealcloud.Auth)
  """
  @spec update_user(integer, Dealcloud.Auth) :: any
  defdelegate update_user(body, config), to: Management.User, as: :put

  @doc """
  Takes a user id and deletes the associated user

  ## Examples
      Dealcloud.Management.delete_users(1, Dealcloud.Auth)
  """
  @spec delete_user(binary, Dealcloud.Auth) :: any
  defdelegate delete_user(userId, config), to: Management.User, as: :delete
  ################################################################
  @doc """
  These are the user group APIs
  ## Examples
      Dealcloud.Management.get_user_group(1, Dealcloud.Auth)
  """
  @spec get_user_group(integer, Dealcloud.Auth) :: any
  defdelegate get_user_group(groupId, config), to: Management.Group, as: :get

  @doc """
  These are the user group APIs

  ## Examples
      Dealcloud.Management.get_user_groups(Dealcloud.Auth)
  """
  @spec get_user_groups(Dealcloud.Auth) :: any
  defdelegate get_user_groups(config), to: Management.Group, as: :groups
  ################################################################
  @doc """
  These are the user proxy APIs

  There are two ways to query for proxies, you can search by user or by the proxy

  ## Examples
      Dealcloud.Management.get_user_proxy(%Dealcloud.Management.ProxyQuery{proxyQuery: "test@user.com"}, Dealcloud.Auth)
      Dealcloud.Management.get_user_proxy(%Dealcloud.Management.ProxyQuery{userQuery: "test@user.com"}, Dealcloud.Auth)
  """
  @spec get_user_proxy(Dealcloud.Management.ProxyQuery, Dealcloud.Auth) :: any
  defdelegate get_user_proxy(query, config), to: Management.Proxy, as: :get

  @doc """
  This creates new proxy assignments. There's no way to update an existing proxy assignments. Proxy assignments can be replaced

  ## Examples
      Dealcloud.Management.get_user_proxy(%Dealcloud.Management.Proxy{proxyUserId: 1, userIds: [2,3,4]}, Dealcloud.Auth)
  """
  @spec create_user_proxy(Dealcloud.Management.Proxy, Dealcloud.Auth) :: any
  defdelegate create_user_proxy(body, config), to: Management.Proxy, as: :post
  ################################################################
  @doc """
  These are the user license APIs
  ## Examples
      Dealcloud.Management.get_user_license(1, Dealcloud.Auth)
  """
  @spec get_user_license(integer, Dealcloud.Auth) :: any
  defdelegate get_user_license(userId, config), to: Management.License, as: :get

  @doc """
  Update licenses
  ## Examples
      Dealcloud.Management.update_user_license(%Dealcloud.Management.License{userId: 1, licenseType: 1}, Dealcloud.Auth)
  """
  @spec update_user_license(Dealcloud.Management.License, Dealcloud.Auth) :: :ok
  defdelegate update_user_license(license, config), to: Management.License, as: :put

  @doc """
  Get licenses for multiple users
  ## Examples
      Dealcloud.Management.get_users_license(%Dealcloud.Management.Query{isBillable: true}, Dealcloud.Auth)
  """
  @spec get_users_license(Dealcloud.Management.Query, Dealcloud.Auth) :: any
  defdelegate get_users_license(params, config), to: Management.License, as: :licenses

  @doc """
  Get all licenses
  ## Examples
      Dealcloud.Management.get_user_license(Dealcloud.Auth)
  """
  @spec get_users_license(Dealcloud.Auth) :: any
  defdelegate get_users_license(config), to: Management.License, as: :licenses
  ################################################################
  @doc """
  These are the user activity APIs
    ## Examples
      Dealcloud.Management.get_user_activity(%Dealcloud.Management.ActivityQuery{},%Dealcloud.Management.UserQuery{}, %Dealcloud.Auth{})
  """
  @spec get_user_activity(
          Dealcloud.Management.ActivityQuery,
          Dealcloud.Management.UserQuery,
          Dealcloud.Auth
        ) :: any
  defdelegate get_user_activity(body, query, config), to: Management.Activity, as: :post

  @doc """
  These are the user activity APIs
    ## Examples
      Dealcloud.Management.get_user_activity(%Dealcloud.Management.ActivityQuery{},%Dealcloud.Auth{})
  """
  @spec get_user_activity(
          Dealcloud.Management.ActivityQuery,
          Dealcloud.Auth
        ) :: any
  defdelegate get_user_activity(body, config), to: Management.Activity, as: :post
end
