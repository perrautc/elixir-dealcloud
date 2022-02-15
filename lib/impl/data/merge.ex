defmodule Dealcloud.Impl.Data.Merge do
  alias Dealcloud.Impl.Data
  @name "merge"
  @moduledoc """
  This contains the functions for merging 2 or more entries.
  You're able to perform up to 100 mergest per call
  """
  @doc """
  Takes the entryType as a integer
  Take a list of merge Requests
  Takes query params, must specify if it should overrite blank values
  Takes authentication

      ##Examples
      iex> alias Dealcloud.Impl.Data.Merge
      iex> mergeRequest = %Dealcloud.Data.Merge{entryId: 1, mergeEntries: [1, 2, 3]}
      iex> Merge.post(2014,[mergeRequest], %Dealcloud.Data.Query{overwriteEmptyValues: true}, %Auth{})
  :ok
  """
  @spec post(integer, [Dealcloud.Data.Merge.t()], Dealcloud.Data.Query.t(), Dealcloud.Auth.t()) ::
          :ok
  def post(type, mergeRequest, query, config),
    do: [@name, type] |> Data.post(mergeRequest, query, config)
end
