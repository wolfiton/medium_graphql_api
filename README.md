# MediumGraphqlApi

## Structuring the context and the app

Account Context -> User -> users

Blog Context -> Blog -> Article -> articles

Blog Context -> Blog -> Category -> categories

Blog Context -> Blog -> Tag -> tags

### Runing migrations

mix ecto.migrate

#### Adding deps

`

defp deps do
[
{:phoenix, "~> 1.4.7"},
{:phoenix_pubsub, "~> 1.1"},
{:phoenix_ecto, "~> 4.0"},
{:ecto_sql, "~> 3.0"},
{:postgrex, ">= 0.0.0"},
{:gettext, "~> 0.11"},
{:jason, "~> 1.0"},
{:plug_cowboy, "~> 2.0"},
{:absinthe, "~> 1.4"},
{:absinthe_plug, "~> 1.4"},
{:absinthe_ecto, "~> 0.1.3"}
{:argon2_elixir, "~> 2.0.5"},
{:absinthe_phoenix, "~> 1.4"},
{:bamboo, "~> 1.2"},
{:bamboo_smtp, "~> 1.7"},
{:argon2_elixir, "~> 2.0"}
]
end
`

##### Database Seeds

- Users Seed

- Articles Seed

- Tags Seed

- Categories Seed
