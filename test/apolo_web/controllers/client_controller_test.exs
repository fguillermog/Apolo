defmodule ApoloWeb.ClientControllerTest do
  use ApoloWeb.ConnCase

  alias Apolo.Brands

  @create_attrs %{active: true, brand_holder: "some brand_holder", class: "some class", declaration_use_date: ~N[2010-04-17 14:00:00.000000], denomination: "some denomination", due_date: ~N[2010-04-17 14:00:00.000000], email: "some email", phone: "some phone", registration_date: ~N[2010-04-17 14:00:00.000000], rfc: "some rfc"}
  @update_attrs %{active: false, brand_holder: "some updated brand_holder", class: "some updated class", declaration_use_date: ~N[2011-05-18 15:01:01.000000], denomination: "some updated denomination", due_date: ~N[2011-05-18 15:01:01.000000], email: "some updated email", phone: "some updated phone", registration_date: ~N[2011-05-18 15:01:01.000000], rfc: "some updated rfc"}
  @invalid_attrs %{active: nil, brand_holder: nil, class: nil, declaration_use_date: nil, denomination: nil, due_date: nil, email: nil, phone: nil, registration_date: nil, rfc: nil}

  def fixture(:client) do
    {:ok, client} = Brands.create_client(@create_attrs)
    client
  end

  describe "index" do
    test "lists all clients", %{conn: conn} do
      conn = get conn, client_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Clients"
    end
  end

  describe "new client" do
    test "renders form", %{conn: conn} do
      conn = get conn, client_path(conn, :new)
      assert html_response(conn, 200) =~ "New Client"
    end
  end

  describe "create client" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == client_path(conn, :show, id)

      conn = get conn, client_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Client"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @invalid_attrs
      assert html_response(conn, 200) =~ "New Client"
    end
  end

  describe "edit client" do
    setup [:create_client]

    test "renders form for editing chosen client", %{conn: conn, client: client} do
      conn = get conn, client_path(conn, :edit, client)
      assert html_response(conn, 200) =~ "Edit Client"
    end
  end

  describe "update client" do
    setup [:create_client]

    test "redirects when data is valid", %{conn: conn, client: client} do
      conn = put conn, client_path(conn, :update, client), client: @update_attrs
      assert redirected_to(conn) == client_path(conn, :show, client)

      conn = get conn, client_path(conn, :show, client)
      assert html_response(conn, 200) =~ "some updated brand_holder"
    end

    test "renders errors when data is invalid", %{conn: conn, client: client} do
      conn = put conn, client_path(conn, :update, client), client: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Client"
    end
  end

  describe "delete client" do
    setup [:create_client]

    test "deletes chosen client", %{conn: conn, client: client} do
      conn = delete conn, client_path(conn, :delete, client)
      assert redirected_to(conn) == client_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, client_path(conn, :show, client)
      end
    end
  end

  defp create_client(_) do
    client = fixture(:client)
    {:ok, client: client}
  end
end
