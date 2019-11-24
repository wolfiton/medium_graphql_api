defmodule MediumGraphqlApi.Accounts do
  @moduledoc """
  The Accounts context.
  """
  import Ecto.Query, warn: false
  alias MediumGraphqlApi.Repo

  alias MediumGraphqlApi.Accounts.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:insert_user, insert_user(attrs))
    |> Ecto.Multi.run(:send_email, &send_email/2)
    |> Repo.transaction
  end

  defp insert_user(attrs) do
    fn repo, _ -> 
      %User{}
      |> User.changeset(attrs)
      |> repo.insert()
    end
  end

  defp send_email(_, %{insert_user: user}) do
    MediumGraphqlApi.Email.send_confirmation(user)
    {:ok, user}
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end
end
