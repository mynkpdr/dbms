
## Question 1
Q001flisdb: Write a SQL statement to find the names of teams that have played more than 3 matches.[Database: FLIS] flisdb:

### Solution:
```SQL
select name
from teams as t
inner join matches as m
on t.team_id = m.host_team_id
or t.team_id = m.guest_team_id
group by t.name
having count(*) > 3
```

## Question 2
Q001lisdb:Write an SQL statement to find the first name, last name of the faculty of the department having department code as 'ME' and who have issued at least one book, such that there are no duplicate firstname-lastname pairs.[Database: LIS] lisdb:

### Solution:
```SQL
select distinct faculty_fname, faculty_lname
from faculty natural join members natural join book_issue
where faculty.department_code = 'ME'
```
## Question 3
Q001lisdb:Write an SQL statement to find the number of book-titles issued on 11th August 2021.[Database: LIS] lisdb:

### Solution:
```SQL
select count(title) from book_catalogue where isbn_no in
  (select isbn_no
  from book_issue a, book_copies b
  where a.accession_no=b.accession_no and
  a.doi='2021-08-11'
  )
```
## Question 4
Q001lisdb:Write a SQL statement to find the names of faculty (faculty_fname, faculty_lname) who did not issue any book.[Database: LIS] lisdb:

### Solution:
```SQL
select faculty_fname, faculty_lname
from faculty
where faculty.id not in
(select members.id from members natural join book_issue
where members.id is not null)
```
## Question 5
Q001lisdb: Write a SQL statement to find the unique book titles which are issued to 'PG' students but not to 'UG' students .[Database: LIS] lisdb:

### Solution:
```SQL
select distinct(title) from
  book_catalogue natural join book_copies natural join
  book_issue natural join members
  where member_type = 'PG'
except
select distinct(title) from
  book_catalogue natural join book_copies natural join
  book_issue natural join members
  where member_type = 'UG'
```
