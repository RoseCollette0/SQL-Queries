## LIMIT function as the name implies, filters only the requested number of rows. E.g LIMIT 3, will filter only the 3 top rows of the requested
## columns. It can be combined with the ORDER BY function to filter a more powerful result. E.g Filter the 3 oldest employees in the company.
					## ORDER BY must come before LIMIT
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

## This parameter filters for the two oldest employees after the first two on the age column.
## So basically, start at position 2, then take the next 2 rows after that position 2, i.e rows 3 and 4.
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 2
