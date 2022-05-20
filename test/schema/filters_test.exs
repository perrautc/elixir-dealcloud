defmodule DealcloudTest.Schema.FiltersTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Schema.FilterOperations, as: Request

  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/filteroperations" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:ok, "[pong, ping]"} = Request.get(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end
