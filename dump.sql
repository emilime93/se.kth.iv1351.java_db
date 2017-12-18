#
# DUMP FILE
#
# Database is ported from MS Access
#------------------------------------------------------------------
# Created using "MS Access to MySQL" form http://www.bullzip.com
# Program Version 5.5.282
#
# OPTIONS:
#   sourcefilename=C:/Users/ockel/Desktop/Databas-färdig-relation.accdb
#   sourceusername=
#   sourcepassword=
#   sourcesystemdatabase=
#   destinationdatabase=SpelRsi
#   storageengine=MyISAM
#   dropdatabase=0
#   createtables=1
#   unicode=1
#   autocommit=1
#   transferdefaultvalues=1
#   transferindexes=1
#   transferautonumbers=1
#   transferrecords=1
#   columnlist=1
#   tableprefix=
#   negativeboolean=0
#   ignorelargeblobs=0
#   memotype=LONGTEXT
#   datetimetype=DATETIME
#

CREATE DATABASE IF NOT EXISTS `SpelRsi`;
USE `SpelRsi`;

#
# Table structure for table 'Bevakning'
#

DROP TABLE IF EXISTS `Bevakning`;

CREATE TABLE `Bevakning` (
  `epost` VARCHAR(150) NOT NULL, 
  `butik_ID` INTEGER NOT NULL, 
  `produkt` VARCHAR(150) NOT NULL, 
  PRIMARY KEY (`epost`, `butik_ID`, `produkt`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Bevakning'
#

INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('ISeeU@gmail.com', 1, '1234');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Stalker@mail.com', 3, '1250');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Niclas@olsson.se', 5, '1251');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Testerino@frapperino.com', 3, '1252');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Shitterino@materino.com', 3, '1235');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Shitterino@materino.com', 2, '1236');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Shitterino@materino.com', 1, '1251');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Niclas@olsson.se', 2, '1242');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('Niclas@olsson.se', 5, '1242');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('test@email.com', 3, '1234');
INSERT INTO `Bevakning` (`epost`, `butik_ID`, `produkt`) VALUES ('test2@email.com', 3, '1235');
# 11 records

#
# Table structure for table 'Bild'
#

DROP TABLE IF EXISTS `Bild`;

