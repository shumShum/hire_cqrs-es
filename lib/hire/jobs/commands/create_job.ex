defmodule Hire.Jobs.Commands.CreateJob do
  defstruct id: nil,
            title: "",
            salary: 0,
            limit: 0,
            user_id: nil

  def new(attrs), do: struct(__MODULE__, attrs)

  def assign_id(%__MODULE__{} = command, id),
    do: %__MODULE__{command | id: id}

  def assign_user(%__MODULE__{} = command, user),
    do: %__MODULE__{command | user_id: user.id}
end
