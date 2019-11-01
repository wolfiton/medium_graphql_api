# defmodule MediumGraphqlApiWeb.Plugs.Context do
#   @behaviour Plug

#   import Plug.Conn

#   def init(opts), do: opts

#   def call(conn, _) do
#     context = build_context(conn)
#     Absinthe.Plug.put_options(conn, context: context)
#   end

#   defp build_context(conn) do
#     with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
#          {:ok, claims} <- MediumGraphqlApiWeb.Guardian.decode_and_verify(token),
#          {:ok, %{"id" => id}} <- MediumGraphqlApiWeb.Guardian.resource_from_claims(claims) do
#       %{current_user: Medium.Accounts.get_user!(id)}
#     else
#       _ -> %{}
#     end
#   end
# end
