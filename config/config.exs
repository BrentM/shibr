# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shibr,
  ecto_repos: [Shibr.Repo]

# Configures the endpoint
config :shibr, ShibrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vGYu4TtQkMvfRs1J76b+5y1y7b85HrrKsjyDHdfJz7AKPozAkngh79dBV8jSSTK7",
  render_errors: [view: ShibrWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Shibr.PubSub,
  live_view: [signing_salt: "JvWS9yEX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
