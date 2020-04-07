defmodule Hire.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:title, :salary, :limit, :user_id]

  schema "jobs" do
    field :title, :string
    field :salary, :integer
    field :limit, :integer

    belongs_to :company, Hire.Users.User, foreign_key: :user_id
    has_many :workers, Hire.Users.User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
