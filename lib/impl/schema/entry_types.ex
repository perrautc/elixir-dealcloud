defmodule Dealcloud.Impl.Schema.EntryTypes do
  @name "entrytypes"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)

  @spec get(String.t() | integer, Dealcloud.Auth.t()) :: any
  def get(type, config = %Dealcloud.Auth{}),
    do: Dealcloud.Impl.Schema.get(config, "/#{type}", @name)

  @spec fields(String.t() | integer, Dealcloud.Auth.t()) :: any
  def fields(type, config = %Dealcloud.Auth{}),
    do: Dealcloud.Impl.Schema.get(config, "/#{type}/fields", @name)
end
