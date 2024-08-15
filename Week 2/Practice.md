## Question 1: Prime Jersey
### Problem Statement:

In this question, you have to write a Python program to print the names of the players and the team of each player of all those players whose jersey number is a prime number.

1.  The list should be ordered in reverse alphabetical order of player names. If two or more players have the same name, then further sorting should be done on the team name, again in reverse alphabetical order.
    
2.  The format of output is as given below:
    

Name of the player, followed by a comma (,), then a space and then the team name.

  

For example, if Arjun has jersey number 5 and is playing for All Stars and Pranav, with jersey number 7, is playing for team Amigos, then the output will be:

Pranav, Amigos

Arjun, All Stars

### Solution:
```python
import psycopg2
import psycopg2.extras
import os
import sys


database = sys.argv[1]

user = os.environ.get('PGUSER') 

password = os.environ.get('PGPASSWORD') 

host = os.environ.get('PGHOST')

port = os.environ.get('PGPORT')


conn=None
try:
    with psycopg2.connect(
    host=host,
    dbname=database,
    user=user,
    password=password,
    port=port) as con:

        with con.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
            '''------------CREATE SCRIPT------------'''
            
            cur.execute("SELECT * FROM players as p INNER JOIN teams as t on p.team_id = t.team_id ORDER BY p.name DESC")
            values = cur.fetchall()
            def is_prime(n):
                if n <=1:
                    return False
                for i in range(2,n):
                    if n%i==0:
                        return False
                return True
            
            finallist=[]
            for i in values:
                if is_prime(i[3]):
                    finallist.append([i[1], i[6]])
                
            for i in finallist:
                print(f'{i[0]}, {i[1]}')
except Exception as error:
    print(error)
finally:
    if conn is not None:
        con.close()
```

## Question 2: Encoding teams
### Problem Statement:


In this problem, you have to write a Python program to print an encoding of the ids of the teams whose jersey colour at home is different from the jersey colour when they play away from home.

  

-   The encoding must be using a shift cipher, which is detailed below.
    

-   An alphabet is mapped to another alphabet as follows. For a given alphabet α, let pos be the position at which α occurs in the alphabet listing (A at 1, B at 2, …. Z at 26). Then the encoding of α is the alphabet at the position (pos + 7) mod 26.
    

For example, if M is the alphabet, then the position at which M occurs in the alphabet listing is 13. Then, the encoding of M is the alphabet at the position (13 + 7) mod 26 = 20, which is T.

-   For each digit β, the encoding of β is (β+7) mod 10.
    

For example, if 3 is the digit, then the encoding of 3 is the number (3 + 7) mod 10 = 0.

-   The ids should be listed in the ascending order before performing the encoding.
    
-   Each line in the output of the program must correspond to one row retrieved from the table.

### Solution:
```python
import sys
import os
import psycopg2

try:
    # Establish database connection
    connection = psycopg2.connect(
        database=sys.argv[1],
        user=os.environ.get('PGUSER'),
        password=os.environ.get('PGPASSWORD'),
        host=os.environ.get('PGHOST'),
        port=os.environ.get('PGPORT')
    )
    
    cursor = connection.cursor()
    
    # Define and execute the query
    query = "SELECT team_id FROM teams WHERE jersey_home_color <> jersey_away_color"
    cursor.execute(query)
    
    result = cursor.fetchall()
    
    # Process and print results
    for res in result:
        # Encrypt the team_id
        new_res = chr(((ord(res[0][0]) - 65 + 7) % 26) + 65)
        for i in res[0][1:]:
            new_res += str((int(i) + 7) % 10)
        print(new_res)
    
    cursor.close()

except (Exception, psycopg2.DatabaseError) as error:
    print(error)

finally:
    if connection:
        connection.close()

```

## Question 3
### Problem Statement:
Write a Python program to output the jersey number of the player. Player's name is given in a file named 'player.txt' resides in the same folder as python program file.  
The output of the python program is only jersey number.  
For example, if the jersey number of the player is 99. Then output must be 99 only. Note: No spaces.

