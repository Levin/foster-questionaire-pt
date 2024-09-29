defmodule Foster.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def change do

    alter table(:users) do
      remove :name
      remove :email
      remove :age
      add :agespan, :string
      add :pt_region, :string
    end
  end
end
