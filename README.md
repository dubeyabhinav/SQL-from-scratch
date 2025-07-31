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

### Summary 01

In this lecture, we explored two fundamental SQL joins used to combine rows from multiple tables:

+**`INNER JOIN`:** Retrieves only those rows that have matching values in both tables. Useful when we only care about related records (e.g., customers who have placed orders).
+ **`LEFT JOIN`:** Returns all rows from the left table, along with matched rows from the right table. If no match exists, NULL is shown for right table columns. This allows us to include all customers, even those without orders.

We applied these concepts using the customers and orders tables from our dummy01 dataset to better understand how data behaves when joined with or without matches.

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
## Lecture 2: Lecture 3: `RIGHT JOIN` and the Elusive `FULL OUTER JOIN`
__________________________________________________________________

SQL gives us multiple ways to combine tables, but some joins don't get as much spotlight. In this lecture, we're covering two such joins: `RIGHT JOIN` and `FULL OUTER JOIN`. One is rarely used, and the other is rarely supported but both are powerful.

###  1. The `RIGHT JOIN`: Flipping the Perspective

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

#### Why `RIGHT JOIN` is Rarely Used?
  1. Most of the time, data is written or designed with the primary or important table on the left. So, developers naturally use `LEFT JOIN` and get what they want.

  2. A `RIGHT JOIN` can always be rewritten as a `LEFT JOIN` by swapping the table order. Because of that, it often goes unused.

But when you're reading legacy code or need to prioritize the second table, `RIGHT JOIN` still has its place.

### 2. `FULL OUTER JOIN` — The Overlooked Join

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

### Summary 03

In this lecture, we learned how to retrieve data even when relationships between two tables are not complete. We focused on:

+ **RIGHT JOIN:** Returns all rows from the right table and the matching rows from the left table. When no match is found on the left, the result shows NULL for left table columns.
+ **FULL OUTER JOIN** (simulated)**:** SQL does not support FULL OUTER JOIN in all databases, so we simulated it by combining a LEFT JOIN and a RIGHT JOIN using UNION. This helps bring together:
    * All matched records
    * All unmatched records from the left table
    * All unmatched records from the right table


We used the dummy01 dataset (customers and orders) to demonstrate:
- Customers who placed orders (matched)
- Customers with no orders (unmatched left)
- Orders with no customer record (unmatched right)

This lecture helped us understand how to work with incomplete or mismatched data when combining tables.




In the next lecture, we'll look at filtering results using WHERE — an essential step toward data cleaning and targeted queries.


__________________________________________________________________
## Lecture 4: Exploring `GROUP BY` and `HAVING` in SQL
__________________________________________________________________

Welcome to lecture 4! Glad you made it this far! 

In the previous lectures, we explored how we can connect data from different tables using joins and retrieve specific details. Now that we have a solid understanding of how rows relate to each other, it is time to understand how to analyze groups of data rather than looking at them row by row.

Today we will focus on two powerful tools in SQL: `GROUP BY` and `HAVING`. These are used when we want to group rows that have the same values in one or more columns and then perform operations on these groups, like counting or summing.

### The Concept of `GROUP BY`

Imagine you have a list of orders made by customers. Some customers may have made more than one order. What if you wanted to know how many orders each customer made? Or which customer bought the most products?

This is where GROUP BY comes in. It groups rows based on the values in a particular column or set of columns.

**For example:**

* If we group by `customer_id`, all orders made by the same customer will be treated as one group.
* We can then apply aggregate functions like `COUNT()`, `SUM()`, or `AVG()` to get summary stats per customer.

### The Role of `HAVING`

`WHERE` is used to filter rows before grouping, but what if we want to filter groups after the grouping is done? That’s where `HAVING` helps. It filters the grouped results.

For example:

* If you want to see only those customers who made more than 1 order.
* You cannot use `WHERE` with `COUNT()`, but you can use `HAVING` with it.


Now that we have seen what they do, it's time see how they do it taking some simple examples using the _dummy01_ dataset.
We have two tables: _'customers'_ and _'orders'_. The orders table contains _order_id_, _customer_id_, and _product_.

**Example 1:** Count how many orders each customer made

```sql
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;
```

This groups all orders by customer and counts how many times each customer appears, as you can see in the output. 

**Output:**

<img width="407" height="176" alt="image" src="https://github.com/user-attachments/assets/f43f0295-02c0-4119-b3c8-6af491b768bf" />

**Example 2:** Show only those customers who made more than one order

```sql
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
```
Here, we first group orders by customer and then filter the result to show only those customers who made more than one order. `HAVING` is used after the grouping step which does the filtering.

**Output:**

<img width="396" height="207" alt="image" src="https://github.com/user-attachments/assets/bd767f72-69a9-4e1e-bf72-934251a1f70c" />

**Example 3:** Count number of products each customer ordered

```sql
SELECT customer_id, COUNT(DISTINCT product) AS unique_products
FROM orders
GROUP BY customer_id;
```

This query tells us how many different products each customer ordered.

**Output:**

<img width="345" height="199" alt="image" src="https://github.com/user-attachments/assets/a1cb7efc-3211-4cf3-bd24-f20f4a16fbb4" />

Here, `DISTINCT` ensures that only disctinct products are counted for each _customer_id_. So all the cstomers have ordered 2 distinct items. Note that this does not count the order frequency.

### Edge Cases & Common Pitfalls

**Edge Cases:**

