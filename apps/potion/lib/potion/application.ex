defmodule Potion.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Potion.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Potion.PubSub}
      # Start a worker by calling: Potion.Worker.start_link(arg)
      # {Potion.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Potion.Supervisor)
  end
end
