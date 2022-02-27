defmodule Dealcloud.Data.ModifiedQuery do
  @moduledoc false
  defstruct modifiedSince:
              DateTime.utc_now() |> DateTime.add(900, :second) |> DateTime.to_iso8601()
end
