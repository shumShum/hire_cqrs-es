defmodule Hire.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Hire.RepoRead,
      HireWeb.Telemetry,
      HireWeb.Endpoint,
      Hire.Dispatcher,
      Hire.Users.Sup,
      Hire.Jobs.Sup
    ]

    opts = [strategy: :one_for_one, name: Hire.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    HireWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
