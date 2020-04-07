defmodule Hire.Jobs do
  import Ecto.Query
  alias Hire.RepoRead, as: Repo
  alias Hire.Jobs.Job

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
end
