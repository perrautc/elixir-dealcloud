defmodule Dealcloud.Impl.Management.User do
  @moduledoc false
  alias Dealcloud.Impl.Management
  alias Dealcloud.Management.User
  @name "user"

  @doc """
  Takes a integer representing the user's Id and returns the user

    ## Examples
    get_by_id(1, Dealcloud.Auth)
  """
  @spec get_by_id(integer, Dealcloud.Auth) :: list(User)
  def get_by_id(userId, config) when is_integer(userId),
    do: [userId] |> get_by_ids(config)

  @doc """
  Takes a list of integers representing the user's Id and returns the users

    ## Examples
    get_by_ids([1,2,3], Dealcloud.Auth)
  """
  @spec get_by_ids(list(integer), Dealcloud.Auth) :: list(User)
  def get_by_ids(userIds, config), do: [@name <> "s"] |> Management.post(userIds, %{}, config)

  @doc """
  Takes a query containing either the user's email address or a dateTime, attempts to
  find the user or return all user modified since the dateTime provided

    ## Examples
    get(%Dealcloud.Management.Query{email: "test@email.com"}, Dealcloud.Auth)
    or
    get(%Dealcloud.Management.Query{ModifiedSince: "2019-07-15T15:53:00.050Z"}, Dealcloud.Auth)
  """
  @spec get(Dealcloud.Management.Query | integer, Dealcloud.Auth) :: list[User]
  def get(params, config), do: [@name] |> Management.get(params, config)

  @spec post(list[User], Dealcloud.Auth) :: list[User]
  def post(body, config), do: [@name] |> Management.post(body, %{}, config)

  @spec put(list[User], Dealcloud.Auth) :: list[User]
  def put(body, config), do: [@name] |> Management.put(body, %{}, config)

  @spec delete(integer | String.t(), Dealcloud.Auth) :: any
  def delete(userId, config), do: [@name, userId] |> Management.delete(config)
end
