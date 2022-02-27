defmodule Dealcloud.Impl.Data.RowData do
  @moduledoc false
  alias Dealcloud.Impl.Data
  @name "rows"
  @spec get(binary | integer, Dealcloud.Data.Query, Dealcloud.Auth) :: any
  def get(type, params, config), do: ["entrydata", @name, type] |> Data.get(params, config)

  @spec patch(binary | integer, list(map), Dealcloud.Auth) :: any
  def patch(type, body, config),
    do: ["entrydata", @name, type] |> Data.patch(body, %{}, config)

  @spec put(binary | integer, list(map), Dealcloud.Auth) :: any
  def put(type, body, config), do: ["entrydata", @name, type] |> Data.put(body, %{}, config)
  @spec post(binary | integer, list(map), Dealcloud.Auth) :: any
  def post(type, body, config), do: ["entrydata", @name, type] |> Data.post(body, %{}, config)

  @spec query(binary | integer, Dealcloud.Data.PostQuery, Dealcloud.Auth) :: any
  def query(type, body, config),
    do: ["entrydata", @name, "query", type] |> Data.post(body, %{}, config)
end
