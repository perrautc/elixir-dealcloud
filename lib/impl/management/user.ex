defmodule Dealcloud.Impl.Management.User do
  alias Dealcloud.Impl.Management
  alias Dealcloud.Management.User
  @name "user"

  def get_by_id(userId, config) when is_integer(userId),
    do: [userId] |> get_by_id(config)

  def get_by_id(userIds, config), do: [@name <> "s"] |> Management.post(userIds, %{}, config)

  @spec get(Dealcloud.Management.UserQuery | integer, Dealcloud.Auth) :: list[User]
  def get(params, config), do: [@name] |> Management.get(params, config)

  @spec post(list[User], Dealcloud.Auth) :: list[User]
  def post(body, config), do: [@name] |> Management.post(body, %{}, config)

  @spec put(list[User], Dealcloud.Auth) :: list[User]
  def put(body, config), do: [@name] |> Management.put(body, %{}, config)

  @spec delete(integer | String.t(), Dealcloud.Auth) :: any
  def delete(userId, config), do: [@name, userId] |> Management.delete(config)
end
