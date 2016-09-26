select quantity, 
    isnull(lag(quantity) over(order by item),0) [previous],
    isnull(lead(quantity) over(order by item),0) [next]
from tbl_cube
