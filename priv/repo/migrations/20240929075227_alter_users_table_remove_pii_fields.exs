defmodule Foster.Repo.Migrations.AlterUsersTableRemovePiiFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :agespan
      remove :pt_region
      remove :education
    end
  end
end
