defmodule Shibr.Repo.Migrations.CreateDogHistories do
  use Ecto.Migration

  def change do
    create table(:dog_histories, primary_key: false) do
      add :id, :uuid, primary_key: true 
      add :breed, :string
      add :url, :string

      timestamps([type: :utc_datetime]) # All timestamps should be UTC
    end

    create index(:dog_histories, [:breed]) # We'll want to see history by breed mostly.

  end
end
