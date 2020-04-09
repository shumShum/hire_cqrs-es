defmodule Hire.Jobs.Projections.Job do
  use Ecto.Schema

  alias Hire.Users.Projections.User

  @primary_key {:id, :integer, autogenerate: false}

  schema "jobs" do
    field :title, :string
    field :salary, :integer
    field :limit, :integer

    belongs_to :company, User, foreign_key: :user_id
    has_many :workers, User

    timestamps()
  end
end
