defmodule MediumGraphqlApi.Blog.Category do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "categories" do
      field :name, :string
      many_to_many(:posts, MediumGraphqlApi.Blog.Post, join_through: "category_to_post", on_replace: :delete)
     
      timestamps()
    end
  
    @doc false
    def changeset(category, attrs) do
      category
      |> cast(attrs, [:name])
      |> validate_required([:name])
    end
  end