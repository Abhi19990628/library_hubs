defmodule LibraryHub.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LibraryHub.Library` context.
  """

  @doc """
  Generate a books.
  """
  def books_fixture(attrs \\ %{}) do
    {:ok, books} =
      attrs
      |> Enum.into(%{
        author: "some author",
        isbn: "some isbn",
        name: "some name",
        year: "some year"
      })
      |> LibraryHub.Library.create_books()

    books
  end

  @doc """
  Generate a borrower_history.
  """
  def borrower_history_fixture(attrs \\ %{}) do
    {:ok, borrower_history} =
      attrs
      |> Enum.into(%{
        borrowed_at: ~N[2024-12-25 10:32:00]
      })
      |> LibraryHub.Library.create_borrower_history()

    borrower_history
  end
end
