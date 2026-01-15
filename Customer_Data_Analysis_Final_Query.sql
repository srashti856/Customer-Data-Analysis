SELECT * FROM project_customer_segmentation.customer;
select* from customer;
SELECT COUNT(*) FROM customer;

#Dataset Size 
SELECT COUNT(*) AS total_records
FROM customer;

# Unique Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customer;

#NULL Value Check 
SELECT
    SUM(age IS NULL) AS age_nulls,
    SUM(quantity IS NULL) AS quantity_nulls,
    SUM(price IS NULL) AS price_nulls
FROM customer;

#Invalid (Zero / Negative) Value Check
SELECT
    SUM(age <= 0) AS invalid_age,
    SUM(quantity <= 0) AS invalid_quantity,
    SUM(price <= 0) AS invalid_price
FROM customer;




SELECT
    invoice_no,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price,
    payment_method,
    invoice_date,
    shopping_mall
FROM customer
WHERE age IS NOT NULL
  AND quantity IS NOT NULL
  AND price IS NOT NULL
  AND age > 0
  AND quantity > 0
  AND price > 0;
  
# Shopping Distribution According To Gender
SELECT gender,
COUNT(DISTINCT customer_id) AS total_customers
FROM customer
GROUP BY gender
ORDER BY total_customers DESC;
  
  
 # Which gender did we sell more products to?
SELECT gender,
SUM(quantity) AS total_products_sold
FROM customer
GROUP BY gender
ORDER BY total_products_sold DESC;



# Which gender generated more revenue?

SELECT gender,
SUM(quantity * price) AS revenue
FROM customer
GROUP BY gender
ORDER BY revenue DESC;

# Distribution of purchase categories relative to other columns?
SELECT category,
SUM(quantity) AS total_quantity
FROM customer
GROUP BY category
ORDER BY total_quantity DESC;



# Shopping Distribution Accroding To Age
SELECT age,
COUNT(DISTINCT customer_id) AS total_customers
FROM customer
GROUP BY age
ORDER BY total_customers DESC;

# Shopping Distribution Accroding To Age GROUP
SELECT
CASE
  WHEN age BETWEEN 18 AND 25 THEN '18-25'
  WHEN age BETWEEN 26 AND 35 THEN '26-35'
  WHEN age BETWEEN 36 AND 45 THEN '36-45'
  WHEN age BETWEEN 46 AND 60 THEN '46-60'
  ELSE '60+'
END AS age_group,
COUNT(DISTINCT customer_id) AS total_customers
FROM customer
GROUP BY age_group
ORDER BY total_customers DESC;


# Which age group did we sell more products to?
select age,
sum(quantity) as quantity
from customer 
group by age
order by age desc;



SELECT
  CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    WHEN age > 60 THEN '60+'
  END AS age_group,
  SUM(quantity) AS total_products_sold
FROM customer
GROUP BY age_group
ORDER BY total_products_sold DESC;

# Which Age Groups Generated More Revenue
select age,
sum(quantity*price) as revenue
from customer
group by age
order by age desc;

SELECT
  CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    WHEN age > 60 THEN '60+'
  END AS age_group,
  SUM(quantity*price) as revenue
FROM customer
GROUP BY age_group
ORDER BY revenue DESC;

# Purchase Category Related To Other Columns 
# Category vs Gender
select category,gender,
sum(quantity*price) as revenue,
sum(quantity) as quantity
from customer
group by category,gender
order by category, revenue desc;


# Category vs Age Group
SELECT
  CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
  END AS age_group,
  category,
  SUM(quantity * price) AS revenue
FROM customer
GROUP BY age_group, category
ORDER BY category,revenue DESC;


# Category vs Payment Method
SELECT
  category,
  payment_method,
  SUM(quantity) AS total_quantity
FROM customer
GROUP BY category, payment_method
ORDER BY total_quantity DESC;


select category,payment_method,
sum(quantity*price) as revenue
from customer
group by category,payment_method
order by category,revenue  desc;

# Category vs Shopping Mall
SELECT
  shopping_mall,
  category,
  SUM(quantity) AS total_quantity
FROM customer
GROUP BY shopping_mall, category
ORDER BY total_quantity DESC;


# Payment Method Relation To Other Columns
# Payment Method vs Gender
SELECT
  payment_method,
  gender,
  COUNT(DISTINCT customer_id) AS total_customers
FROM customer
GROUP BY payment_method, gender
ORDER BY payment_method;


# Payment Method vs Age group
SELECT
  payment_method,
  CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
  END AS age_group,
 sum(quantity) AS total_quantity
FROM customer
GROUP BY payment_method, age_group
ORDER BY payment_method;


#Payment Method vs Category
SELECT
  payment_method,
  category,
  SUM(quantity) AS total_quantity
FROM customer
GROUP BY payment_method, category
ORDER BY total_quantity DESC;

#Payment Method vs Revenue
SELECT
  payment_method,
  SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY payment_method
ORDER BY total_revenue DESC;



# Distribution Of Payment Method
#Transaction-wise

SELECT
  payment_method,
  COUNT(*) AS total_transactions
FROM customer
GROUP BY payment_method
ORDER BY total_transactions DESC;

#Quantity-wise
SELECT
  payment_method,
  SUM(quantity) AS total_quantity
FROM customer
GROUP BY payment_method
ORDER BY total_quantity DESC;



# Top Customer By Revenue
select customer_id,
sum(quantity*price) as revenue
from customer
group by customer_id
order by customer_id;



# Top Category By Revenue Within Each Mall
select shopping_mall,category,
sum(quantity*price) as revenue
from customer
group by shopping_mall,category
order by shopping_mall,revenue;



# Mall-Wise Revenue
select shopping_mall,
sum(quantity*price) as revenue
from customer
group by shopping_mall
order by revenue;

# Monthly Revenue Trend
select invoice_date,
sum(price),sum(quantity)
from customer
group by invoice_date
order by invoice_date;

