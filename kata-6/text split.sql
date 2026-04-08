create or replace function name_split( person_name text, part integer)
returns text as $$
declare
  parts integer;
  txt text;
  
begin
  parts:= length(person_name) - length(replace(person_name, ' ', '')) + 1;
  
  case
    when parts > 3 then 
      case
       when part = 1 then
          txt:= split_part(person_name, ' ', part) || ' '|| split_part(person_name, ' ', part + 1);
       when part = 2 then
          txt:= split_part(person_name, ' ', part + 1);
       else
          txt:= split_part(person_name, ' ', part + 1);
      end case; 
    else
      txt:= split_part(person_name, ' ', part);
  end case;
  
  return txt;
end;
$$ language plpgsql;


SELECT name_split(name, 1) as name,
       name_split(name, 2) as first_lastname,
       name_split(name, 3) as second_lastname
FROM people
