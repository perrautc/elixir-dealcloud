defmodule Dealcloud.Impl.Data.Utility do
  alias Dealcloud.Impl.Data.EntryData

  @moduledoc """
  EntryData contains the API to get entries as cells
  """
  def get(entries, params, config) do
    entries
    |> create_batches()
    |> Enum.map(fn v ->
      v |> EntryData.get(params, config)
    end)
    |> Enum.reduce([], fn x, acc -> acc ++ x end)
    |> Enum.group_by(fn x -> x["entryId"] end)
  end

  def get(entryIds, fieldIds, params, config) do
    generate_entries_fields(entryIds, fieldIds)
    |> get(params, config)
  end

  def all_fields(entryType, entryIds, config) do
    fieldIds =
      Dealcloud.Impl.Schema.EntryTypes.fields(entryType, config)
      |> Enum.map(fn x -> x["id"] end)

    generate_entries_fields(entryIds, fieldIds)
  end

  def all_entries(entryType, config) do
    entryIds =
      Dealcloud.Impl.Data.EntryData.get_entries(entryType, config)
      |> Enum.map(fn x -> x["id"] end)

    fieldIds =
      Dealcloud.Impl.Schema.EntryTypes.fields(entryType, config)
      |> Enum.map(fn x -> x["id"] end)

    generate_entries_fields(entryIds, fieldIds)
  end

  def all_entries(entryType, fieldIds, config) do
    entryIds =
      Dealcloud.Impl.Data.EntryData.get_entries(entryType, config)
      |> Enum.map(fn %{"id" => x} -> x end)

    generate_entries_fields(entryIds, fieldIds)
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
