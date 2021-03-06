defmodule DealcloudTest.Management.GroupTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Management.Group, as: Request
  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method

      assert "/api/rest/v1/management/user/group/1" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, ~s<pong>)
    end)

    assert {:ok, ["pong"]} = Request.get(1, %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "can make correct requests for all user groups", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method

      assert "/api/rest/v1/management/user/group" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, ~s<[]>)
    end)

    assert {:ok, []} = Request.groups(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end
