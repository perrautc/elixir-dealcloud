defmodule Dealcloud.Data.Filter do
  @moduledoc false
  @derive Jason.Encoder
  defstruct(
    value: nil,
    valueTo: nil,
    currencyCode: nil,
    fieldId: 0,
    filterOperation: 0
  )
end
