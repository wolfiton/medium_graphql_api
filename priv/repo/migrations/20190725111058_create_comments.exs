defmodule MediumGraphqlApi.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :message, :string

      timestamps()
    end

  end
end
