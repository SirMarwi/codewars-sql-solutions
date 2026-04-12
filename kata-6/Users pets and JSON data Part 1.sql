select 
  id,
  info ->> 'name' as user_name,
  (select string_agg( p ->> 'name', ', ')
   from jsonb_array_elements(info -> 'pets') as p
  where p ->> 'name' like 'M%') as pet_names
from users
where exists (
  select 1
from jsonb_array_elements( info -> 'pets') as p
where p ->> 'name' like 'M%'
)