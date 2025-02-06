/*
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

Assumption:

There are no duplicates in the candidates table.
candidates Table:
Column Name	Type
candidate_id	integer
skill	varchar
candidates Example Input:
candidate_id	skill
123	Python
123	Tableau
123	PostgreSQL
234	R
234	PowerBI
234	SQL Server
345	Python
345	Tableau
Example Output:
candidate_id
123
Explanation
Candidate 123 is displayed because they have Python, Tableau, and PostgreSQL skills. 345 isn't included in the output because they're missing one of the required skills: PostgreSQL.

The dataset you are querying against may have different input & output - this is just an example!
*/



-- ** SOLUTION **

SELECT candidate_id from candidates 
WHERE skill in ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING count(DISTINCT skill)=3
ORDER BY candidate_id ASC;

-- Expression learnt is "IN"
/*
Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
*/

-- ** Alternative Solution **

SELECT candidate_id FROM candidates WHERE skill = 'Python'
INTERSECT 
SELECT candidate_id FROM candidates WHERE skill = 'Tableau'
INTERSECT  
SELECT candidate_id FROM candidates WHERE skill = 'PostgreSQL'
ORDER BY 1;

-- Intersect Clause
/*
What is SQL INTERSECT?
The INTERSECT clause in SQL is used to combine two SELECT statements but the dataset returned by the INTERSECT statement 
will be the intersection of the data sets of the two SELECT statements. In simple words, the INTERSECT statement will return
only those rows that will be common to both of the SELECT statements.

Key Characteristics of SQL INTERSECT:
Returns only the common rows between two result sets.
Ensures uniqueness by automatically removing duplicate rows.
Requires that both SELECT statements have the same number of columns.
The data types of corresponding columns in both queries must be compatible.

Syntax:


SELECT column1 , column2 ….
FROM table1
WHERE condition
INTERSECT
SELECT column1 , column2 ….
FROM table2
WHERE condition

*/


