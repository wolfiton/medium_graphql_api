defmodule MediumGraphqlApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :attempts, :string
    field :confirmed, :string
    field :email, :string
    field :locked, :string
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :password_hash, :attempts, :confirmed, :locked])
    |> validate_required([:email, :username, :password_hash, :attempts, :confirmed, :locked])
  end
end
