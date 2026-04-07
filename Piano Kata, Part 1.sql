create or replace function keys_check (key integer)
returns text as $$
declare
  n integer;
  y integer;
  txt text;
begin
  y:= (key/88) :: integer;
  
  case
    when key <= 88 then n:= mod(key, 12);
    else n:= mod(key - (88 * y), 12);
  end case;
  
  case 
    when n = 1 then txt:= 'white';
    when n = 2 then txt:= 'black';
    when n = 3 then txt:= 'white';
    when n = 4 then txt:= 'white';
    when n = 5 then txt:= 'black';
    when n = 6 then txt:= 'white';
    when n = 7 then txt:= 'black';
    when n = 8 then txt:= 'white';
    when n = 9 then txt:= 'white';
    when n = 10 then txt:= 'black';
    when n = 11 then txt := 'white';
    else txt:= 'black';
  end case;
  return txt;
end;
$$ language plpgsql;

select n, keys_check(n) as res
from pianokeys