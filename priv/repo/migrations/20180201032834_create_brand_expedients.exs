defmodule Apolo.Repo.Migrations.CreateBrandExpedients do
  use Ecto.Migration

  def change do
    create table(:brand_expedients) do
      add :holder, :string
      add :denomination, :string
      add :class, :string
      add :presentation_date, :naive_datetime
      add :register_date, :naive_datetime
      add :due_date, :naive_datetime
      add :declaration_of_use, :naive_datetime
      add :active, :boolean, default: false, null: false
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:brand_expedients, [:client_id])
  end
end
