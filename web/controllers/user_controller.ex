defmodule Peepchat.UserController do
  use Peepchat.Web, :controller

  # alias Peepchat.User

  # plug ensure only authenticated users able to invoke create method
  plug Guardian.Plug.EnsureAuthenticated, handler: Peepchat.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Peepchat.UserView, "show.json", user: user)
  end
end
