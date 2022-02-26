defmodule DealcloudTest.Schema.UsersTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Schema.Users, as: Request
  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with HTTP 200 response", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      conn |> Plug.Conn.send_resp(200, ~s<"[pong, ping]">)
    end)

    assert {:ok, "[pong, ping]"} = Request.get(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/users" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<"[pong, ping]">)
    end)

    assert {:ok, "[pong, ping]"} = Request.get(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "with Http 500 response", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/users" == conn.request_path
      conn |> Plug.Conn.send_resp(500, ~s<Server Error>)
    end)

    assert {:error, %{status_code: 500, body: "Server Error"}} =
             Request.get(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "with unexpected outtage", %{bypass: bypass} do
    Bypass.down(bypass)

    assert {:error, %{reason: :econnrefused}} =
             Request.get(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end
