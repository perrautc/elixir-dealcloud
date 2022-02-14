defmodule Dealcloud.Impl.Schema.SystemFieldTypes do
  @name "systemfieldtypes"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)
end
