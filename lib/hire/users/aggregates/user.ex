defmodule Hire.Users.Aggregates.User do
  defstruct [:id, :name, :type]

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

  def apply(%__MODULE__{} = user, %UserRegistered{} = event) do
    %__MODULE__{
      user
      | id: event.id,
        name: event.name,
        type: event.type
    }
  end
end
