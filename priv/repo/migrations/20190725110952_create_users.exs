defmodule MediumGraphqlApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password, :string
      add :role, :string
      add :confirmed, :boolean
      add :attempts, :string
      add :locked, :boolean

      timestamps()
    end

    execute("CREATE INDEX index_users_email_trgm_idx ON users USING gin (email gin_trgm_ops);")
    execute("CREATE INDEX index_users_username_trgm_idx ON users USING gin (username gin_trgm_ops);")
    execute("CREATE INDEX index_users_on_confirmed_idx ON users(confirmed) WHERE confirmed = true")
    execute("CREATE INDEX index_users_on_locked_idx ON users(locked) WHERE locked = true")
    create unique_index(:users, [:email])
    create unique_index(:users, [:username])
  end
end
