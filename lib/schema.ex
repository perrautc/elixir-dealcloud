defmodule Dealcloud.Schema do
  alias Dealcloud.Impl.Schema
  ################################################################
  @doc """
  These are the system Information APIs
  """

  @spec get_currencies(Dealcloud.Auth.t()) :: any
  defdelegate get_currencies(config), to: Schema.Currencies, as: :get
  @spec get_field(binary, Dealcloud.Auth.t()) :: any
  defdelegate get_field(fieldId, config), to: Schema.Fields, as: :get
  @spec get_fields(list(integer()), Dealcloud.Auth.t()) :: any
  defdelegate get_fields(fields, config), to: Schema.Fields, as: :get
  @spec get_filters(Dealcloud.Auth.t()) :: any
  defdelegate get_filters(config), to: Schema.FilterOperations, as: :get
  @spec get_system_entry_type(Dealcloud.Auth.t()) :: any
  defdelegate get_system_entry_type(config), to: Schema.EntryTypes, as: :get
  @spec get_system_field_type(Dealcloud.Auth.t()) :: any
  defdelegate get_system_field_type(config), to: Schema.SystemFieldTypes, as: :get
  @spec get_time_zone(Dealcloud.Auth.t()) :: any
  defdelegate get_time_zone(config), to: Schema.TimeZones, as: :get

  ################################################################
  @doc """
  These are the site Information APIs
  """

  @spec get_entry_types(Dealcloud.Auth.t()) :: any
  defdelegate get_entry_types(config), to: Schema.EntryTypes, as: :get
  @spec get_entry_type(binary | integer, Dealcloud.Auth.t()) :: any
  defdelegate get_entry_type(entryType, config), to: Schema.EntryTypes, as: :get
  @spec get_entry_fields(binary | integer, Dealcloud.Auth.t()) :: any
  defdelegate get_entry_fields(entryType, config), to: Schema.EntryTypes, as: :fields
  @spec get_all_fields(Dealcloud.Auth.t()) :: any
  defdelegate get_all_fields(config), to: Schema.AllFields, as: :get
  @spec get_field_types(Dealcloud.Auth.t()) :: any
  defdelegate get_field_types(config), to: Schema.FieldTypes, as: :get
  @spec get_users(Dealcloud.Auth.t()) :: any
  defdelegate get_users(config), to: Schema.Users, as: :get
  @spec create_choices(integer, list(binary), Dealcloud.Auth.t()) :: any
  defdelegate create_choices(fieldId, choices, config), to: Schema.ChoiceFieldValues, as: :post
end
