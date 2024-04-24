-- อัปเดตราคาสินค้าในตำแหน่งที่ 2
update products
set Product_Price = 500.00
where id = 2 ;

-- เปลี่ยนหน่วยของราคาสินค้าที่มากกว่า 1,000.00 บาทให้กลายเป็น BOX
update products
set Product_Unit = 'BOX'
where Product_Price > 1000;

