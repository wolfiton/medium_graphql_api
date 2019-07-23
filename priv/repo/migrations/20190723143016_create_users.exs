defmodule MediumGraphqlApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password_hash, :string
      add :role, :string
      add :confirmed, :string
      add :attempts, :string
      add :locked, :string

      timestamps()
    end

  end
end