### Solution:
```python
import psycopg2
import psycopg2.extras
import os
import sys



database = sys.argv[1]

user = os.environ.get('PGUSER') 

password = os.environ.get('PGPASSWORD') 

host = os.environ.get('PGHOST')

port = os.environ.get('PGPORT')

f=open('player.txt', 'r')
playername=f.readline()

conn=None
try:
    with psycopg2.connect(
    host=host,
    dbname=database,
    user=user,
    password=password,
    port=port) as con:

        with con.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
            
            cur.execute(f"SELECT jersey_no FROM players WHERE name = '{playername}'")
            print(cur.fetchone()[0])
except Exception as error:
    print(error)
finally:
    if conn is not None:
        con.close()

```

## Question 4
### Problem Statement:
Write a Python program to print the roll number of the student. Student's first name is given in a file named 'name.txt' resides in the same folder as python program file.  
The output of the python program is only roll number.  
For example, if the first name of the student is 'Vikas'. Then output must be CS01 only. Note: No spaces.

### Solution:
```python
import psycopg2
import os, sys

f = open('name.txt', 'r')
stdname=f.readline()
    

database = sys.argv[1]

user = os.environ.get('PGUSER') 

password = os.environ.get('PGPASSWORD') 

host = os.environ.get('PGHOST')

port = os.environ.get('PGPORT')

con=psycopg2.connect(
    host=host,
    dbname=database,
    user=user,
    password=password,
    port=port
)
cur=con.cursor()

cur.execute(f"SELECT roll_no from students where student_fname = '{stdname}'")
print(cur.fetchone()[0])

con.close()

```

## Question 5
### Problem Statement:
write a Python program to print the playground of the given team id. team_id is given in a file named 'team.txt' resides in the same folder as python program file.  
• The output of the python program is only playground name.  
• For example, if the team_id is 'T0002' . Then output must be **Villa Park** only

### Solution:
```python
import psycopg2
import psycopg2.extras
import os
import sys



database = sys.argv[1]

user = os.environ.get('PGUSER') 

password = os.environ.get('PGPASSWORD') 

host = os.environ.get('PGHOST')

port = os.environ.get('PGPORT')

f=open('team.txt', 'r')
team_id=f.readline()

conn=None
try:
    with psycopg2.connect(
    host=host,
    dbname=database,
    user=user,
    password=password,
    port=port) as con:

        with con.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
            
            cur.execute(f"SELECT playground FROM teams WHERE team_id = '{team_id}'")
            print(cur.fetchone()[0])
except Exception as error:
    print(error)
finally:
    if conn is not None:
        con.close()

```

## Question 6
### Problem Statement:

Write a Python program to print the student's first name, the corresponding department name and the respective year of date of birth, if the year is even then print "Even" or else "Odd".  
Student's first name is given in a file named 'name.txt' resides in the same folder as python program file.

-   The output of the python program is only student's first name, the corresponding department name and year of date of birth, if the year is even then "Even" or else "Odd".
-   For example, 'Suman' and 'Computer Science' is the name and department name of the student. '2002' is the year he was born in. '2002' is even. Then, the final output will be **Suman,Computer Science,Even** only. Note: No spaces.  
    
-   For example, 'Vinod' and 'Electrical Engineering' is the name and department name of the student. '2003' is the year he was born in. '2003' is not even. Then, the final output will be **Vinod,Electrical Engineering,Odd** only. Note: No spaces.

### Solution:
```python
import psycopg2
import sys
import os

database = sys.argv[1]

user = os.environ.get('PGUSER') 

password = os.environ.get('PGPASSWORD') 

host = os.environ.get('PGHOST')

port = os.environ.get('PGPORT')
f=open('name.txt', 'r')
fname=f.readline()
con=psycopg2.connect(
    host=host,
    dbname=database,
    user=user,
    password=password,
    port=port
    )
cur=con.cursor()


cur.execute(f"SELECT s.student_fname, d.department_name, s.dob FROM students as s INNER JOIN departments as d ON d.department_code=s.department_code where s.student_fname='{fname}'")
for i in cur.fetchall():
    if int(str(i[2])[:4]) %2 == 0:
        print(f"{i[0]},{i[1]},Even")
    else:
        print(f"{i[0]},{i[1]},Odd")

cur.commit()
con.close()


```
