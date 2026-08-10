--------------
Finds the average and median parcel values, as well as the difference between them. Finds percentage of parcels with a million + in value
--------------
SELECT
 MSTATE,
  REGEXP_EXTRACT(MZIP, r'^(\d{5})') AS zip_clean,
  COUNT(*) AS parcel_count,
  ROUND(AVG(PARVAL)) AS avg_parval,
  APPROX_QUANTILES(PARVAL,100)[OFFSET(50)] as median_parval,
  ROUND (AVG(PARVAL) - APPROX_QUANTILES(PARVAL,100)[OFFSET(50)],0) as avg_median_difference,
  COUNTIF(PARVAL >= 1000000) AS million_plus_parcels,
  ROUND(COUNTIF(PARVAL >= 1000000)/ COUNT(*)*100, 2) AS percent_million_plus
FROM `project.dataset.table` 
WHERE MZIP IS NOT NULL
AND MSTATE = "NC"
AND PARVAL != 0
AND PARVAL IS NOT NULL
GROUP BY zip_clean, MSTATE
HAVING COUNT(*) >50
ORDER BY avg_median_difference DESC
