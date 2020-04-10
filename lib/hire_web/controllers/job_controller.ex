defmodule HireWeb.JobController do
  use HireWeb, :controller

  alias Hire.Jobs
  alias Hire.Users

  def index(conn, _) do
    jobs = Jobs.all_for(conn.assigns.user)
    render(conn, jobs: jobs)
  end

  def new(conn, _), do: render(conn, job: :job)

  def create(conn, %{job: attrs}) do
    :ok = Jobs.create(conn.assigns.user, attrs)
    redirect(conn, to: Routes.job_path(conn, :index))
  end

  def edit(conn, %{id: id}) do
    case Jobs.fetch(id) do
      {:ok, job} -> render(conn, changeset: Ecto.Changeset.cast(job, %{}, []), job: job)
      {:error, _} -> redirect(conn, to: Routes.job_path(conn, :index))
    end
  end

  def update(conn, %{id: id, job: params}) do
    :ok = Jobs.update(id, params)
    redirect(conn, to: Routes.job_path(conn, :index))
  end

  def get(conn, %{job_id: job_id}) do
    :ok = Users.get_job(conn.assigns.user, job_id)
    redirect(conn, to: Routes.job_path(conn, :index))
  end
end
