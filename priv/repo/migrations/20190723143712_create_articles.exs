defmodule MediumGraphqlApi.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :slug, :string
      add :content, :string
      add :view_count, :string

      add :likes, :integer, default: 0

      timestamps()
    end


  end
end
