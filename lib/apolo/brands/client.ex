defmodule Apolo.Brands.Client do
  use Ecto.Schema
  import Ecto.Changeset
  alias Apolo.Brands.Client


  schema "clients" do
    field :active, :boolean, default: false
    field :address, :string
    field :client, :string
    field :contact, :string
    field :email, :string
    field :phone, :string
    field :rfc, :string

    timestamps()
  end

  @doc false
  def changeset(%Client{} = client, attrs) do
    client
    |> cast(attrs, [:client, :contact, :email, :phone, :address, :rfc, :active])
    |> validate_required([:client, :contact, :email, :phone, :address, :rfc, :active])
  end
end
