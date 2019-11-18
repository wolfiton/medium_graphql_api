defmodule MediumGraphqlApiWeb.Plugs.Context do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, id} <- Phoenix.Token.verify(MediumGraphqlApiWeb.Endpoint, token, "session", max_age: 86400),
         user = %MediumGraphqlApi.Accounts.User{} <- MediumGraphqlApi.Accounts.get_user!(id) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
