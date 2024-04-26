-- การแสดงผลโดยเลือกข้อมูลที่มีการเชื่อมต่อตาราง ด้วยคำสั่ง inner join เพื่อดึงข้อมูลที่มีโน๊ตออกมาเท่านั้น และให้เรียงลำดับด้วย id
select p.id,p.Product_Name,pn.note
from products AS p
inner join product_notes AS pn
on p.id = pn.product_id
order by id asc
