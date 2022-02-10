defmodule Dealcloud.Management do
  alias Dealcloud.Impl.Management

  ################################################################
  @doc """
  These are the user management APIs
  """
  @spec get_user(Dealcloud.Management.UserQuery.t(), Dealcloud.Auth.t()) :: any
  defdelegate get_user(param, config), to: Management.User, as: :get
  @spec get_user_by_id(integer | List.t(integer), Dealcloud.Auth.t()) :: any
  defdelegate get_user_by_id(param, config), to: Management.User, as: :get_by_id
  @spec create_user(Dealcloud.Management.User.t(), Dealcloud.Auth.t()) :: any
  defdelegate create_user(body, config), to: Management.User, as: :post
  @spec update_user(integer, Dealcloud.Auth.t()) :: any
  defdelegate update_user(body, config), to: Management.User, as: :put
  @spec delete_user(binary, Dealcloud.Auth.t()) :: any
  defdelegate delete_user(userId, config), to: Management.User, as: :delete
  ################################################################
  @doc """
  These are the user group APIs
  """
  @spec get_user_group(integer, Dealcloud.Auth.t()) :: any
  defdelegate get_user_group(groupId, config), to: Management.Group, as: :get
  @spec get_user_groups(Dealcloud.Auth.t()) :: any
  defdelegate get_user_groups(config), to: Management.Group, as: :groups
  ################################################################
  @doc """
  These are the user proxy APIs
  """
  @spec get_user_proxy(Dealcloud.Management.ProxyQuery.t(), Dealcloud.Auth.t()) :: any
  defdelegate get_user_proxy(query, config), to: Management.Proxy, as: :get
  @spec create_user_proxy(Dealcloud.Management.Proxy.t(), Dealcloud.Auth.t()) :: any
  defdelegate create_user_proxy(body, config), to: Management.Proxy, as: :post
  ################################################################
  @doc """
  These are the user license APIs
  """
  @spec get_user_license(integer, Dealcloud.Auth.t()) :: any
  defdelegate get_user_license(userId, config), to: Management.License, as: :get
  @spec update_user_license(Dealcloud.Management.UserLicense.t(), Dealcloud.Auth.t()) :: :ok
  defdelegate update_user_license(license, config), to: Management.License, as: :put
  @spec get_users_license(Dealcloud.Management.UserQuery.t(), Dealcloud.Auth.t()) :: any
  defdelegate get_users_license(params, config), to: Management.License, as: :licenses
  defdelegate get_users_license(config), to: Management.License, as: :licenses
  ################################################################
  @doc """
  These are the user activity APIs
  """
  @spec get_user_activity(
          Dealcloud.Management.ActivityQuery.t(),
          Dealcloud.Management.UserQuery.t(),
          Dealcloud.Auth.t()
        ) :: any
  defdelegate get_user_activity(body, query, config), to: Management.Activity, as: :post

  @spec get_user_activity(
          Dealcloud.Management.ActivityQuery.t(),
          Dealcloud.Auth.t()
        ) :: any
  defdelegate get_user_activity(body, config), to: Management.Activity, as: :post
end
