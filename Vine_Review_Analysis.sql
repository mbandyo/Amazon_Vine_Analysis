-- create vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- create table with more than 20 reviews
SELECT * INTO twenty_plus_vine_table
FROM vine_table
WHERE total_votes >= 20;

-- create table with more than 50% helpful votes
SELECT * INTO helpful_vine_votes_table
FROM twenty_plus_vine_table
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

-- create table for paid reviews
SELECT * INTO paid_reviews_table
FROM helpful_vine_votes_table
WHERE vine = 'Y';

-- create table for unpaid reviews
SELECT * INTO unpaid_reviews_table
FROM helpful_vine_votes_table
WHERE vine = 'N';

-- Find Statistics

SELECT (SELECT COUNT(review_id)FROM unpaid_reviews_table) AS total_votes,
       (SELECT COUNT(star_rating) FROM unpaid_reviews_table WHERE star_rating = 5) AS five_star_rating,
       (SELECT CAST(COUNT(star_rating)AS FLOAT) FROM unpaid_reviews_table WHERE star_rating = 5 )/(SELECT CAST(COUNT(review_id) AS FLOAT)FROM unpaid_reviews_table )
AS five_star_percentage;

SELECT (SELECT COUNT(review_id)FROM paid_reviews_table) AS total_votes,
       (SELECT COUNT(star_rating) FROM paid_reviews_table WHERE star_rating = 5) AS five_star_rating,
       (SELECT CAST(COUNT(star_rating)AS FLOAT) FROM paid_reviews_table WHERE star_rating = 5 )/(SELECT CAST(COUNT(review_id) AS FLOAT)FROM paid_reviews_table )
AS five_star_percentage;



SELECT * FROM paid_reviews_table;

