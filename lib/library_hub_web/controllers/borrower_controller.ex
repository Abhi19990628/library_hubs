defmodule LibraryHubWeb.BorrowerController do
  use LibraryHubWeb, :controller

  alias LibraryHub.Accounts
  alias LibraryHub.Accounts.Borrower

  action_fallback LibraryHubWeb.FallbackController

  def index(conn, _params) do
    borrowers = Accounts.list_borrowers()
    render(conn, :index, borrowers: borrowers)
  end

  def create(conn, %{"borrower" => borrower_params}) do
    with {:ok, %Borrower{} = borrower} <- Accounts.create_borrower(borrower_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/borrowers/#{borrower}")
      |> render(:show, borrower: borrower)
    end
  end

  def show(conn, %{"id" => id}) do
    borrower = Accounts.get_borrower!(id)
    render(conn, :show, borrower: borrower)
  end

  def update(conn, %{"id" => id, "borrower" => borrower_params}) do
    borrower = Accounts.get_borrower!(id)

    with {:ok, %Borrower{} = borrower} <- Accounts.update_borrower(borrower, borrower_params) do
      render(conn, :show, borrower: borrower)
    end
  end

  def delete(conn, %{"id" => id}) do
    borrower = Accounts.get_borrower!(id)

    with {:ok, %Borrower{}} <- Accounts.delete_borrower(borrower) do
      send_resp(conn, :no_content, "")
    end
  end
end
