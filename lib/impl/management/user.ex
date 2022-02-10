defmodule Dealcloud.Impl.Management.User do
  alias Dealcloud.Impl
  alias Dealcloud.Impl.Management
  alias Dealcloud.Management.User
  @name "user"

  def get_by_id(userId, config) when is_integer(userId) do
    [userId]
    |> get_by_id(config)
  end

  def get_by_id(userIds, config) do
    userIds
    |> Impl.post(config)
    |> Management.url("s", @name)
    |> Impl.make_request(&process_data/2)
  end

  @spec get(Management.userQuery() | integer, Dealcloud.Auth.t()) :: List[User.t()]
  def get(params, config) do
    cells(:get, params, [], config)
  end

  @spec post(List[User.t()], Dealcloud.Auth.t()) :: List[User.t()]
  def post(body, config) do
    cells(:post, %{}, body, config)
  end

  @spec put(List[User.t()], Dealcloud.Auth.t()) :: List[User.t()]
  def put(body, config) do
    cells(:put, %{}, body, config)
  end

  @spec delete(integer | String.t(), Dealcloud.Auth.t()) :: any
  def delete(userId, config) do
    Impl.delete(userId, config)
    |> Management.url(userId, @name)
    |> Impl.make_request(& &1)
  end

  defp cells(requestType, params, body, config) do
    Impl.any(requestType, body, params, config)
    |> Management.url(@name)
    |> Impl.make_request(&process_data/2)
  end

  defp process_data([], p), do: p.data

  defp process_data(body, _p = %{params: params, requestType: :get})
       when params == %{} do
    [body]
  end

  defp process_data(body, _p = %{params: params, requestType: :get})
       when params.email != nil do
    body
  end

  defp process_data(body, p = %{data: data, params: params, requestType: :get}) do
    %{p | params: %{params | pageNumber: params.pageNumber + 1}, data: data ++ body}
    |> Impl.make_request(&process_data/2)
  end

  defp process_data(body, _p), do: body
end
