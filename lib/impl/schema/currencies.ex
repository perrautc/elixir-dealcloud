defmodule Dealcloud.Impl.Schema.Currencies do
  @moduledoc false
  @name "currencies"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: [@name] |> Schema.get(config)
end
