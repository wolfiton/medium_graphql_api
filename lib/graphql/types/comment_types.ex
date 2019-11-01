defmodule MediumGraphqlApiWeb.Schema.CommentTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MediumGraphqlApi.Repo

  object :comment do
    field(:id, :id)
    field(:content, :string)
    field(:user, :user, resolve: assoc(:user))
    field(:post, :post, resolve: assoc(:post))
  end

  input_object :comment_input do
    field(:content, non_null(:string))
    field(:post_id, non_null(:id))
  end
end
