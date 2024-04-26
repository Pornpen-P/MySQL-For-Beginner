
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

-- เพิ่มข้อมูล Category_Name
INSERT INTO `SCK_Shopingmall`.`Categories` (`Category_Name`) VALUES ('กล่องสุ่ม');
INSERT INTO `SCK_Shopingmall`.`Categories` (`Category_Name`) VALUES ('ตุ๊กตาตัวใหญ่');

-- อัปเดตข้อมูล Category_id
UPDATE `SCK_Shopingmall`.`Products` SET `Category_id` = '1' WHERE (`id` = '1');
UPDATE `SCK_Shopingmall`.`Products` SET `Category_id` = '1' WHERE (`id` = '2');
UPDATE `SCK_Shopingmall`.`Products` SET `Category_id` = '1' WHERE (`id` = '3');
UPDATE `SCK_Shopingmall`.`Products` SET `Category_id` = '2' WHERE (`id` = '4');
UPDATE `SCK_Shopingmall`.`Products` SET `Category_id` = '1' WHERE (`id` = '5');
UPDATE `SCK_Shopingmall`.`Products` SET `Category_id` = '2' WHERE (`id` = '6');
UPDATE `SCK_Shopingmall`.`Products` SET `Category_id` = '2' WHERE (`id` = '7');


-- แก้ไขโครงสร้างตาราง Product_notes โดยการกำหนดให้ Product_id มีความ Unique
ALTER TABLE `SCK_Shopingmall`.`Product_notes`
;
ALTER TABLE `SCK_Shopingmall`.`Product_notes` ALTER INDEX `Product_id_UNIQUE` VISIBLE;
