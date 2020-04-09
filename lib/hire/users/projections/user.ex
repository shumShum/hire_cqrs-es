defmodule Hire.Users.Projections.User do
  use Ecto.Schema

  @primary_key {:id, :integer, autogenerate: false}

  schema "users" do
    field :name, :string, unique: true
    field :type, :string

    belongs_to :job, Hire.Jobs.Projections.Job

    timestamps()
  end
end
