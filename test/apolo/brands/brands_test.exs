defmodule Apolo.BrandsTest do
  use Apolo.DataCase

  alias Apolo.Brands

  describe "clients" do
    alias Apolo.Brands.Client

    @valid_attrs %{active: true, brand_holder: "some brand_holder", class: "some class", declaration_use_date: ~N[2010-04-17 14:00:00.000000], denomination: "some denomination", due_date: ~N[2010-04-17 14:00:00.000000], email: "some email", phone: "some phone", registration_date: ~N[2010-04-17 14:00:00.000000], rfc: "some rfc"}
    @update_attrs %{active: false, brand_holder: "some updated brand_holder", class: "some updated class", declaration_use_date: ~N[2011-05-18 15:01:01.000000], denomination: "some updated denomination", due_date: ~N[2011-05-18 15:01:01.000000], email: "some updated email", phone: "some updated phone", registration_date: ~N[2011-05-18 15:01:01.000000], rfc: "some updated rfc"}
    @invalid_attrs %{active: nil, brand_holder: nil, class: nil, declaration_use_date: nil, denomination: nil, due_date: nil, email: nil, phone: nil, registration_date: nil, rfc: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Brands.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Brands.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Brands.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Brands.create_client(@valid_attrs)
      assert client.active == true
      assert client.brand_holder == "some brand_holder"
      assert client.class == "some class"
      assert client.declaration_use_date == ~N[2010-04-17 14:00:00.000000]
      assert client.denomination == "some denomination"
      assert client.due_date == ~N[2010-04-17 14:00:00.000000]
      assert client.email == "some email"
      assert client.phone == "some phone"
      assert client.registration_date == ~N[2010-04-17 14:00:00.000000]
      assert client.rfc == "some rfc"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Brands.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Brands.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.active == false
      assert client.brand_holder == "some updated brand_holder"
      assert client.class == "some updated class"
      assert client.declaration_use_date == ~N[2011-05-18 15:01:01.000000]
      assert client.denomination == "some updated denomination"
      assert client.due_date == ~N[2011-05-18 15:01:01.000000]
      assert client.email == "some updated email"
      assert client.phone == "some updated phone"
      assert client.registration_date == ~N[2011-05-18 15:01:01.000000]
      assert client.rfc == "some updated rfc"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Brands.update_client(client, @invalid_attrs)
      assert client == Brands.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Brands.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Brands.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Brands.change_client(client)
    end
  end

  describe "clients" do
    alias Apolo.Brands.Client

    @valid_attrs %{active: true, address: "some address", client: "some client", contact: "some contact", email: "some email", phone: "some phone", rfc: "some rfc"}
    @update_attrs %{active: false, address: "some updated address", client: "some updated client", contact: "some updated contact", email: "some updated email", phone: "some updated phone", rfc: "some updated rfc"}
    @invalid_attrs %{active: nil, address: nil, client: nil, contact: nil, email: nil, phone: nil, rfc: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Brands.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Brands.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Brands.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Brands.create_client(@valid_attrs)
      assert client.active == true
      assert client.address == "some address"
      assert client.client == "some client"
      assert client.contact == "some contact"
      assert client.email == "some email"
      assert client.phone == "some phone"
      assert client.rfc == "some rfc"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Brands.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Brands.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.active == false
      assert client.address == "some updated address"
      assert client.client == "some updated client"
      assert client.contact == "some updated contact"
      assert client.email == "some updated email"
      assert client.phone == "some updated phone"
      assert client.rfc == "some updated rfc"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Brands.update_client(client, @invalid_attrs)
      assert client == Brands.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Brands.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Brands.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Brands.change_client(client)
    end
  end
end
