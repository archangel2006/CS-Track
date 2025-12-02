# Write your MySQL query statement below


-- Select specific columns from both tables
SELECT Person.firstName, Person.lastName, Address.city, Address.state 
-- LEFT JOIN ensures we include all persons even if they don't have an address entry
FROM Person LEFT JOIN Address 
on Person.personId = Address.personId

-- It retrieves a list of people (first name + last name) from the Person table.
-- It also tries to match their city and state from the Address table.
-- If a person doesn’t have an address, their city and state will appear as NULL (because of LEFT JOIN).


/*
1. INNER JOIN	: Only matching rows from both tables	
- Use when you only want records with relationship in both tables

2. LEFT JOIN	: All rows from left table + matching rows from right table	
- Use when missing matching data is acceptable (keeps unmatched records)

3. RIGHT JOIN	: All rows from right table + matches from left	
- Similar to LEFT JOIN but reversed (less common)

4. FULL OUTER JOIN : All matched + unmatched (from both tables)	
- Not supported in MySQL directly
*/