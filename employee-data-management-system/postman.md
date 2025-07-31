# API Testing with Postman: Employee Data Management System

This guide explains how to test your FastAPI endpoints using Postman, including request bodies, response validation, and best practices. No authentication is required for the basic endpoints, but instructions for adding Bearer Token authentication are included for future extension.

---

## 1. Setting Up Postman

- Download and install Postman: [https://www.postman.com/downloads/](https://www.postman.com/downloads/)
- Start your FastAPI server:
  ```sh
  uvicorn app.main:app --reload
  ```
- Base URL for requests: `http://localhost:8000`

---

## 2. Endpoint Testing

### a. Create Employee (POST /employees)

- **Method:** POST
- **URL:** `http://localhost:8000/employees`
- **Body:**
  - Select "Body" > "raw" > "JSON"
  - Example:
    ```json
    {
      "name": "Purna Shrestha",
      "age": 21,
      "department": "Engineering"
    }
    ```
- **Expected Response:**
  - Status: 201 Created
  - Body:
    ```json
    {
      "id": 1,
      "name": "Purna Shrestha",
      "age": 21,
      "department": "Engineering"
    }
    ```

### b. List All Employees (GET /employees)

- **Method:** GET
- **URL:** `http://localhost:8000/employees`
- **Expected Response:**
  - Status: 200 OK
  - Body: Array of employee objects
    - Example:
      ```json
      [
        {
          "id": 1,
          "name": "Purna Shrestha",
          "age": 21,
          "department": "Engineering"
        }
      ]
      ```

### c. Get Employee by ID (GET /employees/{id})

- **Method:** GET
- **URL:** `http://localhost:8000/employees/1`
- **Expected Response:**
  - Status: 200 OK
  - Body: Employee object
  - If not found: Status 404, `{ "detail": "Employee not found" }`

### d. Update Employee (PUT /employees/{id})

- **Method:** PUT
- **URL:** `http://localhost:8000/employees/1`
- **Body:**
  - Select "Body" > "raw" > "JSON"
  - Example:
    ```json
    {
      "id": 1,
      "name": "Purna Bahadur Shrestha",
      "age": 21,
      "department": "Engineering"
    }
    ```
- **Expected Response:**
  - Status: 200 OK
  - Body: Updated employee object
  - If not found: Status 404, `{ "detail": "Employee not found" }`

### e. Delete Employee (DELETE /employees/{id})

- **Method:** DELETE
- **URL:** `http://localhost:8000/employees/1`
- **Expected Response:**
  - Status: 204 No Content
  - If not found: Status 404, `{ "detail": "Employee not found" }`

---

## 3. Authentication (Optional/Future Extension)

For this project, all endpoints are open and do not require authentication.

---

## 4. Best Practices for Postman

- **Use Collections:** Group related requests for easy access and sharing.
- **Environment Variables:** Set base URLs and tokens as variables for quick switching.
- **Save Example Responses:** Document expected outputs for future reference.
- **Automate Tests:** Use Postman's "Tests" tab to write scripts that validate response status and body.
- **Document Each Request:** Add descriptions and instructions for each endpoint.

---

## 5. Troubleshooting

- Ensure the FastAPI server is running and accessible at `localhost:8000`.
- Check request body format (JSON) and required fields.
- Review error messages for missing or invalid data.
- Use Swagger UI (`/docs`) for live endpoint testing and documentation.

---

**This guide will help you test, validate, and document your API endpoints using Postman, following best practices for professional API development.**
