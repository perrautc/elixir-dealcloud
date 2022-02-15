defmodule Dealcloud.Impl.Data.History do
  alias Dealcloud.Impl.Data
  @name "getHistoricalData"
  def get(body, params, config), do: ["entrydata", @name] |> Data.get(body, params, config)
end
