defmodule Dealcloud.Impl.Data.EntryData do
  alias Dealcloud.Impl.Data
  @name "entrydata"
  @moduledoc """
  EntryTypes contains all apis needed to work with entries in Dealcloud, using the cells API

  With these APIs you are able to:
  1. Create Entries
  2. Update Entries
  3. Delete Entries
  4. Get Entries
  5. Filter Entries
  6. Get Modified Entries
  7. Get Historical Data for a entry
  """
  def url(p, name) do
    Dealcloud.Impl.Data.url(p) |> (&%{&1 | url: &1.url <> "/entrydata/#{name}"}).()
  end

  def url(p, extra, name) do
    url(p, name) |> (&%{&1 | url: &1.url <> extra}).()
  end

  @spec get_entries(integer, Dealcloud.Auth.t()) :: any
  def get_entries(type, config), do: [@name, type, "entries"] |> Data.get(%{}, config)

  def get_entries_ids(entryType, config),
    do: get_entries(entryType, config) |> Enum.map(fn %{"id" => id} -> id end)

  @spec get_modified_entries(any, Dealcloud.Query.t(), Dealcloud.Auth.t()) :: any
  def get_modified_entries(type, params, config),
    do: [@name, type, "entries", "history"] |> Data.get(params, config)

  @spec filter_entries(any, Dealcloud.Data.Filter.t(), Dealcloud.Auth.t()) :: any
  def filter_entries(type, body, config),
    do: [@name, type, "filter"] |> Data.post(body, %{}, config)

  def post(type, entries, config),
    do: [@name, type] |> Data.post(%{"storeRequests" => entries}, %{}, config)

  def put(type, entries, config),
    do: [@name, type] |> Data.put(%{"storeRequests" => entries}, %{}, config)

  def get(entries, params, config),
    do: [@name, "get"] |> Data.post(entries, params, config)
end
