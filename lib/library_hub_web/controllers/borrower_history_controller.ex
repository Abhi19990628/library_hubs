defmodule LibraryHubWeb.BorrowerHistoryController do
  use LibraryHubWeb, :controller

  alias LibraryHub.Library
  alias LibraryHub.Library.BorrowerHistory

  action_fallback LibraryHubWeb.FallbackController

  def index(conn, _params) do
    borrower_histories = Library.list_borrower_histories()
    render(conn, :index, borrower_histories: borrower_histories)
  end

  def create(conn, %{"borrower_history" => borrower_history_params}) do
    with {:ok, %BorrowerHistory{} = borrower_history} <- Library.create_borrower_history(borrower_history_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/borrower_histories/#{borrower_history}")
      |> render(:show, borrower_history: borrower_history)
    end
  end

  def show(conn, %{"id" => id}) do
    borrower_history = Library.get_borrower_history!(id)
    render(conn, :show, borrower_history: borrower_history)
  end

  def update(conn, %{"id" => id, "borrower_history" => borrower_history_params}) do
    borrower_history = Library.get_borrower_history!(id)

    with {:ok, %BorrowerHistory{} = borrower_history} <- Library.update_borrower_history(borrower_history, borrower_history_params) do
      render(conn, :show, borrower_history: borrower_history)
    end
  end

  def delete(conn, %{"id" => id}) do
    borrower_history = Library.get_borrower_history!(id)

    with {:ok, %BorrowerHistory{}} <- Library.delete_borrower_history(borrower_history) do
      send_resp(conn, :no_content, "")
    end
  end
end
