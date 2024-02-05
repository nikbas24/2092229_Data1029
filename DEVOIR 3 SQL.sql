use library;
 
-- 1. La liste des paires (auteur, éditeur) demeurant dans la même ville. (10pts)
select au_fname, pub_name
from library.publishers
join library.authors as author
where publishers.city = author.city;
 
-- 2. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère. (10pts)
select au_fname, pub_name
from library.publishers
right join library.authors as author
on publishers.city = author.city;
 
-- 3. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les éditeurs qui ne répondent pas à ce critère. (10pts)
select au_fname, pub_name
from library.publishers
left join library.authors as author
on publishers.city = author.city;
 
-- 4. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les auteurs et les éditeurs qui ne répondent pas à ce critère. (10pts)
select au_fname, pub_name
from library.publishers
left join library.authors as author
on publishers.city = author.city
union
select au_fname, pub_name
from library.publishers
right join library.authors as author
on publishers.city = author.city;
 
 
-- 5. Effectif(nombre) d'employes par niveau d'experience (15pts)
select job_lvl, count(*)
from employees
group by job_lvl;
 
 
-- 6. Liste des employes par maison d'edition (15pts)
select fname, pub_name
from library.employees
join library.publishers as pub
on pub.pub_id = employees.pub_id;
 
 
-- 7. Salaires horaires moyens des employes par maison d'edition (15pts)
select pub_name, avg(salary) 
from library.employees
join library.publishers as pub
on pub.pub_id = employees.pub_id
group by pub.pub_id;
 
 
-- 8- Effectif(nombre) d'employées de niveau SEINIOR  par maison d'edition
select pub_name, count(*)  
from library.employees
join library.publishers as pub
on pub.pub_id = employees.pub_id
and employees.job_lvl = 'SEINIOR'
group by pub.pub_id;