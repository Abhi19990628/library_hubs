# Library Management API


This project is a comprehensive Library Management API built using the Phoenix Framework and Elixir. The API provides endpoints for managing books, borrowers, and their borrowing histories. It supports CRUD operations, borrowing/returning books, input validation, error handling, and testing for all endpoints.
applicaiton
# Features

Book Management: CRUD operations for books.

Borrower Management: CRUD operations for library borrowers.

Borrowing and Returning Books: Record borrowing/returning activities.


Input Validation: Ensures data integrity and prevents invalid inputs.

Error Handling: Comprehensive error messages for failed operations.

Testing: Includes unit and integration tests for all endpoints.


# API Endpoints

## Books

| Method | Endpoint         | Controller Action                | Description                  |
|--------|-------------------|----------------------------------|------------------------------|
| GET    | `/api/books`      | `LibraryHubWeb.BooksController:index` | List all books              |
| GET    | `/api/books/:id`  | `LibraryHubWeb.BooksController:show`  | Retrieve a single book      |
| POST   | `/api/books`      | `LibraryHubWeb.BooksController:create` | Add a new book              |
| PATCH  | `/api/books/:id`  | `LibraryHubWeb.BooksController:update` | Update partial book details |
| PUT    | `/api/books/:id`  | `LibraryHubWeb.BooksController:update` | Update full book details    |
| DELETE | `/api/books/:id`  | `LibraryHubWeb.BooksController:delete` | Remove a book               |





## Borrowers

| Method | Endpoint             | Controller Action                     | Description                   |
|--------|-----------------------|---------------------------------------|-------------------------------|
| GET    | `/api/borrowers`      | `LibraryHubWeb.BorrowerController:index` | List all borrowers           |
| GET    | `/api/borrowers/:id`  | `LibraryHubWeb.BorrowerController:show`  | Retrieve a single borrower   |
| POST   | `/api/borrowers`      | `LibraryHubWeb.BorrowerController:create` | Add a new borrower           |
| PATCH  | `/api/borrowers/:id`  | `LibraryHubWeb.BorrowerController:update` | Update partial borrower details |
| PUT    | `/api/borrowers/:id`  | `LibraryHubWeb.BorrowerController:update` | Update full borrower details |
| DELETE | `/api/borrowers/:id`  | `LibraryHubWeb.BorrowerController:delete` | Remove a borrower            |



## Borrower Histories

| Method | Endpoint                     | Controller Action                           | Description                     |
|--------|-------------------------------|---------------------------------------------|---------------------------------|
| GET    | `/api/borrower_histories`     | `LibraryHubWeb.BorrowerHistoryController:index` | List all borrowing histories   |
| GET    | `/api/borrower_histories/:id` | `LibraryHubWeb.BorrowerHistoryController:show`  | Retrieve a single history      |
| POST   | `/api/borrower_histories`     | `LibraryHubWeb.BorrowerHistoryController:create` | Add a new borrowing record     |
| PATCH  | `/api/borrower_histories/:id` | `LibraryHubWeb.BorrowerHistoryController:update` | Update partial history details |
| PUT    | `/api/borrower_histories/:id` | `LibraryHubWeb.BorrowerHistoryController:update` | Update full history details    |
| DELETE | `/api/borrower_histories/:id` | `LibraryHubWeb.BorrowerHistoryController:delete` | Remove a borrowing record      |



## Setup and Installation

1. **Clone the repository:**
   ```bash
   git clone <https://github.com/Abhi19990628/library_hubs.git>
   cd <library_hubs>

2. **Install dependencies:**
    ```bash
   mix deps.get
3. **Set up the database:**
    ```bash
    mix ecto.create
    mix ecto.migrate
4. **Run the server:**
   ```bash
   mix phx.server

  The server will be available at http://localhost:4000.

## Testing
  
  **To run the test suite, execute:**
  ```bash 
  mix test
  ````
Ensure all endpoints are tested for various scenarios, including valid and invalid inputs.


## Development Guidelines
```bash
Follow Elixir and Phoenix conventions for code structure.
Write unit and integration tests for all new features.

Ensure proper input validation and error handling for every endpoint.
```