1. Groups with `NULL` values: When grouping columns contain `NULL`s, all `NULL`s are treated as a single group. This can affect counts and aggregates if not handled intentionally.
2. Empty groups after filtering: Using `HAVING` might exclude all groups, resulting in an empty result set, which can be confusing if unexpected.
3. `COUNT(DISTINCT ...)` nuances: Counting distinct values counts unique entries only, which may differ significantly from total counts and affect analysis.

**Common Pitfalls:**

1. Using WHERE to filter on aggregated values: WHERE cannot filter on aggregate functions like `COUNT` or `SUM`; `HAVING` must be used instead.
2. Forgetting to include all non-aggregated columns in `GROUP BY`: All selected columns that are not aggregated must appear in GROUP BY; ignoring this leads to errors or unintended results.
3. Misunderstanding the order of execution: `HAVING` filters after groups are formed; WHERE filters rows before grouping—mixing these up leads to wrong filtering behavior.


### Summary 04

+ Use `GROUP BY` when you want to perform calculations across sets of rows that share the same value.
+ Use aggregate functions like `COUNT`, `SUM`, `AVG`, etc. with it.
+ Use `HAVING` to filter groups based on conditions.

That’s all for Lecture 4. Practice these examples with your `dummy01` dataset and try modifying the queries a bit to explore further.

__________________________________________________________________
## Lecture 5: Subqueries & Derived Tables
__________________________________________________________________


Welcome to lecture 5! Glad to see you keep up. That's some good dicipline you have there, much appreciated. Now, let's begin.

### Why Subqueries and Derived Tables?

As SQL tasks become more complex, you often need to answer questions that involve intermediate logic—like filtering based on calculated averages or building queries on top of other queries.
Subqueries and derived tables let you:

- Re-use logic with minimal code duplication
- Dynamically filter data based on summary results
- Make your queries modular and easier to debug

### Example Tables & Data

We use these three tables in the _'dummy02-student-enrollment'_ dataset:
Overview of tables:
- students (student_id, student_name, major)
- courses (course_id, course_name, department)
- enrollments (enrollment_id, student_id, course_id, grade)



#### Example 1: Find all Computer Science majors who took courses with above-average class performance.

_Step 1:_ Subquery in `WHERE`

First, let’s find the average grade by course.

```sql
SELECT course_id, AVG(grade) AS avg_grade
FROM enrollments
GROUP BY course_id;
```

**Output:**
<img width="267" height="182" alt="image" src="https://github.com/user-attachments/assets/46893763-13bd-47c5-a1e9-4ee8cf217acd" />


Now, to get IDs of courses where the average grade is greater than `80`:

```sql
SELECT course_id
FROM enrollments
GROUP BY course_id
HAVING AVG(grade) > 80;
```

**Output:**
<img width="127" height="214" alt="image" src="https://github.com/user-attachments/assets/36cfaba9-5c80-4549-a354-8d890dbabe62" />


We use this as a subquery in our WHERE clause:

```sql
SELECT s.student_id, s.student_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE s.major = 'Computer Science'
  AND e.course_id IN (
      SELECT course_id
      FROM enrollments
      GROUP BY course_id
      HAVING AVG(grade) > 80
  );
```

**Output:**
<img width="247" height="226" alt="image" src="https://github.com/user-attachments/assets/bfb9d6ad-7723-40f0-83e5-b9fe23cdbae8" />

  **What Happened?**
  
  - The inner subquery finds courses with class average over 80.
  - The outer query matches Computer Science students who took any such course.

_Step 2:_ Derived Table (Inline View) in `FROM`

Suppose now you want to list, for each Computer Science major, the courses they took (and their grades) only in _high-performing_ courses.

We use a derived table for the high-average courses and join:

```sql
SELECT s.student_id, s.student_name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN (
    SELECT course_id
    FROM enrollments
    GROUP BY course_id
    HAVING AVG(grade) > 80
) high_avg_courses
    ON e.course_id = high_avg_courses.course_id
WHERE s.major = 'Computer Science';
```

_Key Points_

- The subquery in the FROM clause creates a temporary results table (high_avg_courses).
- The main query joins everything together, focusing on Computer Science majors only.

### Subqueries in `SELECT`, `FROM`, `WHERE` — Comparison

| Use Case      | Example Location | Typical Output            |
|---------------|-----------------|----------------------------|
| Filtering     | WHERE/IN        | Scalar or list of values   |
| Derived Table | FROM            | Result set as a table      |
| Computation   | SELECT          | Single value per row       |

### Edge Cases & Common Pitfalls

**Edge Cases:**
- If a course has only one enrollment (or all low grades), it might never appear for the >80 cutoff. Always check for empty matches.
- If a student takes multiple “high-performance” courses, results may have duplicate student rows.

**Common Mistakes:**
- Mixing WHERE and HAVING: Remember, HAVING is for filters after aggregation, WHERE is for row-level filtering before grouping.
- Not grouping properly in the subquery: You must group by course_id in subqueries analyzing aggregate data per course.

### Practice

Try these on your own:

- A. Find all Biology majors enrolled in at least two courses where their grade was above the class average for that course.
- B. List each major with the number of high-performing courses (average >82) that at least one of their students has taken.

### Summary 05

- _Subqueries:_ Powerful for filtering and calculated logic in SELECT/WHERE.
- _Derived Tables:_ Temporary tables created in the FROM clause to enable multi-step logic in a single query.
- _Best Practices:_ Always clarify what is being grouped and filtered, and test for edge cases in your data.
- Both techniques will improve your SQL analysis skills and help you solve real-world problems efficiently.



Practice more on our own dataset
> Coming up next:
> "CASE WHEN and Conditional Aggregation" (applying conditionals in aggregation).




For any fedback connect me. Unil I upgrade it again!


==========< **Thank You** >==========
