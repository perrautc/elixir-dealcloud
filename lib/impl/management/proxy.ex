defmodule Dealcloud.Impl.Management.Proxy do
  alias Dealcloud.Auth
  alias Dealcloud.Impl.Management

  @name "proxy"

  @spec get(ProxyQuery.t(), Auth.t()) :: any
  def get(query, config), do: ["user", @name] |> Management.get(query, config)

  def post(body, config), do: ["user", @name] |> Management.post(body, %{}, config)
end
