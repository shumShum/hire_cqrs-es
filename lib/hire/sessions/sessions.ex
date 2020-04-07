defmodule Hire.Sessions do
  alias Hire.Users

  def signin(name), do: Users.fetch_by_name(name)
end
