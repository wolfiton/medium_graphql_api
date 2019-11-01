defmodule MediumGraphqlApi.Blog.Tag do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "tags" do
      field :name, :string
      many_to_many(:posts, MediumGraphqlApi.Blog.Post, join_through: "tag_to_post", on_replace: :delete)
     
      # timestamps()
    end
  
    @doc false
    def changeset(tag, attrs) do
      tag
      |> cast(attrs, [:name])
      |> validate_required([:name])
      |> unique_constraint(:name)
    end
  end