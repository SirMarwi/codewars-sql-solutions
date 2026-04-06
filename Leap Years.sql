select
  year,
  case 
    when year % 4 <> 0 then False
    when year % 400 = 0 then True
    when year % 100 = 0 then False
    when year % 4 = 0 then True
    else False
  end
  as is_leap
from years
order by year asc