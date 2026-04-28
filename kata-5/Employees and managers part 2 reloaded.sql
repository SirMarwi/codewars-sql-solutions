do $$
begin
  create temporary table temp_emp as
  select id, name, manager_id, '':: text as management_chain
  from employees;
  
  while exists( select 1 from temp_emp where manager_id is not null) loop
  update temp_emp t
    set management_chain = case
      when t.management_chain = '' then e.name || ' (' || e.id || ')'
      else e.name || ' (' || e.id || ')' ||  ' -> ' || t.management_chain
    end,
    manager_id = e.manager_id
    
    from employees e
    where t.manager_id = e.id
      and t.manager_id is not null;
    
  end loop;
  
end $$;

select id, name, management_chain
from temp_emp
order by id 
