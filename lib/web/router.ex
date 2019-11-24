defmodule MediumGraphqlApiWeb.Router do
  use MediumGraphqlApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  #GraphQl
  scope "/api" do
    pipe_through :api

    get "/email-confirmation/:token", MediumGraphqlApiWeb.ConfirmController, :index

    forward "/graphql", Absinthe.Plug,
      schema: MediumGraphqlApiWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: MediumGraphqlApiWeb.Schema
  end
end
