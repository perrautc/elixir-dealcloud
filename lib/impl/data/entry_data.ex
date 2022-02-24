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

  @spec get_entries(integer, Dealcloud.Auth.t()) :: any
  def get_entries(entryType, config), do: [@name, entryType, "entries"] |> Data.get(%{}, config)

  def get_entries_ids(entryType, config) do
    response = get_entries(entryType, config)

    case response do
      {:ok, entries} ->
        ids = entries |> Enum.map(fn %{"id" => id} -> id end)
        {:ok, ids}

      _ ->
        response
    end
  end

  @spec get_modified_entries(integer, Dealcloud.Data.ModifiedQuery, Dealcloud.Auth) :: any
  def get_modified_entries(type, params, config),
    do: [@name, type, "entries", "history"] |> Data.get(params, config)

  @spec filter_entries(integer, Dealcloud.Data.Filter, Dealcloud.Auth) :: any
  def filter_entries(type, body, config),
    do: [@name, type, "filter"] |> Data.post(body, %{}, config)

  @spec post(
          integer,
          list(Dealcloud.Data.Record),
          Dealcloud.Auth
        ) :: any
  def post(type, entries, config),
    do: [@name, type] |> Data.post(%{"storeRequests" => entries}, %{}, config)

  @spec put(
          integer,
          list(Dealcloud.Data.Record),
          Dealcloud.Auth
        ) :: any
  def put(type, entries, config),
    do: [@name, type] |> Data.put(%{"storeRequests" => entries}, %{}, config)

  @spec get(
          list(Dealcloud.Data.Record),
          Dealcloud.Data.Query,
          Dealcloud.Auth
        ) :: any
  def get(entries, params, config),
    do: [@name, "get"] |> Data.post(entries, params, config)
end
