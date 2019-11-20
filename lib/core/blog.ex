defmodule MediumGraphqlApi.Blog do
  @moduledoc """
  The Blog context.
  """
  import Ecto.Query, warn: false
  alias MediumGraphqlApi.Repo
  alias MediumGraphqlApi.Blog.{Comment, Post, Category, Tag}

  def list_posts do
    Repo.all(Post)
  end

  def get_post!(id), do: Repo.get!(Post, id)

  def create_post(attrs = %{tags: tags, categories: cat}) do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:create_post, run_create_post(attrs))
    |> Ecto.Multi.run(:get_tags, get_tags(tags))
    |> Ecto.Multi.run(:get_categories, get_categories(cat))
    |> Ecto.Multi.run(:create_tags, create_tags(tags))
    |> Ecto.Multi.run(:create_categories, create_categories(cat))
    |> Ecto.Multi.run(:update_post_assoc, &update_post_assoc/2)
    |> Repo.transaction()
  end

  defp run_create_post(attrs) do
    fn repo, _ ->
      %Post{}
      |> Post.changeset(attrs)
      |> repo.insert()
    end
  end

  defp get_tags(tags) do
    fn repo, _ ->
      {:ok, repo.all(from t in Tag, where: t.name in ^tags)}
    end
  end

  defp get_categories(categories) do
    fn repo, _ ->
      {:ok, repo.all(from c in Category, where: c.name in ^categories)}
    end
  end

  defp create_tags(tags) do
    fn repo, %{get_tags: existing} ->
      new = tags -- Enum.map(existing, fn x -> x.name end)

      {_, list} =
        repo.insert_all(Tag, Enum.map(new, fn x -> %{name: x} end),
          on_conflict: :nothing,
          returning: true
        )

      {:ok, list}
    end
  end

  defp create_categories(categories) do
    fn repo, %{get_categories: existing} ->
      new = categories -- Enum.map(existing, fn x -> x.name end)

      {_, list} =
        repo.insert_all(Category, Enum.map(new, fn x -> %{name: x} end),
          on_conflict: :nothing,
          returning: true
        )

      {:ok, list}
    end
  end

  def update_post_assoc(repo, data) do
    data.create_post
    |> Repo.preload(:tags)
    |> Repo.preload(:categories)
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:tags, data.get_tags ++ data.create_tags)
    |> Ecto.Changeset.put_assoc(:categories, data.get_categories ++ data.create_categories)
    |> repo.update()
  end

  def get_comment(id), do: Repo.one!(Comment, id)

  def create_comment(attrs = %{current_user: current_user, reply_user: reply_user}) do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:create_comment, run_create_comment(attrs))
    |> Ecto.Multi.run(:get_user, get_current_user(current_user))
    |> Ecto.Multi.run(:get_reply, get_reply_user(reply_user))
  end

  defp run_create_comment(attrs) do
    fn repo, _ ->
      %Comment{}
      |> Comment.changeset(attrs)
      |> repo.insert()
    end
  end

  def get_current_user(current_user: current_user) do
    Repo.one!(User, current_user)
  end

  defp get_reply_user(reply_user: reply_user) do
    Repo.one!(Comment, reply_user)
  end
end
