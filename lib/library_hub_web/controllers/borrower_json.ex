defmodule LibraryHubWeb.BorrowerJSON do
  alias LibraryHub.Accounts.Borrower

  @doc """
  Renders a list of borrowers.
  """
  def index(%{borrowers: borrowers}) do
    %{data: for(borrower <- borrowers, do: data(borrower))}
  end

  @doc """
  Renders a single borrower.
  """
  def show(%{borrower: borrower}) do
    %{data: data(borrower)}
  end

  defp data(%Borrower{} = borrower) do
    %{
      id: borrower.id,
      name: borrower.name,
      phone: borrower.phone,
      email: borrower.email
    }
  end
end
