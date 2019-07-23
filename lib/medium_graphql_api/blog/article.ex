defmodule MediumGraphqlApi.Blog.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :content, :string
    field :slug, :string
    field :title, :string
    field :view_count, :string
    field :likes, :integer
    field :tags_id, :id
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :slug, :content, :view_count])
    |> validate_required([:title, :slug, :content, :view_count])
  end
end
