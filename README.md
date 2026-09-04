# 🍔 Swiggy Restaurant Analysis Using SQL

## Project Overview

This project analyzes **148,541 Swiggy restaurant records** to understand restaurant distribution, cuisine popularity, restaurant-name/chain presence, ratings, customer engagement, and pricing patterns across Indian cities.

## Dataset

**Source:** Kaggle — Restaurants Dataset | Swiggy  
https://www.kaggle.com/datasets/ashishjangra27/swiggy-restaurants-dataset

The raw CSV is not committed to this repository. It was imported as the SQLite table `swiggy`.

## Tools

- SQL
- SQLite / DB Browser for SQLite
- Python / Pandas for result validation and visualizations
- GitHub

## Business Questions

1. Which cities have the most restaurants?
2. What are the most popular cuisines?
3. Which restaurant names have the most records?
4. Which cities have the highest average ratings?
5. Which cities have the highest average restaurant cost?
6. Which cuisines have the highest average ratings?
7. Which restaurants combine high ratings with high rating counts?
8. Which cities offer relatively better value for money?
9. How are restaurants distributed across rating categories?
10. Does restaurant price appear to correspond with average rating?

## Data Cleaning

The source contains non-numeric rating values such as `NEW` and `--`. The `rating_count` field also contains values such as `50+ ratings` and `Too Few Ratings`, while cost values contain the rupee symbol.

The project therefore:

- trims text fields;
- converts valid ratings to numeric values;
- converts `50+ ratings` into `50`;
- treats `Too Few Ratings` as unavailable;
- removes currency symbols and commas from cost;
- keeps unavailable ratings/counts as `NULL`;
- preserves the original `swiggy` table and creates `swiggy_clean`.

## Data Quality

| Metric | Result |
|---|---:|
| Total records | 148,541 |
| Duplicate full rows | 0 |
| Valid numeric ratings | 61,441 |
| Unrated/non-numeric ratings | 87,100 |
| Missing cost | 131 |
| Missing rating count | 87,100 |
| Unique cities | 821 |
| Unique restaurant names | 112,818 |

## Key Findings

### 1. City with the most restaurants
**Bikaner** had the highest number of records: **1,666**.

### 2. Most popular cuisine
**North Indian,Chinese** was the most frequently represented cuisine with **6,471** records.

### 3. Restaurant name with the most records
**Domino's Pizza** appeared **442** times.

> This is a count of records under the same restaurant name. It should not automatically be interpreted as the chain's official physical branch count.

### 4. Highest-rated city
Among cities with more than 50 rated restaurant records, **Mylapore,Chennai** had the highest average rating: **4.23**.

### 5. Most expensive vs. cheapest city
Among cities with more than 30 restaurants containing cost data, **Khan Market,Delhi** had the highest average cost at **₹601**, while **Connaught Place,Delhi** was lowest within the same filtered result set at **₹434**.

### 6. Best value-for-money city
Using the project-defined metric:

`Value Score = Average Rating / Average Cost × 100`

**Bathinda** ranked highest with a value score of **2.22**.

This is a simple analytical metric created for this project, not an official Swiggy metric.

## Rating Distribution

| rating_category   |   restaurant_count |
|:------------------|-------------------:|
| 4.0 - 4.4         |              26809 |
| 3.5 - 3.9         |              21312 |
| 3.0 - 3.4         |               6532 |
| 4.5 - 5.0         |               4481 |
| Below 3.0         |               2307 |

## Business Insights

- Restaurant supply is concentrated in a smaller group of cities.
- Cuisine frequency reveals which food categories have the broadest restaurant presence.
- Restaurant names with many records can indicate large chains or repeated brand presence.
- Average rating should be considered alongside rating count and sample size.
- Restaurant pricing varies across cities.
- High ratings alone do not necessarily indicate strong customer engagement.
- A derived value score can help compare rating and price, provided its assumptions are clearly documented.

## SQL Skills Demonstrated

`SELECT` · `WHERE` · `GROUP BY` · `HAVING` · `ORDER BY` · `LIMIT` · `COUNT()` · `AVG()` · `SUM()` · `ROUND()` · `CAST()` · `REPLACE()` · `CASE` · NULL handling · Data validation · Business analysis


## How to Reproduce

1. Download the CSV from Kaggle.
2. Open DB Browser for SQLite.
3. Create/import a database.
4. Import the CSV as `swiggy`.
5. Run `01_data_validation.sql`.
6. Run `02_data_cleaning.sql`.
7. Run `03_business_analysis.sql`.
8. Compare your results with the generated CSV files.

## Resume Bullet

> **Analyzed 148,541+ Swiggy restaurant records across Indian cities using SQL, performing data validation, cleaning, aggregation, filtering, and city/cuisine-level analysis to identify restaurant, rating, customer engagement, and pricing trends.**

## Disclaimer

This project is for educational and portfolio purposes. The dataset is sourced from Kaggle. Check the current Kaggle license and terms before redistributing raw dataset files.
