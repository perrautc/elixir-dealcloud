defmodule Dealcloud.Management.License do
  defstruct userId: nil, licenseType: nil, description: nil

  @type t :: %__MODULE__{
          userId: integer,
          licenseType: integer,
          description: String.t()
        }
end