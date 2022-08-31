defmodule LiveRedirect.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveRedirect.Repo,
      # Start the Telemetry supervisor
      LiveRedirectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveRedirect.PubSub},
      # Start the Endpoint (http/https)
      LiveRedirectWeb.Endpoint
      # Start a worker by calling: LiveRedirect.Worker.start_link(arg)
      # {LiveRedirect.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveRedirect.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveRedirectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
