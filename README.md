# SQL-from-scratch
A beginner-to-advanced SQL learning journey with clean examples, clear explanations, and real-world use cases. Ideal for learners, interview prep, and refreshing SQL concepts! Let's go.

SQL Lessons From Scratch:-

Welcome to my structured SQL learning journey where I built one concept at a time, explained as simply as possible.

Whether you're starting from scratch or brushing up for data roles, this repo offers:
  > Clean `.sql` scripts with comments  
  > Real-world inspired datasets  
  > Use cases explained in plain English  
  > Markdown guides for every major topic  
  > LinkedIn-friendly formats (great for sharing + teaching others)

-----------------------------------------------------------------------------------------------

### What's Inside?

    ________________________________________________________________________________________
    | Topics              | What You'll Learn                                              |
    |---------------------|----------------------------------------------------------------|
    | Joins               | INNER, LEFT, RIGHT, FULL, and CROSS joins — with Venn visuals  |
    | Window Functions    | ROW_NUMBER, RANK, LAG/LEAD, Moving Averages                    |
    | Subqueries          | Correlated vs Uncorrelated, `EXISTS`, `IN`, `NOT IN`           |
    | Aggregations        | `GROUP BY`, `HAVING`, multi-level summaries                    |
    | A/B Testing SQL     | Test/control setup, conversions, and metrics                   |
    | Datasets            | Sample `customers`, `orders`, and more for hands-on practice   |

-----------------------------------------------------------------------------------------------

### How to Use

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

-- LEFT JOIN
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
```
__________________________________________________________________
## Lecture 2: Lecture 2: Deep Dive into JOINs with a Practical Example
__________________________________________________________________

### Welcome back  

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

#### Table 2: `orders`

| order_id | customer_id  | product     |
|----------|--------------|-------------|
| 101      | 1            | Laptop      |
| 102      | 2            | Headphones  |
| 103      | 4            | Keyboard    |

_**Note:** Refer the `dummy01.sql` to create the dataset & practice._

Here’s what’s happening:
- Alice and Bob are customers who placed orders.  
- Charlie is a customer who hasn't placed any order.  
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


  Look forward to more!
==========** Thank You **==========
