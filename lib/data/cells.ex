defmodule Dealcloud.Data.Cells do
  @type modified :: %Dealcloud.Data.ModifiedQuery{}
  @type filter :: %Dealcloud.Data.Filter{}
  @type record :: %Dealcloud.Data.Record{}

  @moduledoc """
  These are cell APIs. These APIs use key-value pairs when communicating with the server.
  Both Requests and Responses are sent as arrays of [{EntryId: 1, FieldId: 1, Value: "Hello"}].

  These APIs are more performant, but may not be the best when working with ETL tools.
  """

  @doc """
  Returns name and entry ids for all records of a given entry type

  ## Examples
      Dealcloud.Data.Cells.get_keys(2011, %Dealcloud.Auth{})
  """
  @spec get_keys(integer, Dealcloud.Auth.t()) :: any
  defdelegate get_keys(entryType, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_entries

  @doc """
  Returns a list of only entry ids for all records of a given entry type

  ## Examples
      Dealcloud.Data.Cells.get_ids(2011, %Dealcloud.Auth{})
  """
  @spec get_ids(integer, Dealcloud.Auth.t()) :: any
  defdelegate get_ids(entryType, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_entries_ids

  @doc """
  Returns a list of name and entry ids for entries modified since the provided DateTime

  ## Examples
      modifiedDate = %Dealcloud.Data.ModifiedQuery{ modifiedSince: "2019-07-15T15:53:00.050Z"}
      Dealcloud.Data.Cells.get_modified(2011, modifiedDate,%Dealcloud.Auth{})
  """
  @spec get_modified(integer, Dealcloud.Data.ModifiedQuery, Dealcloud.Auth) :: any
  defdelegate get_modified(entryType, params, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :get_modified_entries

  @doc """
  Returns a list of only entry ids for all records of a given entry type

  ## Examples
      filter1 = %Dealcloud.Data.Filter{fieldId: 1, value: "a", filterOperation: 1}
      filter2 = %Dealcloud.Data.Filter{fieldId: 2, value: 500, filterOperation: 0}
      filters = [filter1, filter2]
      Dealcloud.Data.Cells.get_filtered(2011, filters, %Dealcloud.Auth{})
  """
  @spec get_filtered(integer, Dealcloud.Data.Filter, Dealcloud.Auth) :: any
  defdelegate get_filtered(entryType, filters, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :filter_entries

  @doc """
  Returns a list record field values for the entries and fields requested

  ## Examples
      field1 = %Dealcloud.Data.Record{fieldId: 1, entryId: 1}
      field2 = %Dealcloud.Data.Record{fieldId: 2, entryId: 1}
      entries = [field1, field2]
      query = %Dealcloud.Data.Query{wrapIntoArrays: true}
      Dealcloud.Data.Cells.get(entries, query, %Dealcloud.Auth{})
  """
  @spec get(list(Dealcloud.Data.Record), Dealcloud.Data.Query, Dealcloud.Auth) ::
          list(Dealcloud.Data.Record)
  defdelegate get(entries, params, config),
    to: Dealcloud.Impl.Data.EntryData

  @doc """
  Just like `Dealcloud.Data.Cells.get/3`, except can handle requests of any size.
  Returns a list record field values for the entries and fields requested

  ## Examples
      field1 = %Dealcloud.Data.Record{fieldId: 1, entryId: 1}
      field2 = %Dealcloud.Data.Record{fieldId: 2, entryId: 1}
      entries = [field1, field2]
      query = %Dealcloud.Data.Query{wrapIntoArrays: true}
      Dealcloud.Data.Cells.batch_get(entries, query, %Dealcloud.Auth{})
  """
  @spec batch_get([Dealcloud.Data.Record], Dealcloud.Data.Query, Dealcloud.Auth.t()) :: map
  defdelegate batch_get(entries, params, config),
    to: Dealcloud.Impl.Data.Utility,
    as: :get

  @doc """
  Creates new entries and Returns a list record field values for the created entries
  entryId must be negative integer
  ## Examples
      field1 = %Dealcloud.Data.Record{fieldId: 1, entryId: -1, value: "Hello"}
      field2 = %Dealcloud.Data.Record{fieldId: 2, entryId: -1, value: 6}
      entries = [field1, field2]
      Dealcloud.Data.Cells.create(2011, entries, %Dealcloud.Auth{})
  """
  @spec create(integer, [Dealcloud.Data.Record], Dealcloud.Auth) :: any
  defdelegate create(type, entries, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :post

  @doc """
  Just like `Dealcloud.Data.Cells.create/3`, except can handle requests of any size.
  Creates new entries and Returns a list record field values for the created entries
  entryId must be negative integer
  ## Examples
      field1 = %Dealcloud.Data.Record{fieldId: 1, entryId: -1, value: "Hello"}
      field2 = %Dealcloud.Data.Record{fieldId: 2, entryId: -1, value: 6}
      entries = [field1, field2]
      Dealcloud.Data.Cells.create(2011, entries, %Dealcloud.Auth{})
  """
  @spec batch_create(integer, [Dealcloud.Data.Record], Dealcloud.Auth.t()) :: map
  defdelegate batch_create(type, entries, config),
    to: Dealcloud.Impl.Data.Utility,
    as: :post

  @doc """
  Updates entries and Returns a list record field values for the created entries
  entryId must be positive integer
  ## Examples
      field1 = %Dealcloud.Data.Record{fieldId: 1, entryId: 1, value: "Hello"}
      field2 = %Dealcloud.Data.Record{fieldId: 2, entryId: 1, value: 6}
      entries = [field1, field2]
      Dealcloud.Data.Cells.update(2011, entries, %Dealcloud.Auth{})
  """
  @spec update(integer, [Dealcloud.Data.Record], Dealcloud.Auth) :: any
  defdelegate update(type, entries, config),
    to: Dealcloud.Impl.Data.EntryData,
    as: :put

  @doc """
  Just like `Dealcloud.Data.Cells.update/3`, except can handle requests of any size.
  Updates entries and Returns a list record field values for the created entries
  entryId must be positive integer
  ## Examples
      field1 = %Dealcloud.Data.Record{fieldId: 1, entryId: 1, value: "Hello"}
      field2 = %Dealcloud.Data.Record{fieldId: 2, entryId: 1, value: 6}
      entries = [field1, field2]
      Dealcloud.Data.Cells.create(2011, entries, %Dealcloud.Auth{})
  """
  @spec batch_update(integer, [Dealcloud.Data.Record], Dealcloud.Auth.t()) :: map
  defdelegate batch_update(type, entries, config),
    to: Dealcloud.Impl.Data.Utility,
    as: :put

  @doc """
  Returns a list of records and all field values for the requested entries for a given entry type
  ## Examples
      Dealcloud.Data.Cells.all_fields(2011, [1,2,3,4], %Dealcloud.Auth{})
  """
  @spec all_fields(binary | integer, [integer], Dealcloud.Auth.t()) :: [Dealcloud.Data.Record]
  defdelegate all_fields(entryType, entryIds, config),
    to: Dealcloud.Impl.Data.Utility,
    as: :all_fields

  @doc """
  Returns a list of all records and all field values for a given entry type
  ## Examples
      Dealcloud.Data.Cells.get_all(2011, %Dealcloud.Auth{})
  """
  @spec get_all(integer, Dealcloud.Auth.t()) :: [Dealcloud.Data.Record]
  defdelegate get_all(entryType, config),
    to: Dealcloud.Impl.Data.Utility,
    as: :all_entries
end
