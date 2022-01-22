-- 1. We will need a list of all staff members, including their first and last names, email addresses, and the store identification number where they work.
use mavenmovies;
select first_name, last_name, email, store_id
from staff
order by staff.store_id;

-- 2. We will need a count of active customers for each of your stores. 

select count(store_id) count, store_id
from customer
where active=1
group by store_id;

-- 3. We will need separate counts of inventory items held at each of your two stores. Separately Please
select count(inventory_id) count, store_id
from inventory
group by store_id;

-- 4. In order to assess the liability of a data breach, we will need you to provide a count of all customer email addresses stored in the database.
select count(email) count
from customer;

-- 5. We are interested in how diverse your film offering is as a means of understanding how likely you are to keep customers engaged in the future.
-- Please provide a count of unique film titles you have in inventory at each store and then provide a count of the unique categories of films you provide.

select count( distinct film.film_id) as count, film_category.category_id
from film
left join inventory on inventory.film_id = film.film_id
left join film_category on film.film_id = film_category.film_id
group by inventory.store_id;


select count( distinct film_id) as count, store_id
from inventory
group by store_id;

select count(distinct category_id) count
from film_category;

-- 6. We would like to understand the replacement cost of your films. 
-- Please provide the replacement cost for the film that is least expensive to replace, the most expensive to replace, and the average of all films you carry.

select min(replacement_cost) minimun, max(replacement_cost) maximum, avg(replacement_cost) avg
from film;

-- 7. We are interested in having you put payment monitoring systems and maximum payment processing restrictions 
-- in place in order to minimize the future risk of fraud by your staff. Please provide the average payment you process, as well as the maximum payment you have processed.

select avg(amount) average_payment, max(amount) maximum_payment
from payment;

/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/

select customer_id, count(rental_id) count
from rental
group by customer_id
order by count(rental_id) desc; 













