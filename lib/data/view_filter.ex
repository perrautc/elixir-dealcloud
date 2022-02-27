defmodule Dealcloud.Data.ViewFilter do
  @moduledoc false
  @type t :: %__MODULE__{
          column: String.t(),
          value: any
        }
  defstruct [:column, :value]
end
