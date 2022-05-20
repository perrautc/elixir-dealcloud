defmodule Dealcloud.Impl.Data.Utility do
  alias Dealcloud.Impl.Data.EntryData

  @moduledoc false
  @spec get(list(Dealcloud.Data.Record), Dealcloud.Data.Query, Dealcloud.Auth.t()) :: map
  def get(entries, params, config) do
    entries
    |> create_batches()
    |> Enum.map(fn v ->
      v |> EntryData.get(params, config)
    end)
    |> Enum.reduce([], fn x, acc -> acc ++ x end)
    |> Enum.group_by(fn x -> x.entryId end)
  end

  @spec put(integer, list(Dealcloud.Data.Record), Dealcloud.Auth.t()) :: map
  def put(entryTypeId, entries, config) do
    entries
    |> create_new_batches()
    |> Enum.map(fn v -> EntryData.put(entryTypeId, v, config) |> cleaner end)
    |> Enum.reduce([], fn x, acc -> acc ++ x end)
    |> Enum.group_by(fn x -> x.entryId end)
  end

  @spec post(integer, list(Dealcloud.Data.Record), Dealcloud.Auth.t()) :: map
  def post(entryTypeId, entries, config) do
    entries
    |> create_batches()
    |> Enum.map(fn v -> EntryData.post(entryTypeId, v, config) |> cleaner end)
    |> Enum.reduce([], fn x, acc -> acc ++ x end)
    |> Enum.group_by(fn x -> x.entryId end)
  end

  @spec get(list(integer), list(integer), Dealcloud.Data.Query, Dealcloud.Auth.t()) :: map
  def get(entryIds, fieldIds, params, config) do
    generate_entries_fields(entryIds, fieldIds)
    |> get(params, config)
  end

  @spec all_fields(binary | integer, list(integer), Dealcloud.Auth.t()) ::
          list(Dealcloud.Data.Record)
  def all_fields(entryType, entryIds, config) do
    fieldIds =
      Dealcloud.Impl.Schema.EntryTypes.fields(entryType, config)
      |> cleaner
      |> Enum.map(fn x -> x["id"] end)

    generate_entries_fields(entryIds, fieldIds)
  end

  @spec all_entries(integer, Dealcloud.Auth.t()) :: list(Dealcloud.Data.Record)
  def all_entries(entryType, config) do
    entryIds =
      Dealcloud.Impl.Data.EntryData.get_entries(entryType, config)
      |> cleaner
      |> Enum.map(fn x -> x["id"] end)



    fieldIds =
      Dealcloud.Impl.Schema.EntryTypes.fields(entryType, config)
      |> cleaner
      |> Enum.map(fn x -> x["id"] end)

    generate_entries_fields(entryIds, fieldIds)
  end

  def cleaner({:ok, response}) do
    response
  end

  @spec all_entries(integer, list(integer), Dealcloud.Auth.t()) :: list(Dealcloud.Data.Record)
  def all_entries(entryType, fieldIds, config) do
    entryIds =
      Dealcloud.Impl.Data.EntryData.get_entries(entryType, config)
      |> cleaner
      |> Enum.map(fn %{"id" => x} -> x end)

    generate_entries_fields(entryIds, fieldIds)
  end

  @spec generate_entries_fields(list(integer), list(integer)) :: list(Dealcloud.Data.Record)
  def generate_entries_fields(entriesIds, fieldIds) do
    for e <- entriesIds, f <- fieldIds, do: %Dealcloud.Data.Record{entryId: e, fieldId: f}
  end

  @spec generate_entries_fields(list(integer), list(integer), Dealcloud.Data.Record) ::
          list(Dealcloud.Data.Record)
  def generate_entries_fields(entriesIds, fieldIds, recordType) do
    for e <- entriesIds, f <- fieldIds, do: %{recordType | entryId: e, fieldId: f}
  end

  @spec create_batches(any, pos_integer) :: [list]
  def create_batches(entries, batch_size \\ 10_000) do
    entries |> Enum.chunk_every(batch_size)
  end

  @spec create_new_batches(any, any) :: any
  def create_new_batches(entries, batch_size \\ 10_000) do
    entries
    |> Enum.group_by(fn x -> x.entryId end)
    |> Enum.reduce([], fn x, acc -> create_largest_size_batch(x, batch_size, acc) end)
  end

  defp create_largest_size_batch([_], _batch_size, accumulator), do: accumulator

  defp create_largest_size_batch({_, fields}, _batch_size, []), do: [fields]

  defp create_largest_size_batch({_, fields}, batch_size, accumulator) do
    cond do
      length(hd(accumulator)) + length(fields) > batch_size ->
        [fields | accumulator]

      true ->
        [roomy | tail] = accumulator
        [fields ++ roomy | tail]
    end
  end
end
