-- การแสดงผลโดยเลือกข้อมูลที่มีการเชื่อมต่อตาราง ด้วยคำสั่ง inner join เพื่อดึงข้อมูลที่มีโน๊ตออกมาเท่านั้น และให้เรียงลำดับด้วย id
select p.id,p.Product_Name,pn.note
from products AS p
inner join product_notes AS pn
on p.id = pn.product_id
order by id asc;

-- การแสดงผลโดยเลือกข้อมูลที่มีการเชื่อมต่อตาราง ด้วยคำสั่ง left join เพื่อดึงข้อมูลทั้งหมดในตารางซ้ายออกมา และให้เรียงลำดับด้วย id
select p.id,p.Product_Name,pn.note
from products AS p
left join product_notes AS pn
on p.id = pn.product_id
order by id asc



-- แสดงข้อมูลสินค้าทุกอัน โดยเอาข้อมูล id , ชื่อสินค้า , ชื่อประเภทสินค้าจากอีกตารางมาร่วมด้วย
select p.id , p.Product_Name , c.Category_Name
from Products AS p
left join Categories AS c
on p.Category_id = c.id;


-- แสดงข้อมูลประเภทสินค้าทุกอัน โดยเอาข้อมูล id , ชื่อประเภทสินค้า และนับจำนวนสินค้าด้วย
select c.id,c.Category_Name,COUNT(p.id) AS products_count
from Categories AS c
left join Products AS p
on p.Category_id = c.id
group by c.id;
