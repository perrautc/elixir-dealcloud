defmodule Dealcloud.Data.HistoryQuery do
  @moduledoc false
  @type t :: %__MODULE__{
    entryTypeId: integer,
    fields: list(integer),
    entries: list(integer),
    fromDate: Date.t()
  }
  defstruct entryTypeId: 0, fields: [], entries: [], fromDate: nil
end
