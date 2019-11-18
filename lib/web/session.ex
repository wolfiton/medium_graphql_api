defmodule MediumGraphqlApiWeb.Session do
    alias MediumGraphqlApi.Repo
    alias MediumGraphqlApi.Accounts.User

    def authenticate(email, password) do
        user = Repo.get_by!(User, email: email)
    
        MediumGraphqlApi.Encryption.validate(password, user.password_hash)
        |> case do
          true ->
            {:ok, user}
    
          _ ->
            {:error, "Invalid credentials"}
        end
    end
end