defmodule Hire.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :type]

  schema "users" do
    field :name, :string
    field :type, :string

    belongs_to :job, Hire.Jobs.Job

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
