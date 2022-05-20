defmodule DealcloudTest.Schema.FieldsTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Schema.Fields, as: Request

  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request for one field", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/fields/1234" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.get_field(1234, %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "request for multiple fields", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method

      assert "/api/rest/v4/schema/fields" ==
               conn.request_path

      assert %{"fieldIds" => "1&fieldIds=2&fieldIds=3"} = conn.params

      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.get_fields([1, 2, 3], %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end
