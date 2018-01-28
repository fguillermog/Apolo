defmodule ApoloWeb.ClientController do
  use ApoloWeb, :controller

  alias Apolo.Brands
  alias Apolo.Brands.Client

  def index(conn, _params) do
    clients = Brands.list_clients()
    render(conn, "index.html", clients: clients)
  end

  def new(conn, _params) do
    changeset = Brands.change_client(%Client{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"client" => client_params}) do
    case Brands.create_client(client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client created successfully.")
        |> redirect(to: client_path(conn, :show, client))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Brands.get_client!(id)
    render(conn, "show.html", client: client)
  end

  def edit(conn, %{"id" => id}) do
    client = Brands.get_client!(id)
    changeset = Brands.change_client(client)
    render(conn, "edit.html", client: client, changeset: changeset)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Brands.get_client!(id)

    case Brands.update_client(client, client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client updated successfully.")
        |> redirect(to: client_path(conn, :show, client))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", client: client, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Brands.get_client!(id)
    {:ok, _client} = Brands.delete_client(client)

    conn
    |> put_flash(:info, "Client deleted successfully.")
    |> redirect(to: client_path(conn, :index))
  end
end
