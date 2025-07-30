defmodule Foster.Answers.Subscribe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscribe" do
    field :email, :string

    timestamps()
  end

  def changeset(subscribe, attrs) do
    subscribe
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
