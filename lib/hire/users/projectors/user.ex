defmodule Hire.Users.Projectors.User do
  use Commanded.Projections.Ecto,
    application: Hire.Dispatcher,
    name: "Users.Projectors.User",
    consistency: :strong

  import Ecto.Query

  alias Hire.Users.Projections.User
  alias Hire.Users.Events.UserRegistered
  alias Hire.Users.Events.UserGotJob

  project(%UserRegistered{id: id, name: name, type: type}, fn multi ->
    Ecto.Multi.insert(multi, :user, %User{id: id, name: name, type: type},
      on_conflict: :nothing,
      conflict_target: :name
    )
  end)

  project(%UserGotJob{id: id, job_id: job_id}, fn multi ->
    Ecto.Multi.update_all(multi, :job, user_query(id), set: [job_id: job_id])
  end)

  defp user_query(id) do
    from j in User,
      where: j.id == ^id
  end
end
