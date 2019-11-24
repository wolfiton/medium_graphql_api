defmodule MediumGraphqlApi.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w(message user_id post_id)a


  schema "comments" do
    field :message, :string

    belongs_to(:user, MediumGraphqlApi.Accounts.User, foreign_key: :user_id)
    belongs_to(:post, MediumGraphqlApi.Blog.Post, foreign_key: :post_id)
    has_one(:reply_to, __MODULE__, foreign_key: :reply_to_id)
    many_to_many(:replies, __MODULE__ , join_through: "replies", on_replace: :delete)

    timestamps()
  end


  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, @fields)
    |> validate_required([:message, :post_id, :user_id])
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:user_id)
  end
end
