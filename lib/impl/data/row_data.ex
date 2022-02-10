defmodule Dealcloud.Impl.Data.RowData do
  @name "rows"
  @spec get(any, Dealcloud.Data.Query.t(), Dealcloud.Auth.t()) :: any
  def get(type, params, config) do
    Dealcloud.Impl.get(params, config)
    |> url(type)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  def patch(type, body, config) do
    Dealcloud.Impl.patch(body, config)
    |> url(type)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  def put(type, body, config) do
    Dealcloud.Impl.put(body, config)
    |> url(type)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  def post(type, body, config) do
    Dealcloud.Impl.post(body, config)
    |> url(type)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  @spec query(any, Dealcloud.Data.PostQuery.t(), Dealcloud.Auth.t()) :: any
  def query(type, body, config) do
    Dealcloud.Impl.post(body, config)
    |> url(type, "query")
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp url(p, type),
    do: Map.put(p, :url, "#{p.config.site}/#{p.config.data_url}/entrydata/#{@name}/#{type}")

  defp url(p, type, extra),
    do:
      Map.put(
        p,
        :url,
        "#{p.config.site}/#{p.config.data_url}/entrydata/#{@name}/#{extra}/#{type}"
      )

  defp process_data(%{"rows" => rows}, p) when rows == [], do: p.data

  defp process_data(%{"rows" => rows}, p = %{data: data, params: params}) do
    %{p | params: %{params | skip: p.params.skip + params.limit}, data: data ++ rows}
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body
end
