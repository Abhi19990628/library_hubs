defmodule LibraryHub.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias LibraryHub.Repo

  alias LibraryHub.Accounts.Borrower

  @doc """
  Returns the list of borrowers.

  ## Examples

      iex> list_borrowers()
      [%Borrower{}, ...]

  """
  def list_borrowers do
    Repo.all(Borrower)
  end

  @doc """
  Gets a single borrower.

  Raises `Ecto.NoResultsError` if the Borrower does not exist.

  ## Examples

      iex> get_borrower!(123)
      %Borrower{}

      iex> get_borrower!(456)
      ** (Ecto.NoResultsError)

  """
  def get_borrower!(id), do: Repo.get!(Borrower, id)

  @doc """
  Creates a borrower.

  ## Examples

      iex> create_borrower(%{field: value})
      {:ok, %Borrower{}}

      iex> create_borrower(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_borrower(attrs \\ %{}) do
    %Borrower{}
    |> Borrower.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a borrower.

  ## Examples

      iex> update_borrower(borrower, %{field: new_value})
      {:ok, %Borrower{}}

      iex> update_borrower(borrower, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_borrower(%Borrower{} = borrower, attrs) do
    borrower
    |> Borrower.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a borrower.

  ## Examples

      iex> delete_borrower(borrower)
      {:ok, %Borrower{}}

      iex> delete_borrower(borrower)
      {:error, %Ecto.Changeset{}}

  """
  def delete_borrower(%Borrower{} = borrower) do
    Repo.delete(borrower)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking borrower changes.

  ## Examples

      iex> change_borrower(borrower)
      %Ecto.Changeset{data: %Borrower{}}

  """
  def change_borrower(%Borrower{} = borrower, attrs \\ %{}) do
    Borrower.changeset(borrower, attrs)
  end
end
