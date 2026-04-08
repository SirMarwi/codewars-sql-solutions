select id, name, price
from product
where to_tsvector('english', name) @@ to_tsquery('english', 'Awesome')
