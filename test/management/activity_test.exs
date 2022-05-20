defmodule DealcloudTest.Management.ActivityTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Management.Activity, as: Request
  alias Dealcloud.Management.ActivityQuery, as: Body
  alias Dealcloud.Management.Query
  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/user/activity" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.post([], %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "handles requests with body", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/user/activity" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.post(%Body{}, %Dealcloud.Auth{
               site: @site <> "#{bypass.port}"
             })
  end

  test "handles requests with query", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/user/activity" ==
               conn.request_path

      assert %{
               "email" => "",
               "isBillable" => "",
               "modifiedSince" => "",
               "pageNumber" => "1",
               "pageSize" => "1"
             } == conn.params

      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.post(%Body{activity: 1}, %Query{pageNumber: 1, pageSize: 1}, %Dealcloud.Auth{
               site: @site <> "#{bypass.port}"
             })
  end
end
