defmodule Peepchat.Router do
  use Peepchat.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api", Peepchat do
    pipe_through :api

    # Registration
    post "/register", RegistrationController, :create

    # POST request route to create method in SessionController and within code, refer to route as login
    # ie login_path
    post "/token", SessionController, :create, as: :login
  end

  scope "/api", Peepchat do
    pipe_through :api_auth
    get "/user/current", UserController, :current
    resources "user", UserController, only: [:show, :index] do
      # user_rooms_path
      get "rooms", RoomController, :index, as: :rooms
    end
    resources "rooms", RoomController, except: [:new, :edit]
  end
end
