# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dag_api,
  ecto_repos: [DagApi.Repo]

config :dag_api, DagApi.Repo,
  migration_primary_key: false,
  migration_foreign_key: [column: :id, type: :integer]

# Configures the endpoint
config :dag_api, DagApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "orpTnf0xfBlMuYUgK9ap31Tu9GTpfBim5wjbHI70iJtnJicJpeUwmK29GW5QF7gT",
  render_errors: [view: DagApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DagApi.PubSub,
  live_view: [signing_salt: "b0YR54FU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
