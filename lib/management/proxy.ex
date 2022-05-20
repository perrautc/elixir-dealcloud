defmodule Dealcloud.Management.Proxy do
  @moduledoc false
  @type t :: %__MODULE__{
          proxyUserId: integer,
          userIds: list(integer)
        }
  @derive Jason.Encoder
  defstruct userIds: [], proxyUserId: nil
end
