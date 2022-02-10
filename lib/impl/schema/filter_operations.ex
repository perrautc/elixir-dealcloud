defmodule Dealcloud.Impl.Schema.FilterOperations do
  @name "filteroperations"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)
end
