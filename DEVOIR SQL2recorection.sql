SELECT title, price FROM `titles` WHERE title LIKE '%computer%' ;
SELECT title, price FROM titles WHERE (title LIKE '%computer%') and (title not like '%computers%') GROUP BY title_id; 
SELECT title, price FROM titles WHERE title RLIKE '[sb]u%' GROUP BY title_id;
SELECT title, price FROM titles WHERE title not RLIKE '[sb]u%' GROUP BY title_id;
SELECT title, price FROM titles WHERE (title not RLIKE '[sb]%') and (title like '_o%') GROUP BY title_id;
SELECT title, price FROM titles WHERE (SUBSTRING(title, 1, 1) NOT LIKE 'S' AND SUBSTRING(title, 1, 1) NOT LIKE 'B') AND SUBSTRING(title, 3, 1) = 'f';
SELECT title, price FROM titles WHERE SUBSTRING(title, 1, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
