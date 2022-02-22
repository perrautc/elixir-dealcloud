defmodule Dealcloud.MixProject do
  use Mix.Project

  def project do
    [
      app: :dealcloud,
      version: "0.2.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
end
