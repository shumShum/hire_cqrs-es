defmodule HireWeb.UserResolver do
  def current(_, _, %{context: ctx}) do
    {:ok, ctx.user}
  end

  # def signup(_, _args, _) do
  # end

  # def signin(_, _args, _) do
  # end

  # def signout(_, _, %{context: _ctx}) do
  # end
end
