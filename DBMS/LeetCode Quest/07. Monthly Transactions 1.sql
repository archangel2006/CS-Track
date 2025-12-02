# Write your MySQL query statement below

SELECT country, -- group by country
DATE_FORMAT(trans_date, '%Y-%m') AS MONTH, -- convert date to year-month format
COUNT(id) AS trans_count, -- total number of transactions
SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) AS approved_count,  -- count approved transactions
SUM(amount) AS trans_total_amount, -- sum of all transaction amounts
SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount -- sum of approved amounts
FROM Transactions
GROUP BY month, country  -- group by month and country



/*

1. DATE_FORMAT() (Date Manipulation)
- Used to extract or format date values into specific patterns like year, month, or day.
- In reporting queries, dates are often formatted so that multiple entries in the same month are treated as one group.

2. Aggregation Functions
- These functions summarize multiple rows into a single value:
- COUNT() → counts rows
- SUM() → adds numeric values
- AVG(), MIN(), MAX() → other common aggregates
- Aggregates are used when you want totals, averages, or statistics instead of raw rows.

3. Conditional Aggregation (CASE inside SUM)
- A CASE WHEN expression allows applying conditions inside aggregates.
- Example: SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END)
- This counts only approved rows by summing 1 for approved and 0 for others.

Useful when:
- Counting only certain categories
- Summing values that meet conditions
- Creating custom aggregated metrics

4. GROUP BY (Grouping Rows)
- GROUP BY groups rows based on one or more columns so aggregates are calculated per group instead of the entire table.
- After grouping, each group becomes one summarized row.

5. SELECT Columns in Aggregation Rules
- In a GROUP BY query:
- Any column not inside an aggregate must be in the GROUP BY.
- Aggregated columns (SUM, COUNT) do not need to be in the GROUP BY.
- This ensures SQL knows how to combine rows.

6. Reporting Query Pattern
- This query represents a reporting/analytics query commonly used in dashboards.
It extracts:
total transactions
✔ approved vs non-approved
✔ total amount
✔ approved transaction value
✔ grouped by time period + region

*/


/*

APPROACH
1. Convert each transaction date into a 'YYYY-MM' format to represent the month.
2. Group rows by (month, country) so every month-country pair is aggregated.
3. Count total transactions in each group.
4. Count approved transactions using a CASE expression.
5. Sum all transaction amounts.
6. Sum only approved transaction amounts using another CASE expression.

LOGIC
1. DATE_FORMAT(trans_date, '%Y-%m') extracts the month in required format.
2. GROUP BY month and country ensures each month-country pair becomes one aggregated row.
3. CASE WHEN state = 'approved' THEN ... helps count and sum approved transactions separately.
4. COUNT() and SUM() perform the required aggregation on each group.

*/