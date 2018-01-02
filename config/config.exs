# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :apolo,
  ecto_repos: [Apolo.Repo]

# Configures the endpoint
config :apolo, ApoloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cFXZ+C6q8hwh0hUuUUkWrgvkLfUxEc3O6U190NfDzDEhp+pDYcBv/KAJ9FsXXGmz",
  render_errors: [view: ApoloWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Apolo.PubSub,
           adapter: Phoenix.PubSub.PG2]


config :apolo, Apolo.Auth.Guardian,
  issuer: "apolo", # Name of your app/company/product
  secret_key: "GjGGD1oGvDTDEz+Wdrjz+Bmo+wpRdkrEIPS7UPOUd8nPMPd+gThzBx43enuVG9ae" # Replace this with the output of the mix command

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
