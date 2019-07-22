# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MediumGraphqlApi.Repo.insert!(%MediumGraphqlApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Medium.Repo
alias Medium.{User,Post, Comment}


Repo.insert! %User{
    first_name: "a@a.com",
    last_name: "a@a.com",
    email: "a@a.com",
    password: ("a@a.com"|> Argon2.add_hash()),
    password_confirmation: "a@a.com"
}

Repo.insert! %User{
    first_name: "b@b.com",
    last_name: "b@b.com",
    email: "b@b.com",
    password: ("b@b.com"|> Argon2.add_hash()),
    password_confirmation: "b@b.com"
}


