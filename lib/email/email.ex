defmodule MediumGraphqlApi.Email do
  use Bamboo.Phoenix, view: BureauWeb.EmailView

  @moduledoc """
  Just some useful function to compose emails.
  """
  alias MediumGraphqlApiWeb.Endpoint, as: Endpoint

  @domain "localhost:4000"

  def send_confirmation(user) do
    new_email()
    |> to(user.email)
    |> from("Medium <welcome@#{@domain}.com>")
    |> subject("Confirmation Email")
    |> put_header("Reply-To", "support@#{@domain}.com")
    |> html_body(
      "<strong>Welcome to Medium! <br /> Please confirm your email: #{build_link(user.email)}</strong>"
    )
    |> text_body("Welcome to Medium. Please confirm your email: #{build_link(user.id)}")
    |> MediumGraphqlApi.Mailer.deliver_now()
  end

  defp build_link(id) do
    token = Phoenix.Token.sign(Endpoint, "email", id)
    URI.encode("http://#{@domain}/email-confirmation/#{token}")
  end
end
