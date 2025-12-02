# Write your MySQL query statement below

-- Compare employees with their managers using a self join

SELECT Employee.name AS Employee FROM Employee
JOIN Employee AS Manager  -- second copy of the same table representing managers
ON Employee.managerId = Manager.id -- match employee to their manager
WHERE Employee.salary > Manager.salary -- filter only those earning more

/*
Self join: joining a table to itself to relate rows in different roles (here: employee vs manager).
- Syntax requires two references to the same table (one may be aliased) so SQL can tell which row you mean.

Why JOIN (INNER JOIN) works here:
- We only care about employees who have a manager (i.e., managerId is not NULL). An INNER JOIN excludes rows where managerId is NULL, which is desired for this problem. If you wanted to include employees with NULL managers and show NULL manager info, you'd use LEFT JOIN.

Common bug: comparing a column to itself (e.g. Employee.managerId = Employee.id) — that doesn’t connect different rows. Always ensure one side refers to the other copy (the manager alias).

NULLs: employees with managerId = NULL are excluded by the JOIN. If you used LEFT JOIN you’d have to add AND Manager.id IS NOT NULL (or a WHERE Manager.id IS NOT NULL) to get the same behavior as JOIN.
*/