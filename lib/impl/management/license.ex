defmodule Dealcloud.Impl.Management.License do
  @moduledoc false
  alias Dealcloud.Impl.Management
  alias Dealcloud.Auth
  @name "userlicense"
  @spec get(integer, Auth) :: any
  def get(query, config), do: [@name, query] |> Management.get(%{}, config)

  @spec licenses(any, Auth) :: any
  def licenses(query, config), do: [@name <> "s"] |> Management.get(query, config)

  @spec licenses(Dealcloud.Auth) :: any
  def licenses(config), do: %Dealcloud.Management.Query{} |> licenses(config)

  @spec put(Dealcloud.Management.License, Auth) :: :ok
  def put(userLicense, config), do: [@name] |> Management.put(userLicense, %{}, config)
end
