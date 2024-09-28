# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Foster.Repo.insert!(%Foster.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Foster.Repo
alias Foster.QA.Question

questions = [
  %{id: 1, body: "What is your name?"},
  %{id: 2, body: "What is your age?"},
  %{id: 3, body: "What is your level of education?"},
]

Enum.each(questions, fn question ->
  %Question{}
  |> Question.changeset(question)
  |> Repo.insert!()
end)
