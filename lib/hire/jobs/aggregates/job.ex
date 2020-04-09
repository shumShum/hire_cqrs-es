defmodule Hire.Jobs.Aggregates.Job do
  defstruct [:id, :title, :salary, :limit, :user_id]

  alias Hire.Jobs.Commands.CreateJob
  alias Hire.Jobs.Commands.UpdateJob

  alias Hire.Jobs.Events.JobCreated
  alias Hire.Jobs.Events.JobUpdated

  def execute(%__MODULE__{}, %CreateJob{} = command) do
    %JobCreated{
      id: command.id,
      title: command.title,
      salary: command.salary,
      limit: command.limit,
      user_id: command.user_id
    }
  end

  def execute(%__MODULE__{}, %UpdateJob{} = command) do
    %JobUpdated{
      id: command.id,
      title: command.title,
      salary: command.salary,
      limit: command.limit
    }
  end

  def apply(%__MODULE__{} = job, %JobCreated{} = event) do
    %__MODULE__{
      job
      | id: event.id,
        title: event.title,
        salary: event.salary,
        limit: event.limit,
        user_id: event.user_id
    }
  end

  def apply(%__MODULE__{} = job, %JobUpdated{} = event) do
    %__MODULE__{
      job
      | id: event.id,
        title: event.title,
        salary: event.salary,
        limit: event.limit
    }
  end
end
