# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :test_cldr, TestCldrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NOeOqwilFCAxTEY6wExO/8taYGDXZIdopgb+wEO8coOV/7FRuCIsAWc7ktVoZxkp",
  render_errors: [view: TestCldrWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestCldr.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :ex_cldr,
  default_locale: "en",
  locales: ["fr", "es"],
  gettext: TestCldrWeb.Gettext

config :appsignal, :config,
  active: true,
  name: "Sylar",
  push_api_key: System.get_env("APPSIGNAL_PUSH_API_KEY") || "empty",
  env: Mix.env()

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
