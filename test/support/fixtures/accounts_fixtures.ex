defmodule LibraryHub.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LibraryHub.Accounts` context.
  """

  @doc """
  Generate a borrower.
  """
  def borrower_fixture(attrs \\ %{}) do
    {:ok, borrower} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        phone: "some phone"
      })
      |> LibraryHub.Accounts.create_borrower()

    borrower
  end
end
