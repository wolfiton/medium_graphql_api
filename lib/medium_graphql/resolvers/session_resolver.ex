defmodule MediumGraphqlApiWeb.Schema.SessionResolver do

  def login_user(_, %{input: input}, _) do
    with {:ok, user} <- 
            MediumGraphqlApi.Accounts.Session.authenticate(input),
         {:ok, jwt_token, _} <- 
            MediumGraphqlApiWeb.Guardian.encode_and_sign(%{id: user.id}, %{}) do
      
        {:ok, %{token: jwt_token, user: user}}
    end
  end
end
