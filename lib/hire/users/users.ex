defmodule Hire.Users do
  alias Hire.RepoRead, as: Repo
  alias Hire.Users.Projections.User

  alias Hire.Dispatcher
  alias Hire.Users.Commands.RegisterUser

  alias Hire.Utils

  def get_by_id(id), do: Repo.get(User, id) |> Repo.preload(job: :company)

  def fetch_by_name(name), do: Repo.fetch_by(User, name: name)

  def register(attrs \\ %{}) do
    id = Utils.generate_id()

    register_user =
      attrs
      |> RegisterUser.new()
      |> RegisterUser.assign_id(id)

    with :ok <- Dispatcher.dispatch(register_user, consistency: :strong) do
      fetch_by_name(register_user.name)
    end
  end
end
