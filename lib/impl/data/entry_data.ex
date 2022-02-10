defmodule Dealcloud.Impl.Data.EntryData do
  @moduledoc """
  EntryData contains the API to get entries as cells
  """
  def get(entries, params, config) do
    entries
    |> create_batches()
    |> Enum.map(fn v ->
      call_batches(v, params, config)
    end)
    |> Enum.reduce([], fn x, acc -> acc ++ x end)
    |> Enum.group_by(fn x -> x["entryId"] end)

    # Combine Data and Flatten
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
      Dealcloud.Impl.Data.EntryType.get_entries(entryType, config)
      |> Enum.map(fn x -> x["id"] end)

    get_all_fields(entryType, entryIds, params, config)
  end

  def get_all_entries(entryType, fieldIds, params, config) do
    entryIds =
      Dealcloud.Impl.Data.EntryType.get_entries(entryType, config)
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

  defp call_batches(entries, params, config) do
    Dealcloud.Impl.post(entries, params, config)
    |> Dealcloud.Impl.Data.EntryType.url("get")
    |> Dealcloud.Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body

  def create_batches(entries, batch_size \\ 10_000) do
    entries |> Enum.chunk_every(batch_size)
  end
end
