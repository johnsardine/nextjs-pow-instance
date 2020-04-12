defmodule Powauth.Repo do
  use Ecto.Repo,
    otp_app: :powauth,
    adapter: Ecto.Adapters.Postgres
end
