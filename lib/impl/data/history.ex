defmodule Dealcloud.Impl.Data.History do
  @moduledoc false
  alias Dealcloud.Impl.Data
  @name "getHistoricalData"
  @spec get(
          Dealcloud.Data.History,
          Dealcloud.Auth
        ) :: any
  def get(body, config), do: ["entrydata", @name] |> Data.post(body, %{}, config)
end
