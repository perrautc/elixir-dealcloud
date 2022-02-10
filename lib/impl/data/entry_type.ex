defmodule Dealcloud.Impl.Data.EntryType do
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
  def get_entries(entryType, config) do
    Dealcloud.Impl.get(entryType, config)
    |> url("/entries", entryType)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  def get_entries_ids(entryType, config),
    do: get_entries(entryType, config) |> Enum.map(fn %{"id" => id} -> id end)

  @spec get_modified_entries(any, Dealcloud.Query.t(), Dealcloud.Auth.t()) :: any
  def get_modified_entries(entryType, params, config) do
    Dealcloud.Impl.get(params, config)
    |> url("/entries/history", entryType)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  @spec filter_entries(any, Dealcloud.Data.Filter.t(), Dealcloud.Auth.t()) :: any
  def filter_entries(entryType, body, config) do
    Dealcloud.Impl.post(body, config)
    |> url("/entries/history", entryType)
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  def post(type, entries, config) do
    Dealcloud.Impl.post(type, %{"storeRequests" => entries}, config)
  end

  defp process_data(body, _p), do: body
end
