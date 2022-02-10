defmodule Dealcloud.Impl.Schema.TimeZones do
  @name "timezones"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)
end
