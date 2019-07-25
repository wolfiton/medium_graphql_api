defmodule MediumGraphqlApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :attempts, :string
    field :confirmed, :string
    field :email, :string
    field :locked, :string
    field :password, :string
    field :role, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :role, :confirmed, :attempts, :locked])
    |> validate_required([:username, :email, :password, :role, :confirmed, :attempts, :locked])
  end
end
