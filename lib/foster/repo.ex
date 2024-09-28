defmodule Foster.Repo do
  use Ecto.Repo,
    otp_app: :foster,
    adapter: Ecto.Adapters.Postgres
end
