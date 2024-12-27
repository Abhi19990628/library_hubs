defmodule LibraryHub.Repo do
  use Ecto.Repo,
    otp_app: :library_hub,
    adapter: Ecto.Adapters.Postgres
end
