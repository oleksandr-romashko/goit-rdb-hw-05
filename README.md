# Relational Databases. Concepts and Techniques

### [# goit-rdb-hw-05](https://github.com/topics/goit-rdb-hw-05)

<p align="center">
  <img align="center" src="./assets/thumbnail.jpg" width="300" title="Project thumbnail" alt="project thumbnail">
</p>


## Nested SQL queries, functions, procedures, variables, and loops in SQL.

### Assignment Description

1. Write an SQL query that will display the `order_details` table and the `customer_id` field from the `orders` table corresponding to each record in the `order_details` table.
This should be done using a nested query in the `SELECT` statement.

2. Write an SQL query that will display the `order_details` table. Filter the results so that the corresponding record from the `orders` table meets the condition `shipper_id = 3`.
This should be done using a nested query in the `WHERE` operator.

3. Write an SQL query, nested in the `FROM` operator, that will select rows with the condition `quantity > 10` from the `order_details` table. For the obtained data, find the average value of the `quantity` field — grouping should be done by `order_id`.

4. Solve task 3 above using the `WITH` operator to create a temporary table `temp`. If your version of MySQL is earlier than 8.0, create this query similarly to how it is done in the lecture notes.

5. Create a function with two parameters that will divide the first parameter by the second. Both parameters and the return value should be of type `FLOAT`.
Use the `DROP FUNCTION IF EXISTS` construct. Apply the function to the `quantity` attribute of the `order_details` table. The second parameter can be any number of your choice.

### Solution

Solutions are represented in [homework](./homework/) folder:

1. Part 1: solution for this task part is placed in [homework/p1](./homework/p1) folder.
2. Part 2: solution for this task part is placed in [homework/p2](./homework/p2) folder.
3. Part 3: solution for this task part is placed in [homework/p3](./homework/p3) folder.
4. Part 4: solution for this task part is placed in [homework/p4](./homework/p4) folder.
5. Part 5: solution for this task part is placed in [homework/p5](./homework/p5) folder.
