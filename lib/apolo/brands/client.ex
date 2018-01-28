defmodule Apolo.Brands.Client do
  use Ecto.Schema
  import Ecto.Changeset
  alias Apolo.Brands.Client


  schema "clients" do
    field :active, :boolean, default: false
    field :brand_holder, :string
    field :class, :string
    field :declaration_use_date, :naive_datetime
    field :denomination, :string
    field :due_date, :naive_datetime
    field :email, :string
    field :phone, :string
    field :registration_date, :naive_datetime
    field :rfc, :string

    timestamps()
  end

  @doc false
  def changeset(%Client{} = client, attrs) do
    client
    |> cast(attrs, [:brand_holder, :denomination, :class, :registration_date, :due_date, :declaration_use_date, :email, :phone, :rfc, :active])
    |> validate_required([:brand_holder, :denomination, :class, :registration_date, :due_date, :declaration_use_date, :email, :phone, :rfc, :active])
  end
end
