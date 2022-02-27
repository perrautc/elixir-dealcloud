defmodule Dealcloud.Data.Rows do
  @moduledoc """
  These are Rows APIs, These APIs work using Arrays of Json objects.
  These APIs are typical of what you see in most other systems. These APIs works better with ETL tools.
  """
  @doc """
  Gets entries in the site using either the id or api name
  ## Examples
      Dealcloud.Data.Rows.get_entries(2011, %Dealcloud.Data.Query{}, %Dealcloud.Auth{})
      Dealcloud.Data.Rows.get_entries("company", %Dealcloud.Data.Query{}, %Dealcloud.Auth{})

  """
  @spec get_entries(binary | integer, Dealcloud.Data.Query, Dealcloud.Auth) :: any
  defdelegate get_entries(entryTypeId, params, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :get

  @doc """
  Gets entries in the site, but uses a post request instead
  ## Examples
      Dealcloud.Data.Rows.get_as_post(2011, %Dealcloud.Data.PostQuery{}, %Dealcloud.Auth{})
      Dealcloud.Data.Rows.get_as_post("company", %Dealcloud.Data.PostQuery{}, %Dealcloud.Auth{})

  """
  @spec get_as_post(binary | integer, Dealcloud.Data.PostQuery, Dealcloud.Auth) :: any
  defdelegate get_as_post(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :query

  @doc """
  Creates new entries in the site. EntryId must be negative integer
  ## Examples
      Dealcloud.Data.Rows.create_entries(2011, [{"EntryId" => -1, "Name" => "Hello"}], %Dealcloud.Auth{})
      Dealcloud.Data.Rows.create_entries("company", [{"EntryId" => -1, "Name" => "Hello"}], %Dealcloud.Auth{})

  """
  @spec create_entries(binary | integer, [map], Dealcloud.Auth) :: any
  defdelegate create_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :post

  @doc """
  Updates existing entries in the site. EntryId must be positive integer
  ## Examples
      Dealcloud.Data.Rows.update_entries(2011, [{"EntryId" => 1, "Name" => "Hello"}], %Dealcloud.Auth{})
      Dealcloud.Data.Rows.update_entries("company", [{"EntryId" => 1, "Name" => "Hello"}], %Dealcloud.Auth{})

  """
  @spec update_entries(binary | integer, [map], Dealcloud.Auth) :: any
  defdelegate update_entries(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :patch
end
