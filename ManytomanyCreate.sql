-- สร้างตาราง Hashtags
CREATE TABLE `SCK_Shopingmall`.`Hashtags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Hashtag_Name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Hashtag_Name_UNIQUE` (`Hashtag_Name` ASC) VISIBLE);

-- สร้างตาราง Products_hashtags โดยกำหนดตัวเชื่อม
CREATE TABLE `SCK_Shopingmall`.`Products_hashtags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Product_id` INT NOT NULL,
  `Hashtags_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_hashtags_products_idx` (`Product_id` ASC) VISIBLE,
  INDEX `fk_products_hashtags_Hashtags_idx` (`Hashtags_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_hashtags_products`
    FOREIGN KEY (`Product_id`)
    REFERENCES `SCK_Shopingmall`.`Products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_products_hashtags_Hashtags`
    FOREIGN KEY (`Hashtags_id`)
    REFERENCES `SCK_Shopingmall`.`Hashtags` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- เพิ่มข้อมูลในตาราง hashtags
INSERT INTO `SCK_Shopingmall`.`Hashtags` (`Hashtag_Name`) VALUES ('ปังมาก');
INSERT INTO `SCK_Shopingmall`.`Hashtags` (`Hashtag_Name`) VALUES ('ของมันต้องมี');
INSERT INTO `SCK_Shopingmall`.`Hashtags` (`Hashtag_Name`) VALUES ('ไม่ได้มุสาวาปึ้ง');



-- เพิ่มข้อมูลในตาราง Products_hashtags
INSERT INTO `SCK_Shopingmall`.`Products_hashtags` (`Product_id`, `Hashtags_id`) VALUES ('1', '1');
INSERT INTO `SCK_Shopingmall`.`Products_hashtags` (`Product_id`, `Hashtags_id`) VALUES ('1', '3');
INSERT INTO `SCK_Shopingmall`.`Products_hashtags` (`Product_id`, `Hashtags_id`) VALUES ('2', '2');
INSERT INTO `SCK_Shopingmall`.`Products_hashtags` (`Product_id`, `Hashtags_id`) VALUES ('3', '3');
INSERT INTO `SCK_Shopingmall`.`Products_hashtags` (`Product_id`, `Hashtags_id`) VALUES ('4', '2');
INSERT INTO `SCK_Shopingmall`.`Products_hashtags` (`Product_id`, `Hashtags_id`) VALUES ('5', '1');
