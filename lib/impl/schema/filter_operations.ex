defmodule Dealcloud.Impl.Schema.FilterOperations do
  @name "filteroperations"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)
end
