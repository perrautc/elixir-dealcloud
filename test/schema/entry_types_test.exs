defmodule DealcloudTest.Schema.EntryTypes do
  use ExUnit.Case

  alias Dealcloud.Impl.Schema.EntryTypes, as: Request

  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request for entry types with no config returns correct path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/entrytypes" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<"[pong, ping]">)
    end)

    assert {:ok, "[pong, ping]"} = Request.get(%Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "request for entryType returns correct path", %{bypass: bypass} do
    entryType = "company"

    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/entrytypes/#{entryType}" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<"[pong, ping]">)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.get("#{entryType}", %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "request for entryType fields returns correct path", %{bypass: bypass} do
    entryType = "company"

    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/schema/entrytypes/#{entryType}/fields" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<"[pong, ping]">)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.fields("#{entryType}", %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end
