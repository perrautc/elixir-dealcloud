defmodule DealCloud.Impl.Management.UserTest do
  alias Dealcloud.Impl.Management.User
  alias Dealcloud.Management.UserQuery
  alias Dealcloud.Auth
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup do
    ExVCR.Config.cassette_library_dir("test/fixtures/management/user")
    HTTPoison.start()
    :ok
  end

  describe "User.get/2" do
    test "a user when you know their id" do
      use_cassette("user_fetch_id_success") do
        assert User.get(18801, Auth.token(%Auth{})) == [
                 %{
                   "createdBy" => 7976,
                   "createdDate" => "2019-03-28T18:43:27.293",
                   "email" => "kkonapitsky@dealcloud.com",
                   "firstName" => "Kyle",
                   "groups" => [1],
                   "id" => 18801,
                   "isActive" => true,
                   "isLocked" => false,
                   "lastName" => "Konapitsky",
                   "modifiedBy" => 1_036_581,
                   "modifiedDate" => "2022-02-02T01:30:13.633",
                   "userTimeZoneId" => "Eastern Standard Time"
                 }
               ]
      end
    end

    test "a user when you know their email" do
      use_cassette("user_fetch_email_success") do
        assert User.get(%UserQuery{email: "kkonapitsky@dealcloud.com"}, Auth.token(%Auth{})) == [
                 %{
                   "createdBy" => 7976,
                   "createdDate" => "2019-03-28T18:43:27.293",
                   "email" => "kkonapitsky@dealcloud.com",
                   "firstName" => "Kyle",
                   "groups" => [1],
                   "id" => 18801,
                   "isActive" => true,
                   "isLocked" => false,
                   "lastName" => "Konapitsky",
                   "modifiedBy" => 1_036_581,
                   "modifiedDate" => "2022-02-02T01:30:13.633",
                   "userTimeZoneId" => "Eastern Standard Time"
                 }
               ]
      end
    end

    test "users when you know their modified date" do
      use_cassette("user_fetch_modifiedSince_success") do
        users =
          User.get(
            %UserQuery{modifiedSince: "2019-07-15T15:53:00.050Z", pageSize: 100},
            Auth.token(%Auth{})
          )

        assert Enum.count(users) >= 1
      end
    end
  end
end
