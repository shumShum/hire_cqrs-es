defmodule Hire.Users.Events.UserGotJob do
  @derive Jason.Encoder
  defstruct [
    :id,
    :job_id
  ]
end
