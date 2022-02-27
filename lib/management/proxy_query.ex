defmodule Dealcloud.Management.ProxyQuery do
  @moduledoc false
  @type t :: %__MODULE__{
          proxyQuery: String.t(),
          userQuery: String.t(),
          searchByName: boolean,
          pageNumber: integer,
          pageSize: integer
        }
  defstruct proxyQuery: nil, userQuery: nil, searchByName: false, pageNumber: 1, pageSize: 100
end
