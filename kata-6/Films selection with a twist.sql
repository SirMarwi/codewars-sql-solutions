select film_id, title, length
from film
where
  length not between (
    select min(length)
    from film
    where rating ='R'
    )
    and(
      select percentile_disc(0.5) within group(order by length)
      from film
      where rating = 'PG-13'
    )
order by length asc, title asc, film_id asc