create database Publisher;
use Publisher;

# created authors table
create table authors (
id int primary key auto_increment,
Aname varchar(30),
birth_year int,
death_year int,
constraint ck_birth_year check(length(birth_year) = 4 and birth_year between 1850 and 2150),
constraint ck_death_year check(length(death_year) = 4 and death_year between 1850 and 2150)
);

#created Books table
create table Books(
id int primary key auto_increment,
author_id int,
title varchar(50), 
publish_year year,
publishing_house varchar(50),
rating decimal(5,2),
constraint fK_AuthId foreign key (author_id) references authors(id));

#created adaptation table named movie
create table movie (
book_id int primary key auto_increment,
book_type varchar(20),
title varchar(50),
release_year year,
rating decimal(5,2));

# Created review table
create table review(
book_id int,
review varchar(200) unique,
author varchar(30),
constraint Fk_BookId foreign key (book_id) references movie(book_id)
);

select * from authors;
select * from books;
select * from movie;
select * from review;



-- 1. author name, title, published_year
select a.aname, b.title, b.publish_year 
from authors a  left join books b on a.id=b.author_id where publish_year > 2005;

-- 2. author_name, title, published_year where published after 2005
select a.aname, b.title, b.publish_year
from authors a right join book b on a.id = b.author_id;

-- 3. each book, book title, adaptation title adaptation year publication year
select b.title, m.title, m.release_year, b.publish_year
from books b join movie m on b.id = m.book_id;

-- 4 title of each book,  adaptation title , release 
select b.title, m.title, m.release_year
from books b join movie m on b.id = m.book_id;

-- 5 Book title, m.title, publishing house , type  
select b.title, b.publishing_house, m.title, m.book_type 
from books b join movie m on b.id= m.book_id ;


-- 6 b.title, r.review, r.author,
select b.title, r.review, r.author
from books b join review r on b.id = r.book_id;

-- 7 books title and authors name outer join
select b.title, a.aname
from books b left join authors a on b.author_id = a.id
union 
select b.title, a.aname 
from books b right join authors a on b.author_id = a.id;
