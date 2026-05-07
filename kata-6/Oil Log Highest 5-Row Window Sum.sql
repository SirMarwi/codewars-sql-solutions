with running_window as(
  select
    depth as start_depth,
    lead(depth, 4) over (order by depth) as end_depth,
    sum(ktim) over (order by depth rows between current row and 4 following) as ktim_sum,
    count(*) over (order by depth rows between current row and 4 following) as row_count
  from well_log
  )

select start_depth, end_depth, round(ktim_sum::numeric, 2):: varchar as total_ktim
from running_window
where row_count = 5
order by ktim_sum desc, start_depth 