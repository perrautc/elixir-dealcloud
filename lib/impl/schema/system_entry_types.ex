defmodule Dealcloud.Impl.Schema.SystemEntryTypes do
  @moduledoc false
  @name "systementrytypes"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)
end
