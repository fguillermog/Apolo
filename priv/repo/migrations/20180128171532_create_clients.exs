defmodule Apolo.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :brand_holder, :string
      add :denomination, :string
      add :class, :string
      add :registration_date, :naive_datetime
      add :due_date, :naive_datetime
      add :declaration_use_date, :naive_datetime
      add :email, :string
      add :phone, :string
      add :rfc, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
