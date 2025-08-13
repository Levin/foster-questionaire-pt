defmodule Foster.Subscriptions do
  alias Foster.Repo
  alias Foster.Answers.Subscribe

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
