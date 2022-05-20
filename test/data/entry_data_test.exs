defmodule DealcloudTest.Data.EntryDataTest do
  use ExUnit.Case

  alias Dealcloud.Impl.Data.EntryData, as: Request
  alias Dealcloud.Data.Record, as: R
  alias Dealcloud.Auth
  @site "http://localhost:"
  @entries [
    %R{entryId: 1, fieldId: 1},
    %R{entryId: 1, fieldId: 2},
    %R{entryId: 1, fieldId: 3},
    %R{entryId: 1, fieldId: 4}
  ]
  @entryTypeId 1
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request with HTTP 200 response", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:error, "[pong, ping]"} =
             Request.get_entries(@entryTypeId, %Auth{site: @site <> "#{bypass.port}"})
  end

  test "request with correct method and path", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/api/rest/v4/data/entrydata/#{@entryTypeId}/entries" == conn.request_path
      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:error, "[pong, ping]"} =
             Request.get_entries(@entryTypeId, %Dealcloud.Auth{site: @site <> "#{bypass.port}"})
  end

  # test "returns correct values", %{bypass: bypass} do
  #   Bypass.expect(bypass, fn conn ->
  #     assert "GET" == conn.method
  #     assert "/api/rest/v4/data/entrydata/#{@entryTypeId}/entries" == conn.request_path
  #     conn |> Plug.Conn.send_resp(200, ~s<[{\"id\": 1}, {\"id\": 2}]>)
  #   end)

  #   assert [1, 2] =
  #            Request.get_entries_ids(@entryTypeId, %Dealcloud.Auth{
  #              site: @site <> "#{bypass.port}"
  #            })
  # end

  # test "returns modified entries", %{bypass: bypass} do
  #   Bypass.expect(bypass, fn conn ->
  #     assert "GET" == conn.method

  #     assert "/api/rest/v4/data/entrydata/#{@entryTypeId}/entries/history?modifiedSince=1" ==
  #              conn.request_path

  #     conn |> Plug.Conn.send_resp(200, ~s<[{\"id\": 1}, {\"id\": 2}]>)
  #   end)

  #   assert {:ok, [1, 2]} =
  #            Request.get_modified_entries(
  #              @entryTypeId,
  #              %Dealcloud.Data.ModifiedQuery{modifiedSince: 1},
  #              %Auth{
  #                site: @site <> "#{bypass.port}"
  #              }
  #            )
  # end

  test "returns entry details", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v4/data/entrydata/get" == conn.request_path

      conn |> Plug.Conn.send_resp(200, ~s<[{\"id\": 1}, {\"id\": 2}]>)
    end)

    assert "[{\"id\": 1}, {\"id\": 2}]" =
             Request.get(
               @entries,
               %Dealcloud.Data.Query{},
               %Auth{
                 site: @site <> "#{bypass.port}"
               }
             )
  end
end
