# SQL: A Primer
SQL is the leading language used to interact with Relational Databases like the ones used by most web sites. We will be using SQL as a way to QUERY existing data in our database and to INSERT new data to be saved for later.

## Getting Started
The first we need to do is decide on what database we are using. For now we will be using [SQLite3](https://www.sqlite.org/) as our database of choice. SQLite is an awesome and light weight database that powers nearly every iPhone app and is the default database for Rails.

Since we are using SQLite3, we can enter a sql prompt by typing `sqlite3` anywhere in the terminal.

If we want to *open* an existing sqlite database you simply state the path to the database we are attempting to open `sqlite3 my_store.sqlite3`
## Writing Queries
Once we have a sql prompt open, we can start to write queries against the data that we have. In our database we have a **table** called `products` and inside the `products` table we have the following **rows** of data. The **fields** of the `products` table are (`id`, `name`, `cost`, and `quantity`).

###products
| id |    name    |    cost  | quantity |
|--- | ----       | ----     |   ---    |
| 1  | Quadcopter | 199.99   | 10 | 
| 2  | Teleporter | 99999    | 1  |
| 3  | VR Headset | 250.00   | 20 |
| 4  | Motion Sensor | 50.00 | 99 |

### SYNTAX
###`SELECT desired_fields FROM table_name;`
The basics of any SQL query are to select the fields you want from a particular table.
_(Note the `;` semicolon at the end of the line. **Every** SQL statement must end with a semicolon)_

### Getting Everything
###`SELECT * FROM products;`
If we are simply looking for every product and every **column** then we can ask for `*` from `products`. In SQL `*` is considered a wildcard that says to return every field.

### Putting a LIMIT on How Much We Get Back
### `SELECT * FROM products LIMIT(1);`
If we are not concerned with getting back every record, but instead want a certain _amount_ of records. We can achieve that via the `LIMIT` function

### Starting with an OFFSET
### `SELECT * FROM products LIMIT(-1) OFFSET(5);`
If we need to start at a certain row and begin our query from there, we have this handy `OFFSET` function built in to do just that. See how `LIMIT` is being passed `-1`? That is because you cannot use `OFFSET` by itself in sqlite. Setting limit to -1 states that there is no limit.

### Only Getting Certain Fields
###`SELECT name, cost FROM products;`
If we do not need every single field from table it is better to ask for the fields we need explicitly. Notice that they are comma separated.

### Maintaining ORDER with Results
###`SELECT * FROM products ORDER BY name;`
When we need our results in a particular order, we have the `ORDER BY` keyword to let us supply which field they should be sorted by. This will make the results alphabetical is the type of the field specified is a string or numerically if it is an int.


### Limiting The Results with WHERE
###`SELECT * FROM products WHERE quantity > 15;`
###`SELECT name FROM products WHERE quantity > 0 AND cost < 200.00;`
###`SELECT * FROM products WHERE name = 'Quadcopter' || name = 'Duecopter';`
Sooner than later we are going to want only specific records from our database. Using `WHERE` we can place a **boolean statement** to the end of our query to filter what rows we receive back.
We can also chain multiple boolean statements together through the use of the `AND` and `OR` keywords. They are functionally equivalent to `&&` and `||`.

### Other Useful Functions
- `COUNT`
- `SUM`
- `AVG`
- `MAX`
- `MIN`
- `LENGTH`
- `LOWER`
- `UPPER`
- `RANDOM`
- `REPLACE` _(Think of it as gsub)_
- `TRIM`
