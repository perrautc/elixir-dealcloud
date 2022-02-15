defmodule Dealcloud.Impl.Management.User do
  alias Dealcloud.Impl.Management
  alias Dealcloud.Management.User
  @name "user"

  def get_by_id(userId, config) when is_integer(userId),
    do: [userId] |> get_by_id(config)

  def get_by_id(userIds, config), do: [@name <> "s"] |> Management.post(userIds, %{}, config)

  @spec get(Management.userQuery() | integer, Dealcloud.Auth.t()) :: List[User.t()]
  def get(params, config), do: [@name] |> Management.get(params, config)

  @spec post(List[User.t()], Dealcloud.Auth.t()) :: List[User.t()]
  def post(body, config), do: [@name] |> Management.post(body, %{}, config)

  @spec put(List[User.t()], Dealcloud.Auth.t()) :: List[User.t()]
  def put(body, config), do: [@name] |> Management.put(body, %{}, config)

  @spec delete(integer | String.t(), Dealcloud.Auth.t()) :: any
  def delete(userId, config), do: [@name, userId] |> Management.delete(config)
end
