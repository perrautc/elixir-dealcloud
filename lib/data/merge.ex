defmodule Dealcloud.Data.Merge do
  @typedoc """
    Type that represents what a merge requests takes. The entry Id is integer and the mergeEntries is a list of integers
  """
  @type t :: %__MODULE__{
          entryId: integer,
          mergeEntries: [integer]
        }
  defstruct [:entryId, :mergeEntries]
end