CREATE TABLE `Bild` (
  `bildURL` LONGTEXT NOT NULL, 
  `bildtyp` VARCHAR(255) NOT NULL, 
  `ordningsNR` VARCHAR(255) NOT NULL, 
  `produkt` VARCHAR(255) NOT NULL, 
  UNIQUE (`ordningsNR`), 
  PRIMARY KEY (`bildURL`(100))
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Bild'
#

INSERT INTO `Bild` (`bildURL`, `bildtyp`, `ordningsNR`, `produkt`) VALUES ('bild.com/bild#http://bild.com/bild#', 'Omslag', '1', '1234');
# 1 records

#
# Table structure for table 'Butik'
#

DROP TABLE IF EXISTS `Butik`;

CREATE TABLE `Butik` (
  `butiksID` INTEGER NOT NULL AUTO_INCREMENT, 
  `gatuadress` VARCHAR(255) NOT NULL, 
  `postNR` VARCHAR(255) NOT NULL, 
  `stad` VARCHAR(255) NOT NULL, 
  INDEX (`butiksID`), 
  PRIMARY KEY (`butiksID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Butik'
#

INSERT INTO `Butik` (`butiksID`, `gatuadress`, `postNR`, `stad`) VALUES (1, 'Kungsgatan 8', '12345', 'Stockholm');
INSERT INTO `Butik` (`butiksID`, `gatuadress`, `postNR`, `stad`) VALUES (2, 'Kvarnshamnsvägen 2319', '54321', 'Malmö');
INSERT INTO `Butik` (`butiksID`, `gatuadress`, `postNR`, `stad`) VALUES (3, 'Sveavägen 4', '13370', 'Stockholm');
INSERT INTO `Butik` (`butiksID`, `gatuadress`, `postNR`, `stad`) VALUES (4, 'Shuupvägen 7', '34251', 'Umeå');
INSERT INTO `Butik` (`butiksID`, `gatuadress`, `postNR`, `stad`) VALUES (5, 'Örebrovägen 3', '23194', 'Örebro');
# 5 records

#
# Table structure for table 'Designeranställning'
#

DROP TABLE IF EXISTS `Designeranställning`;

CREATE TABLE `Designeranställning` (
  `designergrupp` VARCHAR(255) NOT NULL, 
  `speldesigner` INTEGER NOT NULL, 
  PRIMARY KEY (`designergrupp`, `speldesigner`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Designeranställning'
#

INSERT INTO `Designeranställning` (`designergrupp`, `speldesigner`) VALUES ('Mojang', 4);
INSERT INTO `Designeranställning` (`designergrupp`, `speldesigner`) VALUES ('Blizzard', 1);
INSERT INTO `Designeranställning` (`designergrupp`, `speldesigner`) VALUES ('Valve', 5);
# 3 records

#
# Table structure for table 'Designergrupp'
#

DROP TABLE IF EXISTS `Designergrupp`;

CREATE TABLE `Designergrupp` (
  `namn` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`namn`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Designergrupp'
#

INSERT INTO `Designergrupp` (`namn`) VALUES ('Devolver Digital');
INSERT INTO `Designergrupp` (`namn`) VALUES ('Mojang');
INSERT INTO `Designergrupp` (`namn`) VALUES ('Activision');
INSERT INTO `Designergrupp` (`namn`) VALUES ('EA');
INSERT INTO `Designergrupp` (`namn`) VALUES ('Ubisoft');
INSERT INTO `Designergrupp` (`namn`) VALUES ('Nintendo');
INSERT INTO `Designergrupp` (`namn`) VALUES ('Valve');
INSERT INTO `Designergrupp` (`namn`) VALUES ('Blizzard');
# 8 records

#
# Table structure for table 'Genre'
#

DROP TABLE IF EXISTS `Genre`;

CREATE TABLE `Genre` (
  `namn` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`namn`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Genre'
#

INSERT INTO `Genre` (`namn`) VALUES ('Action');
INSERT INTO `Genre` (`namn`) VALUES ('Shooter');
INSERT INTO `Genre` (`namn`) VALUES ('Pussel');
INSERT INTO `Genre` (`namn`) VALUES ('First-person');
INSERT INTO `Genre` (`namn`) VALUES ('Third-person');
INSERT INTO `Genre` (`namn`) VALUES ('RPG');
INSERT INTO `Genre` (`namn`) VALUES ('RTS');
INSERT INTO `Genre` (`namn`) VALUES ('Sport');
INSERT INTO `Genre` (`namn`) VALUES ('Music');
# 9 records

#
# Table structure for table 'Innehållsklassificering'
#

DROP TABLE IF EXISTS `Innehållsklassificering`;

CREATE TABLE `Innehållsklassificering` (
  `typ` VARCHAR(255) NOT NULL, 
  `beskrivning` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`typ`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Innehållsklassificering'
#

INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Blood', 'Depictions of blood');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Sexual Content', 'Non-explicit depictions of sexual behavior, possibly including partial nudity');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Simulated Gambling', 'Player can gamble without betting or wagering real cash or currency');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Tobacco Reference', 'Reference to and/or images of tobacco products');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Use of Alcohol', 'The consumption of alcoholic beverages');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Use of Drugs', 'The consumption or use of illegal drugs');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Use of Tobacco', 'The consumption of tobacco products');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Violence', 'Scenes involving aggressive conflict. May contain bloodless dismemberment');
INSERT INTO `Innehållsklassificering` (`typ`, `beskrivning`) VALUES ('Violent References', 'References to violent acts');
# 9 records

#
# Table structure for table 'Plattform'
#

DROP TABLE IF EXISTS `Plattform`;

CREATE TABLE `Plattform` (
  `namn` VARCHAR(255) NOT NULL, 
  `beskrivning` VARCHAR(255) NOT NULL, 
  `utgivningsdatum` DATETIME NOT NULL, 
  `tillverkare` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`namn`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Plattform'
#

INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('Xbox', 'A box with an X on it', '2002-03-14 00:00:00', 'Microsoft');
INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('Playstation 2', 'A station with a 2 on it', '2000-11-24 00:00:00', 'Sony');
INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('Nintendo Switch', 'A Nintendo with a switch', '2017-03-03 00:00:00', 'Nintendo');
INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('Xbox 360', 'A box with 360 on it', '2005-12-02 00:00:00', 'Microsoft');
INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('PC', 'Master race', '1983-11-10 00:00:00', 'Microsoft');
INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('Playstation 3', 'A station with a 3 on it', '2007-03-23 00:00:00', 'Sony');
INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('Playstation 4', 'A station with a 4 on it', '2013-11-29 00:00:00', 'Sony');
INSERT INTO `Plattform` (`namn`, `beskrivning`, `utgivningsdatum`, `tillverkare`) VALUES ('Xbox One', 'A box with 1 on it', '2014-09-05 00:00:00', 'Microsoft');
# 8 records

#
# Table structure for table 'Plattformstillverkare'
#

DROP TABLE IF EXISTS `Plattformstillverkare`;

CREATE TABLE `Plattformstillverkare` (
  `namn` VARCHAR(255) NOT NULL, 
  UNIQUE (`namn`), 
  PRIMARY KEY (`namn`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Plattformstillverkare'
#

INSERT INTO `Plattformstillverkare` (`namn`) VALUES ('Microsoft');
INSERT INTO `Plattformstillverkare` (`namn`) VALUES ('Sony');
INSERT INTO `Plattformstillverkare` (`namn`) VALUES ('Nintendo');
INSERT INTO `Plattformstillverkare` (`namn`) VALUES ('Valve');
# 4 records

#
# Table structure for table 'Produkt'
#

DROP TABLE IF EXISTS `Produkt`;

CREATE TABLE `Produkt` (
  `pris` VARCHAR(255), 
  `spel_ID` INTEGER NOT NULL, 
  `utvecklarföretag` VARCHAR(255) NOT NULL, 
  `beskrivning` LONGTEXT, 
  `spelserie_ID` INTEGER, 
  `antalsålda` INTEGER NOT NULL DEFAULT 0, 
  `släppdatum` DATETIME, 
  `plattform` VARCHAR(255) NOT NULL, 
  `streckkod` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`streckkod`), 
  INDEX (`streckkod`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Produkt'
#

INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('199', 4, 'Mojang Studios', 'Kreativt block spel', NULL, 1000, '2011-11-18 00:00:00', 'PC', '1234');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('399', 11, 'Blizzard Studios', 'Animerat skjutspel', NULL, 1111, '2016-05-24 00:00:00', 'PC', '1235');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('49', 8, 'DICE', 'Krigssimulation', 2, 0, '2005-06-21 00:00:00', 'PC', '1236');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('69', 9, 'DICE', 'Krigssimulation', 2, 0, '2011-10-25 00:00:00', 'PC', '1237');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('189', 10, 'DICE', 'Krigssimulation', 2, 0, '2013-10-29 00:00:00', 'PC', '1238');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('199', 15, 'Infinity Ward', 'Skjutspel', 1, 0, '2005-10-25 00:00:00', 'PC', '1239');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('49', 16, 'Treyarch', 'Skjutspel', 4, 1000, '2006-11-07 00:00:00', 'Playstation 3', '1240');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('139', 12, 'Infinity Ward', 'Skjutspel', 1, 0, '2007-11-05 00:00:00', 'PC', '1241');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('169', 14, 'Treyarch', 'Skjutspel', 1, 2000, '2008-11-11 00:00:00', 'PC', '1242');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('169', 14, 'Treyarch', 'Skjutspel', 5, 2000, '2008-11-11 00:00:00', 'Xbox 360', '1243');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('169', 14, 'Treyarch', 'Skjutspel', 4, 0, '2008-11-11 00:00:00', 'Playstation 3', '1244');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('139', 12, 'Infinity Ward', 'Skjutspel', 4, 1111, '2007-11-05 00:00:00', 'Playstation 3', '1245');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('139', 12, 'Infinity Ward', 'Skjutspel', 5, 0, '2007-11-05 00:00:00', 'Xbox 360', '1246');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('49', 16, 'Treyarch', 'Skjutspel', 10, 0, '2006-11-07 00:00:00', 'Playstation 2', '1247');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('49', 16, 'Treyarch', 'Skjutspel', 8, 0, '2006-11-07 00:00:00', 'Xbox', '1248');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('49', 16, 'Treyarch', 'Skjutspel', 5, 0, '2006-11-07 00:00:00', 'Xbox 360', '1249');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('199', 15, 'Infinity Ward', 'Skjutspel', 5, 0, '2005-10-25 00:00:00', 'Xbox 360', '1250');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('299', 17, 'Croteam', 'Skjutspel', NULL, 10054, '2011-11-22 00:00:00', 'Playstation 3', '1251');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('299', 17, 'Croteam', 'Skjutspel', NULL, 0, '2011-11-22 00:00:00', 'PC', '1252');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('199', 18, 'Neversoft', 'Musikspel', 3, 0, '2018-11-25 00:00:00', 'Playstation 3', '1253');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('149', 19, 'Neversoft', 'Musikspel', 3, 0, '2018-12-12 00:00:00', 'Playstation 3', '1254');
INSERT INTO `Produkt` (`pris`, `spel_ID`, `utvecklarföretag`, `beskrivning`, `spelserie_ID`, `antalsålda`, `släppdatum`, `plattform`, `streckkod`) VALUES ('199', 18, 'Neversoft', 'Musikspel', 9, 0, '2018-11-25 00:00:00', 'Xbox 360', '1255');
# 22 records

#
# Table structure for table 'Produktlagersaldo'
#

DROP TABLE IF EXISTS `Produktlagersaldo`;

CREATE TABLE `Produktlagersaldo` (
  `antal` INTEGER NOT NULL DEFAULT 0, 
  `produkt` VARCHAR(255) NOT NULL, 
  `butik_ID` INTEGER NOT NULL, 
  PRIMARY KEY (`produkt`, `butik_ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Produktlagersaldo'
#

INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (1230, '1234', 4);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (100, '1238', 2);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (20, '1244', 3);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (200, '1239', 5);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (20, '1245', 5);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (20, '1250', 5);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (100, '1235', 5);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (18, '1251', 3);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (48, '1251', 2);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (22, '1251', 5);
INSERT INTO `Produktlagersaldo` (`antal`, `produkt`, `butik_ID`) VALUES (20, '1252', 4);
# 11 records

#
# Table structure for table 'Recension'
#

DROP TABLE IF EXISTS `Recension`;

CREATE TABLE `Recension` (
  `recensent` VARCHAR(150) NOT NULL, 
  `produkt` VARCHAR(150) NOT NULL, 
  `betyg` INTEGER NOT NULL DEFAULT 0, 
  `maxskala` INTEGER NOT NULL DEFAULT 0, 
  `minskala` INTEGER NOT NULL DEFAULT 0, 
  `webbplats` LONGTEXT, 
  PRIMARY KEY (`recensent`, `produkt`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Recension'
#

INSERT INTO `Recension` (`recensent`, `produkt`, `betyg`, `maxskala`, `minskala`, `webbplats`) VALUES ('Jocke', '1234', 9, 10, 0, 'Gainz.mannen/minecraft#http://Gainz.mannen/minecraft#');
INSERT INTO `Recension` (`recensent`, `produkt`, `betyg`, `maxskala`, `minskala`, `webbplats`) VALUES ('Emil', '1239', 10, 10, 0, 'pcgamer.com#http://pcgamer.com#');
# 2 records

#
# Table structure for table 'Spel'
#

DROP TABLE IF EXISTS `Spel`;

CREATE TABLE `Spel` (
  `spelID` INTEGER NOT NULL AUTO_INCREMENT, 
  `namn` VARCHAR(255), 
  `grupp` VARCHAR(255), 
  `beskrivning` LONGTEXT NOT NULL, 
  `designer_ID` INTEGER, 
  UNIQUE (`namn`), 
  PRIMARY KEY (`spelID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Spel'
#

INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (4, 'Minecraft', NULL, 'Kreativt block-baserat spel', 4);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (7, 'FIFA 17', 'EA', 'Fotbollsspel', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (8, 'Battlefield 2', 'EA', 'Krigssimulation', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (9, 'Battlefield 3', 'EA', 'Krigssimulation', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (10, 'Battlefield 4', 'EA', 'Krigssimulation', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (11, 'Overwatch', 'Blizzard', 'Animerat futuristiskt krigspel med apor', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (12, 'Call of Duty 4: Modern Warfare', 'Activision', 'Krigsspel', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (14, 'Call of Duty: World at War', 'Activision', 'Krigsspel', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (15, 'Call of Duty 2', 'Activision', 'Krigsspel', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (16, 'Call of Duty 3', 'Activision', 'Krigsspel', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (17, 'Serious Sam 3: BFE', 'Devolver Digital', 'Skrrrrrrrrrraaaa pa pa pa pa pa', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (18, 'Guitar Hero III: Legends of Rock', 'Activision', 'Hiiiiighway to hell!', NULL);
INSERT INTO `Spel` (`spelID`, `namn`, `grupp`, `beskrivning`, `designer_ID`) VALUES (19, 'Guitar Hero: Aerosmith', 'Activision', 'Dreeeam oon!', NULL);
# 13 records

#
# Table structure for table 'Speldesigner'
#

DROP TABLE IF EXISTS `Speldesigner`;

CREATE TABLE `Speldesigner` (
  `pID` INTEGER NOT NULL AUTO_INCREMENT, 
  `fnamn` VARCHAR(255) NOT NULL, 
  `enamn` VARCHAR(255) NOT NULL, 
  INDEX (`pID`), 
  PRIMARY KEY (`pID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Speldesigner'
#

INSERT INTO `Speldesigner` (`pID`, `fnamn`, `enamn`) VALUES (1, 'Jeff', 'Kaplan');
INSERT INTO `Speldesigner` (`pID`, `fnamn`, `enamn`) VALUES (2, 'Klas', 'Engberg');
INSERT INTO `Speldesigner` (`pID`, `fnamn`, `enamn`) VALUES (3, 'Joar', 'Bergmark');
INSERT INTO `Speldesigner` (`pID`, `fnamn`, `enamn`) VALUES (4, 'Markus', 'Persson');
INSERT INTO `Speldesigner` (`pID`, `fnamn`, `enamn`) VALUES (5, 'Gabe', 'Newell');
INSERT INTO `Speldesigner` (`pID`, `fnamn`, `enamn`) VALUES (6, 'Guy', 'Beahm');
# 6 records

#
# Table structure for table 'Spelgenre'
#

DROP TABLE IF EXISTS `Spelgenre`;

CREATE TABLE `Spelgenre` (
  `spel_ID` INTEGER NOT NULL, 
  `genre` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`spel_ID`, `genre`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Spelgenre'
#

INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (4, 'First-person');
INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (4, 'Action');
INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (11, 'First-person');
INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (11, 'Action');
INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (11, 'Shooter');
INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (17, 'Action');
INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (17, 'Shooter');
INSERT INTO `Spelgenre` (`spel_ID`, `genre`) VALUES (17, 'First-person');
# 8 records

#
# Table structure for table 'Spelinnehållsklassificering'
#

DROP TABLE IF EXISTS `Spelinnehållsklassificering`;

CREATE TABLE `Spelinnehållsklassificering` (
  `spel_ID` INTEGER NOT NULL, 
  `innehållsklassificering` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`spel_ID`, `innehållsklassificering`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Spelinnehållsklassificering'
#

INSERT INTO `Spelinnehållsklassificering` (`spel_ID`, `innehållsklassificering`) VALUES (4, 'Violence');
INSERT INTO `Spelinnehållsklassificering` (`spel_ID`, `innehållsklassificering`) VALUES (11, 'Violence');
INSERT INTO `Spelinnehållsklassificering` (`spel_ID`, `innehållsklassificering`) VALUES (11, 'Simulated Gambling');
INSERT INTO `Spelinnehållsklassificering` (`spel_ID`, `innehållsklassificering`) VALUES (11, 'Violent References');
INSERT INTO `Spelinnehållsklassificering` (`spel_ID`, `innehållsklassificering`) VALUES (17, 'Blood');
INSERT INTO `Spelinnehållsklassificering` (`spel_ID`, `innehållsklassificering`) VALUES (17, 'Violence');
# 6 records

#
# Table structure for table 'Spelserie'
#

DROP TABLE IF EXISTS `Spelserie`;

CREATE TABLE `Spelserie` (
  `spelserieID` INTEGER NOT NULL AUTO_INCREMENT, 
  `namn` VARCHAR(255) NOT NULL, 
  `beskrivning` LONGTEXT NOT NULL, 
  `plattform` VARCHAR(255) NOT NULL, 
  `grupp_ID` INTEGER, 
  PRIMARY KEY (`spelserieID`), 
  INDEX (`spelserieID`), 
  INDEX (`namn`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Spelserie'
#

INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (1, 'Call of Duty', 'Overkligt krigsspel', 'PC', 1);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (2, 'Battlefield', 'Krigssimulation', 'PC', 2);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (3, 'Guitar Hero', 'Musikspel', 'Playstation 3', 3);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (4, 'Call of Duty', 'Overkligt krigsspel', 'Playstation 3', 1);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (5, 'Call of Duty', 'Overkligt krigsspel', 'Xbox 360', 1);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (6, 'Battlefield', 'Krigssimulation', 'Playstation 3', 2);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (7, 'Battlefield', 'Krigssimulation', 'Xbox 360', 2);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (8, 'Call of Duty', 'Overkligt krigsspel', 'Xbox', 1);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (9, 'Guitar Hero', 'Musikspel', 'Xbox 360', 3);
INSERT INTO `Spelserie` (`spelserieID`, `namn`, `beskrivning`, `plattform`, `grupp_ID`) VALUES (10, 'Call of Duty', 'Overkligt krigsspel', 'Playstation 2', 1);
# 10 records

#
# Table structure for table 'Spelseriegrupp'
#

DROP TABLE IF EXISTS `Spelseriegrupp`;

CREATE TABLE `Spelseriegrupp` (
  `spelseriegruppID` INTEGER NOT NULL AUTO_INCREMENT, 
  `namn` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`spelseriegruppID`), 
  INDEX (`spelseriegruppID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Spelseriegrupp'
#

INSERT INTO `Spelseriegrupp` (`spelseriegruppID`, `namn`) VALUES (1, 'Call of Duty');
INSERT INTO `Spelseriegrupp` (`spelseriegruppID`, `namn`) VALUES (2, 'Battlefield');
INSERT INTO `Spelseriegrupp` (`spelseriegruppID`, `namn`) VALUES (3, 'Guitar Hero');
# 3 records

#
# Table structure for table 'Utvecklarföretag'
#

DROP TABLE IF EXISTS `Utvecklarföretag`;

CREATE TABLE `Utvecklarföretag` (
  `namn` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`namn`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Utvecklarföretag'
#

INSERT INTO `Utvecklarföretag` (`namn`) VALUES ('Treyarch');
INSERT INTO `Utvecklarföretag` (`namn`) VALUES ('Neversoft');
INSERT INTO `Utvecklarföretag` (`namn`) VALUES ('DICE');
INSERT INTO `Utvecklarföretag` (`namn`) VALUES ('Infinity Ward');
INSERT INTO `Utvecklarföretag` (`namn`) VALUES ('Blizzard Studios');
INSERT INTO `Utvecklarföretag` (`namn`) VALUES ('Mojang Studios');
INSERT INTO `Utvecklarföretag` (`namn`) VALUES ('Croteam');
# 7 records

