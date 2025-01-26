SELECT * FROM employee_demographics;

## with group by, what should have looked like this, will now look like the next query;
SELECT gender
 FROM employee_demographics;
 
 ## Becomes this. It results into just the distinct infomation of what you h.ave grouped by.
 ## Note that if you are not performing an aggregate function; e.g AVG(...) then what's on the SELECT  must match what's 
 ## on the GROUP BY.
 SELECT gender
 FROM employee_demographics
 GROUP BY gender;
 
 ## Perform an aggregate fxn with the group by. Here, even though the GENDER in select fits whats on the group by, it wouldn't have
 ## mattered since the next column requested, is an aggregate fxn.
 SELECT gender, AVG(age)
 FROM employee_demographics
 GROUP BY gender;

## GROUP BY can also be performed using 2 columns. 
 ## Using one column to group 2 columns won't work. It's accurate but dependent on what is needed. Unless of course, it's an aggregate fxn.
 SELECT occupation, salary
 FROM employee_salary
 GROUP BY occupation, salary;
 
 ## Multiple aggregates can also be queried.
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
 FROM employee_demographics
 GROUP BY gender;

 

 
 
 
 