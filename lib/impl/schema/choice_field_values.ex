defmodule Dealcloud.Impl.Schema.ChoiceFieldValues do
  @name "choiceFieldValues"

  def post(fieldId, body, config = %Dealcloud.Auth{}) do
    Dealcloud.Impl.post(body, config)
    |> Dealcloud.Impl.Schema.url("/#{fieldId}", @name)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body
end
