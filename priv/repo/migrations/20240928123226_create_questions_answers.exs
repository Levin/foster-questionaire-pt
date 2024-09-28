defmodule Foster.Repo.Migrations.CreateQuestionsAnswers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :age, :integer, null: false
      add :education, :string, null: false

      timestamps()
    end

    create table(:questions) do
      add :body, :text, null: false

      timestamps()
    end

    create table(:answers) do
      add :body, :text, null: false
      add :question_id, references(:questions, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :nilify_all)

      timestamps()
    end

    create index(:answers, [:question_id])
    create index(:answers, [:user_id])
  end
end
