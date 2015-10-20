




CREATE TABLE `answer` (
  `AnswerId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `DestId` int(11) NOT NULL,
  `OptionId` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`AnswerId`,`UserId`,`DestId`,`OptionId`),
  KEY `FkAnswerUserId_idx` (`UserId`),
  KEY `FkAnswerDestinationId_idx` (`DestId`),
  KEY `FkAnswerOptionId_idx` (`OptionId`),
  CONSTRAINT `FkAnswerDestId` FOREIGN KEY (`DestId`) REFERENCES `destination` (`DestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkAnswerOptionId` FOREIGN KEY (`OptionId`) REFERENCES `options` (`OptionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkAnswerUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO answer VALUES(1,1,2,2,2015-10-10 16:17:23,2015-10-10 16:17:23);
INSERT INTO answer VALUES(2,1,1,2,2015-10-10 17:18:30,2015-10-10 12:27:23);
INSERT INTO answer VALUES(3,1,3,1,2015-10-10 07:25:24,2015-10-10 07:25:24);
INSERT INTO answer VALUES(4,1,3,3,2015-10-10 07:25:24,2015-10-10 07:25:24);
INSERT INTO answer VALUES(5,1,4,2,2015-10-10 07:25:24,2015-10-10 07:25:24);
INSERT INTO answer VALUES(6,1,4,4,2015-10-10 07:25:24,2015-10-10 07:25:24);
INSERT INTO answer VALUES(7,1,5,5,2015-10-10 07:25:24,2015-10-10 07:25:24);



DROP TABLE IF EXISTs comment_and_like;

CREATE TABLE `comment_and_like` (
  `UserId` int(11) NOT NULL,
  `DestId` int(11) NOT NULL,
  `LikeCount` int(11) NOT NULL,
  `CommentText` varchar(100) DEFAULT NULL,
  `LikeUpdatedDate` datetime NOT NULL,
  `CommentUpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`,`DestId`),
  KEY `FnLikeDestId_idx` (`DestId`),
  CONSTRAINT `FnLikeDestId` FOREIGN KEY (`DestId`) REFERENCES `destination` (`DestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FnLikeUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS destination;

CREATE TABLE `destination` (
  `DestId` int(11) NOT NULL AUTO_INCREMENT,
  `DestName` varchar(50) NOT NULL,
  `Lat` double NOT NULL,
  `Long` double NOT NULL,
  `Active` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`DestId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO destination VALUES(1,PUNE,18.52043,73.856744,1,2015-10-09 11:30:00,2015-10-09 11:30:00);
INSERT INTO destination VALUES(2,MUMBAI,19.075984,72.877656,1,2015-10-09 11:30:10,2015-10-09 11:30:10);
INSERT INTO destination VALUES(3,DELHI,28.613939,77.209021,1,2015-10-09 11:30:20,2015-10-09 11:30:20);
INSERT INTO destination VALUES(4,CHENNAI,13.08268,80.27,1,2015-10-09 11:30:30,2015-10-09 11:30:30);
INSERT INTO destination VALUES(5,BANGLORE,12.971599,77.594563,1,2015-10-09 11:30:40,2015-10-09 11:30:40);



DROP TABLE IF EXISTS images;

CREATE TABLE `images` (
  `ImageId` int(11) NOT NULL AUTO_INCREMENT,
  `ImagePath` varchar(100) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UserId` int(11) NOT NULL,
  `DestinationId` int(11) NOT NULL,
  PRIMARY KEY (`ImageId`),
  KEY `FkImageDestId_idx` (`DestinationId`),
  KEY `FkImageUserId_idx` (`UserId`),
  CONSTRAINT `FkImageDestId` FOREIGN KEY (`DestinationId`) REFERENCES `destination` (`DestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkImageUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS options;

CREATE TABLE `options` (
  `OptionId` int(11) NOT NULL AUTO_INCREMENT,
  `OptionText` varchar(45) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  PRIMARY KEY (`OptionId`),
  KEY `FkOptionQuestionId_idx` (`QuestionId`),
  CONSTRAINT `FkOptionQuestionId` FOREIGN KEY (`QuestionId`) REFERENCES `question` (`QuestionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO options VALUES(1,YES,1);
INSERT INTO options VALUES(2,NO,1);
INSERT INTO options VALUES(3,BAD,2);
INSERT INTO options VALUES(4,GOOD,2);
INSERT INTO options VALUES(5,GOODEST,2);



DROP TABLE IF EXISTS question;

CREATE TABLE `question` (
  `QuestionId` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionText` varchar(100) NOT NULL,
  `Active` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`QuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO question VALUES(1,do you like place?,1,2015-10-10 09:27:17,2015-10-10 09:27:17);
INSERT INTO question VALUES(2,How is your experience,1,2015-10-10 12:34:12,2015-10-10 12:34:11);



DROP TABLE IF EXISTS stat_conf;

CREATE TABLE `stat_conf` (
  `Key` varchar(45) NOT NULL,
  `Value` varchar(45) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO stat_conf VALUES(NoOfRetry,5,2015-10-10 13:27:34);
INSERT INTO stat_conf VALUES(SyncTime,30,2015-10-10 13:26:43);



DROP TABLE IF EXISTS sync;

CREATE TABLE `sync` (
  `SyncAutoNo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `JsonSync` mediumtext NOT NULL,
  `TableName` varchar(45) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`SyncAutoNo`),
  UNIQUE KEY `SyncAutoNo` (`SyncAutoNo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO sync VALUES(9,1,[{"0":null,"DestId":1,"DestName":"PUNE","Lat":18.52043,"Long":73.856744,"UpdatedDate":"2015-10-09T11:30:00+0000"},{"DestId":2,"DestName":"MUMBAI","Lat":19.075984,"Long":72.877656,"UpdatedDate":"2015-10-09T11:30:10+0000"},{"DestId":3,"DestName":"DELHI","Lat":28.613939,"Long":77.209021,"UpdatedDate":"2015-10-09T11:30:20+0000"},{"DestId":4,"DestName":"CHENNAI","Lat":13.08268,"Long":80.27,"UpdatedDate":"2015-10-09T11:30:30+0000"},{"DestId":5,"DestName":"BANGLORE","Lat":12.971599,"Long":77.594563,"UpdatedDate":"2015-10-09T11:30:40+0000"}],DESTINATION,2015-10-10 11:37:26);
INSERT INTO sync VALUES(10,1,[{"QuestionId":1,"QuestionText":"do you like place?","Options":[{"OptionId":1,"OptionText":"YES"},{"OptionId":2,"OptionText":"NO"}],"UpdatedDate":"2015-10-10T09:27:17+0000"},{"QuestionId":2,"QuestionText":"How is your experience","Options":[{"OptionId":3,"OptionText":"BAD"},{"OptionId":4,"OptionText":"GOOD"},{"OptionId":5,"OptionText":"GOODEST"}],"UpdatedDate":"2015-10-10T12:34:11+0000"}],QUESTION,2015-10-10 11:37:26);
INSERT INTO sync VALUES(11,1,[{"UserId":1,"DestId":2,"OptionId":2,"UpdatedDate":"2015-10-10T16:17:23+0000"},{"UserId":1,"DestId":1,"OptionId":2,"UpdatedDate":"2015-10-10T12:27:23+0000"},{"UserId":1,"DestId":3,"OptionId":1,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":3,"OptionId":3,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":4,"OptionId":2,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":4,"OptionId":4,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":5,"OptionId":5,"UpdatedDate":"2015-10-10T07:25:24+0000"}],ANSWER,2015-10-10 11:37:26);
INSERT INTO sync VALUES(12,2,[{"0":null,"DestId":1,"DestName":"PUNE","Lat":18.52043,"Long":73.856744,"UpdatedDate":"2015-10-09T11:30:00+0000"},{"DestId":2,"DestName":"MUMBAI","Lat":19.075984,"Long":72.877656,"UpdatedDate":"2015-10-09T11:30:10+0000"},{"DestId":3,"DestName":"DELHI","Lat":28.613939,"Long":77.209021,"UpdatedDate":"2015-10-09T11:30:20+0000"},{"DestId":4,"DestName":"CHENNAI","Lat":13.08268,"Long":80.27,"UpdatedDate":"2015-10-09T11:30:30+0000"},{"DestId":5,"DestName":"BANGLORE","Lat":12.971599,"Long":77.594563,"UpdatedDate":"2015-10-09T11:30:40+0000"}],DESTINATION,2015-10-10 11:48:44);
INSERT INTO sync VALUES(13,2,[{"QuestionId":1,"QuestionText":"do you like place?","Options":[{"OptionId":1,"OptionText":"YES"},{"OptionId":2,"OptionText":"NO"}],"UpdatedDate":"2015-10-10T09:27:17+0000"},{"QuestionId":2,"QuestionText":"How is your experience","Options":[{"OptionId":3,"OptionText":"BAD"},{"OptionId":4,"OptionText":"GOOD"},{"OptionId":5,"OptionText":"GOODEST"}],"UpdatedDate":"2015-10-10T12:34:11+0000"}],QUESTION,2015-10-10 11:48:44);
INSERT INTO sync VALUES(14,2,[{"UserId":1,"DestId":2,"OptionId":2,"UpdatedDate":"2015-10-10T16:17:23+0000"},{"UserId":1,"DestId":1,"OptionId":2,"UpdatedDate":"2015-10-10T12:27:23+0000"},{"UserId":1,"DestId":3,"OptionId":1,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":3,"OptionId":3,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":4,"OptionId":2,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":4,"OptionId":4,"UpdatedDate":"2015-10-10T07:25:24+0000"},{"UserId":1,"DestId":5,"OptionId":5,"UpdatedDate":"2015-10-10T07:25:24+0000"}],ANSWER,2015-10-10 11:48:44);
INSERT INTO sync VALUES(24,1,{"UserId":3,"UserName":"Dany"},USER,2015-10-10 12:20:50);
INSERT INTO sync VALUES(25,2,{"UserId":3,"UserName":"Dany"},USER,2015-10-10 12:20:50);



DROP TABLE IF EXISTS user;

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `MobileNo` char(10) NOT NULL,
  `OTP` int(11) NOT NULL,
  `OTPRetryCount` int(11) NOT NULL,
  `Active` int(11) NOT NULL DEFAULT '0',
  `CreatedDate` datetime NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO user VALUES(1,Niteen,7875888662,7587,1,1,2015-10-10 08:12:29);
INSERT INTO user VALUES(2,Mahesh,7588105079,5978,1,1,2015-10-10 11:46:05);
INSERT INTO user VALUES(3,Dany,7387866318,1195,1,1,2015-10-10 11:51:31);



