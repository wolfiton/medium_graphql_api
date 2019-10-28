defmodule MediumGraphqlApi.Blog.Post do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "posts" do
      field :title, :string
      field :body, :string
      belongs_to(:user, MediumGraphqlApi.Accounts.User, foreign_key: :user_id)
      many_to_many(:categories, MediumGraphqlApi.Blog.Category, join_through: "category_to_post", on_replace: :delete)
      many_to_many(:tags, MediumGraphqlApi.Blog.Category, join_through: "tag_to_post", on_replace: :delete)

      timestamps()
    end
  
    @doc false
    def changeset(post, attrs) do
      post
      |> cast(attrs, [:title, :body])
      |> validate_required([:title])
      |> foreign_key_constraint(:user_id)
    end
  end