defmodule Dealcloud.Data.Record do
  defstruct entryId: 0,
            fieldId: 0,
            currencyCode: nil,
            rowId: 0,
            value: nil,
            ignoreNearDups: true
end
