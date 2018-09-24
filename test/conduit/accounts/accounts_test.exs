defmodule Conduit.AccountsTest do
  use Conduit.DataCase

  alias Conduit.Accounts
  alias Conduit.Accounts.Projections.User

  describe "register user" do
    @tag :integration
    test "should succeed with valid data" do
      assert {:ok, %User{} = user} = Accounts.register_user(build(:user))

      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.hashed_password == "some hashed_password"
      assert user.image == "some image"
      assert user.username == "some username"
    end
  end
end
