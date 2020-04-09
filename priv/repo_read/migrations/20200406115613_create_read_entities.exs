defmodule Hire.RepoRead.Migrations.CreateReadEntities do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :bigint, primary_key: true)
      add(:name, :string)
      add(:type, :string, default: "WORKER")
      add(:job_id, :bigint)

      timestamps()
    end

    create(index(:users, [:job_id]))
    create(unique_index(:users, [:name]))

    create table(:jobs, primary_key: false) do
      add(:id, :bigint, primary_key: true)
      add(:title, :string)
      add(:salary, :integer)
      add(:limit, :integer)
      add(:user_id, :bigint)

      timestamps()
    end

    create(index(:jobs, [:user_id]))
  end
end
