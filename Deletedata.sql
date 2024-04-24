-- ลบข้อมูลในฐานข้อมูลตำแหน่งที่ 3
delete from products
where id = 3;


-- ลบข้อมูลในฐานข้อมูลของสินค้าที่ราคาน้อยกว่า 1,000.00 บาท
delete from products
where Product_Price < 1000;

-- ลบข้อมูลในฐานข้อมูลที่ถูกสร้างก่อนเวลาที่กำหนด
delete from products
where  Product_Created < '2024-04-24 17:14:06';
