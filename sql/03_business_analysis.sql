-- 03_business_analysis.sql

-- Q1_top_cities
SELECT city, COUNT(*) total_restaurants FROM swiggy_clean
WHERE city IS NOT NULL AND TRIM(city)<>'' GROUP BY city ORDER BY total_restaurants DESC LIMIT 10;

-- Q2_top_cuisines
SELECT cuisine, COUNT(*) restaurant_count FROM swiggy_clean
WHERE cuisine IS NOT NULL AND TRIM(cuisine)<>'' GROUP BY cuisine ORDER BY restaurant_count DESC LIMIT 10;

-- Q3_top_restaurant_chains
SELECT name AS restaurant_name, COUNT(*) branches FROM swiggy_clean
WHERE name IS NOT NULL AND TRIM(name)<>'' GROUP BY name ORDER BY branches DESC LIMIT 10;

-- Q4_top_rated_cities
SELECT city, ROUND(AVG(rating),2) avg_rating, COUNT(*) total_restaurants FROM swiggy_clean
WHERE rating IS NOT NULL GROUP BY city HAVING COUNT(*)>50 ORDER BY avg_rating DESC LIMIT 5;

-- Q5_most_expensive_cities
SELECT city, ROUND(AVG(cost),0) avg_cost, COUNT(*) restaurants_with_cost FROM swiggy_clean
WHERE cost IS NOT NULL GROUP BY city HAVING COUNT(*)>30 ORDER BY avg_cost DESC LIMIT 10;

-- Q6_top_rated_cuisines
SELECT cuisine, ROUND(AVG(rating),2) avg_rating, COUNT(*) restaurant_count FROM swiggy_clean
WHERE rating IS NOT NULL GROUP BY cuisine HAVING COUNT(*)>100 ORDER BY avg_rating DESC LIMIT 10;

-- Q7_high_rating_high_engagement
SELECT name AS restaurant_name, city, rating, rating_count, cost FROM swiggy_clean
WHERE rating>=4.5 AND rating_count>=1000 ORDER BY rating DESC, rating_count DESC LIMIT 20;

-- Q8_value_for_money_cities
SELECT city, ROUND(AVG(rating),2) avg_rating, ROUND(AVG(cost),0) avg_cost,
ROUND((AVG(rating)/AVG(cost))*100,2) value_score, COUNT(*) restaurant_count FROM swiggy_clean
WHERE rating IS NOT NULL AND cost IS NOT NULL GROUP BY city HAVING COUNT(*)>30
ORDER BY value_score DESC LIMIT 10;

-- Q9_rating_distribution
SELECT CASE WHEN rating>=4.5 THEN '4.5 - 5.0'
WHEN rating>=4.0 THEN '4.0 - 4.4' WHEN rating>=3.5 THEN '3.5 - 3.9'
WHEN rating>=3.0 THEN '3.0 - 3.4' ELSE 'Below 3.0' END rating_category,
COUNT(*) restaurant_count FROM swiggy_clean WHERE rating IS NOT NULL GROUP BY rating_category
ORDER BY restaurant_count DESC;

-- Q10_highly_rated_by_city
SELECT city, COUNT(*) highly_rated_restaurants FROM swiggy_clean
WHERE rating>=4.5 GROUP BY city ORDER BY highly_rated_restaurants DESC LIMIT 10;

-- Q11_most_rated_restaurants
SELECT name AS restaurant_name, city, rating, rating_count FROM swiggy_clean
WHERE rating_count IS NOT NULL ORDER BY rating_count DESC LIMIT 20;

-- Q12_price_vs_rating
SELECT CASE WHEN cost<300 THEN 'Under 300' WHEN cost<500 THEN '300 - 499'
WHEN cost<800 THEN '500 - 799' ELSE '800+' END price_category, ROUND(AVG(rating),2) avg_rating,
COUNT(*) restaurant_count FROM swiggy_clean WHERE rating IS NOT NULL AND cost IS NOT NULL
GROUP BY price_category ORDER BY CASE price_category WHEN 'Under 300' THEN 1 WHEN '300 - 499' THEN 2
WHEN '500 - 799' THEN 3 ELSE 4 END;