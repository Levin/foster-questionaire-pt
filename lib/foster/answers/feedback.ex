defmodule Foster.Answers.Feedback do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feedback" do
    field :body, :map

    timestamps()
  end

  def changeset(feedback, attrs) do
    feedback
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
