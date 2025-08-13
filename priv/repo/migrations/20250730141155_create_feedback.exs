defmodule Foster.Repo.Migrations.CreateFeedback do
  use Ecto.Migration

  def change do
    create table(:feedback) do
      add :body, :map, null: false
      timestamps()
    end

    create unique_index(:feedback, [:body])

  end
end
