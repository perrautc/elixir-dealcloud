defmodule Dealcloud.Schema do
  alias Dealcloud.Impl.Schema
  ################################################################
  @doc """
  These are the system Information APIs
  """

  defdelegate get_currencies(config), to: Schema.Currencies, as: :get

  defdelegate get_field(fieldId, config), to: Schema.Fields, as: :get
  defdelegate get_fields(fields, config), to: Schema.Fields, as: :get
  defdelegate get_filters(config), to: Schema.FilterOperations, as: :get
  defdelegate get_system_entry_type(config), to: Schema.EntryTypes, as: :get
  defdelegate get_system_field_type(config), to: Schema.SystemFieldTypes, as: :get
  defdelegate get_time_zone(config), to: Schema.TimeZones, as: :get

  ################################################################
  @doc """
  These are the site Information APIs
  """
  defdelegate get_entry_types(config), to: Schema.EntryTypes, as: :get
  defdelegate get_entry_type(entryType, config), to: Schema.EntryTypes, as: :get
  defdelegate get_entry_fields(entryType, config), to: Schema.EntryTypes, as: :fields
  defdelegate get_all_fields(config), to: Schema.AllFields, as: :get
  defdelegate get_field_types(config), to: Schema.FieldTypes, as: :get
  defdelegate get_users(config), to: Schema.Users, as: :get
  defdelegate create_choices(fieldId, choices, config), to: Schema.ChoiceFieldValues, as: :post
end
