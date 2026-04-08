select capital
from countries
where country like 'E%'
  and continent like 'Afri%a'
order by capital
limit 3
