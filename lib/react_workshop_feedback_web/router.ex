defmodule ReactWorkshopFeedbackWeb.Router do
  use ReactWorkshopFeedbackWeb, :router

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

  scope "/", ReactWorkshopFeedbackWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/feedbacks", FeedbackController
    resources "/volunteers", VolunteerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReactWorkshopFeedbackWeb do
  #   pipe_through :api
  # end
end
