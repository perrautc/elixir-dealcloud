defmodule Dealcloud.Impl.Management.License do
  alias Dealcloud.Impl.Management
  alias Dealcloud.Auth
  @name "userlicense"
  @spec get(integer, Auth.t()) :: any
  def get(query, config), do: [@name, query] |> Management.get(%{}, config)

  def licenses(query, config), do: [@name <> "s"] |> Management.get(query, config)

  def licenses(config), do: %Dealcloud.Management.UserQuery{} |> licenses(config)

  @spec put(UserLicense.t(), Auth.t()) :: :ok
  def put(userLicense, config), do: [@name] |> Management.put(userLicense, %{}, config)
end
