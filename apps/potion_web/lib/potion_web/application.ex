defmodule PotionWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PotionWeb.Telemetry,
      # Start the Endpoint (http/https)
      PotionWeb.Endpoint
      # Start a worker by calling: PotionWeb.Worker.start_link(arg)
      # {PotionWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PotionWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PotionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
