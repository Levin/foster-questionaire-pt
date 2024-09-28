defmodule Foster.QA.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :age, :integer
    field :education, :string
    # has_many :answers, Foster.QA.Answer

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :age, :education])
    |> validate_required([:name, :email, :age, :education])
  end
end
