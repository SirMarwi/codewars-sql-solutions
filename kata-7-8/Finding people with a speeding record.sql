select
  p.id as person_id,
  p.birthdate,
  coalesce( sum(r.speed_delta), 0) as total_speed_delta
from people p left join records r
  on p.id = r.person_id
group by p.id, p.birthdate
order by p.id