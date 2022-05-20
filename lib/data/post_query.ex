defmodule Dealcloud.Data.PostQuery do
  @moduledoc false
  @type t :: %__MODULE__{
    query: any,
    fields: list(integer),
    limit: integer,
    skip: integer,
    resolveReferenceUrls: boolean,
    wrapIntoArrays: boolean
  }
  @derive Jason.Encoder
  defstruct query: nil,
            fields: [],
            limit: 100,
            skip: 0,
            resolveReferenceUrls: true,
            wrapIntoArrays: true
end
