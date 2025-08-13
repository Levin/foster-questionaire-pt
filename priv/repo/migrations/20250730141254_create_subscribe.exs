defmodule Foster.Repo.Migrations.CreateSubscribe do
  use Ecto.Migration

  def change do
    create table(:subscribe) do
      add :email, :string, null: false
      timestamps()
    end

    create unique_index(:subscribe, [:email])
  end
end
