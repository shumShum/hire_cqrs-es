defmodule Hire.Jobs.Projectors.Job do
  use Commanded.Projections.Ecto,
    application: Hire.Dispatcher,
    name: "Jobs.Projectors.Job",
    consistency: :strong

  import Ecto.Query

  alias Hire.Jobs.Projections.Job
  alias Hire.Jobs.Events.JobCreated
  alias Hire.Jobs.Events.JobUpdated

  project(%JobCreated{} = event, fn multi ->
    IO.inspect(event, label: :projector)

    Ecto.Multi.insert(
      multi,
      :job,
      %Job{
        id: event.id,
        title: event.title,
        salary: String.to_integer(event.salary),
        limit: String.to_integer(event.limit),
        user_id: event.user_id
      },
      on_conflict: :nothing,
      conflict_target: :id
    )
  end)

  project(%JobUpdated{id: id} = event, fn multi ->
    Ecto.Multi.update_all(multi, :job, job_query(id),
      set: [title: event.title, salary: event.salary, limit: event.limit]
    )
  end)

  defp job_query(id) do
    from j in Job,
      where: j.id == ^id
  end
end
