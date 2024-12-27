defmodule LibraryHub.Library.Books do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :isbn, :string
    field :name, :string
    field :year, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(books, attrs) do
    books
    |> cast(attrs, [:name, :author, :isbn, :year])
    |> validate_required([:name, :author, :isbn, :year])
  end
end
