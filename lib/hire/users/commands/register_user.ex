defmodule Hire.Users.Commands.RegisterUser do
  defstruct id: nil,
            name: "",
            type: "WORKER"

  def new(attrs), do: struct(__MODULE__, attrs)

  def assign_id(%__MODULE__{} = command, id),
    do: %__MODULE__{command | id: id}
end
