ALTER TABLE  `product` ADD  `made_country` VARCHAR( 255 ) NOT NULL AFTER  `item_code` ;
ALTER TABLE  `product` CHANGE  `made_country`  `made_country` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ;
ALTER TABLE  `product` ADD  `price_s` INT NOT NULL AFTER  `price_buy` ,
ADD  `price_l` INT NOT NULL AFTER  `price_s` ;
ALTER TABLE  `product` CHANGE  `price_s`  `price_s` FLOAT( 11 ) NOT NULL ;
ALTER TABLE  `product` CHANGE  `price_l`  `price_l` FLOAT( 11 ) NOT NULL ;
ALTER TABLE  `product` ADD  `quantity` INT NOT NULL AFTER  `price_l` ;