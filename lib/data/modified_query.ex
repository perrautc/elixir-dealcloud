defmodule Dealcloud.Data.ModifiedQuery do
  @moduledoc false
  @type t :: %__MODULE__{
    modifiedSince: Date.t(),
  }
  defstruct modifiedSince:
              DateTime.utc_now() |> DateTime.add(900, :second) |> DateTime.to_iso8601()
end
