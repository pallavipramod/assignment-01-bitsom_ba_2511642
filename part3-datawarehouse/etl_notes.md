## ETL Decisions

### Decision 1 — Date Format Standardization

Problem:
The dataset contained inconsistent date formats such as "29/08/2023", "12-12-2023", and "2023-02-05", making it difficult to perform time-based analysis.

Resolution:
All dates were converted into a standard ISO format (YYYY-MM-DD) before loading into the dim_date table. Additional fields such as month, year, and month_name were derived for analytical queries.

---

### Decision 2 — Revenue Calculation

Problem:
The dataset did not contain a revenue column, which is essential for business analysis.

Resolution:
A new field "revenue" was created by calculating:
units_sold × unit_price
This derived value was stored in the fact_sales table.

---

### Decision 3 — Category Normalization

Problem:
Product categories had inconsistent casing such as "electronics", "Electronics", and "ELECTRONICS".

Resolution:
All category values were standardized to proper format (e.g., "Electronics", "Clothing", "Groceries") before loading into the dim_product table to ensure accurate grouping and reporting.
