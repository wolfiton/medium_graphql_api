defmodule MediumGraphqlApi.Repo.Migrations.Posts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :text
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
  end
end
