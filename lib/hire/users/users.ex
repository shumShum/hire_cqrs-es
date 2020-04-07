defmodule Hire.Users do
  alias Hire.RepoRead, as: Repo
  alias Hire.Users.User

  def get_by_id(id), do: Repo.get(User, id) |> Repo.preload(job: :company)

  def fetch_by_name(name), do: Repo.fetch_by(User, name: name)
end
