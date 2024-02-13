select receipt_id, name, quantity, price
from nexus_stores.receipt_items, (                                                                                                                                          
    select id as pid, name, price
    from nexus_stores.products
    where name similar to '%(a|A)(p|P)(p|P)(l|L)(e|E)%'
) as apples
where pid = product_id
    and quantity > 10;
