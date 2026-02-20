In this project, I performed a complete data cleaning process on a real-world layoffs dataset using SQL in MySQL Workbench. The goal was to transform raw, inconsistent data into a clean and analysis-ready dataset.

Key Cleaning Steps:

1. Handling Missing Values

Identified NULL and blank values in critical columns such as industry.

Standardized empty strings by converting them to NULL.

Used self-joins to intelligently populate missing industry values based on matching company and location records.

Verified updates to ensure data consistency.

2. Standardizing Data

Cleaned inconsistent text entries.

Ensured consistent formatting across categorical columns.

Removed unwanted spaces and unified similar values.

3. Removing Duplicates

Used row numbering techniques to detect duplicate records.

Removed duplicates while preserving valid entries.

4. Data Validation

Reviewed records before and after updates.

Ensured no unintended changes were made.

Confirmed accuracy through targeted SELECT checks.

5. Preparing Final Clean Dataset

Structured the cleaned table for analysis and dashboard building.

Ensured proper data types and consistency across all columns.


Outcome

The dataset is now:

Free from missing critical values

Standardized and consistent

Ready for analysis and visualization

Suitable for building dashboards (Power BI / Excel)
