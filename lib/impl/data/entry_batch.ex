defmodule Dealcloud.Impl.Data.EntryBatch do
  alias Dealcloud.Impl.Data.EntryData

  @moduledoc """
  EntryData contains the API to get entries as cells
  """
  def get(entries, params, config) do
    entries
    |> create_batches()
    |> Enum.map(fn v ->
      EntryData.post(v, params, config)
    end)
    |> Enum.reduce([], fn x, acc -> acc ++ x end)
    |> Enum.group_by(fn x -> x["entryId"] end)
  end

  def get(entryIds, fieldIds, params, config) do
    generate_entries_fields(entryIds, fieldIds)
    |> get(params, config)
  end

  def get_all_fields(entryType, entryIds, params, config) do
    fieldIds =
      Dealcloud.Impl.Schema.EntryTypes.fields(entryType, config)
      |> Enum.map(fn x -> x["id"] end)

    generate_entries_fields(entryIds, fieldIds)
    |> get(params, config)
  end

  def get_all_entries(entryType, params, config) do
    entryIds =
      Dealcloud.Impl.Data.EntryData.get_entries(entryType, config)
      |> Enum.map(fn x -> x["id"] end)

    get_all_fields(entryType, entryIds, params, config)
  end

  def get_all_entries(entryType, fieldIds, params, config) do
    entryIds =
      Dealcloud.Impl.Data.EntryData.get_entries(entryType, config)
      |> Enum.map(fn %{"id" => x} -> x end)

    generate_entries_fields(entryIds, fieldIds)
    |> get(params, config)
  end

  def generate_entries_fields(entriesIds, fieldIds) do
    for e <- entriesIds, f <- fieldIds, do: %Dealcloud.Data.Record{entryId: e, fieldId: f}
  end

  def generate_entries_fields(entriesIds, fieldIds, recordType) do
    for e <- entriesIds, f <- fieldIds, do: %{recordType | entryId: e, fieldId: f}
  end

  def create_batches(entries, batch_size \\ 10_000) do
    entries |> Enum.chunk_every(batch_size)
  end
end
