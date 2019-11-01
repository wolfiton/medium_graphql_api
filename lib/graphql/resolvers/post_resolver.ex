defmodule MediumGraphqlApiWeb.Schema.PostResolver do

  def posts(_, _, _), do: {:ok, MediumGraphqlApi.Blog.list_posts}

  def post(_, %{id: id}, _) do
    {:ok, MediumGraphqlApi.Blog.get_post!(id)}
  end

  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    post_input = Map.merge(input, %{user_id: current_user.id})
    MediumGraphqlApi.Blog.create_post(post_input)
  end
end
