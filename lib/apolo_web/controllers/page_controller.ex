defmodule ApoloWeb.PageController do
  use ApoloWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
