use sakila;

-- 1) Drop column picture from staff.
alter table staff
drop column picture;

-- 2) A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff values 
(3, 'Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy',null,'2006-02-15 03:57:16');

-- 3) Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select inventory_id from inventory
where film_id= (select film_id from film
where title = 'Academy Dinosaur');

select staff_id from staff
where first_name='mike';

insert into rental (rental_date,inventory_id,customer_id,staff_id)
values (CURRENT_TIMESTAMP,1,130,1);

-- 4) Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
select * from customer;

select customer_id from customer
where active = 0;

create table customer_backup (
 `customer_id` smallint UNIQUE NOT NULL, -- AS PRIMARY KEY
  `email`varchar(50) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (customer_id));
  
insert into customer_backup
select customer_id, email from customer
where customer_id in (16, 64, 124, 169, 241, 271, 315, 368, 406, 446, 482, 510, 534, 558, 592); 

select * from customer_backup;

SET FOREIGN_KEY_CHECKS=0;

delete from customer
where customer_id in (16, 64, 124, 169, 241, 271, 315, 368, 406, 446, 482, 510, 534, 558, 592);

SET FOREIGN_KEY_CHECKS=1;

select * FROM customer;



