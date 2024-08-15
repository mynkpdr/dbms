
## Question 1
Q003flisdb: Write an SQL statement to find the match number of the match held on '2020-05-21' and the name of the fourth referee who refereed that match. Print match_num first, followed by respective fourth referee name. Note: fourth referee is to be obtained from the 'fourth_referee' attribute.[Database: FLIS] flisdb:

### Solution:
```SQL
SELECT 
    m.match_num, 
    r.name AS fourth_referee_name
FROM 
    matches m
JOIN 
    match_referees mr ON m.match_num = mr.match_num
JOIN 
    referees r ON mr.fourth_referee = r.referee_id
WHERE 
    m.match_date = '2020-05-21'

```

## Question 2
Q005flisdb: Write an SQL statement to find the name and date of birth of the youngest player in the team named 'Arawali'.[Database: FLIS] flisdb:

### Solution:
```SQL
SELECT players.name, players.dob
FROM players
INNER JOIN teams ON players.team_id = teams.team_id
WHERE teams.name = 'Arawali'
ORDER BY players.dob DESC
LIMIT 1
```
## Question 3
Q003flisdb: Write an SQL statement to find the name and dob of the players who belongs from the team names 'Amigos' or 'Black Eagles'. flisdb:

### Solution:
```SQL
SELECT players.name, players.dob
FROM players
JOIN teams ON players.team_id = teams.team_id
WHERE teams.name = 'Amigos' OR teams.name = 'Black Eagles'
```
## Question 4
Q004lisdb: Write an SQL statement to find roll_no and member_no of all students who have issued (borrowed) books between '2021-08-02' and '2021-08-07'. lisdb:

### Solution:
```SQL
SELECT students.roll_no, book_issue.member_no
FROM students
JOIN members ON students.roll_no = members.roll_no
JOIN book_issue ON members.member_no = book_issue.member_no
WHERE book_issue.doi BETWEEN '2021-08-02' AND '2021-08-07'
```
## Question 5
Q005lisdb: Write an SQL statement to find the book titles and the number of copies of the books which has the word 'Easy' in their title. [Database: LIS] lisdb::

### Solution:
```SQL
select title, count(*)
from book_catalogue b1 join book_copies b2
on b1.isbn_no = b2.isbn_no
where title like '%Easy%' group by title
```