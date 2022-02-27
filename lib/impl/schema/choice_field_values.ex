defmodule Dealcloud.Impl.Schema.ChoiceFieldValues do
  @moduledoc false
  @name "choiceFieldValues"
  alias Dealcloud.Impl.Schema

  def post(fieldId, body, config), do: ["#{fieldId}", @name] |> Schema.post(body, config)
end
