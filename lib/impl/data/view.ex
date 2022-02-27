defmodule Dealcloud.Impl.Data.View do
  @moduledoc false
  alias Dealcloud.Impl.Data
  @name "view"
  def get(query, config), do: ["rows", @name] |> Data.get(query, config)

  def post(viewId, body, query, config),
    do: ["rows", @name, viewId] |> Data.post(body, query, config)
end
