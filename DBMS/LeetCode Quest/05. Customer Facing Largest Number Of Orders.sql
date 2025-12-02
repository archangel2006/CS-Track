# Write your MySQL query statement below

SELECT customer_number FROM Orders
GROUP BY customer_number  -- group orders by customer
ORDER BY COUNT(*) DESC   -- sort by number of orders (highest first)
LIMIT 1;  -- keep only the top result

/*
1. SELECT : Specifies which column will appear in the final output. In this case, only the customer identifier is needed.

 2. GROUP BY : Combines rows that share the same customer number into logical groups. This allows SQL to apply aggregation functions, such as counting how many orders each customer submitted.

3. COUNT() (Aggregate Function) : Calculates how many rows exist in each group. Here, it determines the total number of orders per customer.

4. ORDER BY : Sorts the grouped results. Using COUNT(*) with DESC orders the customers from the highest number of orders to the lowest.

5. LIMIT : Restricts the output to a specific number of rows. LIMIT 1 returns only the customer with the most orders after sorting.

*/