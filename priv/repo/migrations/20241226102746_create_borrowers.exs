defmodule LibraryHub.Repo.Migrations.CreateBorrowers do
  use Ecto.Migration

  def change do
    create table(:borrowers) do
      add :name, :string
      add :phone, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
