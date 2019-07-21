defmodule Medium do
  import Ecto.Query, warn: false
  alias MediumGraphqlApi.Repo

  alias Medium.{Post, Comment}


  def list_posts, do: Repo.all(Post)

  def get_post!(id), do: Repo.get!(Post, id)

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end

  # def list_comments, do: Repo.all(Comment)

  # def get_comment!(id), do: Repo.get!(Comment, id)
  
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

 
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

 
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

 
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end
end
