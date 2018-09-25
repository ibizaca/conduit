defmodule Conduit.Accounts.Commands.RegisterUser do
  defstruct [
    :user_uuid,
    :username,
    :email,
    :password,
    :hashed_password,
  ]

  use ExConstructor
  use Vex.Struct

  validates :user_uuid, uuid: true
  validates :username, presence: [message: "can't be empty"], format: [with: ~r/^[a-z0-9]+$/, allow_nil: true, allow_blank: true, message: "is invalid"], string: true, unique_username: true
  validates :email, presence: [message: "can't be empty"], string: true
  validates :hashed_password, presence: [message: "can't be empty"], string: true

  defimpl Conduit.Support.Middleware.Uniqueness.UniqueFields, for: Conduit.Accounts.Commands.RegisterUser do
    def unique(_command), do: [
      {:username, "has already been taken"},
    ]
  end

  @doc """
  Assign a unique identity for the user
  """
  def assign_uuid(%__MODULE__{} = register_user, uuid) do
    %__MODULE__{register_user | user_uuid: uuid}
  end

  @doc """
  Convert username to lowercase characters
  """
  def downcase_username(%__MODULE__{username: username} = register_user) do
    %__MODULE__{register_user | username: String.downcase(username)}
  end
end
