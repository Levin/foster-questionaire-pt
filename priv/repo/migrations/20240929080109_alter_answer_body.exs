defmodule Foster.Repo.Migrations.AlterAnswerBody do
  use Ecto.Migration

  def change do


    alter table(:answers) do
      remove :body
      add :body, :map
    end

  end
end
