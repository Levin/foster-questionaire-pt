defmodule Foster.Answers.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :body, :map

    timestamps()
  end

  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
