defmodule Dealcloud.Impl.Data.RowData do
  alias Dealcloud.Impl.Data
  @name "rows"
  @spec get(any, Dealcloud.Data.Query.t(), Dealcloud.Auth.t()) :: any
  def get(type, params, config), do: ["entrydata", @name, type] |> Data.get(params, config)

  def patch(type, body, config),
    do: ["entrydata", @name, type] |> Data.patch(body, %{}, config)

  def put(type, body, config), do: ["entrydata", @name, type] |> Data.put(body, %{}, config)

  def post(type, body, config), do: ["entrydata", @name, type] |> Data.post(body, %{}, config)

  @spec query(any, Dealcloud.Data.PostQuery.t(), Dealcloud.Auth.t()) :: any
  def query(type, body, config),
    do: ["entrydata", @name, "query", type] |> Data.post(body, %{}, config)
end
