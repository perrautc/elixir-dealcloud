defmodule Dealcloud.Impl.Schema.TimeZones do
  @moduledoc false
  @name "timezones"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)
end
