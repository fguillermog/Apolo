defmodule Apolo.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :client, :string
      add :contact, :string
      add :email, :string
      add :phone, :string
      add :address, :string
      add :rfc, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
