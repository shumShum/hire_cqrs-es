defmodule HireWeb.Router do
  use HireWeb, :router

  alias HireWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authenticated do
    plug Plugs.AuthPlug, :authenticated
  end

  pipeline :not_authenticated do
    plug :put_layout, {HireWeb.LayoutView, :auth}
    plug Plugs.AuthPlug, :not_authenticated
  end

  scope "/", HireWeb do
    pipe_through :browser

    scope "/" do
      pipe_through :not_authenticated

      get "/signup", RegistrationController, :new
      post "/signup", RegistrationController, :create

      get "/signin", SessionController, :new
      post "/signin", SessionController, :create
    end

    scope "/" do
      pipe_through :authenticated

      delete "/signout", SessionController, :delete

      get "/", JobController, :index
      resources "/jobs", JobController
    end
  end
end
