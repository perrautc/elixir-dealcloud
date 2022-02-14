defmodule Dealcloud.Schema.SystemEntryTypes do
  @name "systementrytypes"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)
end
