defmodule MediumGraphqlApiWeb.Schema.CommentTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MediumGraphqlApi.Repo

  object :comment do
    field(:id, :id)
    field(:message, :string)
    field(:user, :user, resolve: assoc(:user))
    field(:post, :post, resolve: assoc(:post))
    field(:reply_to, :comment, resolve: assoc(:comment))
    field(:replies, :comment, resolve: list_of(assoc(:comment)))
  end

  input_object :comment_input do
    field(:message, non_null(:string))
    field(:post_id, non_null(:id))
    field(:reply_to_id, non_null(:id))
  end
end
