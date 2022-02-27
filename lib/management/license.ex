defmodule Dealcloud.Management.License do
  @moduledoc false
  defstruct userId: nil, licenseType: nil, description: nil

  @type t :: %__MODULE__{
          userId: integer,
          licenseType: integer,
          description: String.t()
        }
end
