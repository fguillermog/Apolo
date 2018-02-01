defmodule ApoloWeb.Router do
  use ApoloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end
  
  pipeline :auth do
    plug Apolo.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated    
  end

  #Maybe logged in scoped
  scope "/", ApoloWeb do
    pipe_through [:browser, :auth] # Use the default browser stack
    get "/", PageController, :index
    post "/", PageController, :login
    post "/logout", PageController, :logout
  end


  #Definitely logged in scope
  scope "/", ApoloWeb do
    pipe_through [:browser, :auth, :ensure_auth]
    get "/secret", PageController, :secret
    resources "/clients", ClientController
    resources "/brand_expedients", BrandExpedientController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ApoloWeb do
  #   pipe_through :api
  # end
end
