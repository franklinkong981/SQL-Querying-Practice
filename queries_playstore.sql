--Query 1
SELECT * FROM analytics
WHERE id = 1880;
--Query 2
SELECT id, app_name FROM analytics
WHERE last_updated = '2018-08-01';
--Query 3
SELECT category, COUNT(*) FROM analytics
GROUP BY category;
--Query 4
SELECT app_name, reviews FROM analytics
ORDER BY reviews desc
LIMIT 5;
--Query 5
SELECT * FROM analytics
WHERE rating >= 4.8
ORDER BY reviews desc
LIMIT 1;
--Query 6
SELECT category, AVG(rating) FROM analytics
GROUP BY category
ORDER BY AVG(rating) desc;
--Query 7
SELECT app_name, price, rating FROM analytics
WHERE rating < 3
ORDER BY price desc
LIMIT 1;
--Query 8
SELECT * FROM analytics
WHERE min_installs <= 50 AND rating IS NOT NULL
ORDER BY rating desc;
--Query 9
SELECT app_name FROM analytics
WHERE rating < 3 AND reviews > 10000;
--Query 10
SELECT * FROM analytics
WHERE price >= 0.10 AND price <= 1
ORDER BY reviews desc
LIMIT 10;
--Query 11
SELECT MIN(last_updated) FROM analytics;
SELECT * FROM analytics
WHERE last_updated = '2010-05-21';
--Query 12
SELECT MAX(price) FROM analytics;
SELECT * FROM analytics
WHERE price = 400;
--Query 13
SELECT SUM(reviews) FROM analytics;
--Query 14
SELECT category, COUNT(*) FROM analytics
GROUP BY category
HAVING COUNT(*) > 300;
--Query 15
SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion FROM analytics
WHERE min_installs > 100000
ORDER BY min_installs / reviews desc
LIMIT 1;
--FS 1 Query
SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;
--FS 2 Query
SELECT app_name FROM analytics
WHERE app_name ILIKE '%facebook%';
--FS 3 Query
SELECT * FROM analytics
WHERE array_length(genres, 1) > 1;
--FS 4 Query
SELECT * FROM analytics
WHERE genres @> '{"Education"}';
