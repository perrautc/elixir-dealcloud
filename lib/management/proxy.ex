defmodule Dealcloud.Management.Proxy do
  @type t :: %__MODULE__{
          proxyUserId: integer,
          userIds: List.t(integer)
        }
  defstruct userIds: [], proxyUserId: nil
end
