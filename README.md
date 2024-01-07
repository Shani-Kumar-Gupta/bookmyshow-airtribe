# Problem Solving Case: Bookmyshow

## Objective and Project Description:

Bookmyshow is a ticketing platform where you can book tickets for a movie show. The image attached represents that for a given theatre we can see the next 7 dates. As one chooses the date, we get list of all shows running in that theatre along with the show timings.

TASK 1 - As part of this assignment, we need to list down all the entities, their attributes and the table structures for the scenario mentioned in the previous slide. You also need to write the SQL queries required to create these tables along with few sample entries. Ensure the tables follow 1NF, 2NF, 3NF and BCNF rules.

TASK 2 - Write a query to list down all the shows on a given date at a given theatre along with their respective show timings. 

## Identify the Entity for the problem case:

As per the problem statement analysis, we required the below entities to cater to the above-mentioned functionality-
```bash
  1. users
  2. theatres
  3. movies
  4. shows
```

## Identify the relationship b/w the entities mentioned above:

1. theatres vs movies:
   <br>1 Theatre can multiple Movies to run: (1:M)
   <br>1 Movie can run in multiple Theatre: (1:M)
   
   ```bash
     Final Relationship b/w Theatres vs. Movies: (M:M)
   ```

2. movies vs shows:
   <br>1 Movie can have multiple shows: (1:M)
   <br>1 Show can only run one Movie: (1:1)
   
   ```bash
     Final Relationship b/w Movies vs. Shows: (1:M)
   ```

3. theatres vs shows:
   <br>1 Theatre can have multiple shows: (1:M)
   <br>1 Show can run on multiple Theatres: (1:M)
   
   ```bash
     Final Relationship b/w Theatres vs. Shows: (M:M)
   ```
