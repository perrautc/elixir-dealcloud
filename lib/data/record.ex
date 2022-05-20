defmodule Dealcloud.Data.Record do
  @moduledoc false
  @type t :: %__MODULE__{
    entryId: integer,
    fieldId: integer,
    currencyCode: String.t(),
    rowId: integer,
    value: any,
    ignoreNearDups: boolean
  }
  @derive Jason.Encoder
  defstruct entryId: 0,
            fieldId: 0,
            currencyCode: nil,
            rowId: 0,
            value: nil,
            ignoreNearDups: true
end
