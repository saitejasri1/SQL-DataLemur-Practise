/*
This is the same question as problem #6 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

tweets Table:
Column Name	Type
tweet_id	integer
user_id	integer
msg	string
tweet_date	timestamp
tweets Example Input:
tweet_id	user_id	msg	tweet_date
214252	111	Am considering taking Tesla private at $420. Funding secured.	12/30/2021 00:00:00
739252	111	Despite the constant negative press covfefe	01/01/2022 00:00:00
846402	111	Following @NickSinghTech on Twitter changed my life!	02/14/2022 00:00:00
241425	254	If the salary is so competitive why won’t you tell me what it is?	03/01/2022 00:00:00
231574	148	I no longer have a manager. I can't be managed	03/23/2022 00:00:00
Example Output:
tweet_bucket	users_num
1	2
2	1
Explanation:
Based on the example output, there are two users who posted only one tweet in 2022, and one user who posted two tweets in 2022. The query groups the users by the number of tweets they posted and displays the number of users in each group.
*/

-- ** Solution **

Time spent ; 16:39 min 

WITH CTE AS(
SELECT user_id, count(*) as tweet_bucket
FROM tweets 
WHERE EXTRACT(year from tweet_date) ='2022'
GROUP BY user_id
)

SELECT tweet_bucket, count(user_id) as user_num FROM CTE 
GROUP BY tweet_bucket;


"The new concept that I have learnt is CTE . It helps me create a new common table expression which can be reused any time. It is easy to extract and allow to search within the query.
The next thing I learnt is EXTRACTY (year/month/day from column) ="expression value". "

-- Another Possible. solution 
SELECT user_id, count(twee_id) AS tweet_count_per_user
FROM tweets 
WHERE tweet_date BETWEEEN '2022-01-01' NAD '2022-12-31'
GROUP BY user_id


SELECT tweet_count_per_user AS tweet_bucket , count(user_id) as user_num
FROM (SELECT user_id, count(tweet_id) AS tweet_count_per_user
FROM tweets 
WHERE tweet_date BETWEEEN '2022-01-01' NAD '2022-12-31'
GROUP BY user_id)AS total_tweets 
GROUP BY tweet_count_per_user;


-- SAme as above but using the CTE tables
WITH total_tweets AS (
  SELECT 
    user_id, 
    COUNT(tweet_id) AS tweet_count_per_user
  FROM tweets 
  WHERE tweet_date BETWEEN '2022-01-01' 
    AND '2022-12-31' 
  GROUP BY user_id) 
  
SELECT 
  tweet_count_per_user AS tweet_bucket, 
  COUNT(user_id) AS users_num 
FROM total_tweets 
GROUP BY tweet_count_per_user;