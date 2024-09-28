defmodule Foster.QA.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :body, :string
    belongs_to :question, Foster.QA.Question

    timestamps()
  end

  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:body, :question_id])
    |> validate_required([:body, :question_id])
    |> foreign_key_constraint(:question_id)
  end
end
