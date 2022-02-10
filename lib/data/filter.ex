defmodule Dealcloud.Data.Filter do
  @moduledoc """
  Handles authentication with DealCloud's API
  """
  defstruct(
    value: nil,
    valueTo: nil,
    currencyCode: nil,
    fieldId: 0,
    filterOperation: 0
  )
end
