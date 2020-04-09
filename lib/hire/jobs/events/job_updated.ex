defmodule Hire.Jobs.Events.JobUpdated do
  @derive Jason.Encoder
  defstruct [
    :id,
    :title,
    :salary,
    :limit
  ]
end
