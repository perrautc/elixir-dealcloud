defmodule Dealcloud.Schema do
  @moduledoc """
  Schema tells you information about your site and about the system.

  Use these APIs to discover things you need to know about configurations that are possible as well as
  what's currently implemented
  """
  alias Dealcloud.Impl.Schema
  ################################################################
  @doc """
  These are the system Information APIs

  Returns all currencies supported by the system
  Schema.currencies(%Auth{})
  """
  @spec get_currencies(Dealcloud.Auth.t()) :: any
  defdelegate get_currencies(config), to: Schema.Currencies, as: :get

  @doc """
  Returns information about all the filters supported by the data apis

  Schema.get_filters(%Auth{})
  """
  @spec get_filters(Dealcloud.Auth.t()) :: any
  defdelegate get_filters(config), to: Schema.FilterOperations, as: :get

  @doc """
  Returns information about all the system entry types

  Schema.get_system_entry_type(%Auth{})
  """
  @spec get_system_entry_type(Dealcloud.Auth.t()) :: any
  defdelegate get_system_entry_type(config), to: Schema.SystemEntryTypes, as: :get

  @doc """
  Returns information about field types. This information is helpful when looking at the entry type fields.
  Fields configured can be any of the fields returned by the endpoint

  Schema.get_system_entry_type(%Auth{})
  """
  @spec get_field_types(Dealcloud.Auth.t()) :: any
  defdelegate get_field_types(config), to: Schema.FieldTypes, as: :get

  @doc """
  Returns information about all the system field types

  Schema.get_system_field_type(%Auth{})
  """
  @spec get_system_field_type(Dealcloud.Auth.t()) :: any
  defdelegate get_system_field_type(config), to: Schema.SystemFieldTypes, as: :get

  @doc """
  Returns information about all timezones supported by the system

  Schema.get_time_zone(%Auth{})
  """
  @spec get_time_zone(Dealcloud.Auth.t()) :: any
  defdelegate get_time_zone(config), to: Schema.TimeZones, as: :get

  ################################################################
  @doc """
  These are the site Information APIs

  Returns information about all entry types configured in the site

  Schema.get_entry_types(%Auth{})
  """
  @spec get_entry_types(Dealcloud.Auth.t()) :: any
  defdelegate get_entry_types(config), to: Schema.EntryTypes, as: :get

  @doc """
  Returns information about specific entry type

  Schema.get_entry_types("company", %Auth{})
  Schema.get_entry_types(2011, %Auth{})
  """
  @spec get_entry_type(binary | integer, Dealcloud.Auth.t()) :: any
  defdelegate get_entry_type(entryType, config), to: Schema.EntryTypes, as: :get

  @doc """
  Returns fields for a specific entry type

  Schema.get_entry_fields("company", %Auth{})
  Schema.get_entry_fields(2011, %Auth{})
  """
  @spec get_entry_fields(binary | integer, Dealcloud.Auth.t()) :: any
  defdelegate get_entry_fields(entryType, config), to: Schema.EntryTypes, as: :fields

  @doc """
  Returns all fields from the site. Use this sparingly,
  this is heavy operation only needed when generating full site schema.

  Schema.get_entry_fields("company", %Auth{})
  Schema.get_entry_fields(2011, %Auth{})
  """
  @spec get_all_fields(Dealcloud.Auth.t()) :: any
  defdelegate get_all_fields(config), to: Schema.AllFields, as: :get

  @doc """
  Returns information of a field. Requires the numerical ID of the field

  Schema.get_field(3, %Auth{})
  """
  @spec get_field(integer, Dealcloud.Auth) :: any
  defdelegate get_field(fieldId, config), to: Schema.Fields

  @doc """
  Returns information of a selection of fields passed in as query params

  Schema.get_fields([3,4,5], %Auth{})
  """
  @spec get_fields(list(integer), Dealcloud.Auth) :: any
  defdelegate get_fields(fields, config), to: Schema.Fields

  @doc """
  Returns all users in the site.

  Schema.get_field(%Auth{})
  """
  @spec get_users(Dealcloud.Auth.t()) :: any
  defdelegate get_users(config), to: Schema.Users, as: :get

  @doc """
  Returns all users in the site filtered by ativeOnly filter

  Schema.get_field(%{"activeOnly" => "true"}, %Auth{})
  """
  @spec get_users(map(), Dealcloud.Auth.t()) :: any
  defdelegate get_users(params, config), to: Schema.Users, as: :get

  @doc """
  Appends new choice values to choice fields

  Schema.create_choices(["Active", "Inactive"], %Auth{})
  """
  @spec create_choices(integer, list(binary), Dealcloud.Auth.t()) :: any
  defdelegate create_choices(fieldId, choices, config), to: Schema.ChoiceFieldValues, as: :post
end
