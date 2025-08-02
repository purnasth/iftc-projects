# Employee Data Management System

## Project Overview

This project is the capstone for the Data Engineering Internship, designed to consolidate all the skills and concepts learned throughout the course. The Employee Data Management System is a REST API-based application built with FastAPI, focusing on CRUD operations for employee data, integrated with a SQLite database. The project emphasizes best practices in API development, data validation, error handling, and documentation.

## Syllabus & Course Content

### Month 1: SQL Foundations

- **Week 1:** Introduction to SQL and RDBMS
  - RDBMS concepts, SQL syntax, CRUD operations
  - Practice: W3Schools SQL tutorials
- **Week 2:** JOIN Operations and Aggregation
  - Master JOINs, aggregate functions, GROUP BY
  - Practice: LeetCode SQL problems
- **Week 3:** Advanced SQL Features
  - CTEs, Window Functions, Views, Materialized Views
  - SQL optimization techniques
- **Week 4:** Library Management System Project
  - Database schema design, stored procedures, triggers

### Month 2: Database Modeling and Python

- **Week 5:** Database Modeling & Python Fundamentals
  - Database models, Python basics
- **Week 6:** Database Design & Python Database Interaction
  - Schema design, Python DB connectivity
- **Week 7:** Python Data Visualization & OOP
  - Data visualization, OOP concepts
- **Week 8:** E-Commerce Sales Data Analysis Project
  - ETL operations, insights, documentation

### Month 3: APIs, Visualization, and Data Quality

- **Week 9:** REST APIs & FastAPI Framework
  - REST API principles, FastAPI basics, API best practices
- **Week 10:** Employee Data Management System Project
  - CRUD API endpoints, SQLite integration, OLTP concepts
- **Week 11:** Data Visualization & Data Quality
  - Visualization principles, KPI, data quality, security
- **Week 12:** Data Visualization Practice & Internship Review
  - Advanced Power BI, final presentation

## Major Project: Employee Data Management System

- **Objective:** Develop a REST API system using FastAPI to manage employee data (CRUD operations).
- **Features:**
  - REST API endpoints for employee management
  - SQLite database integration
  - Data validation and error handling
  - Auto-generated API documentation (Swagger UI, ReDoc)

## Project Structure

```
employee-data-management-system/
    README.md
    aboutproject.md
    app/
        main.py
        models.py
        database.py
        schemas.py
        crud.py
    requirements.txt
```

## How to Run

1. **Environment Setup:**
   - Install Python (>=3.8)
   - Create a virtual environment: `python -m venv venv`
   - Activate the environment: `source venv/bin/activate`
   - Install dependencies: `pip install -r requirements.txt`
2. **Start the API Server:**
   - Run: `uvicorn app.main:app --reload`
3. **Access Documentation:**
   - Swagger UI: [http://localhost:8000/docs](http://localhost:8000/docs)
   - ReDoc: [http://localhost:8000/redoc](http://localhost:8000/redoc)

## Deliverables

- FastAPI Application
- SQLite Database
- Auto-generated API Documentation
- README & aboutproject.md

For detailed project explanation and technology stack, see `aboutproject.md`.
