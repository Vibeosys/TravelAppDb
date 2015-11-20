CREATE TABLE `TravelDB`.`network_device_info` (
  `UserId` VARCHAR(45) NOT NULL COMMENT '',
  `IpAddress` VARCHAR(45) NULL COMMENT '',
  `City` VARCHAR(45) NULL COMMENT '',
  `Region` VARCHAR(45) NULL COMMENT '',
  `Country` VARCHAR(45) NULL COMMENT '',
  `Brand` VARCHAR(45) NULL COMMENT '',
  `Board` VARCHAR(45) NULL COMMENT '',
  `Manufacturer` VARCHAR(45) NULL COMMENT '',
  `Model` VARCHAR(45) NULL COMMENT '',
  `Product` VARCHAR(45) NULL COMMENT '',
  `FmVersion` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`UserId`)  COMMENT '');
