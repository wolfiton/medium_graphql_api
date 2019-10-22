defmodule MediumGraphqlApi.Repo.Migrations.CategoryToPost do
  use Ecto.Migration

  def change do
    create table(:category_to_post, primary_key: false) do
      add :category_id, references(:categories, on_delete: :delete_all), primary_key: true
      add :post_id, references(:posts, on_delete: :delete_all), primary_key: true

      timestamps()
    end

    create index(:category_to_post, [:category_id])
    create index(:category_to_post, [:post_id])

    create unique_index(:category_to_post, [:category_id, :post_id], name: :category_id_posts_id_unique_index)
  end
end
