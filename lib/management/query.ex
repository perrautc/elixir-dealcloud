defmodule Dealcloud.Management.Query do
  @moduledoc false
  @type t :: %__MODULE__{
          modifiedSince: Date.t(),
          email: String.t(),
          pageNumber: integer,
          pageSize: integer,
          isBillable: boolean
        }
  defstruct modifiedSince: nil,
            email: nil,
            pageNumber: 1,
            pageSize: 1000,
            isBillable: nil
end
