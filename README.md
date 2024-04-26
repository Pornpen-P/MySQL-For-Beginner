# MySQL-For-Beginner

สรุปสิ่งที่ได้เรียนรู้ในวันที่ 23 เมษายน 2567 

ได้ทดลองสร้าง DB ซึ่งเป็นฐานข้อมูลวสำหรับเก็บข้อมูล ซึ่งวิธีการสร้างมี 2 แบบคือเราจะเขียนคำสั่งสำหรับการทำการสร้าง หรือใช้เครื่องมือเข้ามาช่วยก็ได้เช่นกัน ดังตัวอย่างในภาพ

![Alt text](Table.png)

แต่ละประเภทของข้อมูล จะมีความแตกต่างกัน การเลือกให้เหมาะกับข้อมูลที่ต้องการเก็บเป็นสิ่งสำคัญ ดังนั้นจึงควรรู้เรื่องของชนิดข้อมูลด้วย 

ทดลองเพิ่มข้อมูลของสินค้า เข้าไปในตารางที่เราสร้าง ซึ่งตรงนี้ก็จะสามารถทำได้ทั้งสองแบบเช่นเดียวกัน สิ่งสำคัญคือเราต้องรู้โครงสร้างตารางของเรา ไม่ว่าจะใช้คำสั่งหรือเครื่องมือมาช่วย 

![Alt text](Inputdata.png)

ได้ลองใช้คำสั่งในการแสดงผลข้อมูลตามเงื่อนไขต่างๆ 
ทำตามโจทย์และคิดโจทย์ขึ้นมาเอง สนุกมาก ๆ :)


---
สรุปสิ่งที่ได้เรียนรู้ในวันที่ 24 เมษายน 2567 

การใช้คำสั่ง
 Insert Into สำหรับเพิ่มข้อมูลลงในฐานข้อมูล ซึ่งสามารถทำได้ทั้งแบบทีละรายการ และหลายรายการพร้อมกัน 

 ตัวอย่างเช่น 

```
insert into products (Product_Name,Product_Price,Product_Unit)
values ('HACIPUPU The Sweetheart Figure',1050.00,'PCS');
```

โดยสิ่งที่ต้องระวังสำหรับเรื่องนี้คือตำแหน่งของข้อมูลในแต่ละตาราง จะต้องถูกต้อง


การใช้คำสั่ง Update เพื่อแก้ไขข้อมูลที่มีอยู่ในฐานข้อมูลเดิม

ตัวอย่างเช่น

```
update products
set Product_Price = 500.00
where id = 2 ;
```

การใช้คำสั่ง Delete from เพื่อลบข้อมูลที่มีอยู่ในฐานข้อมูลเดิม

ตัวอย่างเช่น

```
delete from products
where id = 3;
```

คำสั่งต่าง ๆ ถือว่ามีประโยชน์มากในการจัดการฐานข้อมูลของเรา

---
สรุปสิ่งที่ได้เรียนรู้ในวันที่ 25 เมษายน 2567 

1. การใช้คำสั่ง AS สามารถนำมาช่วยให้เราดูการแสดงผลข้อมูลได้สะดวกขึ้น เนื่องจากบางครั้งเราต้องการดูข้อมูลจากฟิลด์ที่ไม่มีชื่อระบุชัดเจน หรือมีชื่อยาวเกินไป เราสามารถเลือกให้แสดงผลตามที่เราต้องการได้ 

ตัวอย่างเช่น 

การแสดงข้อมูลจำนวน 2 ฟิล์ด โดยเปลี่ยนชื่อฟิลด์จาก Product_Price เป็น Prod_Price

```
select Product_Name,Product_Price AS Prod_Price
from Products;
```

2. การใช้คำสั่ง Group by ทำให้เราสามารถดูข้อมูลได้อย่างเป็นสัดส่วน โดยการแบ่งกลุ่มให้กับข้อมูลที่เราค้นหา 

ตัวอย่างเช่น 

การแสดงข้อมูลเป็นกลุ่มโดยจัดกลุ่มตาม Product_Unit โดยนับจำนวนจาก id และ แสดงชื่อฟิลด์ที่นับเป็น Products_Count

