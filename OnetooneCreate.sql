-- สร้างตารางแบบเชื่อมต่อกับตารางเดิม โดยกำหนดค่า FK
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


-- เพิ่มข้อมูลในตารางเชื่อมต่อ
INSERT INTO `SCK_Shopingmall`.`Product_notes` (`note`, `Product_id`) VALUES ('น่ารักมาก', '1');


