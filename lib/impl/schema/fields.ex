defmodule Dealcloud.Impl.Schema.Fields do
  @moduledoc false
  @name "fields"
  alias Dealcloud.Impl.Schema
  defstruct fieldIds: nil
  @spec get_fields(list(integer), Dealcloud.Auth.t()) :: any
  def get_fields(fields, config) when is_list(fields) do
    query = fields |> Enum.join("&fieldIds=")
    [@name] |> Schema.get(%__MODULE__{fieldIds: query}, config)
  end

  @spec get_field(integer, Dealcloud.Auth.t()) :: any
  def get_field(fieldId, config), do: [@name, "#{fieldId}"] |> Schema.get(config)
end
