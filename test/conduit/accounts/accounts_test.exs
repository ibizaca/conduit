defmodule Conduit.AccountsTest do
  use Conduit.DataCase

  alias Conduit.Accounts
  alias Conduit.Accounts.Projections.User

  describe "register user" do
    @tag :integration
    test "should succeed with valid data" do
      assert {:ok, %User{} = user} = Accounts.register_user(build(:user))

      assert user.username == "ibizaca"
      assert user.email == "ibizaca@ibizaca.ibizaca"
      assert user.hashed_password == "ibizacaibizaca"
      assert user.bio == nil
      assert user.image == nil
    end
  end
end
