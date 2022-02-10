defmodule Dealcloud.Schema.SystemEntryTypes do
  @name "systementrytypes"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)
end
