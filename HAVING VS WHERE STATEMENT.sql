## HAVING only works for filtering aggregate function columns and only after a GROUP BY query runs. This means a GROUP BY instruction
## must come before a HAVING function filter. The GROUPING of columns happens first before an aggregate column can run.
											## while 
##the WHERE clause comes before the GROUP BY and filters columns 
## The aggregate function only occurs after the GROUP BY function has ran its column

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

## Using HAVING and WHERE clause in one query.
## Here the WHERE filters on the row level for anyone in the occupation column who is a manager but the HAVING now 
## filters WHERE particular row(s) in a column has a specific something but only the HAVING function can be used to achieve this.
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000

## Basically WHERE clauses cannot be used when filtering aggregate functions like AVG, SUM, MAX, MIN, COUNT but HAVING can. 
## HAVING is the WHERE clause of aggregrates.