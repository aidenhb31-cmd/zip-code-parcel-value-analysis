------------------------
Looks at MCITY, and finds where the CITY, STATE, ZIP+4 format is broken
------------------------
WITH BASE_QUERY AS (
  SELECT 
    MCITY,
    REGEXP_EXTRACT(MCITY, r'^(.*)\s+[A-Z]{2}\s+\d{5}(?:-\d{4})?$') AS city_clean,
    REGEXP_EXTRACT(MCITY, r'^.*\s+([A-Z]{2})\s+\d{5}(?:-\d{4})?$') AS state_clean,
    REGEXP_EXTRACT(MCITY, r'^.*\s+[A-Z]{2}\s+(\d{5}(?:-\d{4})?)$') AS zip_clean
  FROM `project.mydataset.table` 
)
SELECT MCITY, COUNT(*) AS cnt
FROM BASE_QUERY
WHERE city_clean IS NULL
OR state_clean IS NULL
OR zip_clean IS NULL
GROUP BY MCITY
ORDER BY cnt DESC;
