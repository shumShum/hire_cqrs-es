defmodule Hire.Users.Events.UserRegistered do
  @derive Jason.Encoder
  defstruct [
    :id,
    :name,
    :type
  ]
end
