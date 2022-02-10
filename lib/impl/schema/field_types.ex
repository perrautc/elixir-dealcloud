defmodule Dealcloud.Impl.Schema.FieldTypes do
  @name "fieldtypes"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)
end
