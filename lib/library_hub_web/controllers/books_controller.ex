defmodule LibraryHubWeb.BooksController do
  use LibraryHubWeb, :controller

  alias LibraryHub.Library
  alias LibraryHub.Library.Books

  action_fallback LibraryHubWeb.FallbackController

  def index(conn, _params) do
    books = Library.list_books()
    render(conn, :index, books: books)
  end

  def create(conn, %{"books" => books_params}) do
    with {:ok, %Books{} = books} <- Library.create_books(books_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/books/#{books}")
      |> render(:show, books: books)
    end
  end

  def show(conn, %{"id" => id}) do
    books = Library.get_books!(id)
    render(conn, :show, books: books)
  end

  def update(conn, %{"id" => id, "books" => books_params}) do
    books = Library.get_books!(id)

    with {:ok, %Books{} = books} <- Library.update_books(books, books_params) do
      render(conn, :show, books: books)
    end
  end

  def delete(conn, %{"id" => id}) do
    books = Library.get_books!(id)

    with {:ok, %Books{}} <- Library.delete_books(books) do
      send_resp(conn, :no_content, "")
    end
  end
end
