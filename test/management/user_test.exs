defmodule DealcloudTest.Management.UserTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Management.User, as: Request
  alias Dealcloud.Management.Query, as: Query
  alias Dealcloud.Management.User, as: Body
  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method

      assert "/api/rest/v1/management/user" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, [~s<[]>])
    end)

    assert {:ok, []} = Request.get(%Query{}, %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "can get user by Id", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/users" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, [~s<[]>])
    end)

    assert {:ok, []} = Request.get_by_id(1, %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "can get multiple users by Id", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/users" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, [~s<[]>])
    end)

    assert {:ok, []} =
             Request.get_by_ids([1, 2, 3], %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "can create users", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/user" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, [~s<[]>])
    end)

    assert {:ok, []} = Request.post([%Body{}], %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  test "can update users", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v1/management/user" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, [~s<[]>])
    end)

    assert {:ok, []} = Request.post([%Body{}], %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end
end
