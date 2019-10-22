defmodule MediumGraphqlApi.Blog.CategoryToPost do
    use Ecto.Schema
    import Ecto.Changeset

    @message "ALREADY EXISTS"
    @required_fields ~w(category_id post_id)a
  
    schema "category_to_post" do
      belongs_to(:category, MediumGraphqlApi.Blog.Category, primary_key: true)
      belongs_to(:post, MediumGraphqlApi.Blog.Post, primary_key: true)


      timestamps()
    end
  
    @doc false
    def changeset(category_to_post, attrs) do
        category_to_post
        |> cast(attrs, @required_fields)
        |> validate_required(@required_fields)
        |> foreign_key_constraint(:category_id)
        |> foreign_key_constraint(:post_id)
        |> unique_constraint([:category, :post],
          name: :category_id_posts_id_unique_index,
          message: @message
        )
    end
end