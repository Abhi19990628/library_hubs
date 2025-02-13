defmodule LibraryHub.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :author, :string
      add :isbn, :string
      add :year, :string

      timestamps(type: :utc_datetime)
    end
  end
end
