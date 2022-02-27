defmodule Dealcloud.Management.ActivityQuery do
  @moduledoc false
  @type t :: %__MODULE__{
          userIds: list,
          dateFrom: Date.t(),
          dateTo: Date.t(),
          activity: integer,
          source: integer
        }
  defstruct userIds: [], dateFrom: nil, dateTo: nil, activity: nil, source: nil
end
