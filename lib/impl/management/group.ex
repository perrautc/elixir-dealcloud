defmodule Dealcloud.Impl.Management.Group do
  @moduledoc false
  alias Dealcloud.Impl.Management
  alias Dealcloud.Management.{Query}
  alias Dealcloud.Auth

  @name "group"
  @spec get(integer, Auth) :: any
  def get(groupId, config), do: ["user", @name, groupId] |> Management.get(%{}, config)

  @spec groups(Dealcloud.Auth) :: any
  def groups(c), do: groups(%Query{}, c)

  defp groups(query, c), do: ["user", @name] |> Management.get(query, c)
end
