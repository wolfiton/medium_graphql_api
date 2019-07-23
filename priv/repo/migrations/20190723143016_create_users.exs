defmodule MediumGraphqlApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :username, :string
      add :password_hash, :string
      add :attempts, :string
      add :confirmed, :string
      add :locked, :string

      timestamps()
    end

  end
end
