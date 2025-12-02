# Write your MySQL query statement below

SELECT 
    Activity.activity_date AS day,                    -- show activity date as 'day'
    COUNT(DISTINCT user_id) AS active_users          -- count unique users active on that day
FROM Activity
WHERE activity_date BETWEEN 
      DATE_SUB('2019-07-27', INTERVAL 29 DAY)        -- start date (30 days before)
      AND '2019-07-27'                               -- end date
GROUP BY activity_date;                              -- group results by each date

/*

1. Date Range Filtering (BETWEEN)
- Instead of selecting all data, the query limits results to only rows where the date falls in a fixed window — here, the last 30 days ending on '2019-07-27'.
- This is common in reporting queries (e.g., weekly, monthly usage tracking).

2. DATE_SUB() for Dynamic Windowing
- Instead of manually entering the earlier date, DATE_SUB() calculates it by subtracting a number of days from a given date.
- This keeps the query flexible and reusable for other ranges too.

3. COUNT(DISTINCT ...) for Unique Users
- Using COUNT(DISTINCT user_id) ensures that if a user performs multiple activities on the same day, they are counted only once.
- This is important when measuring active users, not number of actions.

4. GROUP BY to Aggregate Per Day
- Since we need daily numbers rather than one final total, the results are grouped by activity_date.
- Without the GROUP BY, MySQL would try to produce a single summary row instead.

5. Column Aliasing (AS)
-Renaming columns improves readability and is especially useful when returning results to dashboards, reports, or APIs.

*/

/*

APPROACH

1. Filter activities within the 30-day window using WHERE clause with DATE_SUB
2. Group by activity_date to get daily counts
3. Use COUNT(DISTINCT user_id) to count unique active users per day

LOGIC

1. DATE_SUB('2019-07-27', INTERVAL 29 DAY) calculates the start date (2019-06-28)
2. BETWEEN includes both start and end dates (30 days total)
3. COUNT(DISTINCT user_id) ensures we count each user only once per day
4. Any activity type qualifies a user as active for that day

*/