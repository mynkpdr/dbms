
## Question 1
Q002flisdb: Write an SQL statement to find the name of those managers who became managers after the year '2020'.[Database: FLIS] flisdb:

### Solution:
```SQL
SELECT name
FROM managers
WHERE since > '2020-12-31'
```

## Question 2
Q001flisdb: Write an SQL statement to find the colors of the home-jersey and the away-jersey (jersey_home_color, jersey_away_color) used by the team: 'All Stars'.[Database: FLIS] flisdb:

### Solution:
```SQL
select jersey_home_color, jersey_away_color
from teams
where name = 'All Stars'
```
## Question 3
Q001flisdb: Write an SQL statement to find the names of players of the team: 'All Stars'.[Database: FLIS] flisdb:

### Solution:
```SQL
select p.name
from players p, teams t
where p.team_id = t.team_id and t.name = 'All Stars'
```
## Question 4
Q002lisdb: Write an SQL statement to find the first names and the roll number (student_fname, roll_no) of students who belong to the department with department code as 'CS' and who were born after '2002-06-15'.[Database: LIS] lisdb:

### Solution:
```SQL
select student_fname, roll_no
from students
where department_code = 'CS' and dob > '2002-06-15'
```
## Question 5
Q002lisdb: Write an SQL statement to find the last names (faculty_lname) of female faculty who belong to the department: 'Mechanical Engineering'.[Database: LIS] lisdb:

### Solution:
```SQL
SELECT f.faculty_lname
FROM faculty f
JOIN departments d ON f.department_code = d.department_code
WHERE d.department_name = 'Mechanical Engineering'
AND f.gender = 'F'
```