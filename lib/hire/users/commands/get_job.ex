defmodule Hire.Users.Commands.GetJob do
  defstruct [:id, :job_id]

  def new(attrs), do: struct(__MODULE__, attrs)
end
