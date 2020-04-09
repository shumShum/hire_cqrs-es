defmodule Hire.Jobs.Events.JobCreated do
  @derive Jason.Encoder
  defstruct [
    :id,
    :title,
    :salary,
    :limit,
    :user_id
  ]
end
