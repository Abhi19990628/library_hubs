defmodule LibraryHub.AccountsTest do
  use LibraryHub.DataCase

  alias LibraryHub.Accounts

  describe "borrowers" do
    alias LibraryHub.Accounts.Borrower

    import LibraryHub.AccountsFixtures

    @invalid_attrs %{email: nil, name: nil, phone: nil}

    test "list_borrowers/0 returns all borrowers" do
      borrower = borrower_fixture()
      assert Accounts.list_borrowers() == [borrower]
    end

    test "get_borrower!/1 returns the borrower with given id" do
      borrower = borrower_fixture()
      assert Accounts.get_borrower!(borrower.id) == borrower
    end

    test "create_borrower/1 with valid data creates a borrower" do
      valid_attrs = %{email: "some email", name: "some name", phone: "some phone"}

      assert {:ok, %Borrower{} = borrower} = Accounts.create_borrower(valid_attrs)
      assert borrower.email == "some email"
      assert borrower.name == "some name"
      assert borrower.phone == "some phone"
    end

    test "create_borrower/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_borrower(@invalid_attrs)
    end

    test "update_borrower/2 with valid data updates the borrower" do
      borrower = borrower_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name", phone: "some updated phone"}

      assert {:ok, %Borrower{} = borrower} = Accounts.update_borrower(borrower, update_attrs)
      assert borrower.email == "some updated email"
      assert borrower.name == "some updated name"
      assert borrower.phone == "some updated phone"
    end

    test "update_borrower/2 with invalid data returns error changeset" do
      borrower = borrower_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_borrower(borrower, @invalid_attrs)
      assert borrower == Accounts.get_borrower!(borrower.id)
    end

    test "delete_borrower/1 deletes the borrower" do
      borrower = borrower_fixture()
      assert {:ok, %Borrower{}} = Accounts.delete_borrower(borrower)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_borrower!(borrower.id) end
    end

    test "change_borrower/1 returns a borrower changeset" do
      borrower = borrower_fixture()
      assert %Ecto.Changeset{} = Accounts.change_borrower(borrower)
    end
  end
end
