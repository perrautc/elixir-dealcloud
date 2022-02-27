defmodule Dealcloud.Impl.Schema.EntryTypes do
  @moduledoc false
  @name "entrytypes"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)

  @spec get(String.t() | integer, Dealcloud.Auth.t()) :: any
  def get(type, config), do: [@name, "#{type}"] |> Schema.get(config)

  @spec fields(String.t() | integer, Dealcloud.Auth.t()) :: any
  def fields(type, config),
    do: [@name, "#{type}", "fields"] |> Schema.get(config)
end
