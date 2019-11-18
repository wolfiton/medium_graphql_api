defmodule MediumGraphqlApiWeb.Schema.SessionResolver do
  alias MediumGraphqlApiWeb.Endpoint, as: Endpoint

  def login_user(_, %{input: %{email: email, password: pass}}, _) do
    with {:ok, user} <- MediumGraphqlApiWeb.Session.authenticate(email, pass) do

        {:ok, %{token: Phoenix.Token.sign(Endpoint, "session", user.id), user: user}}
    end
  end
end
