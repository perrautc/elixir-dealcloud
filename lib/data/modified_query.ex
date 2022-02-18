defmodule Dealcloud.Data.ModifiedQuery do
  defstruct modifiedSince:
              DateTime.utc_now() |> DateTime.add(900, :second) |> DateTime.to_iso8601()
end
