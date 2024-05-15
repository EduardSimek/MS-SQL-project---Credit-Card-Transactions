SELECT * FROM CreditCardCSV

SELECT exp_type 
FROM CreditCardCSV GROUP BY exp_type

SELECT DISTINCT card_type FROM CreditCardCSV

--Write a query which will print earliest and latest date of transaction
SELECT MIN(transaction_date), MAX(transaction_date) FROM CreditCardCSV

-- Write a query which will retrieve total amount of transactions by city
SELECT city, SUM(amount) total_amount 
FROM CreditCardCSV 
GROUP BY city

-- Write a query which will retrieve count of transactions by card type
SELECT card_type, COUNT(transaction_id) total 
FROM CreditCardCSV 
GROUP BY card_type

-- Write a query which will retrieve transaction date from specific period of time
SELECT * FROM CreditCardCSV 
WHERE transaction_date BETWEEN '2014-01-01' AND '2024-03-03'

--Write a query to print maximum and minimum transaction amount by city
SELECT city, MIN(amount) minimum, MAX(amount) maximum 
FROM CreditCardCSV 
GROUP BY city

--Write a query to print all aggregation functions
SELECT city, MIN(amount) minimum, MAX(amount) maximum, AVG(amount) average, SUM(amount) total, COUNT(*) count22
FROM CreditCardCSV 
GROUP BY city

SELECT * FROM CreditCardCSV

--Write a query which will print total amount of card type grouped by gender and card type
SELECT COUNT(amount) total_amount, gender, card_type 
FROM CreditCardCSV 
GROUP BY gender, card_type

-- Write a query which will print certain amount of transaction which is above of some threshold
SELECT * FROM CreditCardCSV 
WHERE amount > 10000

SELECT DISTINCT city, card_type
FROM CreditCardCSV

--Retrieve the average amount from CreditCard table grouped by city and gender
SELECT city, gender, AVG(amount) average 
FROM CreditCardCSV 
GROUP BY city, gender

--Count of Transactions by Expense Type
SELECT exp_type, COUNT(amount) total 
FROM CreditCardCSV
GROUP BY exp_type

--Count of Transactions by Expense Type for Each Card Type:
SELECT card_type, exp_type, COUNT(*) Transaction_Count
FROM CreditCardCSV
GROUP BY card_type, exp_type;

SELECT * FROM CreditCardCSV

--Write SQL query which will retrieve 
SELECT TOP 5 city, MAX(amount) highest, MIN(amount) minimum, AVG(amount) average
FROM CreditCardCSV 
GROUP BY city

SELECT exp_type, COUNT(*) freq
FROM CreditCardCSV
GROUP BY exp_type
ORDER BY freq DESC

SELECT * FROM CreditCardCSV

SELECT AVG(amount) average, city, card_type 
FROM CreditCardCSV 
GROUP BY city, card_type

SELECT city, SUM(amount) total 
FROM CreditCardCSV 
GROUP BY amount, city
HAVING amount > 20000
ORDER BY amount DESC

SELECT * FROM CreditCardCSV

--Write SQL query which will retrieve transactions involving specific card types made on specific date
SELECT transaction_id, city, amount
FROM CreditCardCSV 
WHERE card_type IN ('Gold', 'Silver') AND transaction_date BETWEEN '2022-01-01' AND '2022-04-04'

--Write SQL query which will print percentage of total transactions by card type
SELECT card_type, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM CreditCardCSV) Percentage 
FROM CreditCardCSV 
GROUP BY card_type

--Write query which will print top 5 cities with minimum amount of transactions 
SELECT TOP 5 city, MIN(amount) minimum
FROM CreditCardCSV 
GROUP BY city
ORDER BY minimum ASC

SELECT * FROM CreditCardCSV 

--Write SQL query which will print total spending by exp_type, card_type and count by each exp_type and card_type
SELECT exp_type, card_type, COUNT(*) total, SUM(amount) total_amount
FROM CreditCardCSV
GROUP BY exp_type, card_type
ORDER BY exp_type, card_type

--Write SQL query which will output top 5 most frequent expense types 
SELECT TOP 5 exp_type, COUNT(*) total
FROM CreditCardCSV 
GROUP BY exp_type 
ORDER BY total DESC 

--Write query which will output top 5 average number of transactions ordered in DESC order grouped by city
SELECT TOP 5 city, AVG(amount) average 
FROM CreditCardCSV 
GROUP BY city 
ORDER BY average DESC

SELECT * FROM CreditCardCSV

SELECT exp_type, SUM(amount) sum_amount 
FROM CreditCardCSV 
GROUP BY exp_type 
ORDER BY sum_amount DESC

SELECT TOP 3 city, SUM(amount) sum_amount 
FROM CreditCardCSV 
GROUP BY city 
ORDER BY sum_amount

SELECT * FROM CreditCardCSV

SELECT card_type, COUNT(transaction_id) total_transactions, SUM(amount) total_amount 
FROM CreditCardCSV 
GROUP BY card_type

SELECT * FROM CreditCardCSV

SELECT exp_type, gender, AVG(amount) average_amount 
FROM CreditCardCSV
GROUP BY exp_type, gender

