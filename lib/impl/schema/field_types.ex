defmodule Dealcloud.Impl.Schema.FieldTypes do
  @moduledoc false
  @name "fieldtypes"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: [@name] |> Schema.get(config)
end
