defmodule LibraryHub.Library.BorrowerHistory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "borrower_histories" do
    field :borrowed_at, :naive_datetime
    belongs_to :borrower,  LibraryHub.Accounts.Borrower
    belongs_to :book,  LibraryHub.Library.Books

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(borrower_history, attrs) do
    borrower_history
    |> cast(attrs, [:borrowed_at, :borrower_id, :book_id])
    |> validate_required([:borrowed_at])
  end
end