SELECT card_type,gender, SUM(amount) total_amount 
FROM CreditCardCSV 
GROUP BY card_type,gender
ORDER BY card_type, total_amount DESC

SELECT exp_type,city, AVG(amount) average 
FROM CreditCardCSV 
GROUP BY exp_type, city
ORDER BY average DESC

SELECT gender, COUNT(transaction_id) countA 
FROM CreditCardCSV 
GROUp BY gender
ORDER BY countA DESC

SELECT city, MAX(amount) maximum 
FROM CreditCardCSV 
GROUP BY city 
ORDER BY maximum DESC

SELECT card_type, exp_type, COUNT(*) TransactionCount, SUM(amount) TotalAmount
FROM CreditCardCSV 
GROUP BY card_type, exp_type
ORDER BY card_type, TotalAmount DESC

SELECT city, gender, SUM(amount) Maximum 
FROM CreditCardCSV 
GROUP BY city, gender 
ORDER BY Maximum DESC



SELECT exp_type, gender, COUNT(*) most_freq 
FROM CreditCardCSV 
GROUP BY exp_type, gender
ORDER BY most_freq DESC

--Identify the top 5 expense types by total spending in each city
WITH RankedExpenses AS (
    SELECT
        city,
        exp_type,
        SUM(amount) AS TotalSpent,
        RANK() OVER (PARTITION BY city ORDER BY SUM(amount) DESC) AS Rank22
    FROM
        CreditCardCSV
    GROUP BY
        city, exp_type
)
SELECT
    city,
    exp_type,
    TotalSpent
FROM
    RankedExpenses
WHERE
    Rank22 <= 5;



SELECT * FROM CreditCardCSV

--Write query which will print total spending by card_type, gender and grouped by card_type, gender 
SELECT card_type, gender, SUM(amount) TotalSpend 
FROM CreditCardCSV 
GROUP BY card_type, gender 
ORDER BY card_type, TotalSpend DESC

--Write SQL query which will output TOP 5 average transaction amount grouped by city and expense type 
SELECT TOP 5 city, exp_type, AVG(amount) AverageAmount 
FROM CreditCardCSV 
GROUP BY city, exp_type 
ORDER BY city, AverageAmount DESC

--Write SQL query which will count of transactions by expense type for each gender
SELECT exp_type, gender, COUNT(transaction_id) NumberOfTransactions 
FROM CreditCardCSV 
GROUP BY exp_type, gender 
ORDER BY NumberOfTransactions DESC

--Write query which will output highest spending transaction per city 
SELECT city, MAX(amount) HighestTransaction
FROM CreditCardCSV 
GROUP BY city 
ORDER BY HighestTransaction DESC

--Output transaction distrubution by card type and expense type
SELECT card_type, exp_type, COUNT(*) TransactionCount, SUM(amount) TotalAmount 
FROM CreditCardCSV 
GROUP BY card_type, exp_type 
ORDER BY card_type, TotalAmount DESC

    
--Output anomaly detection in daily Transactions
WITH DailyStats AS (
    SELECT
        city,
        transaction_date,
        SUM(amount) AS TotalDailySpending,
        AVG(amount) AS AverageSpending,
        STDEV(amount) AS StdDevSpending
    FROM
        CreditCardCSV
    GROUP BY
        city, transaction_date
)
SELECT
    city,
    transaction_date,
    TotalDailySpending,
    AverageSpending,
    StdDevSpending,
    CASE
        WHEN TotalDailySpending > (AverageSpending + 3 * StdDevSpending) THEN 'High Anomaly'
        WHEN TotalDailySpending < (AverageSpending - 3 * StdDevSpending) THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS AnomalyStatus
FROM
    DailyStats
ORDER BY
    city, transaction_date;

--Identity the most frequent expense type by gender
SELECT TOP 1 exp_type, gender, COUNT(*) Frequency
FROM CreditCardCSV 
GROUP BY exp_type, gender 
ORDER BY exp_type, Frequency DESC

    
--Write a SQL query which will find city with lowest percentage spend for platinum and gold card types
SELECT city, (GP_total / total) * 100 as perc 
FROM (
	SELECT city, SUM(CASE WHEN card_type IN ('Gold', 'Platinum') THEN amount END) GP_total, 
				SUM(amount) total 
	FROM CreditCardCSV 
	GROUP BY city
) m 
WHERE (GP_total/total)*100 IS NOT NULL 
ORDER BY perc DESC


--Write a query to print highest_exp_type and lowest_exp_type in each city
with m as 
(
select city, exp_type, sum(amount) as spend
from CreditCardCSV 
group by city, exp_type 
) , cte as 
(
select *,
dense_rank() over(partition by city order by spend desc) as highest_rank,
dense_rank() over(partition by city order by spend asc) as lowest_rank
from m 
)
select cte.city, 
(case when cte.highest_rank = 1 then cte.exp_type end) as highest_exp_type,
(case when cte1.lowest_rank = 1 then cte1.exp_type end) as lowest_exp_type
from cte join cte as cte1 on cte.city = cte1.city and cte.highest_rank = 1 and cte1.lowest_rank =1 
