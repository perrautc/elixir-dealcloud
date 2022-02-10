defmodule Dealcloud.Impl.Schema.Fields do
  @name "fields"
  @spec get(any, Dealcloud.Auth.t()) :: any
  def get(fieldId, config = %Dealcloud.Auth{})
      when is_bitstring(fieldId) or is_integer(fieldId),
      do: Dealcloud.Impl.Schema.get(config, "/#{fieldId}", @name)

  def get(fields, config = %Dealcloud.Auth{}) do
    query = fields |> Enum.join("&fieldIds=")

    Dealcloud.Impl.Schema.get(config, "?fieldids=#{query}", @name)
  end
end
