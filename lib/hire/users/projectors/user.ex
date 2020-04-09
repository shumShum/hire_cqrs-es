defmodule Hire.Users.Projectors.User do
  use Commanded.Projections.Ecto,
    application: Hire.Dispatcher,
    name: "Users.Projectors.User",
    consistency: :strong

  alias Hire.Users.Projections.User
  alias Hire.Users.Events.UserRegistered

  project(%UserRegistered{id: id, name: name, type: type}, fn multi ->
    Ecto.Multi.insert(multi, :user, %User{id: id, name: name, type: type},
      on_conflict: :nothing,
      conflict_target: :name
    )
  end)
end
