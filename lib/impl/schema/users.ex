defmodule Dealcloud.Impl.Schema.Users do
  @name "users"
  @spec get(Dealcloud.Auth.t()) :: any
  def get(config = %Dealcloud.Auth{}), do: Dealcloud.Impl.Schema.get(config, @name)
end
