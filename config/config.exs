# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :peepchat,
  ecto_repos: [Peepchat.Repo]

# Configures the endpoint
config :peepchat, Peepchat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tmbY4jUkKskLYzNvFy7foz/6uiTAVjgvGDtou1ZOiCf2TkMwWhxZrgs14E7o+Qnx",
  render_errors: [view: Peepchat.ErrorView, accepts: ~w(json)],
  pubsub: [name: Peepchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Peepchat",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "D/5TlFfEJrkJmteuYTjcI7k3hSYjqBEDEYGxI0ox0+NPSp3tXP5gtKnirajYJTJZ",
  serializer: Peepchat.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}
import_config "#{Mix.env}.exs"
