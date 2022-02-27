defmodule Dealcloud.Management.User do
  @moduledoc false
  @type t :: %__MODULE__{
          createdDate: Date.t(),
          createdBy: integer,
          modifiedDate: Date.t(),
          modifiedBy: integer,
          id: integer,
          isLocked: boolean,
          isActive: boolean,
          email: String.t(),
          firstName: String.t(),
          lastName: String.t(),
          federationId: String.t(),
          group: list[integer]
        }
  defstruct createdDate: nil,
            createdBy: nil,
            modifiedDate: nil,
            modifiedBy: nil,
            id: nil,
            isLocked: nil,
            isActive: nil,
            email: nil,
            firstName: nil,
            lastName: nil,
            federationId: nil,
            group: []
end
