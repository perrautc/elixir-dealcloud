defmodule Dealcloud.Impl.Schema.AllFields do
  @name "allfields"
  alias Dealcloud.Impl.Schema
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: [@name] |> Schema.get(config)
end
