defmodule Foster.Answers do
  alias Foster.Repo
  alias Foster.Answers.Answer
  alias Foster.Answers
  alias Foster.Answers.Feedback
  alias Foster.Answers.Subscribe

  # answer functions
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

  # feedback functions
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

  # subscribe functions
  def create_subscribe(params) do
    %Subscribe{}
    |> Subscribe.changeset(params)
    |> Repo.insert()
  end

  def remove_subscribe() do
    Repo.delete_all(Subscribe)
  end

  def remove_subscribe!(id) do
    Repo.delete!(get_subscribe!(id))
  end

  def all_subscribe() do
    Repo.all(Subscribe)
  end

  def get_subscribe!(id) do
    Repo.get!(Subscribe, id)
  end

  def get_subscribe_by_email(email) do
    Repo.get_by(Subscribe, email: email)
  end
end
