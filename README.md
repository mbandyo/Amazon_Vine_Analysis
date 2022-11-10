# Amazon Vine Analysis
This project analyzes book reviews in Amazon through Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.
In this project we had access to approximately 50 datasets. Each one contains reviews of a specific product, from clothing apparel to wireless products. The project team selected one of these datasets( a book review) and use PySpark to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin. Then SQL was used to determine if there is any bias toward favorable reviews from Vine members in your dataset. 
## Review Data Analysis
One challenge of analysis is the blind choice of data. 
The steps followed in the ETL process are as follows:
* Select the subset of data where the minimum number of votes was 20.
* The percentage of helpful votes (helpful_votes/total_votes) was at least 50.
The dataset chosen in this specific instance did not have any surviving paid review data after ETL was completed. While this makes the analysis simpler, it is also more credible since any bias could be ruled out.
