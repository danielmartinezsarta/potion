# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :potion,
  ecto_repos: [Potion.Repo]

config :potion_web,
  ecto_repos: [Potion.Repo],
  generators: [context_app: :potion]

# Configures the endpoint
config :potion_web, PotionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n/IjgUZ9ah5OTEq9ZWjCqvjizpX6Su2qbeEOUTEEjLsiI5ZexW7QvFg+dgVnL7yf",
  render_errors: [view: PotionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Potion.PubSub,
  live_view: [signing_salt: "kqeRjhXQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
