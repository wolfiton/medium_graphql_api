defmodule MediumGraphqlApi.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :slug, :string
      add :content, :string
      add :view_count, :string
      add :tags_id, references(:tags, on_delete: :nothing)
      add :category_id, references(:category, on_delete: :nothing)

      timestamps()
    end

    create index(:articles, [:tags_id])
    create index(:articles, [:category_id])
  end
end
