defmodule MediumGraphqlApi.Repo.Migrations.Replies do
  use Ecto.Migration

  def change do
    create table(:replies, primary_key: false) do
      add :comment_id, references(:comments, on_delete: :delete_all), primary_key: true
      add :reply_id, references(:comments, on_delete: :delete_all), primary_key: true

    end

    create index(:replies, [:comment_id])
    create index(:replies, [:reply_id])

    create unique_index(:replies, [:comment_id, :reply_id], name: :reply_to_comment_unique_index)
  end
end
