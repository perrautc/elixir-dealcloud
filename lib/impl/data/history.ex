defmodule Dealcloud.Impl.Data.History do
  alias Dealcloud.Impl.Data
  @name "getHistoricalData"
  @spec get(
          Dealcloud.Data.History.t(),
          atom | %{:access_token => any, :data_url => any, :site => any, optional(any) => any}
        ) :: any
  def get(body, config), do: ["entrydata", @name] |> Data.post(body, %{}, config)
end
