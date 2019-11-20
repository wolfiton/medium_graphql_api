defmodule MediumGraphqlApiWeb.Schema.CommentResolver do
  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    comment_input = Map.merge(input, %{user_id: current_user.id})
    IO.inspect(comment_input)
    MediumGraphqlApi.Blog.create_comment(comment_input)
  end
end
