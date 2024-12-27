defmodule LibraryHubWeb.BooksJSON do
  alias LibraryHub.Library.Books

  @doc """
  Renders a list of books.
  """
  def index(%{books: books}) do
    %{data: for(books <- books, do: data(books))}
  end

  @doc """
  Renders a single books.
  """
  def show(%{books: books}) do
    %{data: data(books)}
  end

  defp data(%Books{} = books) do
    %{
      id: books.id,
      name: books.name,
      author: books.author,
      isbn: books.isbn,
      year: books.year
    }
  end
end
