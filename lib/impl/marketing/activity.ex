defmodule Dealcloud.Impl.Marketing.Activity do
  alias Dealcloud.Impl.Marketing
  @moduledoc false
  @name "activity"
  @spec get(
          Dealcloud.Marketing.Query.t(),
          Dealcloud.Auth.t()) :: any
  def get(params, config), do: [@name] |> Marketing.get(params, config)
  @spec patch(
    Dealcloud.Marketing.Activity.t(),
    Dealcloud.Auth.t()) :: any
def patch(body, config), do: [@name] |> Marketing.patch(body, config)
@spec post(
  Dealcloud.Marketing.Activity.t(),
  Dealcloud.Auth.t()) :: any
def post(body, config), do: [@name] |> Marketing.post(body, config)
end
