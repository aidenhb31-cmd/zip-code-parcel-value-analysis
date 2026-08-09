SELECT
  MSTATE,
  REGEXP_EXTRACT(MZIP, r'^(\d{5})') AS zip_clean,
  COUNT(*) AS parcel_count,
  ROUND(AVG(PARVAL)) AS avg_parcel_value,
  APPROX_QUANTILES(PARVAL, 100)[OFFSET(50)] AS median_parcel_value,
  SUM(PARVAL) AS total_parcel_value,
  MIN(PARVAL) AS min_parcel_value,
  MAX(PARVAL) AS max_parcel_value
FROM `project.mydataset.table` 
WHERE MZIP IS NOT NULL
AND MSTATE = "NC"
AND PARVAL IS NOT NULL
AND PARVAL != 0
GROUP BY zip_clean, MSTATE
ORDER BY parcel_count DESC;
