defmodule MultistreamDownloader.Mixfile do
  use Mix.Project

  def project do
    [app: :multistream_downloader,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript_config,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger,
                    :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.6"}]
  end

  defp escript_config do
    [main_module: MultistreamDownloader.CLI,
     name: "msd"]
  end
end