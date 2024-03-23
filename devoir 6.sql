-- 1. Noms complets des employés de plus haut grade par employeurs
SELECT CONCAT(e.fname, ' ', e.lname) AS full_name, e.job_lvl, p.pub_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE (e.pub_id, e.job_lvl) IN (
    SELECT pub_id, MAX(job_lvl)
    FROM employees
    GROUP BY pub_id
);

-- 2. Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo
SELECT CONCAT(fname, ' ', lname) AS full_name
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE lname = 'Zongo' AND fname = 'Norbert'
);

-- 3. Noms complets des employés des éditeurs canadiens
SELECT CONCAT(e.fname, ' ', e.lname) AS full_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE p.country = 'Canada';

-- 4. Noms complets des employés qui ont un manager
SELECT CONCAT(fname, ' ', lname) AS full_name
FROM employees
WHERE job_lvl = 'MANAGER';

-- 5. Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur
SELECT CONCAT(e.fname, ' ', e.lname) AS full_name
FROM employees e
JOIN (
    SELECT pub_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY pub_id
) AS avg_salaries ON e.pub_id = avg_salaries.pub_id
WHERE e.salary > avg_salaries.avg_salary;

-- 6. Noms complets des employés qui ont le salaire minimum de leur grade
SELECT CONCAT(e.fname, ' ', e.lname) AS full_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (
    SELECT MIN(salary)
    FROM employees
    WHERE job_id = e.job_id
);

-- 7. De quels types sont les livres les plus vendus
SELECT t.type
FROM titles t
JOIN (
    SELECT title_id, SUM(qty) AS total_sold
    FROM sales
    GROUP BY title_id
    ORDER BY total_sold DESC
    LIMIT 1
) AS top_selling ON t.title_id = top_selling.title_id;

-- 8. Pour chaque boutique, les 2 livres les plus vendus et leurs prix
SELECT s.stor_name, t.title, t.price
FROM (
    SELECT stor_id, title_id, RANK() OVER (PARTITION BY stor_id ORDER BY qty DESC) AS ranking
    FROM sales
) AS ranked_sales
JOIN stores s ON ranked_sales.stor_id = s.stor_id
JOIN titles t ON ranked_sales.title_id = t.title_id
WHERE ranking <= 2;

-- 9. Les auteurs des 5 livres les plus vendus
SELECT CONCAT(a.au_fname, ' ', a.au_lname) AS author_name
FROM titleauthor ta
JOIN (
    SELECT title_id, SUM(qty) AS total_sold
    FROM sales
    GROUP BY title_id
    ORDER BY total_sold DESC
    LIMIT 5
) AS top_titles ON ta.title_id = top_titles.title_id
JOIN authors a ON ta.au_id = a.au_id;

-- 10. Prix moyens des livres par maisons d’édition
SELECT p.pub_name, AVG(t.price) AS avg_price
FROM titles t
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY p.pub_name;

-- 11. Les 3 auteurs ayant les plus de livres
SELECT CONCAT(a.au_fname, ' ', a.au_lname) AS author_name, COUNT(ta.title_id) AS num_books
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
GROUP BY a.au_id
ORDER BY num_books DESC
LIMIT 3;
