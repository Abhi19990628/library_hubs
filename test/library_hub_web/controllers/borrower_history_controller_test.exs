defmodule LibraryHubWeb.BorrowerHistoryControllerTest do
  use LibraryHubWeb.ConnCase

  import LibraryHub.LibraryFixtures

  alias LibraryHub.Library.BorrowerHistory

  @create_attrs %{
    borrowed_at: ~N[2024-12-25 10:32:00]
  }
  @update_attrs %{
    borrowed_at: ~N[2024-12-26 10:32:00]
  }
  @invalid_attrs %{borrowed_at: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all borrower_histories", %{conn: conn} do
      conn = get(conn, ~p"/api/borrower_histories")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create borrower_history" do
    test "renders borrower_history when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/borrower_histories", borrower_history: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/borrower_histories/#{id}")

      assert %{
               "id" => ^id,
               "borrowed_at" => "2024-12-25T10:32:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/borrower_histories", borrower_history: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update borrower_history" do
    setup [:create_borrower_history]

    test "renders borrower_history when data is valid", %{conn: conn, borrower_history: %BorrowerHistory{id: id} = borrower_history} do
      conn = put(conn, ~p"/api/borrower_histories/#{borrower_history}", borrower_history: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/borrower_histories/#{id}")

      assert %{
               "id" => ^id,
               "borrowed_at" => "2024-12-26T10:32:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, borrower_history: borrower_history} do
      conn = put(conn, ~p"/api/borrower_histories/#{borrower_history}", borrower_history: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete borrower_history" do
    setup [:create_borrower_history]

    test "deletes chosen borrower_history", %{conn: conn, borrower_history: borrower_history} do
      conn = delete(conn, ~p"/api/borrower_histories/#{borrower_history}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/borrower_histories/#{borrower_history}")
      end
    end
  end

  defp create_borrower_history(_) do
    borrower_history = borrower_history_fixture()
    %{borrower_history: borrower_history}
  end
end
