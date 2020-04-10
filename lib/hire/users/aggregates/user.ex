defmodule Hire.Users.Aggregates.User do
  defstruct [:id, :name, :type, :job_id]

  alias Hire.Users.Commands.RegisterUser
  alias Hire.Users.Commands.GetJob

  alias Hire.Users.Events.UserRegistered
  alias Hire.Users.Events.UserGotJob

  def execute(%__MODULE__{}, %RegisterUser{} = command) do
    %UserRegistered{
      id: command.id,
      name: command.name,
      type: command.type
    }
  end

  def execute(%__MODULE__{}, %GetJob{} = command) do
    %UserGotJob{
      id: command.id,
      job_id: command.job_id
    }
  end

  def apply(%__MODULE__{} = user, %UserRegistered{} = event) do
    %__MODULE__{
      user
      | id: event.id,
        name: event.name,
        type: event.type
    }
  end

  def apply(%__MODULE__{} = user, %UserGotJob{} = event) do
    %__MODULE__{
      user
      | id: event.id,
        job_id: event.job_id
    }
  end
end
