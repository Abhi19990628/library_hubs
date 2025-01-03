defmodule LibraryHubWeb.Router do
  use LibraryHubWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LibraryHubWeb do
    pipe_through :api


    # book apis
    resources "/books", BooksController, except: [:new, :edit]
    resources "/borrowers", BorrowerController, except: [:new, :edit]
    resources "/borrower_histories", BorrowerHistoryController, except: [:new, :edit]
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:library_hub, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
