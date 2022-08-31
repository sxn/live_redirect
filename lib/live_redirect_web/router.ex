defmodule LiveRedirectWeb.Router do
  use LiveRedirectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveRedirectWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveRedirectWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/first", FirstLive, :index
    live "/second", SecondLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveRedirectWeb do
  #   pipe_through :api
  # end
end
