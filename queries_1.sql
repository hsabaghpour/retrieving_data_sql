select customer, count(distinct product)
from dataset1
where customer like '%Pop%'
group by 1 order by 2
