defmodule PdfCalendarWeb.Router do
  use PdfCalendarWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PdfCalendarWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :download
  end

  # Other scopes may use custom stacks.
  # scope "/api", PdfCalendarWeb do
  #   pipe_through :api
  # end
end
