# zepto_inventory_sql_analysis
worked on an end-to-end SQL project using Zepto inventory data where I performed data cleaning, transformation, and generated business insights like revenue estimation, discount analysis, and inventory segmentation.

# 🛒 Zepto E-commerce SQL Data Analysis Project

## 📌 Project Overview

This project focuses on analyzing Zepto's e-commerce inventory dataset using SQL.
The goal is to extract meaningful business insights related to pricing, discounts, stock availability, and product performance.

---

## 🧰 Tools & Technologies

* SQL (MySQL)
* Excel (for dataset handling)
* GitHub (for project hosting)

---

## 📂 Dataset Description

The dataset contains product-level inventory details:

* Category
* Product Name
* MRP (Maximum Retail Price)
* Discount Percentage
* Available Quantity
* Discounted Selling Price
* Weight (grams)
* Stock Availability
* Quantity

---

## 🏗️ Database & Table Creation

* Created database: `zepto_inventory`
* Created table: `zepto`
* Cleaned and transformed raw data
* Converted price from paise to rupees

---

## 🔍 Data Cleaning Steps

* Removed records with MRP = 0
* Checked for NULL values
* Standardized column names
* Converted price values to proper format

---

## 📊 Key Business Insights

### 1️⃣ Top 10 Best Discounted Products

Identified products offering the highest discount percentage.

### 2️⃣ High MRP but Out of Stock Products

Found premium products that are currently unavailable.

### 3️⃣ Estimated Revenue by Category

Calculated total potential revenue using:
`discountedSellingPrice * availableQuantity`

### 4️⃣ Premium Products with Low Discounts

Filtered products where:

* MRP > ₹500
* Discount < 10%

### 5️⃣ Top 5 Categories by Average Discount

Analyzed which categories provide the best deals.

### 6️⃣ Best Value Products (Price per Gram)

Calculated price efficiency for products above 100g.

### 7️⃣ Product Weight Segmentation

Grouped products into:

* Low
* High
* Bulk

### 8️⃣ Total Inventory Weight by Category

Measured inventory volume across categories.

---

## 📈 Sample SQL Query

```sql
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;
```

---

## 💡 Key Learnings

* Data cleaning and transformation in SQL
* Writing analytical queries for business insights
* Using aggregate functions and CASE statements
* Real-world e-commerce data analysis

---

## 🚀 Future Improvements

* Build Power BI dashboard for visualization
* Add trend analysis
* Include customer-level insights

---

## 👩‍💻 Author

Sravanthi Reddy
www.linkedin.com/in/sravanthi-sabbidi
sravs.mech42@gmail.com
---

## ⭐ If you like this project, give it a star!
