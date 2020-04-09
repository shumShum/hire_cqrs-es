defmodule Hire.Jobs do
  import Ecto.Query
  alias Hire.RepoRead, as: Repo
  alias Hire.Jobs.Projections.Job

  alias Hire.Dispatcher
  alias Hire.Jobs.Commands.CreateJob
  alias Hire.Jobs.Commands.UpdateJob

  alias Hire.Utils

  def all_for(%{type: "WORKER", job_id: nil}) do
    Repo.all(
      from j in Job,
        preload: :company
    )
  end

  def all_for(%{type: "WORKER", job_id: current_job_id}) do
    Repo.all(
      from j in Job,
        where: j.id != ^current_job_id,
        preload: :company
    )
  end

  def all_for(%{type: "COMPANY", id: id}) do
    Repo.all(
      from j in Job,
        where: j.user_id == ^id,
        preload: :workers
    )
  end

  def fetch(id), do: Repo.fetch(Job, id)

  def create(user, attrs) do
    id = Utils.generate_id()

    attrs
    |> CreateJob.new()
    |> CreateJob.assign_id(id)
    |> CreateJob.assign_user(user)
    |> Dispatcher.dispatch(consistency: :strong)
  end

  def update(id, attrs) do
    update_job =
      attrs
      |> UpdateJob.new()
      |> UpdateJob.assign_id(id)

    Dispatcher.dispatch(update_job, consistency: :strong)
  end
end
