defmodule HireWeb.SessionController do
  use HireWeb, :controller

  alias Hire.Users

  def new(conn, _), do: render(conn)

  def create(conn, %{name: name}) do
    case Users.fetch_by_name(name) do
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

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> redirect(to: "/signin")
  end
end
