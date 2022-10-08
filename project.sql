  ---Start by getting a feel for the met table:
 SELECT *
 FROM met
 LIMIT 10;

 ---How many pieces are in the American Decorative Art collection?
 SELECT COUNT(*)
 FROM met;

---Celery was considered a luxurious snack in the Victorian era (around the 1800s). Wealthy families served stalks of it in intricate glass vases. Don’t believe it? Count the number of pieces where the category includes ‘celery’.
 SELECT DISTINCT category
 FROM met
 WHERE category LIKE '%celery%';

 ---Find the title and medium of the oldest piece(s) in the collection.
SELECT MIN(date), title, medium
FROM met;

---Find the top 10 countries with the most pieces in the collection.
SELECT country, COUNT(*)
FROM met
WHERE country IS NOT NULL
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 10;

---Find the categories HAVING more than 100 pieces.
SELECT category, COUNT(*)
FROM met
GROUP BY category
HAVING COUNT(*) > 100;

---Lastly, let’s look at some bling! Count the number of pieces where the medium contains ‘gold’ or ‘silver’. And sort in descending order
SELECT medium, COUNT(*)
FROM met
WHERE medium LIKE '%gold%'
  OR medium LIKE '%silver%'
GROUP BY medium
ORDER BY COUNT(*) DESC;

---Notice that in the result, there are ‘Silver’, ‘Gold’, but also a lot of other mediums with these two words. Use a CASE statement to be more accurate.
SELECT CASE
   WHEN medium LIKE '%gold%'   THEN 'Gold'
   WHEN medium LIKE '%silver%' THEN 'Silver'
   ELSE NULL
  END AS 'Bling',
  COUNT(*)
FROM met
WHERE Bling IS NOT NULL
GROUP BY Bling
ORDER BY COUNT(*) DESC;