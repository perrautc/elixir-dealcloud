defmodule Dealcloud.Marketing.Activity do
  @moduledoc false
  @type t :: %__MODULE__  {
    externalRecipientId: integer,
    externalEventId: String.t(),
    communicationId: integer,
    activityType: integer,
    description: String.t(),
    timestamp: Date.t(),
    summary: String.t()
  }
  defstruct externalRecipientId: nil,
    externalEventId: nil,
    communicationId: nil,
    activityType: nil,
    description: nil,
    timestamp: nil,
    summary: nil
end
