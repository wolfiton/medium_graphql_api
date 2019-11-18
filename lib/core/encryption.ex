defmodule MediumGraphqlApi.Encryption do

  def hash(pass), do: Argon2.hash_pwd_salt(pass)
  def validate(pass, hash), do: Argon2.verify_pass(pass, hash)
end
