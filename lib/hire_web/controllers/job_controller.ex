defmodule HireWeb.JobController do
  use HireWeb, :controller

  alias Hire.Jobs

  def index(conn, _) do
    jobs = Jobs.all_for(conn.assigns.user)
    render(conn, jobs: jobs)
  end
end
