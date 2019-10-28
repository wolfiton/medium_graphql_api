defmodule MediumGraphqlApiWeb.Router do
  use Phoenix.Router
  import Phoenix.Controller

  pipeline :api do
    plug :accepts, ["json"]
  end

   #GraphQl
   scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
      schema: MediumGraphqlApiWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: MediumGraphqlApiWeb.Schema
  end
end
