defmodule LibraryHub.Repo.Migrations.CreateBorrowerHistories do
  use Ecto.Migration

  def change do
    create table(:borrower_histories) do
      add :borrowed_at, :naive_datetime
      add :borrower_id, references(:borrowers, on_delete: :nothing)
      add :book_id, references(:books, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:borrower_histories, [:borrower_id])
    create index(:borrower_histories, [:book_id])
  end
end
