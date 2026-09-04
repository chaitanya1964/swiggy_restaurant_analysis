-- 02_data_cleaning.sql
DROP TABLE IF EXISTS swiggy_clean;

CREATE TABLE swiggy_clean AS
SELECT
 TRIM(name) AS name,
 TRIM(city) AS city,
 TRIM(cuisine) AS cuisine,
 CASE
   WHEN TRIM(rating) IN ('NEW','--','') OR rating IS NULL THEN NULL
   ELSE CAST(TRIM(rating) AS REAL)
 END AS rating,
 CASE
   WHEN rating_count IS NULL OR TRIM(rating_count)='' OR UPPER(TRIM(rating_count)) LIKE 'TOO FEW%' THEN NULL
   ELSE CAST(REPLACE(REPLACE(UPPER(TRIM(rating_count)),'+',''),' RATINGS','') AS INTEGER)
 END AS rating_count,
 CASE
   WHEN cost IS NULL OR TRIM(cost)='' THEN NULL
   ELSE CAST(REPLACE(REPLACE(UPPER(TRIM(cost)),'₹',''),',','') AS INTEGER)
 END AS cost,
 lic_no, link, address, menu
FROM swiggy;
