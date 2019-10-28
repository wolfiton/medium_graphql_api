defmodule MediumGraphqlApi.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :message, :string

    belongs_to(:user, MediumGraphqlApi.Accounts.User, foreign_key: :user_id)
    belongs_to(:post, MediumGraphqlApi.Blog.Post, foreign_key: :post_id)
    has_one(:reply, __MODULE__, foreign_key: :reply_id)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:message])
    |> validate_required([:message])
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:user_id)
  end
end
