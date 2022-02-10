defmodule Dealcloud.Data.Query do
  defstruct query: nil,
            limit: 100,
            skip: 0,
            resolveReferenceUrls: true,
            wrapIntoArrays: true,
            overwriteEmptyValues: true,
            isPrivate: nil
end
