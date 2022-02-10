defmodule Dealcloud.Management.ActivityQuery do
  @type t :: %__MODULE__{
          userIds: List.t(),
          dateFrom: Date.t(),
          dateTo: Date.t(),
          activity: integer,
          source: integer
        }
  defstruct userIds: [], dateFrom: nil, dateTo: nil, activity: nil, source: nil
end
