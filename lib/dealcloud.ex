defmodule Dealcloud do
  alias Dealcloud.Auth

  @moduledoc """
  Documentation for `Dealcloud`.
  """
  use HTTPoison.Base

  def headers(config) do
    %{
      "Authorization" => "Bearer #{config.access_token}",
      "Accept" => "Application/json; Charset=utf-8",
      "Content-Type" => "application/json; charset=utf-8"
    }
  end

  def process_status_code(response, p, function_name) do
    case response.status_code do
      200 ->
        response.body |> Poison.decode!() |> process_data(p, function_name)

      401 ->
        config = Auth.token(p.config)
        Map.put(p, :config, config) |> function_name.()

      429 ->
        Process.sleep(500)
        p |> function_name.()

      _ ->
        response
    end
  end

  def process_data(%{"rows" => rows, "totalRecords" => totalRecords}, p, function_name) do
    if p.params.skip < totalRecords do
      params = %{p.params | skip: p.params.skip + p.params.limit}
      function_name.(%{p | data: p.data ++ rows, params: params})
    else
      p.data
    end
  end

  def process_data(data, _p, _function_name), do: data

  def make_request(p) do
    case HTTPoison.request(p.requestType, p.url, JSON.encode!(p.body), headers(p.config),
           params: to_params(p.params)
         ) do
      {:ok, response} ->
        process_status_code(response, p, &make_request/1)

      {_, response} ->
        response
    end
  end

  def to_params(map) when map == %{}, do: []

  def to_params(params) do
    Map.to_list(params) |> tl()
  end
end
