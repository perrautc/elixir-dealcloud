defmodule DealcloudTest.Management.ProxyTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Management.Proxy, as: Request
  alias Dealcloud.Management.ProxyQuery, as: Query
  alias Dealcloud.Management.Proxy, as: Body
  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method

      assert "/api/rest/v1/management/user/proxy" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, [~s<[]>])
    end)

    assert {:ok, []} = Request.get(%Query{}, %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "can create proxy assignments", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/user/proxy" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, [~s<[]>])
    end)

    assert {:ok, []} = Request.post([%Body{}], %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end
