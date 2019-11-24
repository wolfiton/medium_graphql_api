defmodule MediumGraphqlApi.Blog.Replies do
    use Ecto.Schema
    import Ecto.Changeset
  
    @message "ALREADY EXISTS"
    @required_fields ~w(comment_id reply_id)a
  
    schema "replies" do
      belongs_to(:comment, MediumGraphqlApi.Blog.Comment,
        primary_key: true,
        foreign_key: :comment_id
      )
  
      belongs_to(:reply, MediumGraphqlApi.Blog.Comment,
        primary_key: true,
        foreign_key: :reply_id
    )
    end
  
    @doc false
    def changeset(reply, attrs) do
      reply
      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)
      |> foreign_key_constraint(:comment_id)
      |> foreign_key_constraint(:reply_id)
      |> unique_constraint([:comment, :reply],
        name: :reply_to_comment_unique_index,
        message: @message
      )
    end
  end