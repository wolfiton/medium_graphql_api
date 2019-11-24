defmodule MediumGraphqlApi.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :message, :text

      add :post_id, references(:posts, on_delete: :delete_all)
      add :reply_to_id, references(:comments, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

  end
end
