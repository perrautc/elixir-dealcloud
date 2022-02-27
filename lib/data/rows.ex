defmodule Dealcloud.Data.Rows do
  @moduledoc """
  These are Rows APIs, These APIs work using Arrays of Json objects.
  These APIs are typical of what you see in most other systems. These APIs works better with ETL tools.
  """
  @spec get_entries(binary | integer, Dealcloud.Data.Query, Dealcloud.Auth) :: any
  defdelegate get_entries(entryTypeId, params, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :get

  @spec get_as_post(binary | integer, Dealcloud.Data.PostQuery, Dealcloud.Auth) :: any
  defdelegate get_as_post(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :query

  @spec create_entries(binary | integer, [map], Dealcloud.Auth) :: any
  defdelegate create_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :post

  @spec update_entries(binary | integer, [map], Dealcloud.Auth) :: any
  defdelegate update_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :patch
end
