-- 01_data_validation.sql
SELECT COUNT(*) AS total_records FROM swiggy;

SELECT
 SUM(CASE WHEN name IS NULL OR TRIM(name)='' THEN 1 ELSE 0 END) AS null_names,
 SUM(CASE WHEN city IS NULL OR TRIM(city)='' THEN 1 ELSE 0 END) AS null_cities,
 SUM(CASE WHEN cuisine IS NULL OR TRIM(cuisine)='' THEN 1 ELSE 0 END) AS null_cuisines,
 SUM(CASE WHEN rating IS NULL OR TRIM(rating)='' THEN 1 ELSE 0 END) AS null_ratings,
 SUM(CASE WHEN rating_count IS NULL OR TRIM(rating_count)='' THEN 1 ELSE 0 END) AS null_rating_counts,
 SUM(CASE WHEN cost IS NULL OR TRIM(cost)='' THEN 1 ELSE 0 END) AS null_costs
FROM swiggy;

SELECT rating, COUNT(*) AS record_count FROM swiggy
GROUP BY rating ORDER BY record_count DESC;

SELECT rating_count, COUNT(*) AS record_count FROM swiggy
GROUP BY rating_count ORDER BY record_count DESC LIMIT 20;

SELECT cost, COUNT(*) AS record_count FROM swiggy
GROUP BY cost ORDER BY record_count DESC LIMIT 20;
