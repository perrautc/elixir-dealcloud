defmodule Dealcloud.Marketing.Query do
  @moduledoc false
  @type t :: %__MODULE__{
    contactId: integer,
    communicationId: integer,
    fields: any
  }
  defstruct contactId: 1, communicationId: 2, fields: nil
end
