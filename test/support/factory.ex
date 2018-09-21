# test/support/factory.ex
defmodule Conduit.Factory do
  use ExMachina

  alias Conduit.Accounts.Commands.RegisterUser

  def user_factory do
    %{
      email: "ibizaca@ibizaca.ibizaca",
      username: "ibizaca",
      hashed_password: "ibizacaibizaca",
      bio: "Icecream is the menaing of life",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv9Vif8pGMlDjMTyNQyC2gnxMH0Ro4J3_P1s08M73KVUl1R9G1mg",
    }
  end

  def register_user_factory do
    struct(RegisterUser, build(:user))
  end
end
