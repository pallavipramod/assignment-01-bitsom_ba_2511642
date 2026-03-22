Context

You have been given retail_transactions.csv — raw transactional data from a retail chain. You need to design a data warehouse to enable business intelligence reporting.
Tasks

3.1 — Star Schema Design (10 marks)

In part3-datawarehouse/star_schema.sql, create:

    A central Fact Table (fact_sales) with appropriate numeric measures
    At least 3 Dimension Tables: dim_date, dim_store, dim_product
    All foreign key relationships
    INSERT statements loading cleaned sample data (at least 10 fact rows)

Note: The raw data contains intentional issues — inconsistent date formats, NULL values, and inconsistent category casing. Your INSERT statements must reflect cleaned, standardized data.

3.2 — Analytical Queries (10 marks)

In part3-datawarehouse/dw_queries.sql:

-- Q1: Total sales revenue by product category for each month
-- Q2: Top 2 performing stores by total revenue
-- Q3: Month-over-month sales trend across all stores

Subjective — part3-datawarehouse/etl_notes.md

Under section ## ETL Decisions, describe 3 specific transformation decisions you made while cleaning the raw data before loading into the warehouse. For each decision, explain what the problem was and how you resolved it. Use the format:

## ETL Decisions

### Decision 1 — <short title>
Problem: ...
Resolution: ...

### Decision 2 — <short title>
...