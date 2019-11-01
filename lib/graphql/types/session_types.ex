defmodule MediumGraphqlApiWeb.Schema.SessionTypes do
  use Absinthe.Schema.Notation

  @desc "describe the session type"
  object :session do
    field(:token, :string)
    field(:user, :user)
  end

  @desc "describe the value that can be send for the session type"
  input_object :session_input do
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end
end
