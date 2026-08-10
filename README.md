# zip-code-parcel-value-analysis
SQL and BigQuery analysis of parcel values across ZIP codes around Wake County to identify geographic property-value patterns.
The goal is to understand how parcel values vary by ZIP code and identify areas with higher or lower concentrations of property value.

Tools & Technologies
Google BigQuery & Power BI (planned)

Data Preparation

The dataset contains parcel-level property information, including geographic identifiers, land values, property values, and property types. 
The  data required cleaning before analysis. ZIP codes were standardized to five-digit ZIP codes so that ZIP+4 values could be grouped consistently.
For example: 27513-4333 → 27513
MCITY column contained the city, state, as well as the ZIP+4 code for each property, which had to be separated into city, state, and zip columns. There were outliers with property sold 15+ years ago with outdated parcel values and land parcels with nothing but PO boxes as their addresses. These will be analyzed separately.

Analysis
The project examines parcel values at the ZIP-code level using SQL.
Key metrics include:
Number of parcels
Total parcel value
Average parcel value
Median parcel value
Minimum parcel value
Maximum parcel value
Key Questions

The analysis is designed to answer:

Which ZIP codes have the highest average parcel values?
Which ZIP codes have the highest median parcel values?
Which ZIP codes contain the greatest total parcel value?
How many parcels are represented within each ZIP code?
How different are average and median parcel values across ZIP codes?
Are certain ZIP codes characterized by unusually high or low property values?

SQL Techniques

This project uses several SQL techniques, including:
SELECT
WHERE
GROUP BY
ORDER BY
COUNT()
SUM()
AVG()
MIN() and MAX()
ROUND()
REGEXP_EXTRACT()
APPROX_QUANTILES()

Visualization

A Power BI dashboard is planned to visualize ZIP-code-level property values and allow users to explore geographic differences interactively.

Future Improvements
Add Power BI dashboard, Analyze property value distributions, Identify high-value and low-value ZIP-code segments , Investigate outliers, Compare cities and ZIP codes
Author

Aiden Bilyard

MIS Student | Data Analytics & Business Intelligence
