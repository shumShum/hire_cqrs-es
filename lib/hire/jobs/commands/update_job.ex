defmodule Hire.Jobs.Commands.UpdateJob do
  defstruct id: nil,
            title: "",
            salary: 0,
            limit: 0

  def new(attrs), do: struct(__MODULE__, attrs)

  def assign_id(%__MODULE__{} = command, id),
    do: %__MODULE__{command | id: id}
end
