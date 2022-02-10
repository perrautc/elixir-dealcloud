defmodule Dealcloud.Data do
  ################################################################
  @doc """
  These are cell APIs
  """

  defdelegate get_cells_entries_key(entryType, config),
    to: Dealcloud.Impl.Data.EntryType,
    as: :get_entries

  defdelegate get_cells_entries_ids(entryType, config),
    to: Dealcloud.Impl.Data.EntryType,
    as: :get_entries_ids

  defdelegate get_cells_modified_entries(entryType, params, config),
    to: Dealcloud.Impl.Data.EntryType,
    as: :get_modified_entries

  defdelegate get_cells_filtered_entryIds(entryType, filters, config),
    to: Dealcloud.Impl.Data.EntryType,
    as: :filter_entries

  defdelegate get_cells(entries, params, config), to: Dealcloud.Impl.Data.EntryData, as: :get

  defdelegate get_cells_all_fields(entryType, entryIds, params, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_all_fields

  defdelegate get_cells_all_entries_and_fields(entryType, params, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_all_entries
end
