defmodule DealcloudTest.Schema.CurrenciesTest do
  use ExUnit.Case

  alias Dealcloud.Impl.Schema.Currencies, as: Request

  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/currencies" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<"[pong, ping]">)
    end)

    assert {:ok, "[pong, ping]"} = Request.get(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end