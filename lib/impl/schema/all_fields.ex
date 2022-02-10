defmodule Dealcloud.Impl.Schema.AllFields do
  @name "allfields"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)
end
