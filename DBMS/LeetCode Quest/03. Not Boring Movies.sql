# Write your MySQL query statement below

SELECT * FROM Cinema
WHERE id%2 = 1 AND Cinema.description <> "boring"
ORDER BY rating DESC

/*
1. FROM – Choose which table(s) the data comes from.
2. WHERE – Filter rows based on conditions. Only rows that match continue. (Cannot use aggregates here — it filters individual rows.)
3. GROUP BY – Group the filtered rows based on one or more columns. (Aggregates like SUM, COUNT, AVG apply to each group.)
4. HAVING – Filter groups based on aggregate conditions. (Like WHERE but works on groups instead of individual rows.)
5. SELECT – Pick which columns or aggregated values to show from the remaining rows/groups.
6. ORDER BY – Sort the final result.
*/