defmodule Dealcloud.Data.PostQuery do
  defstruct query: nil,
            fields: [],
            limit: 100,
            skip: 0,
            resolveReferenceUrls: true,
            wrapIntoArrays: true
end
