defmodule PmBotWeb.Router do
  use PmBotWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # FIXME:
    # Quite obviously, we need to re-enable this at some point. What we are 
    # asked to do, however, is somehow fold a CSRF token into each of the POST
    # requests dispatched from GitHub's webhooks. 
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PmBotWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # Re: GitHub webhook events
    # get "/payload", PayloadController, :index
    get "/payload", PayloadController, :on_post
    post "/payload", PayloadController, :on_post
  end

  # Other scopes may use custom stacks.
  # scope "/api", PmBotWeb do
  #   pipe_through :api
  # end
end
