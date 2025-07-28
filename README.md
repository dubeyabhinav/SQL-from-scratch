<img width="698" height="264" alt="image" src="https://github.com/user-attachments/assets/3aa78a78-3775-4b5d-a9de-6dfb61d2b332" /># SQL-from-scratch
A beginner-to-advanced SQL learning journey with clean examples, clear explanations, and real-world use cases. Ideal for learners, interview prep, and refreshing SQL concepts! Let's go.

SQL Lessons From Scratch:-

Welcome to my structured SQL learning journey where I built one concept at a time, explained as simply as possible.

Whether you're starting from scratch or brushing up for data roles, this repo offers:
  > Clean `.sql` scripts with comments  
  > Real-world inspired datasets  
  > Use cases explained in plain English  
  > Markdown guides for every major topic  
  > LinkedIn-friendly formats (great for sharing + teaching others)

-------------------------------------------------------------------------------------------

### What's Inside?

| **Topics**          | **What You'll Learn**                                          |
|---------------------|----------------------------------------------------------------|
| Joins               | INNER, LEFT, RIGHT, FULL, and CROSS joins — with Venn visuals  |
| Window Functions    | ROW_NUMBER, RANK, LAG/LEAD, Moving Averages                    |
| Subqueries          | Correlated vs Uncorrelated, `EXISTS`, `IN`, `NOT IN`           |
| Aggregations        | `GROUP BY`, `HAVING`, multi-level summaries                    |
| A/B Testing SQL     | Test/control setup, conversions, and metrics                   |
| Datasets            | Sample `customers`, `orders`, and more for hands-on practice   |

-----------------------------------------------------------------------------------------------

### How to Use?

