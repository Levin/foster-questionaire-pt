defmodule Foster.QA.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :body, :string
    has_many :answers, Foster.QA.Answer

    timestamps()
  end

  def changeset(question, attrs) do
    question
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
