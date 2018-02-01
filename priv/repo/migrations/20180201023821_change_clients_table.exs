defmodule Apolo.Repo.Migrations.ChangeClientsTable do
  use Ecto.Migration

  def change do
  	drop table("clients")
  end
end
