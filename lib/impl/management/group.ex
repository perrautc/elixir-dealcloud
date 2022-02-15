defmodule Dealcloud.Impl.Management.Group do
  alias Dealcloud.Impl.Management
  alias Dealcloud.Management.{UserQuery}
  alias Dealcloud.Auth

  @name "group"
  @spec get(integer, Auth.t()) :: any
  def get(groupId, config), do: ["user", @name, groupId] |> Management.get(%{}, config)

  @spec groups(Dealcloud.Auth.t()) :: any
  def groups(c), do: groups(%UserQuery{}, c)

  defp groups(query, c), do: ["user", @name] |> Management.get(query, c)
end
