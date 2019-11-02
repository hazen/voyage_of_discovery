defmodule VoyageOfDiscovery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: VoyageOfDiscovery.Router, options: [port: cowboy_port()]}
      # {Plug.Cowboy, scheme: :http, plug: VoyageOfDiscovery.HelloWorldPlug, options: [port: 8080]}
      # Starts a worker by calling: VoyageOfDiscovery.Worker.start_link(arg)
      # {VoyageOfDiscovery.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VoyageOfDiscovery.Supervisor]
    Logger.info("Starting application...")
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port(), do: Application.get_env(:voyage_of_discovery, :cowboy_port, 8080)
end
