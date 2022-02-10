defmodule Dealcloud.Impl.Data.View do
  def get(query, config) do
    Dealcloud.Impl.get(query, config)
    |> url()
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  def post(viewId, body, query, config) do
    Dealcloud.Impl.post(body, query, config)
    |> url("/#{viewId}")
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp url(p) do
    Dealcloud.Impl.Data.url(p) |> (&%{&1 | url: &1.url <> "/rows/view"}).()
  end

  def url(p, extra) do
    url(p) |> (&%{&1 | url: &1.url <> extra}).()
  end

  defp process_data(%{"rows" => rows}, p) when rows == [], do: p.data

  defp process_data(%{"rows" => rows}, p = %{data: data, params: params}) do
    %{p | params: %{params | skip: p.params.skip + params.limit}, data: data ++ rows}
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body
end
