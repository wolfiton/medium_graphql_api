defmodule MediumGraphqlApiWeb.Schema.PostTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MediumGraphqlApi.Repo

  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:content, :string)
    field(:published, :boolean)
    field(:user, :user, resolve: assoc(:user))
  end

  input_object :post_input do
    field(:title, non_null(:string))
    field(:content, non_null(:string))
    field(:published, non_null(:boolean))
  end
end
