/*exercise 1*/
SELECT a.au_fname, a.au_lname 
from authors as a 
where a.au_id  not in (
select au_id from titleauthor as ta
WHERE ta.title_id in (select t.title_id from titles as t 
JOIN 
publishers as p on t.pub_id = p.pub_id
WHERE pub_name="Harmattan") group by au_id);



/*exercise 2*/
SELECT a.au_fname, a.au_lname
FROM authors AS a
WHERE "Eyrolles" in (
SELECT t.title_id
FROM titles AS t
LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
WHERE p.pub_name = 'Eyrolles'
AND t.title_id NOT IN (
SELECT ta.title_id
FROM titleauthor AS ta
        WHERE ta.au_id = a.au_id
    )
);

/*exercise 3*/
SELECT a.au_fname, a.au_lname
FROM authors AS a
WHERE a.au_id in
(select au_id from titleauthor as ta
WHERE ta.title_id in (select t.title_id from titles as t 
JOIN 
publishers as p on t.pub_id = p.pub_id
WHERE pub_name="Eyrolles") group by au_id);
