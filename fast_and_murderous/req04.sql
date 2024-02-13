select name
from nexus_stores.products
where name similar to '%(a|A)(p|P)(p|P)(l|L)(e|E)%';
