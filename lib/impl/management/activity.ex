defmodule Dealcloud.Impl.Management.Activity do
  @moduledoc false
  alias Dealcloud.Impl.Management

  @name "activity"

  def post(body, query, config), do: ["user", @name] |> Management.post(body, query, config)

  def post(body, config), do: post(body, %Dealcloud.Management.Query{}, config)
end
