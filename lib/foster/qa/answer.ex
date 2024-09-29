defmodule Foster.QA.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :body, :map
    belongs_to :question, Foster.QA.Question

    timestamps()
  end

  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
