defmodule Foster.QA do
  alias Foster.Repo
  alias Foster.QA.Question
  alias Foster.QA.User

  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def create_user!(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert!()
  end

  def insert_or_update(changeset) do
    case Repo.insert(changeset) do
      {:ok, question} ->
        {:ok, question}
      {:error, changeset} ->
        {:error, changeset}
    end
  end

  # database
  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  def get_question!(id) do
    Repo.get!(Question, id)
  end

  def list_users do
    Repo.all(User)
  end
end
