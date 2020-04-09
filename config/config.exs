# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hire,
  ecto_repos: [Hire.RepoRead],
  event_stores: [Hire.EventStore]

# Configures the endpoint
config :hire, HireWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Pz7EJeH3g6kZmtwxURZMvDzwXARywlPz0gfmuBIecnWN9WO/svGZ0VbSA8VQ0zhq",
  render_errors: [view: HireWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hire.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "4HscVLD4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :hire, Hire.Dispatcher,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: Hire.EventStore
  ],
  pub_sub: :local,
  registry: :local

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: Hire.RepoRead

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine,
  slimleex: PhoenixSlime.LiveViewEngine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
