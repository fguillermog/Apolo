defmodule ApoloWeb.BrandExpedientController do
  use ApoloWeb, :controller

  alias Apolo.Brands
  alias Apolo.Brands.BrandExpedient

  def index(conn, _params) do
    brand_expedients = Brands.list_brand_expedients()
    render(conn, "index.html", brand_expedients: brand_expedients)
  end

  def new(conn, _params) do
    changeset = Brands.change_brand_expedient(%BrandExpedient{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"brand_expedient" => brand_expedient_params}) do
    case Brands.create_brand_expedient(brand_expedient_params) do
      {:ok, brand_expedient} ->
        conn
        |> put_flash(:info, "Brand expedient created successfully.")
        |> redirect(to: brand_expedient_path(conn, :show, brand_expedient))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    brand_expedient = Brands.get_brand_expedient!(id)
    render(conn, "show.html", brand_expedient: brand_expedient)
  end

  def edit(conn, %{"id" => id}) do
    brand_expedient = Brands.get_brand_expedient!(id)
    changeset = Brands.change_brand_expedient(brand_expedient)
    render(conn, "edit.html", brand_expedient: brand_expedient, changeset: changeset)
  end

  def update(conn, %{"id" => id, "brand_expedient" => brand_expedient_params}) do
    brand_expedient = Brands.get_brand_expedient!(id)

    case Brands.update_brand_expedient(brand_expedient, brand_expedient_params) do
      {:ok, brand_expedient} ->
        conn
        |> put_flash(:info, "Brand expedient updated successfully.")
        |> redirect(to: brand_expedient_path(conn, :show, brand_expedient))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", brand_expedient: brand_expedient, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    brand_expedient = Brands.get_brand_expedient!(id)
    {:ok, _brand_expedient} = Brands.delete_brand_expedient(brand_expedient)

    conn
    |> put_flash(:info, "Brand expedient deleted successfully.")
    |> redirect(to: brand_expedient_path(conn, :index))
  end
end
