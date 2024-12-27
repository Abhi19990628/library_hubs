defmodule LibraryHub.Accounts.Borrower do
  use Ecto.Schema
  import Ecto.Changeset

  schema "borrowers" do
    field :email, :string
    field :name, :string
    field :phone, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(borrower, attrs) do
    borrower
    |> cast(attrs, [:name, :phone, :email])
    |> validate_required([:name, :phone, :email])
  end
end
