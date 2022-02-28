defmodule Dealcloud.MixProject do
  use Mix.Project

  @source_url "https://github.com/perrautc/elixir-dealcloud"
  @version "0.3.0"
  def project do
    [
      app: :dealcloud,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      deps: deps(),
      preferred_cli_env: [docs: :docs],
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:hackney, "~> 1.18"},
      {:poison, "~> 5.0"},
      {:json, "~> 1.4"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:inch_ex, "~> 2.0", only: :dev},
      {:bypass, "~> 2.1", only: :test}
    ]
  end

  defp description() do
    """
    A blazing fast SDK for the DealCloud & OnePlace CRM in pure Elixir.
    """
  end

  defp package() do
    [
      maintainers: ["Charles Perraut"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "Dealcloud",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/dealcloud",
      source_url: @source_url,
      extras: ["README.md", "CHANGELOG.md"]
    ]
  end
end