```
select Product_Unit, count(id) AS products_Count
from Products
group by Product_Unit;
```

3. การสร้างตารางแบบเชื่อมต่อข้อมูลถึงกัน เหมือนเป็นตารางแม่และตารางลูก ต้องกำหนด Foreigen Key ให้กับฟิลด์ที่เราต้องการเชื่อมต่อด้วย นอกเหนือจากการเชื่อมตารางแล้ว 

ตัวอย่างเช่น 

การสร้างตารางแบบเชื่อมต่อกับตารางเดิม โดยกำหนดค่า FK
```
CREATE TABLE `SCK_Shopingmall`.`Product_notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `note` TEXT(200) NOT NULL,
  `Product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Product_notes_Products_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_notes_products`
    FOREIGN KEY (`Product_id`)
    REFERENCES `SCK_Shopingmall`.`Products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
```

และเมื่อจะทำการเพิ่มข้อมูลดังกล่าว เราจึงทำการระบุ id ของตัวแม่ไว้ที่ฟิลด์ที่เราเลือกเชื่อมต่อ

ตัวอย่างเช่น 

การเพิ่มข้อมูลในตารางเชื่อมต่อ

```
INSERT INTO `SCK_Shopingmall`.`Product_notes` (`note`, `Product_id`) VALUES ('น่ารักมาก', '1');
```

ค่าของช่อง Product_id ในตาราง Product_notes ก็คือ id ของ ตาราง Products นั่นเอง 


---
สรุปสิ่งที่ได้เรียนรู้ในวันที่ 26 เมษายน 2567 

เรียนรู้เกี่ยวกับคำสั่ง 
Join table ซึ่งเรามักจะต้องใช้งานเมื่อตารางข้อมูลของเรามีการเชื่อมต่อกัน 
ซึ่งจะต้องออกแบบตั้งแต่ ER Diagram เพื่อกำหนดจุดที่เราจะเชื่อมตั้งแต่การสร้างตาราง 
ซึ่งจะทำให้เรารู้ว่า ควรระบุ FOREIGN KEY ของตารางเป็นอย่างไร 
นอกจากนี้ยังได้ใช้คำสั่ง Alter table เพื่อทำการแก้ไขโครงสร้างตารางในฐานข้อมูลของเราได้อีกด้วย 

ตัวอย่างเช่น 

```

-- สร้างตาราง Categories
CREATE TABLE `SCK_Shopingmall`.`Categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Category_Name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Category_Name_UNIQUE` (`Category_Name` ASC) VISIBLE);



-- แก้ไขโครงสร้างตาราง Products โดยการเพิ่มฟิลด์ Category_id
ALTER TABLE `SCK_Shopingmall`.`Products`
ADD COLUMN `Category_id` INT NULL AFTER `Product_Created`,
ADD INDEX `fk_products_categories_idx` (`Category_id` ASC) VISIBLE;
;
ALTER TABLE `SCK_Shopingmall`.`Products`
ADD CONSTRAINT `fk_products_categories`
  FOREIGN KEY (`Category_id`)
  REFERENCES `SCK_Shopingmall`.`Products` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

```

เมื่อเราได้ตารางที่มีการเชื่อมต่อแล้ว ก็สามารถนำคำสั่ง 
Inner Join และ Left Join เข้ามาใช้ช่วยให้แสดงผลได้ ดังตัวอย่าง 

```
-- การแสดงผลโดยเลือกข้อมูลที่มีการเชื่อมต่อตาราง ด้วยคำสั่ง inner join เพื่อดึงข้อมูลที่มีโน๊ตออกมาเท่านั้น และให้เรียงลำดับด้วย id
select p.id,p.Product_Name,pn.note
from products AS p
inner join product_notes AS pn
on p.id = pn.product_id
order by id asc;
```

```
-- การแสดงผลโดยเลือกข้อมูลที่มีการเชื่อมต่อตาราง ด้วยคำสั่ง left join เพื่อดึงข้อมูลทั้งหมดในตารางซ้ายออกมา และให้เรียงลำดับด้วย id
select p.id,p.Product_Name,pn.note
from products AS p
left join product_notes AS pn
on p.id = pn.product_id
order by id asc
```
