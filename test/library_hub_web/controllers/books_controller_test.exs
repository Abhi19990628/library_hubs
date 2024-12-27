defmodule LibraryHubWeb.BooksControllerTest do
  use LibraryHubWeb.ConnCase

  import LibraryHub.LibraryFixtures

  alias LibraryHub.Library.Books

  @create_attrs %{
    author: "some author",
    isbn: "some isbn",
    name: "some name",
    year: "some year"
  }
  @update_attrs %{
    author: "some updated author",
    isbn: "some updated isbn",
    name: "some updated name",
    year: "some updated year"
  }
  @invalid_attrs %{author: nil, isbn: nil, name: nil, year: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all books", %{conn: conn} do
      conn = get(conn, ~p"/api/books")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create books" do
    test "renders books when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/books", books: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/books/#{id}")

      assert %{
               "id" => ^id,
               "author" => "some author",
               "isbn" => "some isbn",
               "name" => "some name",
               "year" => "some year"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/books", books: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update books" do
    setup [:create_books]

    test "renders books when data is valid", %{conn: conn, books: %Books{id: id} = books} do
      conn = put(conn, ~p"/api/books/#{books}", books: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/books/#{id}")

      assert %{
               "id" => ^id,
               "author" => "some updated author",
               "isbn" => "some updated isbn",
               "name" => "some updated name",
               "year" => "some updated year"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, books: books} do
      conn = put(conn, ~p"/api/books/#{books}", books: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete books" do
    setup [:create_books]

    test "deletes chosen books", %{conn: conn, books: books} do
      conn = delete(conn, ~p"/api/books/#{books}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/books/#{books}")
      end
    end
  end

  defp create_books(_) do
    books = books_fixture()
    %{books: books}
  end
end
