defmodule Dealcloud.Impl.Management.Proxy do
  alias Dealcloud.Auth
  alias Dealcloud.Impl.Management

  @name "proxy"

  @spec get(Dealcloud.Management.ProxyQuery, Auth) :: any
  def get(query, config), do: ["user", @name] |> Management.get(query, config)

  @spec post(
          Dealcloud.Management.Proxy,
          Auth
        ) :: any
  def post(body, config), do: ["user", @name] |> Management.post(body, %{}, config)
end
