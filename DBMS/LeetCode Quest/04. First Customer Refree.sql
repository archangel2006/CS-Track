# Write your MySQL query statement below

SELECT name from Customer
WHERE referee_id IS NULL OR referee_id <> 2

/*
1. NULL is not a value
- It represents unknown or missing data.
- You cannot use = or != to check for NULL — these always return **false**.

2. How to check for NULL
- Use IS NULL → true if the column has no value.
- Use IS NOT NULL → true if the column has a value.

3. Combining conditions with OR / AND
- OR → row passes if any condition is true.
- AND → row passes only if all conditions are true.
- Be careful with NULLs: NULL AND TRUE → UNKNOWN → treated as false in WHERE.
*/