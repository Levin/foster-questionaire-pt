defmodule Foster.Answers do
  alias Foster.Repo
  alias Foster.Answers.Answer
  alias Foster.Answers

  def create_answer(params) do
    %Answer{}
    |> Answer.changeset(params)
    |> Repo.insert()
  end

  def remove_answers() do
    Repo.delete_all(Answer)
  end

  def all_answers() do
    Repo.all(Answer)
  end
end
