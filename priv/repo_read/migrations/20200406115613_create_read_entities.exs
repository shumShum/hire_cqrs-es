defmodule Hire.RepoRead.Migrations.CreateReadEntities do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string)
      add(:type, :string, default: "WORKER")
      add(:job_id, :integer)

      timestamps()
    end

    create(index(:users, [:job_id]))

    create table(:jobs) do
      add(:title, :string)
      add(:salary, :integer)
      add(:limit, :integer)
      add(:user_id, :integer)

      timestamps()
    end

    create(index(:jobs, [:user_id]))
  end
end
