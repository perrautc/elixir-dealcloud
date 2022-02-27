defmodule Dealcloud.Impl.Schema.SystemFieldTypes do
  @moduledoc false
  @name "systemfieldtypes"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)
end
