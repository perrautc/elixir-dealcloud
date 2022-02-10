defmodule Dealcloud.Auth do
  alias Dealcloud.Impl

  @moduledoc """
  Handles authentication with DealCloud's API
  """
  @type t :: %__MODULE__{
          site: String.t(),
          client_id: String.t(),
          client_secret: String.t(),
          token_url: String.t(),
          data_url: String.t(),
          schema_url: String.t(),
          user_url: String.t(),
          access_token: String.t(),
          expires_in: integer,
          refresh_token: String.t(),
          token_type: String.t()
        }
  defstruct site: nil,
            client_id: nil,
            client_secret: nil,
            token_url: "api/rest/v1/oauth/token",
            data_url: "api/rest/v4/data",
            schema_url: "api/rest/v4/schema",
            user_url: "api/rest/v1/management",
            access_token: nil,
            expires_in: nil,
            refresh_token: nil,
            token_type: "bearer"

  @spec token(Dealcloud.Auth.t()) :: Dealcloud.Auth.t()
  defdelegate token(config), to: Impl.Auth

  @spec refresh(Dealcloud.Auth.t()) :: Dealcloud.Auth.t()
  defdelegate refresh(config), to: Impl.Auth
end
