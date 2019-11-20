defmodule MediumGraphqlApi.Blog.CommentToUser do
  use Ecto.Schema
  import Ecto.Changeset

  @message "Already exists!"
  @required_fields ~w(comment_id user_id)a

  schema "comment_to_user" do
    belongs_to(:comment, MediumGraphqlApi.Blog.Comment,
      primary_key: true,
      foreign_key: :comment_id
    )

    belongs_to(:user, MediumGraphqlApi.Accounts.User, primary_key: true, foreign_key: :user_id)

    # timestamps()
  end

  def changeset(comment_to_user, attrs) do
    comment_to_user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:comment_id)
    |> foreign_key_constraint(:user_id)
    |> unique_constraint([:comment, :user],
      name: :comment_id_user_id_unique_index,
      message: @message
    )
  end
end
