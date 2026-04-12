select 
  id,
  info ->> 'name' as user_name,
  pets_data ->> 'name' as pet_names
from users,
lateral jsonb_array_elements(info -> 'pets') as pets_data
where pets_data ->> 'name' like 'M%'