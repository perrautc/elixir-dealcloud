defmodule Dealcloud.Impl.Schema.Fields do
  @name "fields"
  alias Dealcloud.Impl.Schema
  defstruct fieldIds: nil
  @spec get(integer | binary, Dealcloud.Auth.t()) :: any
  def get(fields, config) when is_list(fields) do
    query = fields |> Enum.join("&fieldIds=")
    [@name] |> Schema.get(%__MODULE__{fieldIds: query}, config)
  end

  def get(fieldId, config), do: [@name, "#{fieldId}"] |> Schema.get(config)
end
