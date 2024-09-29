defmodule Foster.Repo.Migrations.RemoveUsers do
  use Ecto.Migration

  def change do

    alter table(:answers) do
      remove :question_id
      remove :user_id
    end
    

    drop table(:users)
  end
end
