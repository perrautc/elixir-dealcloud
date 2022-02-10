defmodule Dealcloud.Data.Entries do
  alias Dealcloud.{Auth}

  @name "entries"
  def get(entryTypeId, config = %Auth{}) do
    url = "#{config.site}/#{config.data_url}/#{entryTypeId}/#{@name}"

    headers = Dealcloud.headers(config)

    case HTTPoison.get(url, headers) do
      {:ok, response} -> response.body |> process_response_body
      {_, response} -> response
    end
  end

  def filter(entryTypeId, filters, config = %Auth{}) do
    url = "#{config.site}/#{config.data_url}/#{entryTypeId}/filter"

    headers = Dealcloud.headers(config)
    filterstring = JSON.encode!(filters)
    IO.puts(filterstring)

    case HTTPoison.post(url, filterstring, headers) do
      {:ok, response} ->
        case response.status_code do
          200 -> response.body |> process_response_body
          500 -> response
        end

      {_, response} ->
        response
    end
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!()
  end
end
