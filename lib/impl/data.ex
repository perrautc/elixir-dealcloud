defmodule Dealcloud.Impl.Data do
  @moduledoc """
  Data contains all apis needed to work with data in dealcloud

  With these APIs you are able to:
  1. Create, Update, Get, Delete records
  2. Create, Update, Get, Delete files
  """
  def url(p = %{config: config}) do
    %{p | url: "#{config.site}/#{config.data_url}"}
  end
end
