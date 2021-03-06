defmodule MSD.Downloader.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def start_download(uri, identifier) do
    Supervisor.start_child(__MODULE__, [%{uri: uri, identifier: identifier}])
  end

  def init(:ok) do
    children = [
      worker(MSD.Downloader.Worker, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
