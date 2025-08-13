defmodule Foster.Feedback do
  alias Foster.Repo
  alias Foster.Answers.Feedback

  def create_feedback(params) do
    %Feedback{}
    |> Feedback.changeset(params)
    |> Repo.insert()
  end

  def remove_feedback() do
    Repo.delete_all(Feedback)
  end

  def all_feedback() do
    Repo.all(Feedback)
  end
end
