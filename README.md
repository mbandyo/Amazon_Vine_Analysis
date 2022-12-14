# Amazon Vine Analysis
This project analyzes book reviews in Amazon through Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.
In this project we had access to approximately 50 datasets. Each one contains reviews of a specific product, from clothing apparel to wireless products. The project team selected one of these datasets( a book review) and use PySpark to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin. Then SQL was used to determine if there is any bias toward favorable reviews from Vine members in your dataset. 
## Review Data Analysis
One challenge of analysis is the blind choice of data. 
The steps followed in the ETL process are as follows:
* Select the subset of data where the minimum number of votes was 20.
* The percentage of helpful votes (helpful_votes/total_votes) was at least 50.
The dataset chosen in this specific instance did not have any surviving paid review data after ETL was completed. While this makes the analysis simpler, it is also more credible since any bias could be ruled out.
### Result
Unpaid Reviews Table: </br>
|Total Votes(total_votes)| Five Star Ratings(five_star_percentage) |Five Star Rating Percentage(five_star_percentage)|
|------------------------| ----------------------------------------|-------------------------------------------------|
| 403807                 | 242889                                  | 0.6014977452099641                              |

Paid Reviews Table: </br>
The table contains no data after the initial two-step ETL process. Following is the result from a query for selecting all data from paid_reviews_table:</br>
|review_id|star_rating|helpful_votes|total_votes|vine|verified_purchase|
|---------|----------|--------------|----------|-----|-----------------|

## Summary
The project design is transferrable and could be used to analyze any dataset compliant with the data structure. The specific dataset did not have surviving datapoint after ETL and so is relatively sound as far as credibility and reliability of results. About 60% of reviews in this book review were five star all coming from unpaid reviewers. It is reasonable to conclude that this book was a public favorite.
An important enhancement in the analysis could be to consider the verified purchase data. This would be especially relevant to predict product demand for a reusable product like a book. Since the rating may not provide a reasonable idea of the sales/revenues.

                    

