
-- แสดงข้อมูลจำนวน 2 ฟิล์ด โดยเปลี่ยนชื่อฟิลด์จาก Product_Price เป็น Prod_Price

select Product_Name,Product_Price AS Prod_Price
from Products;

-- แสดงข้อมูลเป็นกลุ่มโดยจัดกลุ่มตาม Product_Unit โดยนับจำนวนจาก id และ แสดงชื่อฟิลด์ที่นับเป็น Products_Count
select Product_Unit, count(id) AS products_Count
from Products
group by Product_Unit;

-- แสดงข้อมูลเป็นกลุ่มโดยจัดกลุ่มตาม Product_Unit โดยรวมราคาสินค้าของแต่ละกลุ่มและแสดงชื่อฟิลด์ที่รวมราคาสินค้าเป็น Products_Prices
select Product_Unit, count(id) AS Products_Count
select Product_Unit, SUM(Product_Price) AS Products_Prices
from Products
group by Product_Unit;


-- แสดงข้อมูลเป็นกลุ่มโดยจัดกลุ่มตาม Product_Unit โดยเชื่อมชื่อสินค้าของแต่ละกลุ่มและแสดงชื่อฟิลด์ที่เชื่อมชื่อสินค้าเป็น Products_Names
select Product_Unit, GROUP_CONCAT(Product_Name) AS Products_Names
from Products
group by Product_Unit;

-- แสดงข้อมูลเป็นกลุ่มโดยจัดกลุ่มตาม Product_Unit โดยเชื่อมชื่อสินค้าของแต่ละกลุ่มพร้อมคั่นชื่อสินค้าด้วย + และแสดงชื่อฟิลด์ที่เชื่อมชื่อสินค้าเป็น Products_Names
select Product_Unit, GROUP_CONCAT(Product_Name SEPARATOR '+ ') AS Products_Names
from Products
group by Product_Unit;
