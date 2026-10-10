# 🛒 SuperStore Sales & Profitability Analysis (SQL)

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-EDA-orange?style=for-the-badge)
![Portfolio Project](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

An end-to-end data analytics project exploring the **Global Superstore 2** dataset using **MySQL**. This project takes raw transactional data through a rigorous data cleaning and staging pipeline, followed by advanced exploratory data analysis (EDA) to uncover profitability leaks, customer segment behavior, and logistics efficiency.

---

## 📑 Table of Contents
* [Project Overview](#-project-overview)
* [Dataset & Schema Structure](#-dataset--schema-structure)
* [Data Cleaning & Staging Pipeline](#-data-cleaning--staging-pipeline)
* [Exploratory Data Analysis (EDA) & Business Questions](#-exploratory-data-analysis-eda--business-questions)
* [Key Business Insights](#-key-business-insights)
* [Tech Stack & Skills Demonstrated](#-tech-stack--skills-demonstrated)
* [How to Run the Project](#-run-the-project)

---

## 🎯 Project Overview
Retail businesses often struggle with high sales volume masking hidden profit drains—such as heavily discounted products or inefficient shipping lanes. This project uses SQL to query over 51,000 international retail records, transforming raw data into strategic insights for business stakeholders.

---

## 📂 Dataset & Schema Structure
* **Source:** Global Superstore 2 Dataset
* **Total Records:** 51,000+ rows
* **Key Columns:** `Order ID`, `Order Date`, `Ship Date`, `Ship Mode`, `Customer ID`, `Customer Name`, `Segment`, `Country`, `City`, `Category`, `Sub-Category`, `Product Name`, `Sales`, `Quantity`, `Discount`, `Profit`, `Shipping Cost`

---

## 🧹 Data Cleaning & Staging Pipeline (`01_data_cleaning.sql`)
Before running any analysis, the raw data underwent strict cleaning protocols:
1. **Staging Table Isolation:** Created a dedicated staging schema (`sales2` / `sales_cleaned`) to protect raw source data.
2. **Robust Deduplication:** Utilized window functions (`ROW_NUMBER()` partitioned by business keys) to eliminate redundant records safely.
3. **Date Standardization:** Converted text-based dates into native SQL `DATE` types (`STR_TO_DATE`) to enable accurate date arithmetic.
4. **Data Hygiene:** Applied string trimming (`TRIM()`) across text attributes and resolved postal code formatting anomalies.

---

## 📊 Exploratory Data Analysis (EDA) & Business Questions (`02_exploratory_analysis.sql`)

The analysis addresses core business pillars:

### 1. Overall Business Performance
* **Objective:** Determine total revenue, total profit, unique order volume, and overall profit margins.
* **SQL Approach:** Uses enterprise aggregation functions combined with precision rounding (`ROUND`, `SUM`, `COUNT DISTINCT`).

### 2. Profitability & Loss-Makers
* **Objective:** Identify which product categories and sub-categories are draining financial resources.
* **SQL Approach:** Filtered for negative profit records (`WHERE Profit < 0`) grouped by category and sub-category.

### 3. Customer Segmentation & Value
* **Objective:** Compare purchasing behavior and profitability across Consumer, Corporate, and Home Office segments.
* **SQL Approach:** Multi-column aggregation grouped by customer segments, sorted by total sales.

### 4. Discount Elasticity Impact
* **Objective:** Evaluate whether aggressive discounting drives healthy volume or destroys margins.
* **SQL Approach:** Grouped transactions by exact `Discount` tier to monitor profit margin tipping points.

### 5. Shipping & Logistics Efficiency
* **Objective:** Compute average delivery times in days using date arithmetic and calculate shipping cost by mode.
* **SQL Approach:** Utilized MySQL's built-in `DATEDIFF()` function paired with `AVG()`.

---

## 💡 Key Business Insights

1. **The Discount Trap:** Analysis reveals that while low discounts (10%–20%) stimulate volume, discounts **exceeding 30% consistently result in net negative profit margins**, bleeding cash for the company.
2. **Customer Segment Value:** The Consumer segment drives the highest total order volume and revenue, but Corporate clients often exhibit higher average order values.
3. **Fulfillment Speeds:** Standard shipping averages around 5 days, while Same-Day and First-Class lanes maintain strict operational timeframes with predictable freight costs.

---

## 🛠️ Tech Stack & Skills Demonstrated
* **Database Management:** MySQL 8.0 / MySQL Workbench
* **Advanced SQL Techniques:**
  * **Window Functions:** `ROW_NUMBER() OVER (PARTITION BY ...)`
  * **Date Arithmetic:** `DATEDIFF()`, `STR_TO_DATE()`, `YEAR()`, `MONTHNAME()`
  * **Conditional Aggregations & Grouping:** `GROUP BY`, `HAVING`, `COALESCE`
  * **Data Pipeline Management:** Staging tables, table renaming, and schema design

---

## 🚀 How to Run the Project

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/YOUR_USERNAME/SuperStore_SQL_Analysis.git](https://github.com/YOUR_USERNAME/SuperStore_SQL_Analysis.git)
