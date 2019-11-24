defmodule MediumGraphqlApiWeb.Schema.CommentResolver do
  
  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    Map.merge(input, %{user_id: current_user.id})
    |> MediumGraphqlApi.Blog.create_comment()
  end
end
