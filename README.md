# Sales & Revenue Analytics ETL Pipeline

An end-to-end **Sales & Revenue Analytics** project demonstrating a complete **ETL pipeline** using **Python, MySQL, SQL, and Power BI**.  
The project simulates real-world business data and delivers actionable insights through interactive dashboards.

---

##  Project Overview

**Business Objective:**  
To analyze sales performance, revenue trends, customer behavior, and product performance for a retail business.

**Key Outcomes:**
- End-to-end ETL pipeline implementation
- Optimized relational data model (Star Schema)
- Advanced SQL analytics and KPI calculations
- Executive-level Power BI dashboards

---

##  Tech Stack

| Layer | Tools |
|-----|------|
| Data Generation | Python (Pandas, Faker) |
| ETL & Load | Python, SQLAlchemy |
| Database | MySQL |
| Analytics | SQL (CTEs, Window Functions) |
| Visualization | Power BI |
| Version Control | GitHub |

---

##  Project Structure

```text
Sales_ETL_Project/
│
├── data/
│   ├── raw/
│   │   ├── customers.csv
│   │   ├── categories.csv
│   │   ├── products.csv
│   │   ├── orders.csv
│   │   └── order_items.csv
│
├── python/
│   ├── data_generation.py
│   └── etl_load_to_mysql.py
│
├── sql/
│   ├── table_creation.sql
│   └── analytics_queries.sql
│
├── powerbi/
│   └── sales_dashboard.pbix
│
└── README.md
```

---

##  Data Model (Star Schema)

**Fact Table**
- `vw_sales_fact`

**Dimension Tables**
- `customers`
- `products`
- `categories`
- `orders`

**Key Metric**
```
Revenue = Quantity × Price
```

---

##  Dataset Details

| Table | Records |
|-----|--------|
| Customers | ~400 |
| Products | ~300 |
| Categories | 10 |
| Orders | ~2000 |
| Order Items | ~3000 |

---

##  ETL Pipeline Flow

1. **Extract**
   - Synthetic business data generated using Python & Faker
   - Data stored as CSV files

2. **Transform**
   - Data cleaning and type normalization in Python
   - SQL joins, aggregations, and window functions

3. **Load**
   - CSV data loaded into MySQL using SQLAlchemy
   - Foreign keys and indexes applied post-load

---

##  SQL Analytics Highlights

- Total Revenue, Orders, AOV
- Monthly & Year-over-Year revenue trends
- Top customers and products by revenue
- Category-wise and payment-wise performance
- Repeat customer analysis

---

##  Power BI Dashboards

### 🔹 Executive Overview
- Total Revenue
- Total Orders
- Average Order Value
- Revenue Trend (Monthly)

### 🔹 Sales Trends
- Daily & Monthly Revenue
- Cumulative Sales Growth
- Date & Category Slicers

### 🔹 Product Performance
- Top Products by Revenue
- Category Contribution
- Quantity vs Revenue Analysis

### 🔹 Customer Insights
- Top Customers
- City-wise Revenue
- Repeat vs One-Time Customers

---

##  Key Learnings

- Designed and implemented a production-style ETL pipeline
- Built optimized SQL views for BI consumption
- Applied advanced SQL analytics and DAX measures
- Developed business-focused dashboards for stakeholders

---

---

## ⭐ If you found this useful
Give the repo a ⭐ and feel free to fork or contribute!
