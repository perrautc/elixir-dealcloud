defmodule Dealcloud.Data do
  @type auth :: %Dealcloud.Auth{}
  @type query :: %Dealcloud.Data.Query{}
  @type history_query :: %Dealcloud.Data.HistoryQuery{}
  @type merge_request :: %Dealcloud.Data.MergeRequest{}
  @type view_filter :: %Dealcloud.Data.ViewFilter{}
  @moduledoc """
  The Data APIs are used to minipulate records in the site.

  These are the APIs that can be used to perform the following acitons:
  1. Create Entries
  2. Update Entries
  3. Query Entries
  4. Read Entries
  5. Delete Entries

  Some of these APIs work with information on a Cells level. These APIs have been grouped under Cells, and
  they accept inputs are Key-Value, and return responses in the same manner.
  The cells APIs have a direct equivalent that are marked as rows. These APIs works with entries as a object.
  Depending on the tooling you're using one of these paradaims may be more beneficial then the other.
  """

  @doc """
  Historical Data API - Retrives data values from the past. This API can be used to retreive data from deleted entries
  as well as data from fields that have since been updated. We do not keep audits of deleted entries, so for a deleted
  entry this will always return the value at time of deletion.

  ## Examples
      Dealcloud.Data.get_historical()
  """
  @spec get_historical(
          history_query(),
          auth()
        ) :: any
  defdelegate get_historical(body, config), to: Dealcloud.Impl.Data.History, as: :get

  @doc """
  View APIs
  """
  @spec get_views(
          query(),
          auth()
        ) :: any
  defdelegate get_views(query, config), to: Dealcloud.Impl.Data.View, as: :get

  @doc """
  Get the records belonging to a view. If supply value later is enabled, this allows you to override the filter
  ## Examples
      Dealcloud.Data.get_view_details(1, [], query, %Dealcloud.Auth{})
  """
  @spec get_view_details(
          integer,
          list(view_filter()),
          query(),
          auth()
        ) :: any
  defdelegate get_view_details(viewId, body, query, config),
    to: Dealcloud.Impl.Data.View,
    as: :post

  @doc """
  This contains the functions for merging 2 or more entries.
  You're able to perform up to 100 mergest per call

  Takes the entryType as a integer
  Take a list of merge Requests
  Takes query params, must specify if it should overrite blank values
  Takes authentication

  ##Examples
      alias Dealcloud.Impl.Data.Merge
      mergeRequest = %Dealcloud.Data.Merge{entryId: 1, mergeEntries: [1, 2, 3]}
      Merge.post(2014,[mergeRequest], %Dealcloud.Data.Query{overwriteEmptyValues: true}, %Auth{})
      :ok
  """
  @spec merge(integer, list(merge_request()), auth()) :: :ok
  defdelegate merge(type, mergeRequest, config), to: Dealcloud.Impl.Data.Merge, as: :post
end