1. Read the accompanying `README.md`.
2. Run the `.sql` scripts on your local SQL engine or an online sandbox (e.g., [https://sqliteonline.com/](https://sqliteonline.com/))
3. Try editing the queries, tweak conditions, switch tables, break stuff to learn!
4. ⭐️ Star this repo if it helps you and feel free to fork it to build your own SQL journal!
5. Connect for datasets or other help.

-----------------------------------------------------------------------------------------------

### Why did I build this?

As a data and business analyst in the making, I'm using this repository to:
  - Practice SQL daily
  - Explain concepts in simple, visual ways
  - Share my learnings publicly via LinkedIn
  - Help others learn SQL with real structure and fewer buzzwords

If you're on the same path — feel free to clone, learn, and connect with me!  
  🔗 [LinkedIn](https://www.linkedin.com/in/abhinav-dubey-b713b2214/)
  📩 [abhinavvv.dubey@gmail.com]

-----------------------------------------------------------------------------------------------

### Coming Soon...

- Common SQL interview questions + answers  
- SQL case studies (sales, marketing, e-commerce)  
- Interactive dashboards connected to SQL queries (Power BI / Jupyter notebooks)
- And many more.

__________________________________________________________________
## **Lesson 1: `INNER JOIN` vs `LEFT JOIN`**
__________________________________________________________________

### Concept Overview
- **INNER JOIN**: Returns only rows where there’s a match in both tables.
- **LEFT JOIN**: Returns all rows from the left table, and matches (if any) from the right table.

### Use Case/Example-
  Imagine you want to see all customers who have made orders (INNER), or all customers with or without orders (LEFT).

### Queries Covered

```sql
-- INNER JOIN
SELECT c.customer_name, o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
```
```
-- LEFT JOIN
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
```
__________________________________________________________________
## Lecture 2: Lecture 2: Deep Dive into JOINs with a Practical Example
__________________________________________________________________

### Welcome back!

In the previous lecture, we got introduced to the idea of combining data from two tables using `INNER JOIN` and `LEFT JOIN`.  
We talked about why joins are useful because in most databases, data is split across tables for better organization.  

In this lecture, let's take a simple and relatable example to explore how these joins work step by step.

### Example: Customers and Orders in an Online Store  

Imagine you're running a basic e-commerce site. You have two tables:

#### Table 1: `customers`

| customer_id | name     |
|-------------|----------|
| 1           | Alice    |
| 2           | Bob      |
| 3           | Charlie  |
| :           |  :       |


#### Table 2: `orders`

| order_id | customer_id  | product     |
|----------|--------------|-------------|
| 101      | 1            | Laptop      |
| 102      | 2            | Headphones  |
| 103      | 3            | Keyboard    |
| :        |  :           |     :       |


_**Note:** Refer the `dummy01.sql` to create the dataset & practice._

Here’s what’s happening:
- Alice and Bob are customers who placed orders.  
- Diana is a customer who hasn't placed any order.  
- Order ID 103 is linked to a customer ID that doesn't exist in the `customers` table.

### `INNER JOIN` in Action  

Let's use `INNER JOIN` to see which customers have placed orders.  

```sql
SELECT c.name, o.product
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
```
**Output:**

<img width="460" height="149" alt="image" src="https://github.com/user-attachments/assets/074b14fd-3070-4079-b3f4-da114dff9cb2" />


### `LEFT JOIN` in Action
Now let’s say you want to see all customers, even those who didn’t place any orders.
This is where LEFT JOIN helps.

```sql
SELECT c.name, o.product
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
```
**Output:**

<img width="484" height="207" alt="image" src="https://github.com/user-attachments/assets/3df45da2-9c21-4230-9c6b-546ed595e0ee" />

### Why this matters?

Using just two types of joins, we already have the ability to:

> Find which customers placed orders
> Find customers who didn’t place any orders
> Avoid mismatches like orders without real customers
> This becomes even more powerful when working with 3 or more related tables.

### Summary 02

| What you want to find                            | What to use? |
| ------------------------------------------------ | ------------ |
| Customers who placed orders                      | `INNER JOIN` |
| All customers, whether or not they placed orders | `LEFT JOIN`  |

__________________________________________________________________
## Lecture 2: Lecture 3: RIGHT JOIN and the Elusive FULL OUTER JOIN
__________________________________________________________________

SQL gives us multiple ways to combine tables, but some joins don't get as much spotlight. In this lecture, we're covering two such joins: `RIGHT JOIN` and `FULL OUTER JOIN`. One is rarely used, and the other is rarely supported but both are powerful.

###  1. The RIGHT JOIN: Flipping the Perspective

A `RIGHT JOIN` works just like a `LEFT JOIN` but in reverse. Instead of keeping all rows from the left table, it keeps all rows from the right table and matches from the left wherever possible.

This is useful when your main focus is on the second table in the query.

```sql
SELECT c.customer_id, c.name, o.order_id, o.product
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;
```

This query lists all orders, even if they don't belong to any customer in our customers table.

In our dataset:
- Orders like 116, 117, 118, and 121 have customer_ids that don’t exist in the customers table
- Still, they appear in the result, with the customer fields shown as NULL
<img width="632" height="300" alt="image" src="https://github.com/user-attachments/assets/ce4ffcc9-8bd3-4079-bbad-15285198aed1" />

As you can see it includes entries even if the `custoer_id` is null or a produst ordered by an unknown custome.

#### Why RIGHT JOIN is Rarely Used?
  1. Most of the time, data is written or designed with the primary or important table on the left. So, developers naturally use `LEFT JOIN` and get what they want.

  2. A `RIGHT JOIN` can always be rewritten as a `LEFT JOIN` by swapping the table order. Because of that, it often goes unused.

But when you're reading legacy code or need to prioritize the second table, `RIGHT JOIN` still has its place.

### 2. FULL OUTER JOIN — The Overlooked Join

#### Why is it not so popular?
`FULL OUTER JOIN` gives you everything — matching rows plus all unmatched rows from both tables. It's very useful but not supported in some database systems like **MySQL**, which is why it's often skipped or replaced with a workaround.

Databases like PostgreSQL or SQL Server support it directly, but in **MySQL**, you’ll have to simulate it using `UNION`.

Let's put it to use and see. Our example dataset will remain `dummy01`

**What are we trying to do?**

We want to:

* Get a list of all customers and all orders
* Match them where possible
* Still include customers who never ordered
* And orders that do not match any customer

```sql
SELECT c.customer_id, c.name, o.order_id, o.product
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.name, o.order_id, o.product
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;
```
This query combines the result of a `LEFT JOIN` (all customers and their orders, if any) and a `RIGHT JOIN` (all orders and their customers, if any). The `UNION` helps remove duplicates and simulate a `FULL OUTER JOIN`.

**Output:**
<img width="698" height="264" alt="image" src="https://github.com/user-attachments/assets/b770fca8-1085-4800-85cf-bf6737364940" />

+ You'll see customers like `'4'`, `'7'`, `'9'`, etc., who didn’t place any orders.
+ You'll also find orders like `'116'`, `'117'`, `'118'`, and `'121'` that don't belong to any customer.
+ Run your own code to observe more clearly.

#### Takeaway
While FULL OUTER JOIN is powerful, it’s not always directly available. Understanding how to simulate it helps when working with systems like MySQL.

In the next lecture, we'll look at filtering results using WHERE — an essential step toward data cleaning and targeted queries.



 Look forward to more!
  
==========> **Thank You** <==========
