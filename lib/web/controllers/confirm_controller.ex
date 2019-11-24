defmodule MediumGraphqlApiWeb.ConfirmController do
	use MediumGraphqlApiWeb, :controller

	def index(conn, %{"token" => token}) do
		with {:ok, id} <- Phoenix.Token.verify(MediumGraphqlApiWeb.Endpoint, token, "email", max_age: 86400),
              user = %MediumGraphqlApi.Accounts.User{} <- MediumGraphqlApi.Accounts.get_user!(id) do
            user
            |> MediumGraphqlApi.Accounts.update_user(%{confirmed: true})
            
            #create a page with template for success on confirmation
            conn
		else
            _ ->
                #create a page with error on confirmation
                conn
		end
	end
end