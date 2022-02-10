defmodule Dealcloud.Impl.Schema.SystemFieldTypes do
  @name "systemfieldtypes"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)
end
