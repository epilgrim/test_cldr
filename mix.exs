defmodule TestCldr.Mixfile do
  use Mix.Project

  def project do
    [
      app: :test_cldr,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers() ++ [:cldr],
      build_embedded: true,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {TestCldr.Application, []},
      extra_applications: [:logger, :cldr]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.4"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:appsignal, "~> 1.8.1"},
      {:ex_cldr_numbers, "~> 1.5"},
      {:ex_cldr_dates_times, "~> 1.3"},
      {:cowboy, "~> 1.0"}
    ]
  end
end
