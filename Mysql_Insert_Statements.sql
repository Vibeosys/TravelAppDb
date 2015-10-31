DESTINATION TABLE INSERT STATEMENT

INSERT INTO `TravelDB`.`destination` (`DestId`, `DestName`, `Lat`, `Long`, `Active`, `CreatedDate`, `UpdatedDate`) VALUES ('1', 'PUNE', '18.520430', '73.856744', '1', '2015-10-09 11:30:00am', '2015-10-09 11:30:00am');
INSERT INTO `TravelDB`.`destination` (`DestId`, `DestName`, `Lat`, `Long`, `Active`, `CreatedDate`, `UpdatedDate`) VALUES ('2', 'MUMBAI', '19.075984', '72.877656', '1', '2015-10-09 11:30:10am', '2015-10-09 11:30:10am');
INSERT INTO `TravelDB`.`destination` (`DestId`, `DestName`, `Lat`, `Long`, `Active`, `CreatedDate`, `UpdatedDate`) VALUES ('3', 'DELHI', '28.613939', '77.209021', '1', '2015-10-09 11:30:20am', '2015-10-09 11:30:20am');
INSERT INTO `TravelDB`.`destination` (`DestId`, `DestName`, `Lat`, `Long`, `Active`, `CreatedDate`, `UpdatedDate`) VALUES ('4', 'CHENNAI', '13.082680', '80.27-718', '1', '2015-10-09 11:30:30am', '2015-10-09 11:30:30am');
INSERT INTO `TravelDB`.`destination` (`DestId`, `DestName`, `Lat`, `Long`, `Active`, `CreatedDate`, `UpdatedDate`) VALUES ('5', 'BANGLORE', '12.971599', '77.594563', '1', '2015-10-09 11:30:40am', '2015-10-09 11:30:40am');


IMAGE TABLE INSERT STATEMENT

INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('1', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\Anand.jpg', '12', '1', '3');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('2', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\Anand.jpg', '12', '2', '2');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('3', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\Anand.jpg', '12', '3', '1');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('4', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\Anand.jpg', '12', '4', '3');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('5', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\Anand.jpg', '12', '5', '2');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('6', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\Anand.jpg', '1212', '3', '3');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('7', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\Anand.jpg', '96', '3', '7');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('8', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\camera.png', '85', '2', '1');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('9', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\camera.png', '98', '8', '9');
INSERT INTO `TravelDB`.`images` (`ImageId`, `ImagePath`, `CreatedDate`, `UserId`, `DestinationId`) VALUES ('10', 'D:\\GitPhpWebsites\\NewTravelWebAppRepo\\tmp\\UserProfile\\camera.png', '23', '2', '4');


SYNC TABLE INSERT STATEMENT

INSERT INTO `TravelDB`.`sync` (`SyncAutoNo`, `UserId`, `JsonSync`, `TableName`, `UpdatedDate`) VALUES ('1', '7695ec70-92de-426d-879d-0396f03b2938', '{\"UserId\":\"5\",\"DestId\":\"10\",\"CommentText\":\"wonderful\"}', 'Comment', '2015-10-20 21:12:45'),
('2', '7695ec70-92de-426d-879d-0396f03b2938', '{\"UserId\":\"5\",\"DestId\":\"10\"}', 'Like', '2015-10-20 21:12:55'),
('3', '7695ec70-92de-426d-879d-0396f03b2938', '{\"DestId\":\"11\",\"DestName\":\"Shirdi\",\"Lat\":\"36.99645\",\"Long\":\"36.99645\"}', 'Destination', '2015-10-20 21:13:45'),
('4', '7695ec70-92de-426d-879d-0396f03b2938', '{\"ImageId\":\"5\",\"ImagePath\":\"http://myimg.jpg\",\"UserId\":\"3\",\"DestId\":\"6\"}', 'Images', '2015-10-20 21:15:45'),
('5', '7695ec70-92de-426d-879d-0396f03b2938', '{\"AnswerId\":\"5\",\"UserId\":\"10\",\"DestId\":\"1\",\"OptionId\":\"2\"}', 'Answer', '2015-10-20 21:22:45'),
('6', '7695ec70-92de-426d-879d-0396f03b2938','{\"QuestionId\":\"3\",\"QuestionText\":\"How are you?\"}', 'Question', '2015-10-20 21:32:45'),
('7', '7695ec70-92de-426d-879d-0396f03b2938','{\"OptionId\":\"9\",\"QuestionText\":\"good\",\"QuestionId\":\"3\"}', 'Options', '2015-10-20 21:32:45'),
('7', '7695ec70-92de-426d-879d-0396f03b2938','{\"OptionId\":\"10\",\"QuestionText\":\"bad\",\"QuestionId\":\"3\"}', 'Options', '2015-10-20 21:32:45')