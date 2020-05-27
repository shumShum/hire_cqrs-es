defmodule HireWeb.Plugs.AuthPlug do
  use HireWeb, :controller

  alias Hire.Users

  def init(opts), do: opts

  def call(conn, :authenticated) do
    case get_session(conn, :current_user) do
      nil ->
        conn
        |> redirect(to: "/signin")
        |> halt()

      user_id ->
        user = Users.get_by_id(user_id)

        conn
        |> Absinthe.Plug.put_options(context: %{user: user})
        |> assign(:user, user)
    end
  end

  def call(conn, :not_authenticated) do
    case get_session(conn, :current_user) do
      nil ->
        conn

      _ ->
        conn
        |> redirect(to: "/jobs")
        |> halt()
    end
  end
end
