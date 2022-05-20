defmodule Dealcloud.Management.ActivityQuery do
  @moduledoc false
  @type t :: %__MODULE__{
          userIds: list,
          dateFrom: Date.t(),
          dateTo: Date.t(),
          activity: integer,
          source: integer
        }
  @derive {Jason.Encoder, only: [:userIds, :dateFrom, :dateTo, :activity, :source]}
  defstruct userIds: [], dateFrom: nil, dateTo: nil, activity: nil, source: nil
end
