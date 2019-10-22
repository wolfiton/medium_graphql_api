defmodule MediumGraphqlApi.Blog.TagToPost do
    use Ecto.Schema
    import Ecto.Changeset

    @message "ALREADY EXISTS"
    @required_fields ~w(tag_id post_id)a
  
    schema "tag_to_post" do
      belongs_to(:tag, MediumGraphqlApi.Blog.Tag, primary_key: true)
      belongs_to(:post, MediumGraphqlApi.Blog.Post, primary_key: true)


      timestamps()
    end
  
    @doc false
    def changeset(tag_to_post, attrs) do
        tag_to_post
        |> cast(attrs, @required_fields)
        |> validate_required(@required_fields)
        |> foreign_key_constraint(:tag_id)
        |> foreign_key_constraint(:post_id)
        |> unique_constraint([:tag, :post],
          name: :tag_id_posts_id_unique_index,
          message: @message
        )
    end
end