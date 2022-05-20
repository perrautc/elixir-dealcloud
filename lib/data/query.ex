defmodule Dealcloud.Data.Query do
  @moduledoc false
  @type t :: %__MODULE__{
    query: any,
    limit: integer,
    skip: integer,
    resolveReferenceUrls: boolean,
    wrapIntoArrays: boolean,
    overwriteEmptyValues: boolean,
    isPrivate: boolean
  }
  @derive Jason.Encoder
  defstruct query: nil,
            limit: 100,
            skip: 0,
            resolveReferenceUrls: true,
            wrapIntoArrays: true,
            overwriteEmptyValues: true,
            isPrivate: nil
end
