defmodule LibraryHubWeb.BorrowerControllerTest do
  use LibraryHubWeb.ConnCase

  import LibraryHub.AccountsFixtures

  alias LibraryHub.Accounts.Borrower

  @create_attrs %{
    email: "some email",
    name: "some name",
    phone: "some phone"
  }
  @update_attrs %{
    email: "some updated email",
    name: "some updated name",
    phone: "some updated phone"
  }
  @invalid_attrs %{email: nil, name: nil, phone: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all borrowers", %{conn: conn} do
      conn = get(conn, ~p"/api/borrowers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create borrower" do
    test "renders borrower when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/borrowers", borrower: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/borrowers/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some email",
               "name" => "some name",
               "phone" => "some phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/borrowers", borrower: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update borrower" do
    setup [:create_borrower]

    test "renders borrower when data is valid", %{conn: conn, borrower: %Borrower{id: id} = borrower} do
      conn = put(conn, ~p"/api/borrowers/#{borrower}", borrower: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/borrowers/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some updated email",
               "name" => "some updated name",
               "phone" => "some updated phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, borrower: borrower} do
      conn = put(conn, ~p"/api/borrowers/#{borrower}", borrower: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete borrower" do
    setup [:create_borrower]

    test "deletes chosen borrower", %{conn: conn, borrower: borrower} do
      conn = delete(conn, ~p"/api/borrowers/#{borrower}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/borrowers/#{borrower}")
      end
    end
  end

  defp create_borrower(_) do
    borrower = borrower_fixture()
    %{borrower: borrower}
  end
end
