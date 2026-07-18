# Retail_DB
# 🛒 Retail Sales Data Warehouse & Business Intelligence Analysis

## 📌 Project Overview

This project demonstrates the complete Business Intelligence (BI) workflow by designing and analyzing a retail sales data warehouse using SQL Server and preparing the data for visualization in Power BI.

The project follows the ETL and Data Warehouse lifecycle, starting from raw CSV files, building a dimensional model, performing SQL analysis, creating reusable SQL views, and preparing an analysis-ready dataset for business reporting.

---

## 🎯 Business Objective

The goal of this project is to help retail management better understand sales performance by answering key business questions related to:

- Sales performance
- Customer behavior
- Product performance
- Store performance
- Regional performance
- Product returns

The resulting dataset is optimized for business reporting and dashboard creation in Power BI.

---

## 📂 Dataset

The project uses multiple CSV files representing a retail business:

- Customers
- Products
- Stores
- Regions
- Calendar
- Sales (2017)
- Sales (2018)
- Returns

---

## 🏗️ Data Warehouse Design

A dimensional model (Star Schema) was implemented.

### Fact Tables

- FactSales
- FactReturns

### Dimension Tables

- DimCustomers
- DimProducts
- DimStores
- DimRegion
- DimCalendar

---

## ⚙️ Technologies Used

- SQL Server Management Studio (SSMS)
- SQL
- Power BI
- CSV Files
- GitHub

---

## 🔄 Project Workflow

### Phase 1 — Data Understanding

- Reviewed all source CSV files
- Identified business requirements
- Classified fact and dimension tables
- Planned the dimensional model

### Phase 2 — Database Design

- Created the RetailDW database
- Imported raw data into SQL Server
- Organized tables using dimensional modeling
- Combined yearly sales into a unified fact table

### Phase 3 — SQL Analysis

Performed business analysis using:

- JOIN
- GROUP BY
- Aggregate Functions
- Filtering
- Sorting

Example analyses include:

- Top-selling products
- Monthly sales trends
- Sales by region
- Store performance
- Customer analysis
- Product return analysis

### Phase 4 — Data Preparation

Created SQL Views to provide clean, analysis-ready datasets for Power BI dashboards.

---

## 📊 Business Questions Answered

Some of the business questions addressed include:

- Which products generate the highest sales?
- Which stores perform best?
- Which regions contribute the most revenue?
- How do sales change over time?
- Which customer segments purchase the most?
- Which products have the highest return rates?
- Which brands generate the highest revenue?

---

## 📁 Project Structure

```
RetailDW/
│
├── Data/
│   ├── Customers.csv
│   ├── Products.csv
│   ├── Stores.csv
│   ├── Region.csv
│   ├── Calendar.csv
│   ├── Sales2017.csv
│   ├── Sales2018.csv
│   └── Returns.csv
│
├── SQL/
│   ├── Database Creation.sql
│   ├── Business Queries.sql
│   ├── Views.sql
│
├── Power BI/
│   └── Retail Dashboard.pbix
│
└── README.md
```

---

## 📈 Dashboard Highlights

The Power BI dashboard includes:

- Executive Overview
- Revenue Analysis
- Profit Analysis
- Sales Trend Analysis
- Product Performance
- Customer Insights
- Store Performance
- Regional Analysis
- Returns Analysis

---

## 🚀 Key Skills Demonstrated

- Data Warehousing
- Star Schema Design
- SQL Server
- SQL Query Optimization
- Data Cleaning
- Business Analysis
- Data Modeling
- Power BI Data Preparation
- Business Intelligence

---


## 👨‍💻 Author

**Ali**

Recent Business Information Systems (BIS) graduate with a passion for Data Analytics, Business Intelligence, SQL, and Power BI.

Always learning and building real-world data projects to strengthen analytical and visualization skills.
