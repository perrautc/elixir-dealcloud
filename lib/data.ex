defmodule Dealcloud.Data do
  ################################################################
  @doc """
  These are cell APIs
  """

  defdelegate get_cells_entries_key(entryType, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_entries

  defdelegate get_cells_entries_ids(entryType, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_entries_ids

  defdelegate get_cells_modified_entries(entryType, params, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_modified_entries

  defdelegate get_cells_filtered_entryIds(entryType, filters, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :filter_entries

  defdelegate get_cells_entries(entries, params, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get

  defdelegate get_cells_entries_batch(entries, params, config),
    to: Dealcloud.Impl.Data.EntryBatch,
    as: :get

  defdelegate create_cells_entries(type, entries, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :post

  defdelegate update_cells_entries(type, entries, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :put

  defdelegate get_cells_all_fields(entryType, entryIds, params, config),
    to: Dealcloud.Impl.Data.EntryBatch,
    as: :get_all_fields

  defdelegate get_cells_all_entries_and_fields(entryType, params, config),
    to: Dealcloud.Impl.Data.EntryBatch,
    as: :get_all_entries

  ################################################################
  @doc """
  These are Rows APIs
  """
  defdelegate get_row_entries(entryTypeId, params, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :get

  defdelegate get_row_as_post(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :query

  defdelegate create_row_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :post

  defdelegate update_row_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :patch

  #####################################
  @doc """
  Historical Data API - Retrives data from in the past
  """
  defdelegate get_historical(body, config), to: Dealcloud.Impl.Data.History, as: :get
  #####################################
  @doc """
  View APIs
  """
  defdelegate get_views(query, config), to: Dealcloud.Impl.Data.View, as: :get

  defdelegate get_view_entries(viewId, body, query, config),
    to: Dealcloud.Impl.Data.View,
    as: :post

  #####################################
  @doc """
  Merge API - merges 2 or more entries. Can handle up to 100 merges per request
  """
  defdelegate merge(type, mergeRequest, config), to: Dealcloud.Impl.Data.Merge, as: :post
end
