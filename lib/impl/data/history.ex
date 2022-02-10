defmodule Dealcloud.Impl.Data.History do
  @name "getHistoricalData"
  def get(body, params, config) do
    Dealcloud.Impl.post(body, params, config)
    |> Dealcloud.Impl.Data.url()
    |> (&%{&1 | url: &1.url <> "/" <> "#{@name}"}).()
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body
end
