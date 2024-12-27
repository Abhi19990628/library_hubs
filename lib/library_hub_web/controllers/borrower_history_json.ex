defmodule LibraryHubWeb.BorrowerHistoryJSON do
  alias LibraryHub.Library.BorrowerHistory

  @doc """
  Renders a list of borrower_histories.
  """
  def index(%{borrower_histories: borrower_histories}) do
    %{data: for(borrower_history <- borrower_histories, do: data(borrower_history))}
  end

  @doc """
  Renders a single borrower_history.
  """
  def show(%{borrower_history: borrower_history}) do
    %{data: data(borrower_history)}
  end

  defp data(%BorrowerHistory{} = borrower_history) do
    %{
      id: borrower_history.id,
      book_id: borrower_history.book_id,
      borrower_id: borrower_history.borrower_id,
      borrowed_at: borrower_history.borrowed_at
    }
  end
end
