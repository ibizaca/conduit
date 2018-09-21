defmodule Conduit.Accounts.Aggregates.UserTest do
  use Conduit.AggregateCase, aggregate: Conduit.Accounts.Aggregates.User

  alias Conduit.Accounts.Events.UserRegistered

  describe "register user" do
    @tag :unit
    test "should succeed when valid" do
      user_uuid = UUID.uuid4()

      assert_events build(:register_user, user_uuid: user_uuid), [
        %UserRegistered{
          user_uuid: user_uuid,
          email: "ibizaca@ibizaca.ibizaca",
          username: "ibizaca",
          hashed_password: "ibizacaibizaca",
        }
      ]

    end
  end
end
