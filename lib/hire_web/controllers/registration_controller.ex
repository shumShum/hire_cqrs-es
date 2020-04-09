defmodule HireWeb.RegistrationController do
  use HireWeb, :controller

  alias Hire.Users

  def new(conn, _), do: render(conn)

  def create(conn, attrs) do
    case Users.register(attrs) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> redirect(to: "/jobs")

      _ ->
        conn
        |> put_flash(:error, "😡🤬😡")
        |> render(:new)
    end
  end
end
