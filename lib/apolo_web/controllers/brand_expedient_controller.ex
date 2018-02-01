defmodule ApoloWeb.BrandExpedientController do
  use ApoloWeb, :controller

  alias Apolo.Brands
  alias Apolo.Brands.BrandExpedient

  require Logger

  def index(conn, _params) do
    brand_expedients = Brands.list_brand_expedients()
    render(conn, "index.html", brand_expedients: brand_expedients)
  end

  def index_by_client_id(conn, %{"client_id" => client_id}) do
    client_id_integer = String.to_integer(client_id)
    client = Brands.get_client!(client_id_integer)
    brand_expedients = Brands.list_brand_expedients_by_client_id(client_id_integer)
    render(conn, "index.html", brand_expedients: brand_expedients, client: client)
  end

  def new(conn, _params) do
    changeset = Brands.change_brand_expedient(%BrandExpedient{})
    render(conn, "new.html", changeset: changeset)
  end

  def new_by_client_id(conn, %{"client_id" => client_id}) do
    client_id_integer = String.to_integer(client_id)
    client = Brands.get_client!(client_id_integer)
    changeset = Brands.change_brand_expedient(%BrandExpedient{})
    #Logger.info "changeset ====> #{inspect changeset}"
    render(conn, "new.html", changeset: changeset, client: client)
  end

  def create(conn, %{"brand_expedient" => brand_expedient_params}) do
    #Logger.info "params create ===>{brand_expedient_params}"
    client_id_integer = String.to_integer(brand_expedient_params["client_id"])
    client = Brands.get_client!(client_id_integer)
    #Logger.info "before create"
    case Brands.create_brand_expedient(brand_expedient_params) do
      {:ok, brand_expedient} ->
        #Logger.info "create"
        conn
        |> put_flash(:info, "Expedient creado satisfactoriamente.")
        |> redirect(to: brand_expedient_path(conn, :show, brand_expedient))
      {:error, %Ecto.Changeset{} = changeset} ->
        #Logger.info "error"
        render(conn, "new.html", changeset: changeset, client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    brand_expedient = Brands.get_brand_expedient!(id)
    client = Brands.get_client!(brand_expedient.client_id)
    render(conn, "show.html", brand_expedient: brand_expedient, client: client)
  end

  def edit(conn, %{"id" => id}) do
    brand_expedient = Brands.get_brand_expedient!(id)
    client = Brands.get_client!(brand_expedient.client_id)
    changeset = Brands.change_brand_expedient(brand_expedient)
    render(conn, "edit.html", brand_expedient: brand_expedient, changeset: changeset, client: client)
  end

  def update(conn, %{"id" => id, "brand_expedient" => brand_expedient_params}) do
    brand_expedient = Brands.get_brand_expedient!(id)

    case Brands.update_brand_expedient(brand_expedient, brand_expedient_params) do
      {:ok, brand_expedient} ->
        conn
        |> put_flash(:info, "Expediente actualizado satisfactoriamente.")
        |> redirect(to: brand_expedient_path(conn, :show, brand_expedient))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", brand_expedient: brand_expedient, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    brand_expedient = Brands.get_brand_expedient!(id)
    {:ok, _brand_expedient} = Brands.delete_brand_expedient(brand_expedient)

    conn
    |> put_flash(:info, "Expediente borrado satisfactoriamente.")
    |> redirect(to: brand_expedient_path(conn, :index))
  end
end
