select purchase_date, first_name, last_name, email, name, price, category
from nexus_stores.receipt_items, (
    select id, purchase_date, first_name, last_name, email
    from nexus_stores.receipts
    where email similar to 's(a|e)m[a-z]{3,6}_w[a-z]{6}[0-9]*@roger_[a-z][a-z]*.[a-z]{3}'
) as suspects, (
    select id, name, price, category
    from nexus_stores.products
    where name similar to '%(a|A)(p|P)(p|P)(l|L)(e|E)%'
) as apple

where receipt_id = suspects.id
    and product_id = apple.id;
