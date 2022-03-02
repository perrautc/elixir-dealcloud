defmodule Dealcloud.Data.Rows do
  @moduledoc """
  These are Rows APIs, These APIs work using Arrays of Json objects.
  These APIs are typical of what you see in most other systems. These APIs works better with ETL tools.
  """
  @doc """
  Gets entries in the site using either the id or api name
  ## Examples
      Dealcloud.Data.Rows.get(2011, %Dealcloud.Data.Query{}, %Dealcloud.Auth{})
      Dealcloud.Data.Rows.get("company", %Dealcloud.Data.Query{}, %Dealcloud.Auth{})

  """
  @spec get(binary | integer, Dealcloud.Data.Query, Dealcloud.Auth) :: any
  defdelegate get(entryTypeId, params, config),
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
      Dealcloud.Data.Rows.create(2011, [{"EntryId" => -1, "Name" => "Hello"}], %Dealcloud.Auth{})
      Dealcloud.Data.Rows.create("company", [{"EntryId" => -1, "Name" => "Hello"}], %Dealcloud.Auth{})

  """
  @spec create(binary | integer, [map], Dealcloud.Auth) :: any
  defdelegate create(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :post

  @doc """
  Updates existing entries in the site. EntryId must be positive integer
  ## Examples
      Dealcloud.Data.Rows.update(2011, [{"EntryId" => 1, "Name" => "Hello"}], %Dealcloud.Auth{})
      Dealcloud.Data.Rows.update("company", [{"EntryId" => 1, "Name" => "Hello"}], %Dealcloud.Auth{})

  """
  @spec update(binary | integer, [map], Dealcloud.Auth) :: any
  defdelegate update(entryTypeId, body, config),
    to: Dealcloud.Impl.Data.RowData,
    as: :patch
end
