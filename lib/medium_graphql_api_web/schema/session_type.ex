defmodule MediumGraphqlApiWeb.Schema.Types.Sessiontype do
  use Absinthe.Schema.Notation

  @desc "describe the session type"
  object :session_type do
    field(:token, :string)
    field(:user, :user_type)
  end

  @desc "describe the value that can be send for the session type"
  input_object :session_input_type do
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end
end
