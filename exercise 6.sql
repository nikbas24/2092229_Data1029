SELECT title, price FROM titles WHERE (SUBSTRING(title, 1, 1) NOT LIKE 'S' AND SUBSTRING(title, 1, 1) NOT LIKE 'B') AND SUBSTRING(title, 3, 1) = 'f';
