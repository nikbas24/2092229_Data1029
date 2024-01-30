SELECT title, price FROM `titles` WHERE title LIKE '%computer%' 
SELECT title, price FROM titles WHERE title LIKE '%computer%' AND title NOT LIKE '%computer%' 
SELECT title, price FROM titles where titles.type rlike '[sb]u%'
SELECT title, price FROM titles WHERE titles.type NOT LIKE 'SU%' AND titles.type NOT LIKE 'BU%';
SELECT title, price FROM titles WHERE (SUBSTRING(title, 1, 1) NOT LIKE 'S' AND SUBSTRING(title, 1, 1) NOT LIKE 'B') AND SUBSTRING(title, 2, 1) = 'o';
SELECT title, price FROM titles WHERE (SUBSTRING(title, 1, 1) NOT LIKE 'S' AND SUBSTRING(title, 1, 1) NOT LIKE 'B') AND SUBSTRING(title, 3, 1) = 'f';
SELECT title, price FROM titles WHERE SUBSTRING(title, 1, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
