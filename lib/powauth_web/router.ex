defmodule PowauthWeb.Router do
  use PowauthWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug PowauthWeb.APIAuthPlug, otp_app: :powauth
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: PowauthWeb.APIAuthErrorHandler
  end

  scope "/api/v1", PowauthWeb.API.V1, as: :api_v1 do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  scope "/", PowauthWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/" do
    pipe_through :browser
    pow_routes()
  end

  # Other scopes may use custom stacks.
  # scope "/api", PowauthWeb do
  #   pipe_through :api
  # end
end
