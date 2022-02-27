defmodule Dealcloud.Impl.Schema.Users do
  @moduledoc false
  @name "users"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config), do: [@name] |> Schema.get(config)
  @spec get(map(), Dealcloud.Auth.t()) :: any
  def get(params, config), do: [@name] |> Schema.get(params, config)
end
