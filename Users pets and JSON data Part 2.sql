select
substring(p ->> 'name', 1, 1) as first_letter,
count(p ->> 'name') as pet_count,
string_agg(info ->> 'name', ', ') as user_names
from users, jsonb_array_elements(info -> 'pets') as p
group by first_letter
order by pet_count desc, first_letter asc