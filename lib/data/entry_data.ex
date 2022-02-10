defmodule Dealcloud.Data.EntryData do
  alias Dealcloud.{Auth}
  alias Dealcloud.Data.EntryData
  defstruct [:url, :requestType, :config, params: %{}, body: [], data: []]

  def get(entries, config = %Auth{}) do
    url = "#{config.site}/#{config.data_url}/entrydata/get"
    cells(:post, url, entries, config)
  end

  def post(type, entries, config = %Auth{}),
    do: cells(:post, url(type, config), %{"storeRequests" => entries}, config)

  def put(type, entries, config = %Auth{}),
    do: cells(:put, url(type, config), %{"storeRequests" => entries}, config)

  def delete(type, entries, config = %Auth{}),
    do: cells(:delete, url(type, config), entries, config)

  defp url(type, config), do: "#{config.site}/#{config.data_url}/entrydata/#{type}"

  defp cells(requestType, url, entries, config) do
    %EntryData{
      url: url,
      body: entries,
      params: %Dealcloud.Data.Query{},
      requestType: requestType,
      config: config
    }
    |> make_request()
  end

  defp make_request(
         %EntryData{config: config, requestType: type, url: url, body: body, params: params} = p
       ) do
    headers = Dealcloud.headers(config)

    case HTTPoison.request(type, url, JSON.encode!(body), headers, Dealcloud.to_params(params)) do
      {:ok, response} ->
        process_status_code(response, p, &make_request/1)

      {_, response} ->
        response
    end
  end

  defp process_status_code(response, %EntryData{config: config} = p, function_name) do
    case response.status_code do
      200 ->
        response.body |> Poison.decode!()

      429 ->
        Process.sleep(500)
        function_name.(p)

      401 ->
        config = Auth.token(config)
        function_name.(%{p | config: config})

      _ ->
        response
    end
  end

  def create_batches(entries, batch_size) do
    entries
    |> Enum.chunk_every(batch_size)
  end
end
