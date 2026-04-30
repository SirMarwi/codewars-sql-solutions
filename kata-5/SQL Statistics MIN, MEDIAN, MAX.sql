select 
min(score),
percentile_cont(0.5) within group (order by score) as median,
max(score)
from result
