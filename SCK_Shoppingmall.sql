-- สร้าง DB ชื่อ SCK_Shopingmall
CREATE SCHEMA `SCK_Shopingmall` ;

-- สร้างตาราง Product
CREATE TABLE `SCK_Shopingmall`.`Products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Product_Name` VARCHAR(100) NOT NULL,
  `Product_Price` FLOAT NOT NULL,
  `Product_Unit` VARCHAR(45) NOT NULL,
  `Product_Created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- เพิ่มข้อมูล Product ลงในตาราง
INSERT INTO `SCK_Shopingmall`.`Products` (`Product_Name`, `Product_Price`, `Product_Unit`) VALUES ('CRYBABY × Powerpuff Girls Series Figures', '380.00', 'PCS');
INSERT INTO `SCK_Shopingmall`.`Products` (`Product_Name`, `Product_Price`, `Product_Unit`) VALUES ('Baby Molly When I was Three！Series Figures', '380.00', 'PCS');
INSERT INTO `SCK_Shopingmall`.`Products` (`Product_Name`, `Product_Price`, `Product_Unit`) VALUES ('Peach Riot Punk Fairy Series Figures', '430.00', 'PCS');


-- แสดงข้อมูล Product ทั้งหมดในตาราง
select * from Products;

-- แสดงข้อมูล Product เฉพาะฟิลด์ที่เลือก
select Product_Name,Product_Price from Products;

-- แสดงข้อมูล Product เฉพาะเงื่อนไขที่เลือก โดยเลือกราคาสินค้าเท่ากันกับ 380.00 บาท
select * from Products where Product_Price = '380.00';

-- แสดงข้อมูล Product โดยเรียงลำดับชื่อจาก A-Z
select * from Products order by Product_Name ASC;

-- แสดงข้อมูล Product ตามเงื่อนไข โดยใช้การเชื่อม and

select * from Products where Product_Price >= 380.00 and Product_Price < 430;

-- แสดงข้อมูล Product ตามเงื่อนไข โดยใช้การเชื่อม or
select * from Products where Product_Price >= 380.00 or Product_Price <= 430;

-- แสดงข้อมูล Product ตามเงื่อนไข โดยใช้คำสั่ง like เพื่อหาว่าสินค้าใดมีคำว่า Baby อยู่ในชื่อบ้าง
select * from Products where Procuct_Name like '%baby%';

-- แสดงข้อมูล Product โดยเรียงลำดับราคาจากมากสุดไปน้อยสุด
select * from Products order by Product_Price DESC;

-- แสดงข้อมูล Product โดยเรียงลำดับราคาจากมากสุดไปน้อยสุด และให้แสดงแค่ 2 แถวแรก
select * from Products order by Product_Price DESC limit 2;

-- แสดงข้อมูล Product โดยเรียงลำดับราคาจากมากสุดไปน้อยสุด และให้แสดงแถวที่ 2-3
select * from Products order by Product_Price DESC limit 2 OFFSET 1;

