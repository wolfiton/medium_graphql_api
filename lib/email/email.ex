defmodule MediumGraphqlApi.Email do
  use Bamboo.Phoenix, view: BureauWeb.EmailView

  @moduledoc """
  Just some useful function to compose emails.
  """
  alias MediumGraphqlApiWeb.Endpoint, as: Endpoint

  @domain "medium"

  def send_confirmation(user) do
    new_email()
    |> to(user.email)
    |> from("Medium <welcome@#{@domain}.com>")
    |> subject("Confirmation Email")
    |> put_header("Reply-To", "support@#{@domain}.com")
    |> html_body(
      "<strong>Welcome to Medium! <br /> Please confirm your email: #{build_link(user.email)}</strong>"
    )
    |> text_body("Welcome to Medium. Please confirm your email: #{build_link(user.email)}")
    |> MediumGraphqlApi.Mailer.deliver_now()
  end

  defp build_link(email) do
    token = Phoenix.Token.sign(Endpoint, "email", email)
    URI.encode("http://#{@domain}/email-confirmation/#{token}")
  end
end
