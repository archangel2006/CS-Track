# Write your MySQL query statement below

SELECT class FROM Courses
GROUP BY class
HAVING COUNT(class) = 5 OR COUNT(class)>5;