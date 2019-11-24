defmodule MediumGraphqlApiWeb.Schema.PostTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MediumGraphqlApi.Repo

  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:body, :string)
    field(:user, :user, resolve: assoc(:user))
    # field(:categories, :category, resolve: assoc(:category))
    # field(:tags, :tag, resolve: assoc(:tag))
  end

  input_object :post_input do
    field(:title, non_null(:string))
    field(:body, non_null(:string))
  end
end
