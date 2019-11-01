defmodule MediumGraphqlApi.Repo.Migrations.TagToPost do
  use Ecto.Migration

  def change do
    create table(:tag_to_post, primary_key: false) do
      add :tag_id, references(:tags, on_delete: :delete_all), primary_key: true
      add :post_id, references(:posts, on_delete: :delete_all), primary_key: true

      # timestamps()
    end

    create index(:tag_to_post, [:tag_id])
    create index(:tag_to_post, [:post_id])

    create unique_index(:tag_to_post, [:tag_id, :post_id], name: :tag_id_posts_id_unique_index)
  end
end
