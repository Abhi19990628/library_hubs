defmodule LibraryHub.LibraryTest do
  use LibraryHub.DataCase

  alias LibraryHub.Library

  describe "books" do
    alias LibraryHub.Library.Books

    import LibraryHub.LibraryFixtures

    @invalid_attrs %{author: nil, isbn: nil, name: nil, year: nil}

    test "list_books/0 returns all books" do
      books = books_fixture()
      assert Library.list_books() == [books]
    end

    test "get_books!/1 returns the books with given id" do
      books = books_fixture()
      assert Library.get_books!(books.id) == books
    end

    test "create_books/1 with valid data creates a books" do
      valid_attrs = %{author: "some author", isbn: "some isbn", name: "some name", year: "some year"}

      assert {:ok, %Books{} = books} = Library.create_books(valid_attrs)
      assert books.author == "some author"
      assert books.isbn == "some isbn"
      assert books.name == "some name"
      assert books.year == "some year"
    end

    test "create_books/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_books(@invalid_attrs)
    end

    test "update_books/2 with valid data updates the books" do
      books = books_fixture()
      update_attrs = %{author: "some updated author", isbn: "some updated isbn", name: "some updated name", year: "some updated year"}

      assert {:ok, %Books{} = books} = Library.update_books(books, update_attrs)
      assert books.author == "some updated author"
      assert books.isbn == "some updated isbn"
      assert books.name == "some updated name"
      assert books.year == "some updated year"
    end

    test "update_books/2 with invalid data returns error changeset" do
      books = books_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_books(books, @invalid_attrs)
      assert books == Library.get_books!(books.id)
    end

    test "delete_books/1 deletes the books" do
      books = books_fixture()
      assert {:ok, %Books{}} = Library.delete_books(books)
      assert_raise Ecto.NoResultsError, fn -> Library.get_books!(books.id) end
    end

    test "change_books/1 returns a books changeset" do
      books = books_fixture()
      assert %Ecto.Changeset{} = Library.change_books(books)
    end
  end

  describe "borrower_histories" do
    alias LibraryHub.Library.BorrowerHistory

    import LibraryHub.LibraryFixtures

    @invalid_attrs %{borrowed_at: nil}

    test "list_borrower_histories/0 returns all borrower_histories" do
      borrower_history = borrower_history_fixture()
      assert Library.list_borrower_histories() == [borrower_history]
    end

    test "get_borrower_history!/1 returns the borrower_history with given id" do
      borrower_history = borrower_history_fixture()
      assert Library.get_borrower_history!(borrower_history.id) == borrower_history
    end

    test "create_borrower_history/1 with valid data creates a borrower_history" do
      valid_attrs = %{borrowed_at: ~N[2024-12-25 10:32:00]}

      assert {:ok, %BorrowerHistory{} = borrower_history} = Library.create_borrower_history(valid_attrs)
      assert borrower_history.borrowed_at == ~N[2024-12-25 10:32:00]
    end

    test "create_borrower_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_borrower_history(@invalid_attrs)
    end

    test "update_borrower_history/2 with valid data updates the borrower_history" do
      borrower_history = borrower_history_fixture()
      update_attrs = %{borrowed_at: ~N[2024-12-26 10:32:00]}

      assert {:ok, %BorrowerHistory{} = borrower_history} = Library.update_borrower_history(borrower_history, update_attrs)
      assert borrower_history.borrowed_at == ~N[2024-12-26 10:32:00]
    end

    test "update_borrower_history/2 with invalid data returns error changeset" do
      borrower_history = borrower_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_borrower_history(borrower_history, @invalid_attrs)
      assert borrower_history == Library.get_borrower_history!(borrower_history.id)
    end

    test "delete_borrower_history/1 deletes the borrower_history" do
      borrower_history = borrower_history_fixture()
      assert {:ok, %BorrowerHistory{}} = Library.delete_borrower_history(borrower_history)
      assert_raise Ecto.NoResultsError, fn -> Library.get_borrower_history!(borrower_history.id) end
    end

    test "change_borrower_history/1 returns a borrower_history changeset" do
      borrower_history = borrower_history_fixture()
      assert %Ecto.Changeset{} = Library.change_borrower_history(borrower_history)
    end
  end
end
