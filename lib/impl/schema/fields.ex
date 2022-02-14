defmodule Dealcloud.Impl.Schema.Fields do
  @name "fields"
  alias Dealcloud.Impl.Schema
  @spec get(any, Dealcloud.Auth.t()) :: any
  def get(fieldId, config)
      when is_bitstring(fieldId) or is_integer(fieldId),
      do: [@name,"#{fieldId}"] |> Schema.get(config)

  def get(fields, config) do
    query = fields |> Enum.join("&fieldIds=")

    Schema.get([@name <> "?fieldids=#{query}"], config)
  end
end
