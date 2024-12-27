defmodule LibraryHub.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias LibraryHub.Repo

  alias LibraryHub.Library.Books

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Books{}, ...]

  """
  def list_books do
    Repo.all(Books)
  end

  @doc """
  Gets a single books.

  Raises `Ecto.NoResultsError` if the Books does not exist.

  ## Examples

      iex> get_books!(123)
      %Books{}

      iex> get_books!(456)
      ** (Ecto.NoResultsError)

  """
  def get_books!(id), do: Repo.get!(Books, id)

  @doc """
  Creates a books.

  ## Examples

      iex> create_books(%{field: value})
      {:ok, %Books{}}

      iex> create_books(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_books(attrs \\ %{}) do
    %Books{}
    |> Books.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a books.

  ## Examples

      iex> update_books(books, %{field: new_value})
      {:ok, %Books{}}

      iex> update_books(books, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_books(%Books{} = books, attrs) do
    books
    |> Books.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a books.

  ## Examples

      iex> delete_books(books)
      {:ok, %Books{}}

      iex> delete_books(books)
      {:error, %Ecto.Changeset{}}

  """
  def delete_books(%Books{} = books) do
    Repo.delete(books)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking books changes.

  ## Examples

      iex> change_books(books)
      %Ecto.Changeset{data: %Books{}}

  """
  def change_books(%Books{} = books, attrs \\ %{}) do
    Books.changeset(books, attrs)
  end

  alias LibraryHub.Library.BorrowerHistory

  @doc """
  Returns the list of borrower_histories.

  ## Examples

      iex> list_borrower_histories()
      [%BorrowerHistory{}, ...]

  """
  def list_borrower_histories do
    Repo.all(BorrowerHistory)
  end

  @doc """
  Gets a single borrower_history.

  Raises `Ecto.NoResultsError` if the Borrower history does not exist.

  ## Examples

      iex> get_borrower_history!(123)
      %BorrowerHistory{}

      iex> get_borrower_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_borrower_history!(id), do: Repo.get!(BorrowerHistory, id)

  @doc """
  Creates a borrower_history.

  ## Examples

      iex> create_borrower_history(%{field: value})
      {:ok, %BorrowerHistory{}}

      iex> create_borrower_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_borrower_history(attrs \\ %{}) do
    %BorrowerHistory{}
    |> BorrowerHistory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a borrower_history.

  ## Examples

      iex> update_borrower_history(borrower_history, %{field: new_value})
      {:ok, %BorrowerHistory{}}

      iex> update_borrower_history(borrower_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_borrower_history(%BorrowerHistory{} = borrower_history, attrs) do
    borrower_history
    |> BorrowerHistory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a borrower_history.

  ## Examples

      iex> delete_borrower_history(borrower_history)
      {:ok, %BorrowerHistory{}}

      iex> delete_borrower_history(borrower_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_borrower_history(%BorrowerHistory{} = borrower_history) do
    Repo.delete(borrower_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking borrower_history changes.

  ## Examples

      iex> change_borrower_history(borrower_history)
      %Ecto.Changeset{data: %BorrowerHistory{}}

  """
  def change_borrower_history(%BorrowerHistory{} = borrower_history, attrs \\ %{}) do
    BorrowerHistory.changeset(borrower_history, attrs)
  end
end
