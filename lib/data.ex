defmodule Dealcloud.Data.Cells do
  ################################################################
  @moduledoc """
  These are cell APIs. These APIs use key-value pairs when communicating with the server.
  Both Requests and Responses are sent as arrays of [{EntryId: 1, FieldId: 1, Value: "Hello"}].

  These APIs are more performant, but may not be the best when working with ETL tools.
  """

  defdelegate get_keys(entryType, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_entries

  defdelegate get_ids(entryType, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_entries_ids

  defdelegate get_modified(entryType, params, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_modified_entries

  defdelegate get_filtered(entryType, filters, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :filter_entries

  defdelegate get(entries, params, config),
    to: Dealcloud.Impl.Data.EntryData

  defdelegate get_batch(entries, params, config),
    to: Dealcloud.Impl.Data.EntryBatch,
    as: :get

  defdelegate create(type, entries, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :post

  defdelegate update(type, entries, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :put

  defdelegate get_all_fields(entryType, entryIds, params, config),
    to: Dealcloud.Impl.Data.EntryBatch,
    as: :get_all_fields

  defdelegate get_all(entryType, params, config),
    to: Dealcloud.Impl.Data.EntryBatch,
    as: :get_all_entries
end

defmodule DealCloud.Data.Rows do
  @moduledoc """
  These are Rows APIs, These APIs work using Arrays of Json objects.
  These APIs are typical of what you see in most other systems. These APIs works better with ETL tools.
  """
  defdelegate get_entries(entryTypeId, params, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :get

  defdelegate get_as_post(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :query

  defdelegate create_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :post

  defdelegate update_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :patch
end

defmodule Dealcloud.Data do
  @doc """
  Historical Data API - Retrives data from in the past
  """
  defdelegate get_historical(body, config), to: Dealcloud.Impl.Data.History, as: :get

  @doc """
  View APIs
  """
  defdelegate get_views(query, config), to: Dealcloud.Impl.Data.View, as: :get

  defdelegate get_view_entries(viewId, body, query, config),
    to: Dealcloud.Impl.Data.View,
    as: :post

  defdelegate merge(type, mergeRequest, config), to: Dealcloud.Impl.Data.Merge, as: :post
end
