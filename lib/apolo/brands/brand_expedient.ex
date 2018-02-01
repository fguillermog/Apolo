defmodule Apolo.Brands.BrandExpedient do
  use Ecto.Schema
  import Ecto.Changeset
  alias Apolo.Brands.{BrandExpedient, Client}


  schema "brand_expedients" do
    field :active, :boolean, default: false
    field :class, :string
    field :declaration_of_use, :naive_datetime
    field :denomination, :string
    field :due_date, :naive_datetime
    field :holder, :string
    field :presentation_date, :naive_datetime
    field :register_date, :naive_datetime
    belongs_to :client, Client

    timestamps()
  end

  @doc false
  def changeset(%BrandExpedient{} = brand_expedient, attrs) do
    brand_expedient
    |> cast(attrs, [:holder, :denomination, :class, :presentation_date, :register_date, :due_date, :declaration_of_use, :active, :client_id])
    |> validate_required([:holder, :denomination, :class, :presentation_date, :register_date, :due_date, :declaration_of_use, :active, :client_id])
  end
end
