defmodule ApoloWeb.PageController do
  use ApoloWeb, :controller
  alias Apolo.Auth
  alias Apolo.Auth.User
  alias Apolo.Auth.Guardian
  require Logger

  def index(conn, _params) do
  	changeset = Auth.change_user(%User{})
  	maybe_user = Guardian.Plug.current_resource(conn)
  	message = if maybe_user != nil do
  		"Someone is logged in"
  	else
  		"No one is logged in"
  	end

  	conn
  		|> put_flash( :info, message)
  		|> render("index.html", changeset: changeset, action: page_path(conn, :login), maybe_user: maybe_user) 
  end

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    Logger.info "user => #{inspect username}"
  	Auth.authenticate_user(username, password)
  	|>login_reply(conn)
  end

  defp login_reply({:error, error}, conn) do
  	conn
  	|> put_flash(:error, error)
  	|> redirect(to: "/")
  end

  defp login_reply({:ok, user}, conn) do
  	conn
  	|> put_flash(:success, "Welcome back!")
  	|> Guardian.Plug.sign_in(user)
  	|> redirect(to: "/secret")
  end


  def logout(conn, _) do
  	conn
  	|> Guardian.Plug.sign_out()
  	|> redirect(to: page_path(conn, :login))
  end

  def secret(conn, _params) do
    render(conn, "secret.html")
  end

end
