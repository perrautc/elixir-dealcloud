defmodule DealcloudTest.Schema.ChoiceFieldValuesTest do
  use ExUnit.Case, async: true

  alias Dealcloud.Impl.Schema.ChoiceFieldValues, as: Request

  @site "http://localhost:"
  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "request for multiple fields", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "POST" == conn.method

      assert "/api/rest/v4/schema/1/choiceFieldValues" ==
               conn.request_path

      conn |> Plug.Conn.send_resp(200, ~s<[pong, ping]>)
    end)

    assert {:ok, "[pong, ping]"} =
             Request.post(1, ["hello", "bonjour"], %Dealcloud.Auth{
               site: @site <> "#{bypass.port}"
             })
  end
end
