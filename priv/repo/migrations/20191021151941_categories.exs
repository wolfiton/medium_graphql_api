defmodule MediumGraphqlApi.Repo.Migrations.Categories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string

      timestamps()
    end

    create unique_index(:categories, [:name])
  end
end
