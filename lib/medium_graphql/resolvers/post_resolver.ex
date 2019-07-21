defmodule MediumGraphqlApiWeb.Schema.PostResolver do

  def posts(_, _, _), do: {:ok, Medium.list_posts}

  def post(_, %{id: id}, _) do
    {:ok, Medium.get_post!(id)}
  end

  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    post_input = Map.merge(input, %{user_id: current_user.id})
    Medium.create_post(post_input)
  end
end
