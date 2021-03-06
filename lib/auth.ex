defmodule Dealcloud.Auth do
  alias Dealcloud.Impl

  @moduledoc """
  Handles authentication with Dealcloud's API
  """
  @type t :: %__MODULE__{
          site: String.t(),
          client_id: String.t(),
          client_secret: String.t(),
          token_url: String.t(),
          data_url: String.t(),
          schema_url: String.t(),
          user_url: String.t(),
          marketing_url: String.t(),
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
            marketing_url: "api/v1/emarketing",
            access_token: nil,
            expires_in: nil,
            refresh_token: nil,
            token_type: "bearer"

  @doc """
  Generates new token
  ## Examples
      Dealcloud.Auth.token(%Dealcloud.Auth{})
  """
  @spec token(t) :: t
  defdelegate token(config), to: Impl.Auth

  @doc """
  Refreshes tokens
  ## Examples
      Dealcloud.Auth.refresh(%Dealcloud.Auth{})
  """
  @spec refresh(t) :: t
  defdelegate refresh(config), to: Impl.Auth
end
