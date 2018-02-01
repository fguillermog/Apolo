defmodule ApoloWeb.BrandExpedientControllerTest do
  use ApoloWeb.ConnCase

  alias Apolo.Brands

  @create_attrs %{active: true, class: "some class", declaration_of_use: ~N[2010-04-17 14:00:00.000000], denomination: "some denomination", due_date: ~N[2010-04-17 14:00:00.000000], holder: "some holder", presentation_date: ~N[2010-04-17 14:00:00.000000], register_date: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{active: false, class: "some updated class", declaration_of_use: ~N[2011-05-18 15:01:01.000000], denomination: "some updated denomination", due_date: ~N[2011-05-18 15:01:01.000000], holder: "some updated holder", presentation_date: ~N[2011-05-18 15:01:01.000000], register_date: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{active: nil, class: nil, declaration_of_use: nil, denomination: nil, due_date: nil, holder: nil, presentation_date: nil, register_date: nil}

  def fixture(:brand_expedient) do
    {:ok, brand_expedient} = Brands.create_brand_expedient(@create_attrs)
    brand_expedient
  end

  describe "index" do
    test "lists all brand_expedients", %{conn: conn} do
      conn = get conn, brand_expedient_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Brand expedients"
    end
  end

  describe "new brand_expedient" do
    test "renders form", %{conn: conn} do
      conn = get conn, brand_expedient_path(conn, :new)
      assert html_response(conn, 200) =~ "New Brand expedient"
    end
  end

  describe "create brand_expedient" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, brand_expedient_path(conn, :create), brand_expedient: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == brand_expedient_path(conn, :show, id)

      conn = get conn, brand_expedient_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Brand expedient"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, brand_expedient_path(conn, :create), brand_expedient: @invalid_attrs
      assert html_response(conn, 200) =~ "New Brand expedient"
    end
  end

  describe "edit brand_expedient" do
    setup [:create_brand_expedient]

    test "renders form for editing chosen brand_expedient", %{conn: conn, brand_expedient: brand_expedient} do
      conn = get conn, brand_expedient_path(conn, :edit, brand_expedient)
      assert html_response(conn, 200) =~ "Edit Brand expedient"
    end
  end

  describe "update brand_expedient" do
    setup [:create_brand_expedient]

    test "redirects when data is valid", %{conn: conn, brand_expedient: brand_expedient} do
      conn = put conn, brand_expedient_path(conn, :update, brand_expedient), brand_expedient: @update_attrs
      assert redirected_to(conn) == brand_expedient_path(conn, :show, brand_expedient)

      conn = get conn, brand_expedient_path(conn, :show, brand_expedient)
      assert html_response(conn, 200) =~ "some updated class"
    end

    test "renders errors when data is invalid", %{conn: conn, brand_expedient: brand_expedient} do
      conn = put conn, brand_expedient_path(conn, :update, brand_expedient), brand_expedient: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Brand expedient"
    end
  end

  describe "delete brand_expedient" do
    setup [:create_brand_expedient]

    test "deletes chosen brand_expedient", %{conn: conn, brand_expedient: brand_expedient} do
      conn = delete conn, brand_expedient_path(conn, :delete, brand_expedient)
      assert redirected_to(conn) == brand_expedient_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, brand_expedient_path(conn, :show, brand_expedient)
      end
    end
  end

  defp create_brand_expedient(_) do
    brand_expedient = fixture(:brand_expedient)
    {:ok, brand_expedient: brand_expedient}
  end
end
