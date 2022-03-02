defmodule Dealcloud.Marketing do
  alias Dealcloud.Impl.Marketing
  @type query :: %Dealcloud.Marketing.Query{}
  @type activity :: %Dealcloud.Marketing.Activity{}
  @moduledoc """
  The Marketing endpoints capture activities associated with campaigns and web pages
  """
  @spec get_activity(Dealcloud.Marketing.Query.t(), Dealcloud.Auth.t()) :: any
  defdelegate get_activity(params, config), to: Marketing.Activity, as: :get
  @spec create_activity(Dealcloud.Marketing.Activity.t(), Dealcloud.Auth.t()) :: any
  defdelegate create_activity(params, config), to: Marketing.Activity, as: :post
  @spec update_activity(Dealcloud.Marketing.Activity.t(), Dealcloud.Auth.t()) :: any
  defdelegate update_activity(params, config), to: Marketing.Activity, as: :patch
  @spec get_page_activity(Dealcloud.Marketing.Query.t(), Dealcloud.Auth.t()) :: any
  defdelegate get_page_activity(params, config), to: Marketing.PageViewActivity, as: :get
  @spec update_page_activity(Dealcloud.Marketing.Activity.t(), Dealcloud.Auth.t()) :: any
  defdelegate update_page_activity(params, config), to: Marketing.PageViewActivity, as: :patch
end
