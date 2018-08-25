/*

+-------------------------------------------------------------+

+-------------------------------------------------------------+

+---------By:Amila Jayasinghe (amilaplus@gmail.com)-----------+

+-------------------------------------------------------------+

*/

-- Dumping tables for database: `image_bank_system`


SET FOREIGN_KEY_CHECKS=0; 


-- Dumping structure for table: `acc_cus_vh_payments`

DROP TABLE IF EXISTS `acc_cus_vh_payments`;
CREATE TABLE `acc_cus_vh_payments` (
  `acc_vhpay_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) NOT NULL,
  `vh_id` int(11) NOT NULL,
  `acc_pay_cat1` varchar(45) DEFAULT 'default',
  `acc_pay_group1` varchar(45) DEFAULT 'default',
  `pay_in_amount` double DEFAULT '0',
  `pay_out_amount` double DEFAULT '0',
  `acc_pay_desc` varchar(45) DEFAULT NULL,
  `pay_status` int(1) DEFAULT '2' COMMENT 'pay confirmed=1 | pending=2',
  `pay_method` varchar(45) DEFAULT 'CASH' COMMENT 'CASH | CHEQUE | OTHER',
  `pay_record_status` int(2) DEFAULT '1' COMMENT 'record active=1 | deleted=99',
  PRIMARY KEY (`acc_vhpay_id`),
  KEY `fk_acc_cus_vh_payments_Customer1_idx` (`cus_id`) USING BTREE,
  KEY `fk_acc_cus_vh_payments_Vehicle1_idx` (`vh_id`) USING BTREE,
  CONSTRAINT `acc_cus_vh_payments_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `acc_cus_vh_payments_ibfk_2` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table: acc_cus_vh_payments



-- Dumping structure for table: `bank`

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_status` int(2) DEFAULT NULL COMMENT '1 = active / 99= inactive',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: bank

INSERT INTO `bank` VALUES('4', 'HNB', 'Kurunegala', '', '1');
INSERT INTO `bank` VALUES('5', 'BOC ', 'Kurunegala', '', '1');
INSERT INTO `bank` VALUES('6', 'DFCC', 'Colombo', '', '1');


-- Dumping structure for table: `clearing_balance`

DROP TABLE IF EXISTS `clearing_balance`;
CREATE TABLE `clearing_balance` (
  `clearing_balance_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `vh_id` int(11) DEFAULT NULL,
  `list` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `coordinator` varchar(255) DEFAULT NULL,
  `chassis_number` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `payment_type` int(2) DEFAULT NULL COMMENT 'charge = 0 / payment =1 ',
  `charge` decimal(10,2) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `last_balance` decimal(10,2) DEFAULT NULL,
  `confirm` int(2) DEFAULT NULL COMMENT 'non confirmed = 0 / confirmed = 1',
  `agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`clearing_balance_id`),
  KEY `vh_id` (`vh_id`),
  CONSTRAINT `clearing_balance_ibfk_1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;



-- Dumping data for table: clearing_balance

INSERT INTO `clearing_balance` VALUES('1', '2016-03-28', '4', '776', 'AL734KR', 'PRIUS', 'Miura International pvt ltd', '54854', '56456', '0', '500.00', '50.00', ' ', '555.00', '555.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('2', '2016-03-29', '1', '779', '', '', '', '', '', '0', '50.00', '0.00', ' ', '555.00', '555.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('3', '2016-03-29', '1', '779', '', '', '', '', '', '1', '0.00', '50.00', ' ', '1110.00', '1110.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('4', '2016-03-29', '1', '779', '', '', '', '', '', '0', '500.00', '0.00', ' ', '1105.00', '1105.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('5', '2016-03-29', '1', '779', '', '', '', '', '', '0', '500.00', '0.00', ' ', '1505.00', '1505.00', '1', '1');
INSERT INTO `clearing_balance` VALUES('6', '2016-04-04', '1', '755', 'AL715KR', 'WAGON R', 'All other customer', '463326', 'PEARL', '0', '50.00', '0.00', 'khjjkjkhjk', '1500.00', '1500.00', '1', '1');
INSERT INTO `clearing_balance` VALUES('7', '2016-04-04', '1', '6', 'LP5KR', 'AQUA', 'All other customer', '6263698', 'PEARL WHITE', '1', '0.00', '500.00', ' ', '1500.00', '1500.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('8', '2016-04-04', '1', '748', 'AL708KR', 'PREMIO', 'All other customer', '3162410', 'WINE RED', '0', '100.00', '0.00', ' ', '1100.00', '1100.00', '1', '1');
INSERT INTO `clearing_balance` VALUES('9', '2016-04-04', '1', '779', '', '', '', '', '', '0', '250.00', '0.00', ' ', '1350.00', '1350.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('10', '2016-04-04', '1', '763', 'AL723KR', 'LAND CRUISER PRADO', 'Miura International pvt ltd', '002403', 'PEARL WHITE', '1', '0.00', '1000.00', ' ', '350.00', '350.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('11', '2016-04-04', '1', '760', 'AL720KR', 'WAGON R', 'All other customer', '465679', 'PEARL', '0', '250.00', '0.00', ' ', '600.00', '600.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('12', '2016-04-04', '1', '776', 'AL734KR', 'PRIUS', 'Miura International pvt ltd', '', '', '0', '50.00', '0.00', ' ', '650.00', '650.00', '0', '3');
INSERT INTO `clearing_balance` VALUES('13', '2016-04-05', '1', '779', '', '', '', '', '', '1', '0.00', '50.00', ' xghcvbmchjfgj', '550.00', '550.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('14', '2016-04-05', '1', '779', '', '', '', '', '', '1', '0.00', '50.00', ' xghcvbmchjfgj', '550.00', '550.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('15', '2016-04-05', '1', '774', 'AL732KR', 'PRIUS', 'Miura International pvt ltd', 'jjkgh', 'ghgh', '0', '50.00', '0.00', ' hchgdfgh', '550.00', '550.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('16', '2016-04-05', '1', '779', '', '', '', '', '', '1', '0.00', '500.00', ' ', '50.00', '50.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('17', '2016-04-06', '1', '756', 'AL716KR', 'WAGON R', 'All other customer', '464155', 'PEARL', '0', '100.00', '0.00', ' 1st add', '100.00', '100.00', '0', '2');
INSERT INTO `clearing_balance` VALUES('18', '2016-04-06', '1', '779', '', '', '', '', '', '1', '0.00', '20.00', ' payment amal', '80.00', '80.00', '0', '2');
INSERT INTO `clearing_balance` VALUES('19', '2016-04-06', '1', '749', 'AL709KR', 'AXIO HYBRID', 'All other customer', '7122300', 'PEARL', '0', '280.00', '0.00', ' 2nd balance', '360.00', '360.00', '0', '2');
INSERT INTO `clearing_balance` VALUES('20', '2016-04-06', '1', '752', 'AL712KR', 'WAGON R', 'All other customer', '461562', 'PURPLE', '0', '800.00', '0.00', ' 1st', '800.00', '800.00', '0', '4');
INSERT INTO `clearing_balance` VALUES('21', '2016-04-06', '1', '775', 'AL733KR', 'PRIUS', 'Miura International pvt ltd', '', '', '0', '500.00', '0.00', ' New car', '550.00', '550.00', '0', '1');
INSERT INTO `clearing_balance` VALUES('22', '2016-04-06', '1', '779', '', '', '', '', '', '1', '0.00', '100.00', ' ', '450.00', '450.00', '0', '1');


-- Dumping structure for table: `coordinator`

DROP TABLE IF EXISTS `coordinator`;
CREATE TABLE `coordinator` (
  `coordinator_id` int(11) NOT NULL AUTO_INCREMENT,
  `coordinator_name` varchar(45) DEFAULT NULL,
  `short_name` varchar(20) DEFAULT '',
  `phone` varchar(11) DEFAULT '',
  `phone2` varchar(11) DEFAULT NULL,
  `email1` varchar(50) DEFAULT '',
  `email2` varchar(50) DEFAULT '',
  `address` varchar(200) DEFAULT NULL,
  `category` varchar(45) DEFAULT '',
  `coordinator_status` int(2) DEFAULT '1',
  `username` varchar(45) DEFAULT '',
  `password` varchar(60) DEFAULT '',
  `user_status` int(2) DEFAULT '0',
  PRIMARY KEY (`coordinator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;



-- Dumping data for table: coordinator

INSERT INTO `coordinator` VALUES('1', 'Miura International pvt ltd', 'Miura', '', '', '', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('2', 'MDCC', 'MDCC', '', '', '', '', '', 'local', '1', 'abc', '1983e83fc9b7b572c58ba13eeff430df85ba5e64', '1');
INSERT INTO `coordinator` VALUES('3', 'Namal Rathnayaka', 'Namal', '0710333408', '', 'namalprasanna20@yahoo.com', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('4', 'Sisira Kumara', 'Sisira', '', '', '', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('5', 'Dr Basnayaka', 'Basnayaka', '', '', '', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('6', 'Sanogi International', 'Sanogi', '', '', '', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('7', 'Dr N.P.G.S.Dayarathne', 'Dr sunil', '', '', '', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('8', 'Pragathi Lanka Pvt Ltd', 'Ravi', '', '', '', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('9', 'All other customer', 'Other', '', '', '', '', '', 'foreign', '1', '', '', '0');
INSERT INTO `coordinator` VALUES('10', 'Mr. Upendra', 'Upendra', '', '', '', '', '', 'local', '1', '', '', '0');


-- Dumping structure for table: `credit_transfer`

DROP TABLE IF EXISTS `credit_transfer`;
CREATE TABLE `credit_transfer` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(45) DEFAULT NULL,
  `ct_type` varchar(45) DEFAULT NULL COMMENT 'Credit transfer/ pay order',
  `from_bank` varchar(45) DEFAULT NULL,
  `from_bank_branch` varchar(45) DEFAULT NULL,
  `from_name` varchar(45) DEFAULT NULL,
  `from_address` varchar(45) DEFAULT NULL,
  `from_acc_no` varchar(45) DEFAULT NULL,
  `to_bank` varchar(45) DEFAULT NULL,
  `to_bank_branch` varchar(45) DEFAULT NULL,
  `to_name` varchar(45) DEFAULT NULL,
  `to_acc_no` varchar(45) DEFAULT NULL,
  `ct_amount` decimal(10,2) DEFAULT '0.00',
  `ct_address` varchar(150) DEFAULT NULL,
  `ct_header` varchar(150) DEFAULT NULL,
  `ct_message` varchar(400) DEFAULT NULL,
  `ho_name` varchar(45) DEFAULT NULL,
  `ho_nic` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `ct_description` varchar(45) DEFAULT NULL,
  `ct_date` date DEFAULT NULL,
  `ct_status` int(2) DEFAULT '1' COMMENT 'active=1/deleted=99',
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8;



-- Dumping data for table: credit_transfer

INSERT INTO `credit_transfer` VALUES('795', 'CP795', 'pay_order', 'hnb ', 'kandy', 'aruna', 'mawathagama', '424324324', 'hnb ', 'kurunegala', 'kamal', '145445', '485446.00', 'The Manager, HNB, Kurunegala', 'Regarding a credit transfer', ' I kindly request to proceed below transaction. And please insert the reference number of this requesting to my account narrations', 'affafa', '234243424V', '81', 'this is the transfer descrioption', '2016-01-13', '98');
INSERT INTO `credit_transfer` VALUES('796', 'CP796', 'pay_order', 'hnb ', 'kandy', 'aruna', 'mawathagama', '424324324', 'hnb ', 'kurunegala', 'nimal', '145445', '550.00', 'Manager, \nHNB, \nKandy', 'Request for pay order', 'this is the pay order message', 'collecting person', '926565645V', '81', ' fdfafdadfaffddfdfnkjjin\nfakljnnfdlknalkn\'\\\nf', '2016-01-12', '1');
INSERT INTO `credit_transfer` VALUES('869', 'CP869', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '', '98');
INSERT INTO `credit_transfer` VALUES('870', 'CP870', 'credit_transfer', 'boc colombo', 'colombo', '', '', '', '', '', '', '', '156456.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-13', '1');
INSERT INTO `credit_transfer` VALUES('871', 'CP871', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '0000-00-00', '98');
INSERT INTO `credit_transfer` VALUES('872', 'CP872', 'credit_transfer', 'qreerw', 'wrewrw', 'erewrw', 'kandy, central proivnce', '3223334', 'HNB', 'Kurunegala', 'nimal', '6545445', '1544545.00', 'The Manager , HNB\n, Kandy ', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', 'pay orders description for the credit transfe', '2016-01-20', '1');
INSERT INTO `credit_transfer` VALUES('873', 'CP873', 'credit_transfer', '', '', '', '', '', '', '', '', '', '500.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-20', '1');
INSERT INTO `credit_transfer` VALUES('874', 'CP874', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-20', '98');
INSERT INTO `credit_transfer` VALUES('876', 'CP876', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-20', '98');
INSERT INTO `credit_transfer` VALUES('877', 'CP877', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-20', '98');
INSERT INTO `credit_transfer` VALUES('878', 'CP878', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-20', '98');
INSERT INTO `credit_transfer` VALUES('879', 'CP879', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-22', '98');
INSERT INTO `credit_transfer` VALUES('880', 'CP880', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-22', '1');
INSERT INTO `credit_transfer` VALUES('881', 'CP881', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-22', '98');
INSERT INTO `credit_transfer` VALUES('882', 'CP882', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-22', '98');
INSERT INTO `credit_transfer` VALUES('883', 'CP883', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-22', '98');
INSERT INTO `credit_transfer` VALUES('884', 'CP884', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-22', '98');
INSERT INTO `credit_transfer` VALUES('885', 'CP885', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-22', '1');
INSERT INTO `credit_transfer` VALUES('904', 'CP904', 'credit_transfer', '', '', '', '', '', '', '', '', '', '14564.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' fgsgsgfsgsgs', '2016-01-25', '1');
INSERT INTO `credit_transfer` VALUES('905', 'CP905', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '0000-00-00', '98');
INSERT INTO `credit_transfer` VALUES('906', 'CP906', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-26', '98');
INSERT INTO `credit_transfer` VALUES('907', 'CP907', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-26', '1');
INSERT INTO `credit_transfer` VALUES('908', 'CP908', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-26', '1');
INSERT INTO `credit_transfer` VALUES('909', 'CP909', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-26', '1');
INSERT INTO `credit_transfer` VALUES('910', 'CP910', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-26', '1');
INSERT INTO `credit_transfer` VALUES('911', 'CP911', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('912', 'CP912', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('913', 'CP913', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('914', 'CP914', 'pay_order', 'fdafa', 'fdafda', 'fafa', 'dfafa', '34234', 'fdafda', 'fdafad', 'fafaf', '32423', '324234.36', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', 'fafafaf', '935456465V', '81', ' dfafaffa', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('915', 'CP915', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', 'fdafaaf', '', '81', ' faa', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('916', 'CP916', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('917', 'CP917', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('918', 'CP918', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('920', 'AL455', 'pay_order', '', '', '', '', '', '', '', '', '', '3645.00', '', '', '', '', '', '81', '', '2016-02-18', '1');
INSERT INTO `credit_transfer` VALUES('921', 'CP921', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('922', 'CP922', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('923', 'CP923', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-27', '1');
INSERT INTO `credit_transfer` VALUES('930', 'CP930', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-27', '98');
INSERT INTO `credit_transfer` VALUES('931', 'CP931', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-27', '98');
INSERT INTO `credit_transfer` VALUES('932', 'CP932', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-27', '98');
INSERT INTO `credit_transfer` VALUES('933', 'CP933', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-27', '98');
INSERT INTO `credit_transfer` VALUES('934', 'CP934', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-28', '1');
INSERT INTO `credit_transfer` VALUES('935', 'CP935', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-28', '98');
INSERT INTO `credit_transfer` VALUES('936', 'CP936', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-28', '1');
INSERT INTO `credit_transfer` VALUES('937', 'CP937', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-28', '98');
INSERT INTO `credit_transfer` VALUES('938', 'CP938', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-28', '98');
INSERT INTO `credit_transfer` VALUES('939', 'CP939', 'pay_order', '', '', '', '', '', '', '', '', '', '1434.00', '', '', '', '', '', '81', '', '2016-01-28', '1');
INSERT INTO `credit_transfer` VALUES('940', 'CP940', 'credit_transfer', '2321', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-28', '1');
INSERT INTO `credit_transfer` VALUES('941', 'CP941', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-01-28', '98');
INSERT INTO `credit_transfer` VALUES('942', 'CP942', 'credit_transfer', '', '', '', '', '', '', '', '', '', '434344.00', 'To Manager , HNB Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' gfsffgsfggs', '2016-01-28', '1');
INSERT INTO `credit_transfer` VALUES('943', 'CP943', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-29', '1');
INSERT INTO `credit_transfer` VALUES('944', 'CP944', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-29', '1');
INSERT INTO `credit_transfer` VALUES('945', 'CP945', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-29', '1');
INSERT INTO `credit_transfer` VALUES('946', 'CP946', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-29', '1');
INSERT INTO `credit_transfer` VALUES('947', 'CP947', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-01-29', '98');
INSERT INTO `credit_transfer` VALUES('948', 'CP948', 'credit_transfer', '', '', '', '', '', '', '', '', '', '342.00', 'To Manager,HNB,Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-02-02', '1');
INSERT INTO `credit_transfer` VALUES('949', 'CP949', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-02-15', '98');
INSERT INTO `credit_transfer` VALUES('950', 'CP950', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-02-15', '1');
INSERT INTO `credit_transfer` VALUES('951', 'CP951', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-02-15', '1');
INSERT INTO `credit_transfer` VALUES('952', 'CP952', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-04-20', '1');
INSERT INTO `credit_transfer` VALUES('953', 'CP953', 'credit_transfer', 'Nation Trust', 'Colombo', 'Miura', 'Colombo', '1905', 'BOC ', 'Kurunegala', '', '', '0.00', 'The Manager,HNB,Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' 123aaa', '2016-04-25', '1');
INSERT INTO `credit_transfer` VALUES('954', 'CP954', 'credit_transfer', 'Nation Trust', 'Colombo', 'Miura', 'Colombo', '1905', 'BOC ', 'Kurunegala', 'Nimal Perera', '5641564645654', '458000.00', 'The Manager,HNB,Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-04-25', '1');
INSERT INTO `credit_transfer` VALUES('955', 'CP955', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-04-26', '1');
INSERT INTO `credit_transfer` VALUES('956', 'CP956', 'pay_order', '', '', '', '', '', '', '', '', '', '0.00', '', '', '', '', '', '0', '', '2016-04-26', '1');
INSERT INTO `credit_transfer` VALUES('957', 'CP957', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'The Manager,HNB,Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-08-30', '1');
INSERT INTO `credit_transfer` VALUES('958', 'CP958', 'pay_order', '', '', '', '', '', '', '', 'Director General of Customs', '', '0.00', 'The Manager,HNB ,Kurunegala', 'REQUEST FOR PAY ORDERS FAVOURING \'THE DIRECTOR GENERAL OF CUSTOMS', 'Please be kind enough to issue pay orders as follows, And please insert the above reference number of this requesting to my account narrations.', '', '', '81', ' ', '2016-08-30', '1');
INSERT INTO `credit_transfer` VALUES('959', 'CP959', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'The Manager,HNB,Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-08-30', '1');
INSERT INTO `credit_transfer` VALUES('960', 'CP960', 'credit_transfer', '', '', '', '', '', '', '', '', '', '0.00', 'The Manager,HNB,Kurunegala', 'Regarding a credit Transferring', 'I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.', '', '', '81', ' ', '2016-08-31', '1');


-- Dumping structure for table: `ct_items`

DROP TABLE IF EXISTS `ct_items`;
CREATE TABLE `ct_items` (
  `ct_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_id` int(11) NOT NULL,
  `ct_item_type` varchar(45) DEFAULT NULL COMMENT 'vehicle/ other',
  `vh_id` int(10) DEFAULT NULL,
  `ref_id` varchar(45) DEFAULT NULL COMMENT 'vehicle_id/other ref id',
  `ct_item_amount` decimal(10,2) DEFAULT NULL,
  `ct_item_desc` varchar(100) DEFAULT NULL,
  `ct_item_status` int(2) DEFAULT NULL COMMENT 'temp "98" / added "1"',
  PRIMARY KEY (`ct_item_id`),
  UNIQUE KEY `vh_id` (`vh_id`,`ref_id`) USING BTREE,
  KEY `fk_ct_items_credit_transfer1_idx` (`ct_id`) USING BTREE,
  CONSTRAINT `ct_items_ibfk_1` FOREIGN KEY (`ct_id`) REFERENCES `credit_transfer` (`ct_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;



-- Dumping data for table: ct_items

INSERT INTO `ct_items` VALUES('92', '795', 'pay_order', '8', 'CP795', '3243.00', ' ', '99');
INSERT INTO `ct_items` VALUES('95', '795', 'pay_order', '7', 'CP795', '234234.00', ' ', '99');
INSERT INTO `ct_items` VALUES('96', '918', 'pay_order', '8', 'CP918', '32423.00', ' ', '1');
INSERT INTO `ct_items` VALUES('99', '918', 'pay_order', '9', 'CP918', '23424.00', ' ', '1');
INSERT INTO `ct_items` VALUES('100', '914', 'pay_order', '3', 'CP914', '3232.00', ' dfafaffa', '1');
INSERT INTO `ct_items` VALUES('101', '914', 'pay_order', '8', 'CP914', '4324.00', ' dfafaffa', '1');
INSERT INTO `ct_items` VALUES('109', '795', 'pay_order', '9', 'CP795', '4324342.00', 'this is the transfer descrioption', '99');
INSERT INTO `ct_items` VALUES('124', '930', 'pay_order', '8', 'CP930', '4324.00', ' ', '1');
INSERT INTO `ct_items` VALUES('125', '931', 'pay_order', '3', 'CP931', '32423.00', ' ', '1');
INSERT INTO `ct_items` VALUES('126', '931', 'pay_order', '6', 'CP931', '424.00', ' ', '1');
INSERT INTO `ct_items` VALUES('129', '931', 'pay_order', '10', 'CP931', '4242.00', ' ', '1');
INSERT INTO `ct_items` VALUES('130', '932', 'pay_order', '3', 'CP932', '34243234.00', ' ', '99');
INSERT INTO `ct_items` VALUES('132', '932', 'pay_order', '8', 'CP932', '2434.00', ' ', '1');
INSERT INTO `ct_items` VALUES('133', '933', 'pay_order', '3', 'CP933', '3323.00', ' ', '1');
INSERT INTO `ct_items` VALUES('134', '933', 'pay_order', '7', 'CP933', '56165.00', ' ', '1');
INSERT INTO `ct_items` VALUES('135', '935', 'pay_order', '6', 'CP935', '321.00', ' ', '1');
INSERT INTO `ct_items` VALUES('136', '935', 'pay_order', '9', 'CP935', '34332.00', ' ', '1');
INSERT INTO `ct_items` VALUES('137', '935', 'pay_order', '7', 'CP935', '32.00', ' ', '1');
INSERT INTO `ct_items` VALUES('138', '936', 'pay_order', '8', 'CP936', '3424.00', ' ', '1');
INSERT INTO `ct_items` VALUES('139', '936', 'pay_order', '7', 'CP936', '254.21', ' ', '1');
INSERT INTO `ct_items` VALUES('140', '937', 'pay_order', '3', 'CP937', '3343.00', ' ', '1');
INSERT INTO `ct_items` VALUES('142', '937', 'pay_order', '10', 'CP937', '4344.00', ' ', '1');
INSERT INTO `ct_items` VALUES('143', '937', 'pay_order', '11', 'CP937', '4344.00', ' ', '1');
INSERT INTO `ct_items` VALUES('144', '938', 'pay_order', '3', 'CP938', '3223.00', ' ', '1');
INSERT INTO `ct_items` VALUES('145', '938', 'pay_order', '6', 'CP938', '32.00', ' ', '1');
INSERT INTO `ct_items` VALUES('146', '795', 'pay_order', '6', 'CP795', '2342.00', 'this is the transfer descrioption', '99');
INSERT INTO `ct_items` VALUES('160', '795', 'pay_order', '3', 'CP795', '12.00', 'this is the transfer descrioption', '1');
INSERT INTO `ct_items` VALUES('161', '796', 'pay_order', '3', 'CP796', '34.00', ' ', '1');
INSERT INTO `ct_items` VALUES('162', '796', 'pay_order', '6', 'CP796', '12.00', ' ', '1');
INSERT INTO `ct_items` VALUES('164', '796', 'pay_order', '8', 'CP796', '21.00', ' ', '1');
INSERT INTO `ct_items` VALUES('165', '796', 'pay_order', '9', 'CP796', '15.00', ' ', '1');
INSERT INTO `ct_items` VALUES('168', '796', 'pay_order', '52', 'CP796', '55.00', ' ', '1');
INSERT INTO `ct_items` VALUES('171', '796', 'pay_order', '11', 'CP796', '33.00', ' ', '1');
INSERT INTO `ct_items` VALUES('179', '936', 'pay_order', '3', 'CP936', '56.00', ' ', '1');
INSERT INTO `ct_items` VALUES('180', '939', 'pay_order', '4', 'CP939', '434.00', ' ', '1');
INSERT INTO `ct_items` VALUES('183', '939', 'pay_order', '10', 'CP939', '455.00', ' ', '1');
INSERT INTO `ct_items` VALUES('184', '939', 'pay_order', '11', 'CP939', '545.00', ' ', '1');
INSERT INTO `ct_items` VALUES('185', '943', 'pay_order', '9', 'CP943', '324.00', ' ', '1');
INSERT INTO `ct_items` VALUES('189', '943', 'pay_order', '11', 'CP943', '424.00', ' ', '1');
INSERT INTO `ct_items` VALUES('190', '943', 'pay_order', '12', 'CP943', '42432.00', ' ', '1');
INSERT INTO `ct_items` VALUES('191', '944', 'pay_order', '3', 'CP944', '343.00', ' ', '1');
INSERT INTO `ct_items` VALUES('192', '944', 'pay_order', '8', 'CP944', '34.00', ' ', '1');
INSERT INTO `ct_items` VALUES('193', '945', 'pay_order', '3', 'CP945', '4334.00', ' ', '1');
INSERT INTO `ct_items` VALUES('195', '945', 'pay_order', '8', 'CP945', '43.00', ' ', '1');
INSERT INTO `ct_items` VALUES('196', '945', 'pay_order', '10', 'CP945', '4343.00', ' ', '1');
INSERT INTO `ct_items` VALUES('197', '946', 'pay_order', '3', 'CP946', '3423.00', ' ', '1');
INSERT INTO `ct_items` VALUES('198', '946', 'pay_order', '9', 'CP946', '434.00', ' ', '1');
INSERT INTO `ct_items` VALUES('199', '947', 'pay_order', '3', 'CP947', '32432.00', ' ', '1');
INSERT INTO `ct_items` VALUES('200', '949', 'pay_order', '6', 'CP949', '34.00', ' ', '1');
INSERT INTO `ct_items` VALUES('201', '950', 'pay_order', '3', 'CP950', '344.00', ' ', '1');
INSERT INTO `ct_items` VALUES('202', '950', 'pay_order', '9', 'CP950', '4343.00', ' ', '1');
INSERT INTO `ct_items` VALUES('203', '950', 'pay_order', '12', 'CP950', '434.00', ' ', '1');
INSERT INTO `ct_items` VALUES('206', '951', 'pay_order', '9', 'CP951', '4343.00', ' ', '1');
INSERT INTO `ct_items` VALUES('208', '951', 'pay_order', '8', 'CP951', '4343.00', ' ', '1');
INSERT INTO `ct_items` VALUES('209', '952', 'pay_order', '7', 'CP952', '15250000.00', ' ', '1');
INSERT INTO `ct_items` VALUES('210', '952', 'pay_order', '9', 'CP952', '3256000.00', ' ', '1');
INSERT INTO `ct_items` VALUES('211', '952', 'pay_order', '11', 'CP952', '5210000.00', ' ', '1');
INSERT INTO `ct_items` VALUES('212', '955', 'pay_order', '6', 'CP955', '454545.00', ' ', '99');
INSERT INTO `ct_items` VALUES('214', '955', 'pay_order', '8', 'CP955', '50000.00', ' ', '1');
INSERT INTO `ct_items` VALUES('217', '956', 'pay_order', '3', 'CP956', '50000.00', ' ', '1');
INSERT INTO `ct_items` VALUES('219', '956', 'pay_order', '6', 'CP956', '50000.00', ' ', '1');
INSERT INTO `ct_items` VALUES('220', '956', 'pay_order', '8', 'CP956', '25000.00', ' ', '1');
INSERT INTO `ct_items` VALUES('222', '956', 'pay_order', '12', 'CP956', '25000.00', ' ', '99');
INSERT INTO `ct_items` VALUES('223', '956', 'pay_order', '36', 'CP956', '50000.00', ' ', '1');


-- Dumping structure for table: `cus_order`

DROP TABLE IF EXISTS `cus_order`;
CREATE TABLE `cus_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `vh_year` varchar(45) DEFAULT NULL,
  `vh_color` varchar(45) DEFAULT NULL,
  `milage_max` double DEFAULT NULL,
  `vh_options` varchar(45) DEFAULT NULL,
  `cus_conditions` varchar(45) DEFAULT NULL,
  `order_actions` varchar(45) DEFAULT NULL,
  `max_price` double DEFAULT NULL,
  `pay_advance` double DEFAULT NULL,
  `gb` varchar(45) DEFAULT NULL,
  `cus_id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `pay_comments` varchar(45) DEFAULT NULL,
  `coordinator_id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` int(2) DEFAULT '1',
  `order_handler` varchar(45) DEFAULT '',
  `manual_bill` varchar(10) DEFAULT '',
  `vh_reserved` int(11) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `fk_cus_order_Maker_model1_idx` (`model_id`) USING BTREE,
  KEY `fk_cus_order_Customer1_idx` (`cus_id`) USING BTREE,
  KEY `fk_cus_order_coordinator1_idx` (`coordinator_id`) USING BTREE,
  CONSTRAINT `cus_order_ibfk_1` FOREIGN KEY (`coordinator_id`) REFERENCES `coordinator` (`coordinator_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cus_order_ibfk_2` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cus_order_ibfk_3` FOREIGN KEY (`model_id`) REFERENCES `maker_model` (`mod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;



-- Dumping data for table: cus_order

INSERT INTO `cus_order` VALUES('1', '1', '11', '2014', 'White', '0', 'Options', 'Requirements', '', '200', '100', '', '1', 'desc', 'pay op', '1', '2015-10-29', '2', '81', '', '141');
INSERT INTO `cus_order` VALUES('2', '2', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '2015-11-25', '99', '81', '', '0');
INSERT INTO `cus_order` VALUES('4', '3', '11', '2014', 'white', '0', '', '', 'action', '500000', '15000', '', '1', '', '', '2', '2015-11-17', '2', '81', '', '146');
INSERT INTO `cus_order` VALUES('5', '4', '28', '2014', 'G', '100', 'options', 'aa', 'actions', '5000000', '1000', '1000', '1', 'desc', 'pay op', '1', '2015-11-30', '99', '81', '5', '0');
INSERT INTO `cus_order` VALUES('6', '5', '28', '2015', 'color', '2000', 'options', ' customer', 'actions', '500', '10', '10', '1', 'dfecs', 'opt', '2', '2015-11-30', '99', '81', '6', '411');
INSERT INTO `cus_order` VALUES('7', '6', '11', '2014', '', '0', '', '', '', '500000', '0', '', '1', '', '', '1', '2015-11-13', '2', '81', '1', '144');
INSERT INTO `cus_order` VALUES('8', '7', '11', '2014', 'RED', '0', '', '', '', '5000000', '1000', '1000', '1', '', '', '1', '2015-11-13', '99', '81', '2', '9');
INSERT INTO `cus_order` VALUES('9', '8', '14', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '2015-11-16', '2', '81', '', '20');
INSERT INTO `cus_order` VALUES('10', '9', '11', '2014', 'color', '100', 'options', '', 'actions', '5000000', '1000', '', '1', 'desc', 'options', '2', '2015-11-17', '1', '81', '5', '0');
INSERT INTO `cus_order` VALUES('11', '10', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '2015-11-17', '2', '81', '', '152');
INSERT INTO `cus_order` VALUES('12', '11', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '2', '81', '', '145');
INSERT INTO `cus_order` VALUES('13', '12', '15', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '2015-11-17', '99', '81', '', '2');
INSERT INTO `cus_order` VALUES('14', '13', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '2016-02-23', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('15', '14', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('16', '15', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '99', '81', '', '0');
INSERT INTO `cus_order` VALUES('17', '16', '12', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('18', '17', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('20', '18', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('21', '19', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('22', '20', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('23', '21', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('24', '22', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('25', '23', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('26', '24', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('27', '25', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('28', '26', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('29', '27', '15', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('30', '28', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('31', '29', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('32', '30', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('33', '31', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('34', '32', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('35', '33', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('36', '34', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '99', '81', '', '0');
INSERT INTO `cus_order` VALUES('37', '35', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('38', '36', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('39', '37', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('40', '38', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('41', '39', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('42', '40', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('43', '41', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('44', '42', '11', '', '', '0', '', '', '', '0', '0', '', '1', '', '', '1', '0000-00-00', '1', '81', '', '0');
INSERT INTO `cus_order` VALUES('45', '43', '11', '', '', '0', '', '', '', '0', '0', '', '2', '', '', '1', '0000-00-00', '1', '81', '', '0');


-- Dumping structure for table: `customer`

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(150) DEFAULT '',
  `cus_inv_name` varchar(150) DEFAULT '' COMMENT 'customers name to show in invoices',
  `cus_address` varchar(255) DEFAULT '',
  `cus_inv_address` varchar(255) DEFAULT '',
  `cus_phone1` varchar(11) DEFAULT '',
  `cus_phone2` varchar(11) DEFAULT '',
  `cus_email1` varchar(45) DEFAULT '',
  `cus_email2` varchar(50) DEFAULT '',
  `other_contact` varchar(45) DEFAULT NULL,
  `comments` varchar(150) DEFAULT '',
  `cus_status` int(2) DEFAULT '1',
  `leasing_id` int(11) DEFAULT '0',
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



-- Dumping data for table: customer

INSERT INTO `customer` VALUES('1', 'DR.N.P.G.S.DAYARATNE', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '03756465461', '', 'npgsd@gmail.com', '', '', '', '1', '13');
INSERT INTO `customer` VALUES('2', 'Mr.Amila Prabath Dissanayake', 'Amila Dissanayake', 'No42, Cricle Road, Lake Round', 'fafadfaf', '3223324322', '07845454654', 'adfdafafadfafafa', 'fadfadf', 'fafaa', 'fafdafd', '1', '2');
INSERT INTO `customer` VALUES('3', 'fdafa', 'afafaf', 'faa', 'fafa', 'fafafa', 'fafa', 'faffa', 'fafaf', 'fafa', 'fadfafdaf', '99', '5');
INSERT INTO `customer` VALUES('4', 'Kamal Perera', 'Kamal Perera', '', '', '', '', '', '', '', '', '1', '2');
INSERT INTO `customer` VALUES('5', 'Saman', 'Saman Kumara', 'Pallandeniya', 'Pallandeniya , Kurunegala', '0714564454', '', 'samank@gmail.com', '', '', '', '1', '0');
INSERT INTO `customer` VALUES('6', 'Nimal Weragoda', 'Nimal', 'Nimal , maspotha , kurunegala', '', '0474988544', '', 'nimal@gmail.com', '', '', '', '1', '2');
INSERT INTO `customer` VALUES('7', 'Jayantha', 'Jayantha', 'Wariyapola', '', '1648484455', '', 'jaya@outlook.com', '', '', '', '1', '16');


-- Dumping structure for table: `driver_charges`

DROP TABLE IF EXISTS `driver_charges`;
CREATE TABLE `driver_charges` (
  `drch_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) DEFAULT NULL,
  `driver_name` varchar(45) DEFAULT '',
  `drch_date` date DEFAULT NULL,
  `vh_id` int(11) DEFAULT '0',
  `drch_desc` varchar(45) DEFAULT NULL,
  `drch_type` varchar(10) DEFAULT NULL COMMENT 'expense = 0 / pay = 1',
  `from` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT '',
  `drch_salary` double(10,2) DEFAULT '0.00',
  `drch_petrol` double(10,2) DEFAULT '0.00',
  `drch_expenses` double(10,2) DEFAULT '0.00',
  `drch_advance` double(10,2) DEFAULT '0.00',
  `drch_payment` double(10,2) DEFAULT '0.00',
  `pay_status` int(2) DEFAULT '0' COMMENT 'ok=1 | not confirmed =0 | cancelled = 2',
  `record_status` int(2) DEFAULT '1' COMMENT 'ok=1 | deleted=99',
  PRIMARY KEY (`drch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;



-- Dumping data for table: driver_charges

INSERT INTO `driver_charges` VALUES('1', '1', 'Buddika', '2016-03-28', '779', '', '0', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('2', '1', 'Buddika', '2016-03-28', '779', '', '0', '', '', '423423.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('3', '1', 'Buddika', '2016-03-28', '770', '', '0', '', '', '42243.00', '4234.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('4', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '4442.00', '0', '99');
INSERT INTO `driver_charges` VALUES('5', '1', 'Buddika', '2016-03-28', '779', '', '0', '', '', '0.00', '0.00', '34234.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('6', '1', 'Buddika', '2016-03-28', '748', '', '0', '', '', '0.00', '42424.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('7', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '423424.00', '0', '99');
INSERT INTO `driver_charges` VALUES('8', '1', 'Buddika', '2016-03-28', '779', '', '0', '', '', '424.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('9', '1', 'Buddika', '2016-03-28', '753', '', '0', '', '', '43.00', '43.00', '43.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('10', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '43434.00', '0', '99');
INSERT INTO `driver_charges` VALUES('11', '1', 'Buddika', '2016-03-28', '743', '', '0', '', '', '342342.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('12', '1', 'Buddika', '2016-03-28', '751', '', '0', '', '', '4242.00', '224.00', '42424.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('13', '1', 'Buddika', '2016-03-28', '764', '', '0', '', '', '424.00', '42424.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('14', '1', 'Buddika', '2016-03-28', '741', '', '0', '', '', '4242.00', '4244.00', '244.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('15', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '424244.00', '0', '1');
INSERT INTO `driver_charges` VALUES('16', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '2377.00', '0', '1');
INSERT INTO `driver_charges` VALUES('17', '1', 'Buddika', '2016-03-28', '779', '', '0', '', '', '5000.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('18', '1', 'Buddika', '2016-03-28', '779', '', '0', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('19', '1', 'Buddika', '2016-03-28', '769', '', '0', '', '', '500.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('20', '1', 'Buddika', '2016-03-28', '775', '', '0', '', '', '500.00', '500.00', '5000.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('21', '1', 'Buddika', '2016-03-28', '750', '', '0', '', '', '500.00', '500.00', '500.00', '500.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('22', '1', 'Buddika', '2016-03-28', '776', '', '0', '', '', '5000.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('23', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '60000.00', '0', '1');
INSERT INTO `driver_charges` VALUES('24', '2', 'Kamal', '2016-03-28', '779', '', '0', '', '', '5000.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('25', '2', 'Kamal', '2016-03-28', '715', '', '0', '', '', '0.00', '2000.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('26', '2', 'Kamal', '2016-03-28', '713', '', '0', '', '', '454.00', '54454.00', '45444.00', '5000.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('27', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '5000.00', '0', '1');
INSERT INTO `driver_charges` VALUES('28', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '500.00', '0', '1');
INSERT INTO `driver_charges` VALUES('29', '2', 'Kamal', '2016-03-28', '779', '', '0', '', '', '5000.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('30', '1', 'Buddika', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '5000.00', '0', '1');
INSERT INTO `driver_charges` VALUES('31', '2', 'Kamal', '2016-03-28', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '70000.00', '0', '1');
INSERT INTO `driver_charges` VALUES('32', '1', 'Buddika', '2016-03-29', '3', '', '0', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('33', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('34', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('35', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('36', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('37', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('38', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('39', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('40', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('41', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('42', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('43', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('44', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('45', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('46', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('47', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('48', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('49', '1', '', '2016-03-29', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12342.00', '0', '1');
INSERT INTO `driver_charges` VALUES('50', '1', 'Buddika', '2016-03-29', '779', '', '0', '', '', '444.00', '25.00', '51.00', '100.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('51', '1', 'Buddika', '2016-04-04', '779', '', '0', '', '', '500000.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('52', '1', 'Buddika', '2016-04-04', '772', '', '0', '', '', '0.00', '0.00', '544.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('53', '1', 'Buddika', '2016-04-04', '771', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '5000.00', '1', '1');
INSERT INTO `driver_charges` VALUES('54', '1', 'Buddika', '2016-04-04', '752', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '152000.00', '1', '1');
INSERT INTO `driver_charges` VALUES('55', '2', 'Kamal', '2016-04-11', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '500.00', '0', '1');
INSERT INTO `driver_charges` VALUES('56', '2', 'Kamal', '2016-04-11', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '500.00', '0', '1');
INSERT INTO `driver_charges` VALUES('57', '1', 'Buddika', '2016-04-20', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '5000.00', '0', '1');
INSERT INTO `driver_charges` VALUES('58', '1', 'Buddika', '2016-04-22', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '850.00', '0', '1');
INSERT INTO `driver_charges` VALUES('59', '1', 'Buddika', '2016-04-22', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '800.00', '1', '1');
INSERT INTO `driver_charges` VALUES('60', '1', 'Buddika', '2016-04-22', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '12355.00', '0', '1');
INSERT INTO `driver_charges` VALUES('61', '1', 'Buddika', '2016-04-22', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '120.00', '0', '1');
INSERT INTO `driver_charges` VALUES('62', '1', 'Buddika', '2016-04-22', '779', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '800.00', '0', '1');
INSERT INTO `driver_charges` VALUES('63', '1', 'Buddika', '2016-04-22', '0', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '32463.00', '0', '1');
INSERT INTO `driver_charges` VALUES('64', '1', 'Buddika', '2016-04-22', '0', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '31235.00', '0', '1');
INSERT INTO `driver_charges` VALUES('65', '1', 'Buddika', '2016-04-22', '0', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '8000.00', '0', '1');
INSERT INTO `driver_charges` VALUES('66', '1', 'Buddika', '2016-04-22', '0', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '500.00', '0', '99');
INSERT INTO `driver_charges` VALUES('67', '1', 'Buddika', '2016-04-22', '779', 'abc', '0', 'bcvb', 'cv', '100.00', '5500.00', '3500.00', '4200.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('68', '1', 'Buddika', '2016-04-22', '779', 'zdfs', '0', 'sdfsdf', 'sdfsd', '150.00', '2500.00', '200.00', '500.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('69', '1', 'Buddika', '2016-04-22', '779', 'zdfs', '0', 'sdfsdf', 'sdfsd', '150.00', '2500.00', '200.00', '500.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('70', '1', 'Buddika', '2016-04-22', '779', 'cffgfr', '0', 'mnbb', 'jihn', '150.00', '50.00', '50.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('71', '1', 'Buddika', '2016-04-22', '779', 'vccvgf', '0', 'fvcc', 'hjvj', '100.00', '150.00', '100.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('72', '1', 'Buddika', '2016-04-22', '775', 'vccvgf', '0', 'fvcc', 'hjvj', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('73', '1', 'Buddika', '2016-04-22', '779', '', '0', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1');
INSERT INTO `driver_charges` VALUES('74', '1', 'Buddika', '2016-04-25', '0', '', '1', '', '', '0.00', '0.00', '0.00', '0.00', '5000.00', '0', '1');


-- Dumping structure for table: `img_category`

DROP TABLE IF EXISTS `img_category`;
CREATE TABLE `img_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_short_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: img_category

INSERT INTO `img_category` VALUES('1', 'GOVERNMENT', 'GOV');
INSERT INTO `img_category` VALUES('2', 'PRIVATE', 'PVT');
INSERT INTO `img_category` VALUES('3', 'RELIGOUS', 'REL');


-- Dumping structure for table: `img_file`

DROP TABLE IF EXISTS `img_file`;
CREATE TABLE `img_file` (
  `image_ai_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_added_date` date DEFAULT NULL,
  `file_last_update_date` date DEFAULT NULL,
  `pdf_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rack_no` int(11) DEFAULT NULL,
  `row_no` int(11) DEFAULT NULL,
  `box_no` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`image_ai_id`),
  UNIQUE KEY `file_id` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: img_file

INSERT INTO `img_file` VALUES('50', 'PVT', '6', '', ' ', '2018-06-22', '2018-06-22', 'PVT_6/6.pdf', 'PVT_6/6.jpg', '0', '0', '0', '');
INSERT INTO `img_file` VALUES('51', 'PVT', '7', '543', ' tearaer', '2018-06-22', '2018-06-22', '', '', '4324', '423', '243', '');
INSERT INTO `img_file` VALUES('52', 'PVT', '8', '342', ' ', '2018-06-22', '2018-06-28', '', '', '23', '43', '43', '');
INSERT INTO `img_file` VALUES('53', 'PVT', '324', '432', ' description', '2018-06-22', '2018-06-28', 'PVT_324/324.pdf', '', '0', '0', '526', '');


-- Dumping structure for table: `img_image`

DROP TABLE IF EXISTS `img_image`;
CREATE TABLE `img_image` (
  `image_ai_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_ai_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `image_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_added_date` datetime DEFAULT NULL,
  PRIMARY KEY (`image_ai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: img_image

INSERT INTO `img_image` VALUES('1', '0', '0', '', '', '');


-- Dumping structure for table: `img_subject`

DROP TABLE IF EXISTS `img_subject`;
CREATE TABLE `img_subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_status` int(2) DEFAULT '1',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: img_subject

INSERT INTO `img_subject` VALUES('1', 'PRIVATE', 'PVT', '1');
INSERT INTO `img_subject` VALUES('2', 'GOVERNMENT', 'GOV', '1');
INSERT INTO `img_subject` VALUES('3', 'CHARITY', 'CHR', '1');
INSERT INTO `img_subject` VALUES('4', 'dfafa', 'fadfa', '99');
INSERT INTO `img_subject` VALUES('5', 'daf', 'test', '99');
INSERT INTO `img_subject` VALUES('6', 'dfafa', 'fadfa', '99');


-- Dumping structure for table: `in_sysprvlg`

DROP TABLE IF EXISTS `in_sysprvlg`;
CREATE TABLE `in_sysprvlg` (
  `prvCode` int(11) NOT NULL,
  `prvName` varchar(100) NOT NULL,
  `prvStatus` int(3) NOT NULL DEFAULT '1',
  `usrPrvMnuName` varchar(100) NOT NULL,
  `usrPrvMnuName_sinhala` varchar(255) DEFAULT NULL,
  `usrPrvMnuIcon` varchar(45) DEFAULT '',
  `usrPrvMnuPath` varchar(100) NOT NULL,
  `usrPrnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`prvCode`),
  UNIQUE KEY `user_privilage_code` (`prvCode`) USING BTREE,
  UNIQUE KEY `user_privilage_code_2` (`prvCode`,`prvName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table: in_sysprvlg

INSERT INTO `in_sysprvlg` VALUES('0', 'Credit Transfer', '1', 'Credit Transfer', '', '', 'credit_transfer.php', '140');
INSERT INTO `in_sysprvlg` VALUES('100', 'System Data', '1', 'System Data', '', 'systemSettings.png', '-', '0');
INSERT INTO `in_sysprvlg` VALUES('101', 'General', '1', 'General', '', 'systemSettings.png', '-', '0');
INSERT INTO `in_sysprvlg` VALUES('103', 'View', '1', 'View', '', '-', '-', '0');
INSERT INTO `in_sysprvlg` VALUES('106', 'File List', '1', 'View File List', '', 'systemSettings.png', 'img_view_file_list.php', '103');
INSERT INTO `in_sysprvlg` VALUES('112', 'Image Registrations', '1', 'Image Registrations', '', 'systemSettings.png', 'img_reg.php', '101');
INSERT INTO `in_sysprvlg` VALUES('114', 'System Settings', '1', 'System Settings', '', 'systemSettings.png', 'settings_dashboard.php', '120');
INSERT INTO `in_sysprvlg` VALUES('115', 'User Management', '1', 'User Management', '', 'usermanege.png', 'userManegement.php', '120');
INSERT INTO `in_sysprvlg` VALUES('116', 'Subject Management', '1', 'Subject Management', '', 'systemSettings.png', 'subject_management.php', '100');
INSERT INTO `in_sysprvlg` VALUES('120', 'Settings', '1', 'Settings', '', '-', '-', '0');
INSERT INTO `in_sysprvlg` VALUES('130', 'News', '1', 'News', '', '-', 'news.php', '123');
INSERT INTO `in_sysprvlg` VALUES('131', 'Technical Specification', '1', 'Technical Specification', '', '', 'vehicle_tech_spec.php', '123');
INSERT INTO `in_sysprvlg` VALUES('132', 'Home Page', '1', 'Home Page', '', '', 'web_homepg_content.php', '123');
INSERT INTO `in_sysprvlg` VALUES('133', 'System Backup', '1', 'System Backup', '', '-', 'run.php', '120');


-- Dumping structure for table: `in_usr`

DROP TABLE IF EXISTS `in_usr`;
CREATE TABLE `in_usr` (
  `usrID` int(11) NOT NULL AUTO_INCREMENT,
  `usrName` varchar(50) NOT NULL DEFAULT '',
  `usrFName` varchar(100) DEFAULT NULL,
  `usrLName` varchar(100) DEFAULT NULL,
  `usrLevel` int(11) NOT NULL DEFAULT '1',
  `usrPwd` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `usrRegDate` date NOT NULL DEFAULT '0000-00-00',
  `usrStatus` int(1) NOT NULL DEFAULT '1',
  `usrAddress` varchar(200) DEFAULT NULL,
  `usrEmail` varchar(150) DEFAULT NULL,
  `lstLgDate` date NOT NULL,
  `lstLgTime` time NOT NULL,
  `usrEmpNo` varchar(100) DEFAULT NULL,
  `usrNIC` varchar(20) DEFAULT NULL,
  `usrMobileNo` varchar(20) DEFAULT NULL,
  `usrWorkTelNo` varchar(20) DEFAULT NULL,
  `usrHomeTelNo` varchar(20) DEFAULT NULL,
  `userBranchID` int(11) NOT NULL,
  PRIMARY KEY (`usrID`,`usrName`),
  UNIQUE KEY `usrEmpNo` (`usrEmpNo`) USING BTREE,
  UNIQUE KEY `usrNIC` (`usrNIC`) USING BTREE,
  KEY `id` (`usrID`) USING BTREE,
  KEY `user_level` (`usrLevel`) USING BTREE,
  KEY `user_name` (`usrName`) USING BTREE,
  CONSTRAINT `in_usr_ibfk_1` FOREIGN KEY (`usrLevel`) REFERENCES `in_usrlevel` (`lvID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;



-- Dumping data for table: in_usr

INSERT INTO `in_usr` VALUES('78', 'mdcc', '-', '-', '18', '56e2636af1fedd1c6f89df1ea09bf1ba120f52e7', '2014-07-07', '1', '-', '', '2014-07-07', '10:30:59', '-', '', '', '', '', '76');
INSERT INTO `in_usr` VALUES('81', 'admin', '', '', '188', '56e2636af1fedd1c6f89df1ea09bf1ba120f52e7', '2014-07-07', '1', '', '', '2014-07-07', '10:37:22', '99999', '999999999V', '', '', '', '76');
INSERT INTO `in_usr` VALUES('97', 'Ranjith', '', '', '188', 'df1bd9b24501d25b26ddccd33111a70bb486cf30', '2015-08-13', '1', '', '', '2015-08-13', '01:34:54', '00', '123456211v', '', '', '', '1');
INSERT INTO `in_usr` VALUES('102', 'Thiwanka', '', '', '194', '2acbd0425ecc48ee18f85525b2039a995c588b7d', '2015-08-14', '1', '', '', '2015-08-14', '02:41:47', '123456123v', '123456123v', '', '', '', '1');
INSERT INTO `in_usr` VALUES('108', 'Roshan', '', '', '194', 'bc1dcbbfc185ac74d571393c3ce83a746d8c5142', '2015-08-14', '1', '', '', '2015-08-14', '02:43:46', '123', '323456123v', '', '', '', '1');
INSERT INTO `in_usr` VALUES('109', 'Gauri', '', '', '194', 'acfc34f340b9cfc4f8e50aed601834735c3c6d41', '2015-08-14', '1', '', '', '2015-08-14', '02:44:21', '12', '123654123v', '', '', '', '1');
INSERT INTO `in_usr` VALUES('111', 'saman', 'Saman', '', '194', '0837c36df900b197cfe68c51da2968ff368702f3', '2016-03-21', '1', '', '', '2016-03-21', '06:37:46', '', '954646545V', '', '', '', '1');


-- Dumping structure for table: `in_usrlevel`

DROP TABLE IF EXISTS `in_usrlevel`;
CREATE TABLE `in_usrlevel` (
  `lvID` int(11) NOT NULL AUTO_INCREMENT,
  `lvName` varchar(100) DEFAULT NULL,
  `usrLvlPrvSeq` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lvID`),
  UNIQUE KEY `usrLvlPrvSeq` (`usrLvlPrvSeq`) USING BTREE,
  UNIQUE KEY `admin_level_name` (`lvName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;



-- Dumping data for table: in_usrlevel

INSERT INTO `in_usrlevel` VALUES('18', 'Super User', '20');
INSERT INTO `in_usrlevel` VALUES('188', 'admin', '1');
INSERT INTO `in_usrlevel` VALUES('194', 'User', '2');


-- Dumping structure for table: `in_usrlvlpriv`

DROP TABLE IF EXISTS `in_usrlvlpriv`;
CREATE TABLE `in_usrlvlpriv` (
  `usrLvl` int(11) NOT NULL,
  `usrPrivilage` int(11) NOT NULL,
  PRIMARY KEY (`usrLvl`,`usrPrivilage`),
  UNIQUE KEY `usrLvl` (`usrLvl`,`usrPrivilage`) USING BTREE,
  KEY `usrPrivilage` (`usrPrivilage`) USING BTREE,
  CONSTRAINT `in_usrlvlpriv_ibfk_1` FOREIGN KEY (`usrLvl`) REFERENCES `in_usrlevel` (`lvID`) ON UPDATE CASCADE,
  CONSTRAINT `in_usrlvlpriv_ibfk_2` FOREIGN KEY (`usrPrivilage`) REFERENCES `in_sysprvlg` (`prvCode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table: in_usrlvlpriv



-- Dumping structure for table: `in_usrprvlg`

DROP TABLE IF EXISTS `in_usrprvlg`;
CREATE TABLE `in_usrprvlg` (
  `usrID` int(11) NOT NULL,
  `usrPrvCode` int(11) NOT NULL,
  PRIMARY KEY (`usrID`,`usrPrvCode`),
  KEY `usrPrvCode` (`usrPrvCode`) USING BTREE,
  KEY `usrID` (`usrID`,`usrPrvCode`) USING BTREE,
  CONSTRAINT `in_usrprvlg_ibfk_1` FOREIGN KEY (`usrID`) REFERENCES `in_usr` (`usrID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table: in_usrprvlg

INSERT INTO `in_usrprvlg` VALUES('81', '0');
INSERT INTO `in_usrprvlg` VALUES('97', '0');
INSERT INTO `in_usrprvlg` VALUES('111', '0');
INSERT INTO `in_usrprvlg` VALUES('81', '99');
INSERT INTO `in_usrprvlg` VALUES('78', '100');
INSERT INTO `in_usrprvlg` VALUES('81', '100');
INSERT INTO `in_usrprvlg` VALUES('97', '100');
INSERT INTO `in_usrprvlg` VALUES('102', '100');
INSERT INTO `in_usrprvlg` VALUES('108', '100');
INSERT INTO `in_usrprvlg` VALUES('109', '100');
INSERT INTO `in_usrprvlg` VALUES('111', '100');
INSERT INTO `in_usrprvlg` VALUES('78', '101');
INSERT INTO `in_usrprvlg` VALUES('81', '101');
INSERT INTO `in_usrprvlg` VALUES('97', '101');
INSERT INTO `in_usrprvlg` VALUES('102', '101');
INSERT INTO `in_usrprvlg` VALUES('108', '101');
INSERT INTO `in_usrprvlg` VALUES('109', '101');
INSERT INTO `in_usrprvlg` VALUES('111', '101');
INSERT INTO `in_usrprvlg` VALUES('78', '103');
INSERT INTO `in_usrprvlg` VALUES('81', '103');
INSERT INTO `in_usrprvlg` VALUES('97', '103');
INSERT INTO `in_usrprvlg` VALUES('102', '103');
INSERT INTO `in_usrprvlg` VALUES('108', '103');
INSERT INTO `in_usrprvlg` VALUES('109', '103');
INSERT INTO `in_usrprvlg` VALUES('111', '103');
INSERT INTO `in_usrprvlg` VALUES('78', '104');
INSERT INTO `in_usrprvlg` VALUES('81', '104');
INSERT INTO `in_usrprvlg` VALUES('97', '104');
INSERT INTO `in_usrprvlg` VALUES('102', '104');
INSERT INTO `in_usrprvlg` VALUES('108', '104');
INSERT INTO `in_usrprvlg` VALUES('109', '104');
INSERT INTO `in_usrprvlg` VALUES('111', '104');
INSERT INTO `in_usrprvlg` VALUES('78', '105');
INSERT INTO `in_usrprvlg` VALUES('81', '105');
INSERT INTO `in_usrprvlg` VALUES('97', '105');
INSERT INTO `in_usrprvlg` VALUES('102', '105');
INSERT INTO `in_usrprvlg` VALUES('108', '105');
INSERT INTO `in_usrprvlg` VALUES('109', '105');
INSERT INTO `in_usrprvlg` VALUES('111', '105');
INSERT INTO `in_usrprvlg` VALUES('78', '106');
INSERT INTO `in_usrprvlg` VALUES('81', '106');
INSERT INTO `in_usrprvlg` VALUES('97', '106');
INSERT INTO `in_usrprvlg` VALUES('111', '106');
INSERT INTO `in_usrprvlg` VALUES('78', '107');
INSERT INTO `in_usrprvlg` VALUES('81', '107');
INSERT INTO `in_usrprvlg` VALUES('97', '107');
INSERT INTO `in_usrprvlg` VALUES('102', '107');
INSERT INTO `in_usrprvlg` VALUES('108', '107');
INSERT INTO `in_usrprvlg` VALUES('109', '107');
INSERT INTO `in_usrprvlg` VALUES('111', '107');
INSERT INTO `in_usrprvlg` VALUES('78', '108');
INSERT INTO `in_usrprvlg` VALUES('81', '108');
INSERT INTO `in_usrprvlg` VALUES('97', '108');
INSERT INTO `in_usrprvlg` VALUES('102', '108');
INSERT INTO `in_usrprvlg` VALUES('108', '108');
INSERT INTO `in_usrprvlg` VALUES('109', '108');
INSERT INTO `in_usrprvlg` VALUES('111', '108');
INSERT INTO `in_usrprvlg` VALUES('78', '109');
INSERT INTO `in_usrprvlg` VALUES('81', '109');
INSERT INTO `in_usrprvlg` VALUES('97', '109');
INSERT INTO `in_usrprvlg` VALUES('102', '109');
INSERT INTO `in_usrprvlg` VALUES('108', '109');
INSERT INTO `in_usrprvlg` VALUES('109', '109');
INSERT INTO `in_usrprvlg` VALUES('111', '109');
INSERT INTO `in_usrprvlg` VALUES('78', '110');
INSERT INTO `in_usrprvlg` VALUES('81', '110');
INSERT INTO `in_usrprvlg` VALUES('97', '110');
INSERT INTO `in_usrprvlg` VALUES('102', '110');
INSERT INTO `in_usrprvlg` VALUES('108', '110');
INSERT INTO `in_usrprvlg` VALUES('109', '110');
INSERT INTO `in_usrprvlg` VALUES('111', '110');
INSERT INTO `in_usrprvlg` VALUES('78', '111');
INSERT INTO `in_usrprvlg` VALUES('81', '111');
INSERT INTO `in_usrprvlg` VALUES('97', '111');
INSERT INTO `in_usrprvlg` VALUES('102', '111');
INSERT INTO `in_usrprvlg` VALUES('108', '111');
INSERT INTO `in_usrprvlg` VALUES('109', '111');
INSERT INTO `in_usrprvlg` VALUES('111', '111');
INSERT INTO `in_usrprvlg` VALUES('81', '112');
INSERT INTO `in_usrprvlg` VALUES('78', '114');
INSERT INTO `in_usrprvlg` VALUES('81', '114');
INSERT INTO `in_usrprvlg` VALUES('97', '114');
INSERT INTO `in_usrprvlg` VALUES('111', '114');
INSERT INTO `in_usrprvlg` VALUES('78', '115');
INSERT INTO `in_usrprvlg` VALUES('81', '115');
INSERT INTO `in_usrprvlg` VALUES('97', '115');
INSERT INTO `in_usrprvlg` VALUES('111', '115');
INSERT INTO `in_usrprvlg` VALUES('78', '116');
INSERT INTO `in_usrprvlg` VALUES('81', '116');
INSERT INTO `in_usrprvlg` VALUES('97', '116');
INSERT INTO `in_usrprvlg` VALUES('102', '116');
INSERT INTO `in_usrprvlg` VALUES('108', '116');
INSERT INTO `in_usrprvlg` VALUES('109', '116');
INSERT INTO `in_usrprvlg` VALUES('111', '116');
INSERT INTO `in_usrprvlg` VALUES('78', '117');
INSERT INTO `in_usrprvlg` VALUES('81', '117');
INSERT INTO `in_usrprvlg` VALUES('97', '117');
INSERT INTO `in_usrprvlg` VALUES('102', '117');
INSERT INTO `in_usrprvlg` VALUES('108', '117');
INSERT INTO `in_usrprvlg` VALUES('109', '117');
INSERT INTO `in_usrprvlg` VALUES('111', '117');
INSERT INTO `in_usrprvlg` VALUES('78', '120');
INSERT INTO `in_usrprvlg` VALUES('81', '120');
INSERT INTO `in_usrprvlg` VALUES('97', '120');
INSERT INTO `in_usrprvlg` VALUES('102', '120');
INSERT INTO `in_usrprvlg` VALUES('108', '120');
INSERT INTO `in_usrprvlg` VALUES('109', '120');
INSERT INTO `in_usrprvlg` VALUES('111', '120');
INSERT INTO `in_usrprvlg` VALUES('78', '121');
INSERT INTO `in_usrprvlg` VALUES('81', '121');
INSERT INTO `in_usrprvlg` VALUES('97', '121');
INSERT INTO `in_usrprvlg` VALUES('102', '121');
INSERT INTO `in_usrprvlg` VALUES('108', '121');
INSERT INTO `in_usrprvlg` VALUES('109', '121');
INSERT INTO `in_usrprvlg` VALUES('111', '121');
INSERT INTO `in_usrprvlg` VALUES('78', '122');
INSERT INTO `in_usrprvlg` VALUES('81', '122');
INSERT INTO `in_usrprvlg` VALUES('97', '122');
INSERT INTO `in_usrprvlg` VALUES('102', '122');
INSERT INTO `in_usrprvlg` VALUES('108', '122');
INSERT INTO `in_usrprvlg` VALUES('109', '122');
INSERT INTO `in_usrprvlg` VALUES('111', '122');
INSERT INTO `in_usrprvlg` VALUES('78', '123');
INSERT INTO `in_usrprvlg` VALUES('81', '123');
INSERT INTO `in_usrprvlg` VALUES('97', '123');
INSERT INTO `in_usrprvlg` VALUES('102', '123');
INSERT INTO `in_usrprvlg` VALUES('108', '123');
INSERT INTO `in_usrprvlg` VALUES('109', '123');
INSERT INTO `in_usrprvlg` VALUES('111', '123');
INSERT INTO `in_usrprvlg` VALUES('78', '130');
INSERT INTO `in_usrprvlg` VALUES('81', '130');
INSERT INTO `in_usrprvlg` VALUES('97', '130');
INSERT INTO `in_usrprvlg` VALUES('102', '130');
INSERT INTO `in_usrprvlg` VALUES('108', '130');
INSERT INTO `in_usrprvlg` VALUES('109', '130');
INSERT INTO `in_usrprvlg` VALUES('111', '130');
INSERT INTO `in_usrprvlg` VALUES('78', '131');
INSERT INTO `in_usrprvlg` VALUES('81', '131');
INSERT INTO `in_usrprvlg` VALUES('97', '131');
INSERT INTO `in_usrprvlg` VALUES('102', '131');
INSERT INTO `in_usrprvlg` VALUES('108', '131');
INSERT INTO `in_usrprvlg` VALUES('109', '131');
INSERT INTO `in_usrprvlg` VALUES('111', '131');
INSERT INTO `in_usrprvlg` VALUES('78', '132');
INSERT INTO `in_usrprvlg` VALUES('81', '132');
INSERT INTO `in_usrprvlg` VALUES('97', '132');
INSERT INTO `in_usrprvlg` VALUES('102', '132');
INSERT INTO `in_usrprvlg` VALUES('108', '132');
INSERT INTO `in_usrprvlg` VALUES('109', '132');
INSERT INTO `in_usrprvlg` VALUES('111', '132');
INSERT INTO `in_usrprvlg` VALUES('78', '133');
INSERT INTO `in_usrprvlg` VALUES('81', '133');
INSERT INTO `in_usrprvlg` VALUES('97', '133');
INSERT INTO `in_usrprvlg` VALUES('102', '133');
INSERT INTO `in_usrprvlg` VALUES('108', '133');
INSERT INTO `in_usrprvlg` VALUES('109', '133');
INSERT INTO `in_usrprvlg` VALUES('111', '133');
INSERT INTO `in_usrprvlg` VALUES('81', '134');
INSERT INTO `in_usrprvlg` VALUES('111', '134');
INSERT INTO `in_usrprvlg` VALUES('81', '136');
INSERT INTO `in_usrprvlg` VALUES('97', '136');
INSERT INTO `in_usrprvlg` VALUES('111', '136');
INSERT INTO `in_usrprvlg` VALUES('81', '137');
INSERT INTO `in_usrprvlg` VALUES('81', '140');
INSERT INTO `in_usrprvlg` VALUES('97', '140');
INSERT INTO `in_usrprvlg` VALUES('111', '140');
INSERT INTO `in_usrprvlg` VALUES('81', '142');
INSERT INTO `in_usrprvlg` VALUES('111', '142');
INSERT INTO `in_usrprvlg` VALUES('81', '143');
INSERT INTO `in_usrprvlg` VALUES('111', '143');
INSERT INTO `in_usrprvlg` VALUES('81', '144');
INSERT INTO `in_usrprvlg` VALUES('111', '144');
INSERT INTO `in_usrprvlg` VALUES('81', '145');
INSERT INTO `in_usrprvlg` VALUES('111', '145');
INSERT INTO `in_usrprvlg` VALUES('81', '146');
INSERT INTO `in_usrprvlg` VALUES('111', '146');
INSERT INTO `in_usrprvlg` VALUES('81', '147');
INSERT INTO `in_usrprvlg` VALUES('111', '147');
INSERT INTO `in_usrprvlg` VALUES('81', '150');
INSERT INTO `in_usrprvlg` VALUES('97', '150');
INSERT INTO `in_usrprvlg` VALUES('111', '150');
INSERT INTO `in_usrprvlg` VALUES('81', '155');
INSERT INTO `in_usrprvlg` VALUES('111', '155');
INSERT INTO `in_usrprvlg` VALUES('81', '156');
INSERT INTO `in_usrprvlg` VALUES('81', '157');
INSERT INTO `in_usrprvlg` VALUES('111', '157');
INSERT INTO `in_usrprvlg` VALUES('81', '158');
INSERT INTO `in_usrprvlg` VALUES('111', '158');
INSERT INTO `in_usrprvlg` VALUES('81', '159');
INSERT INTO `in_usrprvlg` VALUES('111', '159');
INSERT INTO `in_usrprvlg` VALUES('81', '160');
INSERT INTO `in_usrprvlg` VALUES('111', '160');
INSERT INTO `in_usrprvlg` VALUES('81', '161');
INSERT INTO `in_usrprvlg` VALUES('111', '161');
INSERT INTO `in_usrprvlg` VALUES('81', '162');
INSERT INTO `in_usrprvlg` VALUES('81', '163');
INSERT INTO `in_usrprvlg` VALUES('81', '164');
INSERT INTO `in_usrprvlg` VALUES('111', '164');
INSERT INTO `in_usrprvlg` VALUES('81', '165');
INSERT INTO `in_usrprvlg` VALUES('111', '165');
INSERT INTO `in_usrprvlg` VALUES('81', '166');


-- Dumping structure for table: `insurance_company`

DROP TABLE IF EXISTS `insurance_company`;
CREATE TABLE `insurance_company` (
  `ln_id` int(11) NOT NULL AUTO_INCREMENT,
  `ln_name` varchar(45) DEFAULT NULL,
  `ln_address` varchar(100) DEFAULT NULL,
  `ln_contact` varchar(45) DEFAULT '',
  `ln_optional_contact` varchar(45) DEFAULT NULL,
  `ln_email` varchar(100) DEFAULT NULL,
  `ln_fax` varchar(45) DEFAULT NULL,
  `ln_status` int(2) DEFAULT '0',
  PRIMARY KEY (`ln_id`),
  UNIQUE KEY `ls_name` (`ln_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;



-- Dumping data for table: insurance_company

INSERT INTO `insurance_company` VALUES('2', 'Capital Insurance', 'Kurunegala', '0156444444', '3242342434', 'adfafd@fdas.com', '15454546544', '1');
INSERT INTO `insurance_company` VALUES('5', 'ABC', 'Kurunegala', '08154654', '07746777', 'abc@gmail.com', '0375415132', '1');
INSERT INTO `insurance_company` VALUES('6', 'dfafda', 'fadafa', 'fafaf', 'fadaa', 'fadaf', 'fadafd', '99');
INSERT INTO `insurance_company` VALUES('8', 'fdaa', '', '', '', '', '', '99');
INSERT INTO `insurance_company` VALUES('9', 'fdadad', '', '', '', '', '', '99');
INSERT INTO `insurance_company` VALUES('10', 'CDB', 'Kandy', '03787446', '6546464646', 'cdb@yahoo.com', '464', '1');
INSERT INTO `insurance_company` VALUES('11', 'fadfaaf334fdadaf', '', '', '', '', '', '99');
INSERT INTO `insurance_company` VALUES('12', 'dafda', 'fdafda', 'fadfda', 'fda', '', '', '99');
INSERT INTO `insurance_company` VALUES('13', 'AIA', 'Kandy', '0780665464', '037225461', 'aia@gmail.com', '0372225461', '1');
INSERT INTO `insurance_company` VALUES('14', '123@ACB', 'Kurunegala', '0813265478', '0814569820', '123abc@gmail.com', '0812451369', '1');
INSERT INTO `insurance_company` VALUES('15', 'seyan', 'kurunegala', '0713940750', '0713940750', 'sam@gmail.com', '0713940750', '1');
INSERT INTO `insurance_company` VALUES('17', '123456', 'ku', '0372225461', '0713940750', 'asd@gmail.com', '0713940750', '1');
INSERT INTO `insurance_company` VALUES('19', 'cooperative', 'kurunegala', '0375641230', '0372156980', 'cooperative@hu.com', '0372165478', '99');


-- Dumping structure for table: `leasing`

DROP TABLE IF EXISTS `leasing`;
CREATE TABLE `leasing` (
  `ls_id` int(11) NOT NULL AUTO_INCREMENT,
  `ls_name` varchar(45) DEFAULT NULL,
  `ls_address` varchar(100) DEFAULT NULL,
  `ls_contact` varchar(45) DEFAULT '',
  `ls_optional_contact` varchar(45) DEFAULT NULL,
  `ls_email` varchar(100) DEFAULT NULL,
  `ls_fax` varchar(45) DEFAULT NULL,
  `ls_status` int(2) DEFAULT '0',
  PRIMARY KEY (`ls_id`),
  UNIQUE KEY `ls_name` (`ls_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;



-- Dumping data for table: leasing

INSERT INTO `leasing` VALUES('2', 'Capital Leasingghfg', 'Kurunegala', '0156444444', '3242342434', 'adfafd@fdas.com', '15454546544', '1');
INSERT INTO `leasing` VALUES('5', 'ABC', 'Kurunegala', '08154654', '07746777', 'abc@gmail.com', '0375415132', '1');
INSERT INTO `leasing` VALUES('6', 'dfafda', 'fadafa', 'fafaf', 'fadaa', 'fadaf', 'fadafd', '99');
INSERT INTO `leasing` VALUES('8', 'fdaa', '', '', '', '', '', '99');
INSERT INTO `leasing` VALUES('9', 'fdadad', '', '', '', '', '', '99');
INSERT INTO `leasing` VALUES('10', 'CDB', 'Kandy', '03787446', '6546464646', 'cdb@yahoo.com', '464', '99');
INSERT INTO `leasing` VALUES('11', 'fadfaaf334fdadaf', '', '', '', '', '', '99');
INSERT INTO `leasing` VALUES('12', 'dafda', 'fdafda', 'fadfda', 'fda', '', '', '99');
INSERT INTO `leasing` VALUES('13', 'LOLC', 'Kandy', '0780665464', '', 'lolc@gmail.com', '', '99');
INSERT INTO `leasing` VALUES('14', '', '', '', '', '', '', '99');
INSERT INTO `leasing` VALUES('15', '123', 'kurunegala', '0372225461', '0372225461', 'abc@gmail.com', '0372225461', '1');
INSERT INTO `leasing` VALUES('16', 'dg', 'gdhf', 'fgh', 'gh', '', '', '1');


-- Dumping structure for table: `maker`

DROP TABLE IF EXISTS `maker`;
CREATE TABLE `maker` (
  `maker_id` int(11) NOT NULL AUTO_INCREMENT,
  `maker_name` varchar(45) DEFAULT NULL,
  `desc` varchar(100) DEFAULT '',
  `maker_status` int(1) DEFAULT '0',
  PRIMARY KEY (`maker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;



-- Dumping data for table: maker

INSERT INTO `maker` VALUES('11', 'TOYOTA', '', '1');
INSERT INTO `maker` VALUES('12', 'HONDA', '-', '1');
INSERT INTO `maker` VALUES('13', 'MAZDA', '', '1');
INSERT INTO `maker` VALUES('14', 'SUZUKI', '', '1');
INSERT INTO `maker` VALUES('15', 'MITSUBISHI', '', '1');
INSERT INTO `maker` VALUES('17', 'DAIHATSU', '', '1');
INSERT INTO `maker` VALUES('18', 'ISUZU', '', '1');
INSERT INTO `maker` VALUES('19', 'SUBARU', '', '1');
INSERT INTO `maker` VALUES('20', 'NISSAN', '', '1');
INSERT INTO `maker` VALUES('21', 'LEXUS', '', '1');


-- Dumping structure for table: `maker_model`

DROP TABLE IF EXISTS `maker_model`;
CREATE TABLE `maker_model` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `maker_id` int(11) NOT NULL,
  `mod_name` varchar(45) DEFAULT NULL,
  `mod_options` varchar(45) DEFAULT '',
  `mod_desc` varchar(45) DEFAULT '',
  `mod_overview` varchar(800) DEFAULT '',
  `mod_status` varchar(45) DEFAULT '1',
  PRIMARY KEY (`mod_id`),
  KEY `fk_Maker_model_Maker_idx` (`maker_id`) USING BTREE,
  CONSTRAINT `maker_model_ibfk_1` FOREIGN KEY (`maker_id`) REFERENCES `maker` (`maker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;



-- Dumping data for table: maker_model

INSERT INTO `maker_model` VALUES('10', '20', 'ALLION', '', 'G Plus ', 'The Nissan LEAF is 100% electric. You will never put even a drop of petrol in it. Ever. It produces zero CO2 tailpipe emissions. In fact it doesn’t even have a tailpipe. Instead it depends on one of our most advanced lithium-ion batteries ever developed. The LEAF is so vastly original, it will change the way you think about and drive cars for many years to come. Switch to electric today. The Nissan leaf is the first main　steam all-electric vehicle to be offered in the U.S while it has a limited driving range in most other respects the leaf is quite similar to a Conventional gas powered compact hatch back offering a comfortable interior and Surprisingly snappy acceleration.\n100% electric moto', '99');
INSERT INTO `maker_model` VALUES('11', '11', 'PRIUS', '', '', '', '1');
INSERT INTO `maker_model` VALUES('12', '12', 'Vezel', '', '', '', '1');
INSERT INTO `maker_model` VALUES('13', '12', 'FIT HYBRID', '', 'GP1', '', '1');
INSERT INTO `maker_model` VALUES('14', '11', 'AQUA', '', 'NHP10', 'this is aqua', '1');
INSERT INTO `maker_model` VALUES('15', '11', 'PREMIO', '', 'EX G Superior Smart Stop', '', '1');
INSERT INTO `maker_model` VALUES('16', '14', 'WAGON R', '', '', 'Suzuki Wagon R made in JAPAN. Hybrid vehicle. Engine capacity is  660CC. Automatic transmission.4 Seat & 4 Doors with 2WD.', '1');
INSERT INTO `maker_model` VALUES('17', '14', 'EVERY VAN', '', '', '', '1');
INSERT INTO `maker_model` VALUES('18', '11', 'AXIO HYBRID', '', '', '', '1');
INSERT INTO `maker_model` VALUES('19', '20', 'LEAF X', '', '', 'The Nissan LEAF is 100% electric. You will never put even a drop of petrol in it. Ever. It produces zero CO2 tailpipe emissions. In fact it doesn’t even have a tailpipe. Instead it depends on one of our most advanced lithium-ion batteries ever developed. The LEAF is so vastly original, it will change the way you think about and drive cars for many years to come. Switch to electric today. The Nissan leaf is the first main　steam all-electric vehicle to be offered in the U.S while it has a limited driving range in most other respects the leaf is quite similar to a Conventional gas powered compact hatch back offering a comfortable interior and Surprisingly snappy acceleration.\n100% electric moto', '1');
INSERT INTO `maker_model` VALUES('20', '11', 'LAND CRUISER PRADO', '', '', '', '1');
INSERT INTO `maker_model` VALUES('21', '12', 'GRACE HYBRID', '', '', '', '1');
INSERT INTO `maker_model` VALUES('22', '20', 'LEAF G', '', '', 'The Nissan LEAF is 100% electric. You will never put even a drop of petrol in it. Ever. It produces zero CO2 tailpipe emissions. In fact it doesn’t even have a tailpipe. Instead it depends on one of our most advanced lithium-ion ', '1');
INSERT INTO `maker_model` VALUES('23', '11', 'ALLION', '', '', '', '1');
INSERT INTO `maker_model` VALUES('24', '11', 'PASSO', '', '', '', '1');
INSERT INTO `maker_model` VALUES('25', '11', 'VITZ', '', '', '', '1');
INSERT INTO `maker_model` VALUES('26', '14', 'WAGON R STINGRAY', '', '', '', '99');
INSERT INTO `maker_model` VALUES('27', '11', 'TOWNACE', '', '', '', '1');
INSERT INTO `maker_model` VALUES('28', '15', 'MINICAB', '', '', '', '1');
INSERT INTO `maker_model` VALUES('29', '11', 'AXIO', '', '', '', '1');
INSERT INTO `maker_model` VALUES('30', '11', 'PRIUS PHEV', '', '', '', '1');


-- Dumping structure for table: `owner_info`

DROP TABLE IF EXISTS `owner_info`;
CREATE TABLE `owner_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `company_address_1` varchar(100) DEFAULT '',
  `company_address_2` varchar(100) DEFAULT '',
  `company_address_3` varchar(100) DEFAULT '',
  `company_address_4` varchar(100) DEFAULT NULL,
  `po_box` varchar(20) DEFAULT NULL,
  `company_country` varchar(100) DEFAULT '',
  `phone_1` varchar(20) DEFAULT '',
  `phone_2` varchar(20) DEFAULT '',
  `phone_3` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT '',
  `email` varchar(45) DEFAULT '',
  `web` varchar(45) DEFAULT '',
  `other_1` varchar(45) DEFAULT '',
  `other_2` varchar(45) DEFAULT '',
  `record_status` int(2) DEFAULT '0',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



-- Dumping data for table: owner_info

INSERT INTO `owner_info` VALUES('1', 'JAPAN OFFICE', 'No. 101', 'Nakamachi 21-1', 'Adachi-Ku', 'Tokyo', '120-0036', 'Japan', '+81 3 3882 6800', '+81-90-6652-2119', '', '+81 3 3780 1872', 'contact@siyekra.com', '', 'facebook.com/Siyekra.International', 'facebook.com/Siyekra.International', '1');
INSERT INTO `owner_info` VALUES('2', 'SRI LANKA OFFICE', 'No. 220/1', 'Puttalam Rd', 'Yanthampalawa', 'Kurunegala', '', 'Sri Lanka', '+94 37-2233782', '+94 710-820820 ', '+94 777-820820', '+94 37-2233783', 'contact@siyekra.com', '', 'facebook.com/Siyekra.International', 'facebook.com/Siyekra.International', '1');


-- Dumping structure for table: `payments`

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: payments

INSERT INTO `payments` VALUES('73', '780', '1', '2016-03-18', '13:36:48', '25000.00');
INSERT INTO `payments` VALUES('75', '780', '2', '2016-03-25', '13:05:33', '500.00');
INSERT INTO `payments` VALUES('76', '780', '2', '2016-03-25', '13:05:37', '600.00');
INSERT INTO `payments` VALUES('85', '1', '1', '2016-03-25', '13:38:50', '5656.00');
INSERT INTO `payments` VALUES('86', '780', '2', '2016-03-25', '13:39:07', '500.00');
INSERT INTO `payments` VALUES('87', '780', '2', '2016-03-25', '13:39:11', '32.00');
INSERT INTO `payments` VALUES('88', '37', '1', '2016-03-25', '13:45:59', '52000.00');
INSERT INTO `payments` VALUES('89', '37', '1', '2016-03-25', '13:46:04', '654012.00');
INSERT INTO `payments` VALUES('92', '37', '1', '2016-03-25', '13:46:58', '65200.00');
INSERT INTO `payments` VALUES('93', '37', '1', '2016-03-25', '13:47:04', '140808.00');
INSERT INTO `payments` VALUES('94', '37', '1', '2016-03-25', '13:47:38', '22.00');
INSERT INTO `payments` VALUES('95', '37', '1', '2016-03-25', '13:47:46', '14.00');
INSERT INTO `payments` VALUES('96', '37', '1', '2016-03-25', '13:48:16', '1542.00');
INSERT INTO `payments` VALUES('97', '37', '1', '2016-03-25', '13:48:30', '778.00');
INSERT INTO `payments` VALUES('98', '780', '2', '2016-03-25', '13:48:51', '50.00');
INSERT INTO `payments` VALUES('99', '780', '2', '2016-03-25', '13:48:56', '50.00');
INSERT INTO `payments` VALUES('100', '780', '2', '2016-03-25', '13:49:33', '50.00');
INSERT INTO `payments` VALUES('101', '780', '2', '2016-03-25', '13:49:44', '78.00');
INSERT INTO `payments` VALUES('102', '780', '2', '2016-03-25', '13:49:48', '22.00');
INSERT INTO `payments` VALUES('103', '780', '2', '2016-03-25', '13:49:55', '584.00');
INSERT INTO `payments` VALUES('104', '780', '2', '2016-03-25', '13:50:20', '6.00');
INSERT INTO `payments` VALUES('105', '780', '2', '2016-03-25', '13:50:30', '6.00');
INSERT INTO `payments` VALUES('106', '37', '1', '2016-03-25', '13:52:28', '500.00');
INSERT INTO `payments` VALUES('107', '37', '1', '2016-03-25', '13:52:50', '58.00');
INSERT INTO `payments` VALUES('108', '37', '1', '2016-03-25', '13:53:16', '100.00');
INSERT INTO `payments` VALUES('109', '37', '1', '2016-03-25', '13:53:36', '100.00');
INSERT INTO `payments` VALUES('110', '780', '2', '2016-03-25', '14:01:37', '50.00');
INSERT INTO `payments` VALUES('111', '780', '2', '2016-03-25', '14:01:55', '4.00');
INSERT INTO `payments` VALUES('112', '780', '2', '2016-03-25', '14:02:05', '100.00');
INSERT INTO `payments` VALUES('113', '780', '2', '2016-03-25', '14:08:43', '4454.00');
INSERT INTO `payments` VALUES('114', '1', '1', '2016-03-25', '14:25:55', '656.00');
INSERT INTO `payments` VALUES('115', '33', '1', '2016-03-25', '14:28:53', '50.00');
INSERT INTO `payments` VALUES('116', '33', '1', '2016-03-25', '14:29:03', '3000.00');
INSERT INTO `payments` VALUES('117', '33', '1', '2016-03-25', '14:29:11', '10000.00');
INSERT INTO `payments` VALUES('118', '33', '1', '2016-04-20', '17:10:02', '5000.00');
INSERT INTO `payments` VALUES('119', '1', '1', '2016-08-05', '13:28:46', '500.00');


-- Dumping structure for table: `pi_entries`

DROP TABLE IF EXISTS `pi_entries`;
CREATE TABLE `pi_entries` (
  `pi_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` int(11) NOT NULL,
  `vh_id` int(11) NOT NULL,
  `freight` double DEFAULT '0',
  `insuarance` double DEFAULT '0',
  `vh_amt` double DEFAULT '0',
  `tot_amt` double DEFAULT '0',
  `other` double DEFAULT '0' COMMENT 'other charges',
  `record_status` int(2) DEFAULT '0' COMMENT '1-active',
  PRIMARY KEY (`pi_entry_id`),
  KEY `fk_pi_entries_proforma_inv1_idx` (`pi_id`) USING BTREE,
  KEY `fk_pi_entries_Vehicle1_idx` (`vh_id`) USING BTREE,
  CONSTRAINT `pi_entries_ibfk_1` FOREIGN KEY (`pi_id`) REFERENCES `proforma_inv` (`pi_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pi_entries_ibfk_2` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;



-- Dumping data for table: pi_entries

INSERT INTO `pi_entries` VALUES('5', '4', '16', '3500', '1000', '45000', '49500', '0', '0');
INSERT INTO `pi_entries` VALUES('6', '4', '19', '3500', '1000', '45000', '49500', '0', '0');
INSERT INTO `pi_entries` VALUES('14', '12', '22', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('15', '12', '29', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('16', '12', '30', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('71', '55', '60', '3500', '1000', '5000', '9500', '0', '0');
INSERT INTO `pi_entries` VALUES('72', '55', '61', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('76', '62', '64', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('77', '62', '65', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('78', '62', '66', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('79', '63', '62', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('80', '64', '68', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('84', '66', '76', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('85', '67', '77', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('86', '68', '79', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('87', '68', '80', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('88', '68', '81', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('89', '69', '82', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('90', '70', '84', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('94', '74', '67', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('95', '75', '31', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('96', '76', '63', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('97', '77', '74', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('98', '79', '73', '3500', '1000', '0', '4500', '0', '0');
INSERT INTO `pi_entries` VALUES('99', '80', '72', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('110', '91', '87', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('111', '92', '93', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('112', '93', '90', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('113', '94', '91', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('114', '95', '92', '0', '0', '0', '0', '0', '0');
INSERT INTO `pi_entries` VALUES('116', '97', '780', '0', '0', '0', '0', '0', '0');


-- Dumping structure for table: `proforma_inv`

DROP TABLE IF EXISTS `proforma_inv`;
CREATE TABLE `proforma_inv` (
  `pi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_no` varchar(45) DEFAULT NULL,
  `pi_date` date DEFAULT NULL,
  `cus_id` varchar(45) DEFAULT NULL,
  `consignee_name` varchar(80) DEFAULT '',
  `consignee_address` varchar(150) DEFAULT '',
  `port_loading` varchar(40) DEFAULT '',
  `port_discharge` varchar(40) DEFAULT '',
  `shipment_time` varchar(60) DEFAULT '',
  `payment_term` varchar(40) DEFAULT '',
  `validity` varchar(45) DEFAULT '',
  `total_cif` double DEFAULT '0',
  `currency` varchar(45) DEFAULT 'JPY',
  `partial_shipment` varchar(45) DEFAULT NULL,
  `transshipment` varchar(45) DEFAULT NULL,
  `presentation_period` varchar(45) DEFAULT NULL,
  `last_shipment_date` date DEFAULT NULL,
  `lc_charges` varchar(45) DEFAULT NULL,
  `hs_code` varchar(45) DEFAULT NULL,
  `confirmation` varchar(45) DEFAULT NULL,
  `lc_advice` varchar(45) DEFAULT NULL,
  `advising_bank_id` int(11) DEFAULT NULL,
  `pi_status` int(11) DEFAULT '1',
  `supp_id` int(11) unsigned DEFAULT '0',
  `pi_sent` int(1) DEFAULT '0',
  `pi_type` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`pi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;



-- Dumping data for table: proforma_inv

INSERT INTO `proforma_inv` VALUES('4', 'PI-AL4', '2015-10-19', '1', '', '', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '99000', '&yen;', 'ALLOWED', 'ALLOWED', '21', '2015-10-19', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('12', 'PI-AL6', '2015-11-26', '1', 'ABC', 'address', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '13500', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('55', 'PI-AL20', '2015-12-14', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '14000', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-17', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('62', 'PI-AL24', '2016-01-18', '1', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '13500', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('63', 'PI-AL22', '2016-01-18', '1', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '4500', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('64', 'PI-AL28', '2016-01-18', '1', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '4500', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-01-18', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('66', 'PI-AL36', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('67', 'PI-AL37', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('68', 'PI-AL39', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('69', 'PI-AL42', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('70', 'PI-AL44', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('74', 'PI-AL27', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('75', 'PI-AL9', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('76', 'PI-AL23', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('77', 'PI-AL34', '2016-02-08', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-08', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('79', 'PI-AL33', '2016-02-12', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '4500', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-12', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('80', 'PI-AL32', '2016-02-12', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-12', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('91', 'PI-AL47', '2016-02-12', '1', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-12', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('92', 'PI-AL53', '2016-02-12', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-12', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('93', 'PI-AL50', '2016-02-12', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-12', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('94', 'PI-AL51', '2016-02-12', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-12', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('95', 'PI-AL52', '2016-02-12', '2', 'Capital Leasing', 'Kurunegala', 'ANY PORT OF JAPAN', 'ANY PORT OF SRI LANKA', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', 'LC AT SIGHT', '2 MONTHS', '0', '¥', 'ALLOWED', 'ALLOWED', '21', '2016-02-12', 'APPLICANT', '8703.21.69', 'REQUIRED', 'FULL TELEX', '9', '1', '2', '0', 'N');
INSERT INTO `proforma_inv` VALUES('97', '', '2016-03-03', '0', '', '', '', '', '', '', '', '0', 'JPY', '', '', '', '', '', '', '', '', '', '98', '0', '0', 'N');


-- Dumping structure for table: `quotation`

DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) DEFAULT NULL,
  `invoce_no` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL,
  `display_price` decimal(10,2) DEFAULT NULL,
  `vehicle_price` decimal(10,2) DEFAULT NULL,
  `first_advance` decimal(10,2) DEFAULT NULL,
  `lc_charge` decimal(10,2) DEFAULT NULL,
  `second_advance` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: quotation

INSERT INTO `quotation` VALUES('13', '761', 'PI-AL707KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '650000.00', '5500000.00', '20000.00', '350000.00', '10000.00', '5120000.00');
INSERT INTO `quotation` VALUES('30', '640', 'PI-AL600KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '460000.00', '100000.00', '100000.00', '50000.00', '210000.00');
INSERT INTO `quotation` VALUES('31', '772', 'PI-LP22KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '565655.00', '31321.00', '656445.00', '65446.00', '2165.00');
INSERT INTO `quotation` VALUES('32', '745', 'PI-AL705KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '900000.00', '45000.00', '5000.00', '50000.00', '800000.00');
INSERT INTO `quotation` VALUES('33', '694', 'PI-AL654KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '1544565.00', '2321.00', '3242.00', '34242.00', '1504760.00');
INSERT INTO `quotation` VALUES('34', '762', 'PI-AL722KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `quotation` VALUES('35', '774', 'PI-AL732KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `quotation` VALUES('36', '774', 'PI-AL732KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `quotation` VALUES('37', '774', 'PI-AL732KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '', '500000.00', '4545.00', '545.00', '45.00', '494865.00');
INSERT INTO `quotation` VALUES('38', '778', 'PI-AL735KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '85000000.00', '78000000.00', '25000000.00', '50000.00', '1500000.00', '51450000.00');
INSERT INTO `quotation` VALUES('39', '776', 'PI-AL734KR', '5', 'Saman', 'Pallandeniya', '714564454', '4554.00', '8600000.00', '450000.00', '541333.00', '125454.00', '7483213.00');
INSERT INTO `quotation` VALUES('40', '779', 'PI-AL736KR', '6', 'Nimal Weragoda', 'Nimal , maspotha , kurunegala', '474988544', '560000.00', '450000.00', '100000.00', '40000.00', '150000.00', '160000.00');
INSERT INTO `quotation` VALUES('41', '755', 'PI-AL715KR', '6', 'Nimal Weragoda', 'Nimal , maspotha , kurunegala', '474988544', '560000.00', '450000.00', '100000.00', '40000.00', '150000.00', '160000.00');
INSERT INTO `quotation` VALUES('42', '689', 'PI-AL649KR', '2', 'Mr.Amila Prabath Dissanayake', 'No42, Cricle Road, Lake Round', '2147483647', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `quotation` VALUES('43', '689', 'PI-AL649KR', '2', 'Mr.Amila Prabath Dissanayake', 'No42, Cricle Road, Lake Round', '2147483647', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `quotation` VALUES('44', '689', 'PI-AL649KR', '2', 'Mr.Amila Prabath Dissanayake', 'No42, Cricle Road, Lake Round', '2147483647', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('45', '780', 'PI-AL737KR', '2', 'Mr.Amila Prabath Dissanayake', 'No42, Cricle Road, Lake Round', '2147483647', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('46', '761', 'PI-AL721KR', '2', 'Mr.Amila Prabath Dissanayake', 'No42, Cricle Road, Lake Round', '2147483647', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('47', '21', 'PI-LP16KR', '2', 'Mr.Amila Prabath Dissanayake', 'No42, Cricle Road, Lake Round', '2147483647', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('48', '758', 'PI-AL718KR', '2', 'Mr.Amila Prabath Dissanayake', 'No42, Cricle Road, Lake Round', '2147483647', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('49', '758', 'PI-AL718KR', '7', 'Jayantha', 'Wariyapola', '1648484455', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('50', '758', 'PI-AL718KR', '7', 'Jayantha', 'Wariyapola', '1648484455', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('51', '758', 'PI-AL718KR', '7', 'Jayantha', 'Wariyapola', '1648484455', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('52', '758', 'PI-AL718KR', '7', 'Jayantha', 'Wariyapola', '1648484455', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('53', '758', 'PI-AL718KR', '7', 'Jayantha', 'Wariyapola', '1648484455', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('54', '758', 'PI-AL718KR', '7', 'Jayantha', 'Wariyapola', '1648484455', '434344.00', '43344343.00', '434343.00', '434.00', '4343.00', '42905223.00');
INSERT INTO `quotation` VALUES('55', '775', 'PI-AL733KR', '1', 'DR.N.P.G.S.DAYARATNE', 'MEDICAL OFFICER,MOH OFFICE-GANEWATTA,MINISTRY OF HEALTH, SRI LANKA.', '2147483647', '50000.00', '45000.00', '20000.00', '1500.00', '15000.00', '8500.00');
INSERT INTO `quotation` VALUES('56', '749', 'PI-AL709KR', '5', 'Saman', 'Pallandeniya', '714564454', '50000.00', '45000.00', '20000.00', '1500.00', '15000.00', '8500.00');
INSERT INTO `quotation` VALUES('57', '765', 'PI-AL716KR', '5', 'Saman', 'Pallandeniya', '714564454', '50000.00', '45000.00', '20000.00', '1500.00', '15000.00', '8500.00');


-- Dumping structure for table: `registration`

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `ref_no` int(11) DEFAULT NULL,
  `reg_no` int(11) DEFAULT NULL,
  `maker_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chsis_num` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_odintr_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `veh_modl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_plates` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'long size =1 , standard size =2',
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_selection` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'any no =1, advanced no =2 , selected =3',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'registration waiting =1 , \r\nlink waiting =2,\r\nMTA3 waiting =3,\r\nSelected no Waiting =4,\r\ndocuments problems=5,\r\npayments waiting = 6,\r\nregistered = 7 ,\r\nRMB issues =8',
  `to_rmb_officer` date DEFAULT NULL,
  `cr_received_date` date DEFAULT NULL,
  `plates_received_date` date DEFAULT NULL,
  `cr_to_customer` date DEFAULT NULL,
  `plates_to_customer` date DEFAULT NULL,
  `submit_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Check Before Submit = 1,\r\nOk to Submit =2,\r\nOk Submit to Coordinator =3 ',
  `date` date DEFAULT NULL,
  `additional_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: registration

INSERT INTO `registration` VALUES('8', '781', '1', '781', '12356', 'TOYOTA', '789456', 'Miura International pvt ltd', 'PRIUS', 'standard size', '45565', 'any no', 'registration waiting', '2016-03-17', '2016-03-24', '2016-03-24', '2016-03-30', '2016-04-13', 'Check before submit', '2016-03-07', 'palaslsda');
INSERT INTO `registration` VALUES('9', '779', '4', '779', '0', 'TOYOTA', '', 'Miura International pvt ltd', 'PRIUS', 'standard size', '', 'any no', 'registration waiting', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'Check before submit', '2016-03-07', '');


-- Dumping structure for table: `registration_balance`

DROP TABLE IF EXISTS `registration_balance`;
CREATE TABLE `registration_balance` (
  `reg_bal_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) NOT NULL,
  `ref_no` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_no` int(11) DEFAULT NULL,
  `rmb_charges` decimal(10,2) DEFAULT NULL,
  `ad_charges` decimal(10,2) DEFAULT NULL,
  `ad_charges_lease` decimal(10,2) DEFAULT NULL,
  `forward_no` int(11) DEFAULT NULL,
  `prf_no` int(11) DEFAULT NULL,
  `transfer_tax` decimal(10,2) DEFAULT NULL,
  `lux_tax` decimal(10,2) DEFAULT NULL,
  `other_transfer_tax` decimal(10,2) DEFAULT NULL,
  `other` decimal(10,2) DEFAULT NULL,
  `delay_panalty` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `to_customer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reg_bal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: registration_balance

INSERT INTO `registration_balance` VALUES('1', '1', 'AL1+KR', '0', '500.00', '', '', '', '', '', '', '', '', '', '4561.00', '2016-03-25', '555.00', '', '');
INSERT INTO `registration_balance` VALUES('2', '19', 'AL5+KR', '0', '', '', '', '', '', '', '', '', '', '', '5000.00', '2016-03-25', '555.00', '', '');
INSERT INTO `registration_balance` VALUES('4', '19', 'AL5+KR', '0', '', '', '', '', '', '', '', '', '', '', '5000.00', '2016-03-25', '555.00', '', '');


-- Dumping structure for table: `supp_bank`

DROP TABLE IF EXISTS `supp_bank`;
CREATE TABLE `supp_bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(45) DEFAULT NULL,
  `swift` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `ac_num` varchar(45) DEFAULT NULL,
  `bank_status` int(2) DEFAULT '1',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;



-- Dumping data for table: supp_bank

INSERT INTO `supp_bank` VALUES('9', 'Sumitomo Mitsui Banking Corporation', 'SMBCJPJT', 'NAGOYA BRANCH', '7780764', '1');
INSERT INTO `supp_bank` VALUES('10', 'afafd', '', '', '', '1');
INSERT INTO `supp_bank` VALUES('11', 'fdafad', '', '', '', '1');


-- Dumping structure for table: `supplier`

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supp_id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_code` varchar(45) DEFAULT NULL,
  `supp_name` varchar(45) DEFAULT NULL,
  `inv_name` varchar(45) DEFAULT NULL,
  `supp_address` varchar(100) DEFAULT '',
  `inv_address` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `inv_phone` varchar(15) DEFAULT '',
  `supp_email` varchar(45) DEFAULT NULL,
  `web` varchar(45) DEFAULT '',
  `supp_fax` varchar(15) DEFAULT NULL,
  `supp_currency` varchar(5) DEFAULT 'JPY' COMMENT 'JPY/ LKR',
  `bank_id` int(11) DEFAULT '0',
  `supp_status` int(2) DEFAULT '1' COMMENT '1 == active, 2 == diactive',
  PRIMARY KEY (`supp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



-- Dumping data for table: supplier

INSERT INTO `supplier` VALUES('2', 'AL', 'ALPHA FOUR CO.,LTD', 'ALPHA FOUR CO.,LTD', '39-17 OHASHI NISHI KAIMEI ICHINOMIYA CITY AICHI PREF.,494-0001,JAPAN', '39-17 OHASHI NISHI KAIMEI ICHINOMIYA CITY AICHI PREF.,494-0001,JAPAN', '', 'TEL: +81 3 3882', '', '', '', 'JPY', '9', '1');
INSERT INTO `supplier` VALUES('3', 'CB', 'Cobe Motor company', '', '', '', '', '', '', '', '', 'LKR', '0', '1');
INSERT INTO `supplier` VALUES('4', 'LP', 'All locale suppler', '', '', '', '', '', '', '', '', 'LKR', '0', '1');


-- Dumping structure for table: `sys_bank`

DROP TABLE IF EXISTS `sys_bank`;
CREATE TABLE `sys_bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_status` int(2) DEFAULT NULL COMMENT '1 = active / 99= inactive',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: sys_bank

INSERT INTO `sys_bank` VALUES('7', 'Nation Trust', 'Colombo', 'Welangolla', 'Miura', '1905', '', '1');
INSERT INTO `sys_bank` VALUES('9', 'DFCC', 'Kurunegala', 'NO 32, Kurunegala', 'Miura International (Pvt) Ltd', '1001014878', '', '1');
INSERT INTO `sys_bank` VALUES('11', 'HNB', 'Kurunegala Main', 'No 83, Welagedara Uyana, Welangolla Waththa, Kurunegala', 'Miura International (PVT) LTD', '190874848', '', '1');
INSERT INTO `sys_bank` VALUES('12', 'ASSETLINE', 'Kurunegala', 'aaa', 'Jagath Perera', '5646545656445', '', '1');


-- Dumping structure for table: `syscode`

DROP TABLE IF EXISTS `syscode`;
CREATE TABLE `syscode` (
  `sys_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `is_default` int(1) DEFAULT '0' COMMENT '1- default selected option',
  `remarks` varchar(45) DEFAULT '',
  PRIMARY KEY (`sys_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;



-- Dumping data for table: syscode

INSERT INTO `syscode` VALUES('1', '11', '1', 'local', '0', '');
INSERT INTO `syscode` VALUES('2', '11', '2', 'foreign', '0', '');
INSERT INTO `syscode` VALUES('3', '11', '3', 'other', '0', '');
INSERT INTO `syscode` VALUES('4', '12', '2', 'Pending', '0', '');
INSERT INTO `syscode` VALUES('5', '12', '1', 'Done', '0', '');
INSERT INTO `syscode` VALUES('6', '10', '1', 'Automatic', '0', '');
INSERT INTO `syscode` VALUES('7', '10', '2', 'Manual', '0', '');
INSERT INTO `syscode` VALUES('8', '9', '1', 'Gasoline', '0', '');
INSERT INTO `syscode` VALUES('9', '9', '2', 'Diesel', '0', '');
INSERT INTO `syscode` VALUES('10', '9', '3', 'Electric', '0', '');
INSERT INTO `syscode` VALUES('11', '8', '1', '2WD', '0', '');
INSERT INTO `syscode` VALUES('12', '8', '2', '4WD', '0', '');
INSERT INTO `syscode` VALUES('13', '7', '1', 'in stock', '0', '');
INSERT INTO `syscode` VALUES('14', '7', '2', 'reserved', '0', '');
INSERT INTO `syscode` VALUES('15', '7', '3', 'clearing', '0', '');
INSERT INTO `syscode` VALUES('16', '7', '4', 'cleared', '0', '');
INSERT INTO `syscode` VALUES('17', '7', '5', 'sold', '0', '');
INSERT INTO `syscode` VALUES('18', '6', '1', 'JPY', '0', '');
INSERT INTO `syscode` VALUES('19', '6', '2', 'LKR', '0', '');
INSERT INTO `syscode` VALUES('20', '21', '1', 'ANY PORT OF JAPAN', '0', 'PORT');
INSERT INTO `syscode` VALUES('21', '22', '1', 'ANY PORT OF SRI LANKA', '0', '');
INSERT INTO `syscode` VALUES('23', '24', '2', '8703.21.69', '0', '1500cc cars');
INSERT INTO `syscode` VALUES('24', '25', '1', 'FULL TELEX', '0', '-');
INSERT INTO `syscode` VALUES('25', '26', '1', 'AFTER RECEIVING A COPY OR THE ORIGINAL L/C', '0', '-');
INSERT INTO `syscode` VALUES('26', '27', '1', 'LC AT SIGHT', '0', '-');
INSERT INTO `syscode` VALUES('27', '23', '1', '2 MONTHS', '0', '');
INSERT INTO `syscode` VALUES('28', '23', '2', '3 MONTHS', '0', '');
INSERT INTO `syscode` VALUES('29', '30', '1', 'Adaptive Cruise Control', '0', '');
INSERT INTO `syscode` VALUES('30', '30', '2', 'Airbags', '0', '');
INSERT INTO `syscode` VALUES('31', '30', '3', 'Air Conditioning', '0', '');
INSERT INTO `syscode` VALUES('32', '30', '4', 'Alarm System', '0', '');
INSERT INTO `syscode` VALUES('33', '30', '5', 'Anti-theft Protection', '0', '');
INSERT INTO `syscode` VALUES('34', '30', '6', 'Audio Interface', '0', '');
INSERT INTO `syscode` VALUES('35', '30', '7', 'Automatic Climate Control', '0', '');
INSERT INTO `syscode` VALUES('36', '30', '8', 'Automatic Headlights', '0', '');
INSERT INTO `syscode` VALUES('37', '30', '9', 'Auto Start/Stop', '0', '');
INSERT INTO `syscode` VALUES('38', '30', '10', 'Bi-Xenon Headlights', '0', '');
INSERT INTO `syscode` VALUES('39', '30', '11', 'Bluetooth® Handset', '0', '');
INSERT INTO `syscode` VALUES('40', '30', '12', 'BOSE® Surround Sound', '0', '');
INSERT INTO `syscode` VALUES('41', '30', '13', 'Burmester® Surround Sound', '0', '');
INSERT INTO `syscode` VALUES('42', '30', '14', 'CD/DVD Autochanger', '0', '');
INSERT INTO `syscode` VALUES('43', '30', '15', 'CDR Audio', '0', '');
INSERT INTO `syscode` VALUES('44', '30', '16', 'Cruise Control', '0', '');
INSERT INTO `syscode` VALUES('45', '30', '17', 'Direct Fuel Injection', '0', '');
INSERT INTO `syscode` VALUES('46', '30', '18', 'Electric Parking Brake', '0', '');
INSERT INTO `syscode` VALUES('47', '30', '19', 'Floor Mats', '0', '');
INSERT INTO `syscode` VALUES('48', '30', '20', 'Garage Door Opener', '0', '');
INSERT INTO `syscode` VALUES('49', '30', '21', 'Leather Package', '0', '');
INSERT INTO `syscode` VALUES('50', '30', '22', 'Locking Rear Differential', '0', '');
INSERT INTO `syscode` VALUES('51', '30', '23', 'Luggage Compartments', '0', '');
INSERT INTO `syscode` VALUES('52', '30', '24', 'Manual Transmission', '0', '');
INSERT INTO `syscode` VALUES('53', '30', '25', 'Navigation Module', '0', '');
INSERT INTO `syscode` VALUES('54', '30', '26', 'Online Services', '0', '');
INSERT INTO `syscode` VALUES('55', '30', '27', 'ParkAssist', '0', '');
INSERT INTO `syscode` VALUES('56', '30', '28', 'Porsche Communication', '0', '');
INSERT INTO `syscode` VALUES('57', '30', '29', 'Power Steering', '0', '');
INSERT INTO `syscode` VALUES('58', '30', '30', 'Reversing Camera', '0', '');
INSERT INTO `syscode` VALUES('59', '30', '31', 'Roll-over Protection', '0', '');
INSERT INTO `syscode` VALUES('60', '30', '32', 'Seat Heating', '0', '');
INSERT INTO `syscode` VALUES('61', '30', '33', 'Seat Ventilation', '0', '');
INSERT INTO `syscode` VALUES('62', '30', '34', 'Sound Package Plus', '0', '');
INSERT INTO `syscode` VALUES('63', '30', '35', 'Sport Chrono Package', '0', '');
INSERT INTO `syscode` VALUES('64', '30', '36', 'Steering Wheel Heating', '0', '');
INSERT INTO `syscode` VALUES('65', '30', '37', 'Tire Pressure Monitoring', '0', '');
INSERT INTO `syscode` VALUES('66', '30', '38', 'Universal Audio Interface', '0', '');
INSERT INTO `syscode` VALUES('67', '30', '39', 'Voice Control System', '0', '');
INSERT INTO `syscode` VALUES('68', '30', '40', 'Wind Deflector', '0', '');
INSERT INTO `syscode` VALUES('69', '51', '1', '3500', '0', 'FOB');
INSERT INTO `syscode` VALUES('70', '52', '1', '1000', '0', 'Insurance');
INSERT INTO `syscode` VALUES('71', '53', '1', '21', '0', 'Presentation Period');
INSERT INTO `syscode` VALUES('72', '9', '4', 'Hybrid', '0', '');
INSERT INTO `syscode` VALUES('73', '24', '3', '8703.22.59', '0', '1000cc cars');
INSERT INTO `syscode` VALUES('74', '28', '1', '&yen;', '0', 'JPY');
INSERT INTO `syscode` VALUES('75', '28', '2', '$', '0', 'USD');
INSERT INTO `syscode` VALUES('76', '28', '3', '&euro;', '0', 'Euro');
INSERT INTO `syscode` VALUES('77', '28', '4', '&pound;', '0', 'GBP');
INSERT INTO `syscode` VALUES('78', '35', '1', 'Kurunegala', '0', '');
INSERT INTO `syscode` VALUES('79', '54', '1', 'Buddika', '0', 'buddika the driver');
INSERT INTO `syscode` VALUES('80', '54', '2', 'Kamal', '0', 'Temp');
INSERT INTO `syscode` VALUES('81', '55', '1', 'Kumara', '0', 'Clearing agent');
INSERT INTO `syscode` VALUES('82', '55', '2', 'Amal', '0', 'Clearing Agent');
INSERT INTO `syscode` VALUES('83', '31', '5', 'Payment Completed', '0', '');
INSERT INTO `syscode` VALUES('84', '31', '8', 'Hand Over/ Payment Waiting', '0', '');
INSERT INTO `syscode` VALUES('85', '31', '9', 'Advanced', '0', '');
INSERT INTO `syscode` VALUES('86', '31', '10', 'In Other Sale', '0', '');
INSERT INTO `syscode` VALUES('87', '31', '11', 'Cancelled', '0', '');
INSERT INTO `syscode` VALUES('88', '55', '3', 'Anil', '0', 'Agenet ANil');
INSERT INTO `syscode` VALUES('89', '55', '4', 'Premasiri', '0', 'Clearing Agent');


-- Dumping structure for table: `transaction`

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_type` varchar(45) NOT NULL COMMENT 'INSERT, UPDATE, DELETE',
  `tr_desc` varchar(45) DEFAULT NULL COMMENT 'table_name',
  `tr_time` time DEFAULT NULL,
  `tr_date` date NOT NULL,
  `tr_user_id` varchar(45) NOT NULL,
  PRIMARY KEY (`tr_id`),
  UNIQUE KEY `tr_id_UNIQUE` (`tr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1774 DEFAULT CHARSET=utf8;



-- Dumping data for table: transaction

INSERT INTO `transaction` VALUES('1', 'INSERT', 'supplier', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('2', 'UPDATE', 'vehicle', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('3', 'INSERT', 'Web', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('4', 'INSERT', 'Web', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('5', 'INSERT', 'Web', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('6', 'INSERT', 'supplier', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('7', 'INSERT', 'supplier', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('8', 'INSERT', 'maker_model', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('9', 'UPDATE', 'vehicle', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('10', 'INSERT', 'Web', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('11', 'UPDATE', 'vehicle', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('12', 'INSERT', 'maker_model', '', '2015-08-13', '81');
INSERT INTO `transaction` VALUES('13', 'INSERT', 'maker_model', '', '2015-08-13', '97');
INSERT INTO `transaction` VALUES('14', 'UPDATE', 'vehicle', '', '2015-08-13', '97');
INSERT INTO `transaction` VALUES('15', 'INSERT', 'Web', '', '2015-08-13', '97');
INSERT INTO `transaction` VALUES('16', 'UPDATE', 'coordinator-user-abc', '', '2015-08-14', '81');
INSERT INTO `transaction` VALUES('17', 'UPDATE', 'coordinator', '', '2015-08-14', '81');
INSERT INTO `transaction` VALUES('18', 'UPDATE', 'coordinator', '', '2015-08-14', '81');
INSERT INTO `transaction` VALUES('19', 'UPDATE', 'coordinator', '', '2015-08-14', '109');
INSERT INTO `transaction` VALUES('20', 'UPDATE', 'vehicle', '', '2015-08-14', '109');
INSERT INTO `transaction` VALUES('21', 'INSERT', 'Web', '', '2015-08-14', '109');
INSERT INTO `transaction` VALUES('22', 'UPDATE', 'vehicle', '', '2015-08-14', '109');
INSERT INTO `transaction` VALUES('23', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('24', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('25', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('26', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('27', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('28', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('29', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('30', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('31', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('32', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('33', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('34', 'UPDATE', 'vehicle', '', '2015-08-14', '109');
INSERT INTO `transaction` VALUES('35', 'UPDATE', 'vehicle', '', '2015-08-14', '109');
INSERT INTO `transaction` VALUES('36', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('37', 'UPDATE', 'vehicle', '', '2015-08-14', '108');
INSERT INTO `transaction` VALUES('38', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('39', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('40', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('41', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('42', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('43', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('44', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('45', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('46', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('47', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('48', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('49', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('50', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('51', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('52', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('53', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('54', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('55', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('56', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('57', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('58', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('59', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('60', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('61', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('62', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('63', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('64', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('65', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('66', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('67', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('68', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('69', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('70', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('71', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('72', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('73', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('74', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('75', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('76', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('77', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('78', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('79', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('80', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('81', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('82', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('83', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('84', 'UPDATE', 'vehicle', '', '2015-08-15', '108');
INSERT INTO `transaction` VALUES('85', 'UPDATE', 'vehicle', '', '2015-08-15', '109');
INSERT INTO `transaction` VALUES('86', 'UPDATE', 'News', '', '2015-08-18', '108');
INSERT INTO `transaction` VALUES('87', 'UPDATE', 'News', '', '2015-08-18', '108');
INSERT INTO `transaction` VALUES('88', 'UPDATE', 'News', '', '2015-08-18', '108');
INSERT INTO `transaction` VALUES('89', 'UPDATE', 'News', '', '2015-08-18', '108');
INSERT INTO `transaction` VALUES('90', 'UPDATE', 'News', '', '2015-08-18', '108');
INSERT INTO `transaction` VALUES('91', 'UPDATE', 'Web-Homepg-4', '', '2015-08-18', '108');
INSERT INTO `transaction` VALUES('98', 'UPDATE', 'Web-Homepg-8', '', '2015-08-19', '108');
INSERT INTO `transaction` VALUES('103', 'UPDATE', 'News', '', '2015-08-19', '108');
INSERT INTO `transaction` VALUES('104', 'UPDATE', 'News', '', '2015-08-19', '108');
INSERT INTO `transaction` VALUES('114', 'DELETE', 'Web-Homepg-8', '', '2015-08-19', '97');
INSERT INTO `transaction` VALUES('115', 'DELETE', 'Web-Homepg-9', '', '2015-08-19', '97');
INSERT INTO `transaction` VALUES('118', 'INSERT', 'Customer', '', '2015-08-19', '97');
INSERT INTO `transaction` VALUES('120', 'DELETE', 'Web-Homepg-7', '', '2015-08-19', '81');
INSERT INTO `transaction` VALUES('121', 'UPDATE', 'pi_entries-amounts', '', '2015-08-19', '97');
INSERT INTO `transaction` VALUES('122', 'UPDATE', 'pi_entries-FOB', '', '2015-08-19', '97');
INSERT INTO `transaction` VALUES('123', 'UPDATE', 'invoice_proForma completed', '', '2015-08-19', '97');
INSERT INTO `transaction` VALUES('124', 'UPDATE', 'vehicle', '', '2015-08-19', '108');
INSERT INTO `transaction` VALUES('125', 'DELETE', 'ProForma Invoice canceled', '', '2015-08-19', '81');
INSERT INTO `transaction` VALUES('126', 'UPDATE', 'vehicle', '', '2015-08-19', '108');
INSERT INTO `transaction` VALUES('127', 'UPDATE', 'vehicle', '', '2015-08-19', '108');
INSERT INTO `transaction` VALUES('128', 'UPDATE', 'vehicle', '', '2015-08-19', '108');
INSERT INTO `transaction` VALUES('129', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('130', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('131', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('132', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('133', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('134', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('135', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('136', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('137', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('138', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('139', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('140', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('141', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('142', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('143', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('144', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('145', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('146', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('147', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('148', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('149', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('150', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('151', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('152', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('153', 'UPDATE', 'vehicle', '', '2015-08-20', '97');
INSERT INTO `transaction` VALUES('154', 'UPDATE', 'vehicle', '', '2015-08-20', '97');
INSERT INTO `transaction` VALUES('155', 'INSERT', 'Web', '', '2015-08-20', '97');
INSERT INTO `transaction` VALUES('156', 'INSERT', 'Web', '', '2015-08-20', '97');
INSERT INTO `transaction` VALUES('157', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('158', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('159', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('160', 'UPDATE', 'Model-WAGON R FZ', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('161', 'INSERT', 'maker_model', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('162', 'DELETE', 'Model', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('163', 'UPDATE', 'Model-LEAF X', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('164', 'UPDATE', 'Model-LEAF G', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('165', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('166', 'UPDATE', 'Model-WAGON R', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('167', 'DELETE', 'Model', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('168', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('169', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('170', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('171', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('172', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('173', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('174', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('175', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('176', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('177', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('178', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('179', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('180', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('181', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('182', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('183', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('184', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('185', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('186', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('187', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('188', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('189', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('190', 'UPDATE', 'Model-AQUA', '', '2015-08-20', '81');
INSERT INTO `transaction` VALUES('191', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('192', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('193', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('194', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('195', 'INSERT', 'maker_model', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('196', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('197', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('198', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('199', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('200', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('201', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('202', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('203', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('204', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('205', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('206', 'UPDATE', 'vehicle', '', '2015-08-20', '108');
INSERT INTO `transaction` VALUES('207', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('208', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('209', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('210', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('211', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('212', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('213', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('214', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('215', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('216', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('217', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('218', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('219', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('220', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('221', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('222', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('223', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('224', 'UPDATE', 'vehicle', '', '2015-08-22', '109');
INSERT INTO `transaction` VALUES('225', 'UPDATE', 'vehicle', '', '2015-08-24', '109');
INSERT INTO `transaction` VALUES('226', 'INSERT', 'maker_model', '', '2015-08-24', '109');
INSERT INTO `transaction` VALUES('227', 'UPDATE', 'vehicle', '', '2015-08-24', '109');
INSERT INTO `transaction` VALUES('228', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('229', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('230', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('231', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('232', 'UPDATE', 'vehicle', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('233', 'UPDATE', 'vehicle', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('234', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('235', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('236', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('237', 'UPDATE', 'vehicle', '', '2015-08-27', '97');
INSERT INTO `transaction` VALUES('238', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('239', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('240', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('241', 'INSERT', 'Web', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('242', 'UPDATE', 'vehicle', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('243', 'UPDATE', 'vehicle', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('244', 'INSERT', 'Web', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('245', 'UPDATE', 'System code', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('246', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('247', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('248', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('249', 'INSERT', 'Web', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('250', 'UPDATE', 'vehicle', '', '2015-08-27', '108');
INSERT INTO `transaction` VALUES('251', 'UPDATE', 'vehicle', '', '2015-08-27', '109');
INSERT INTO `transaction` VALUES('252', 'INSERT', 'V_Spec', '', '2015-08-27', '97');
INSERT INTO `transaction` VALUES('253', 'UPDATE', 'Model-WAGON R', '', '2015-08-27', '97');
INSERT INTO `transaction` VALUES('254', 'UPDATE', 'Model-WAGON R', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('255', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('256', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('257', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('258', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('259', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('260', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('261', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('262', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('263', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('264', 'UPDATE', 'vehicle', '', '2015-08-28', '97');
INSERT INTO `transaction` VALUES('265', 'UPDATE', 'vehicle', '', '2015-08-28', '97');
INSERT INTO `transaction` VALUES('266', 'UPDATE', 'vehicle', '', '2015-08-28', '97');
INSERT INTO `transaction` VALUES('267', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('268', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('269', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('270', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('271', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('272', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('273', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('274', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('275', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('276', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('277', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('278', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('279', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('280', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('281', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('282', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('283', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('284', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('285', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('286', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('287', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('288', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('289', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('290', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('291', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('292', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('293', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('294', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('295', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('296', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('297', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('298', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('299', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('300', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('301', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('302', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('303', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('304', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('305', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('306', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('307', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('308', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('309', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('310', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('311', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('312', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('313', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('314', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('315', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('316', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('317', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('318', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('319', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('320', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('321', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('322', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('323', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('324', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('325', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('326', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('327', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('328', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('329', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('330', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('331', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('332', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('333', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('334', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('335', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('336', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('337', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('338', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('339', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('340', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('341', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('342', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('343', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('344', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('345', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('346', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('347', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('348', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('349', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('350', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('351', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('352', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('353', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('354', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('355', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('356', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('357', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('358', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('359', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('360', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('361', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('362', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('363', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('364', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('365', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('366', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('367', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('368', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('369', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('370', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('371', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('372', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('373', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('374', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('375', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('376', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('377', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('378', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('379', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('380', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('381', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('382', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('383', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('384', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('385', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('386', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('387', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('388', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('389', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('390', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('391', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('392', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('393', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('394', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('395', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('396', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('397', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('398', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('399', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('400', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('401', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('402', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('403', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('404', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('405', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('406', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('407', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('408', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('409', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('410', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('411', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('412', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('413', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('414', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('415', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('416', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('417', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('418', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('419', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('420', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('421', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('422', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('423', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('424', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('425', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('426', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('427', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('428', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('429', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('430', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('431', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('432', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('433', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('434', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('435', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('436', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('437', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('438', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('439', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('440', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('441', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('442', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('443', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('444', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('445', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('446', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('447', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('448', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('449', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('450', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('451', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('452', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('453', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('454', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('455', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('456', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('457', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('458', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('459', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('460', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('461', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('462', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('463', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('464', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('465', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('466', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('467', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('468', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('469', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('470', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('471', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('472', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('473', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('474', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('475', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('476', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('477', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('478', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('479', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('480', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('481', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('482', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('483', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('484', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('485', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('486', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('487', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('488', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('489', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('490', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('491', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('492', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('493', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('494', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('495', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('496', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('497', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('498', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('499', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('500', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('501', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('502', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('503', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('504', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('505', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('506', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('507', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('508', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('509', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('510', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('511', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('512', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('513', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('514', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('515', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('516', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('517', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('518', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('519', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('520', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('521', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('522', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('523', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('524', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('525', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('526', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('527', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('528', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('529', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('530', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('531', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('532', 'INSERT', 'Web', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('533', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('534', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('535', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('536', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('537', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('538', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('539', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('540', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('541', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('542', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('543', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('544', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('545', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('546', 'UPDATE', 'Web-Homepg-12', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('547', 'DELETE', 'Web-Homepg-11', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('548', 'UPDATE', 'Web-Homepg-14', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('549', 'DELETE', 'Web-Homepg-3', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('551', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('552', 'DELETE', 'Web-Homepg-14', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('553', 'UPDATE', 'Web-Homepg-15', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('554', 'UPDATE', 'Web-Homepg-15', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('555', 'UPDATE', 'vehicle', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('556', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('557', 'DELETE', 'Web-Homepg-2', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('558', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('559', 'DELETE', 'Web-Homepg-15', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('560', 'UPDATE', 'Web-Homepg-15', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('561', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('562', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('563', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('564', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('565', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('566', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('567', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('568', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('569', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('570', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('571', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('572', 'INSERT', 'Web', '', '2015-08-28', '109');
INSERT INTO `transaction` VALUES('573', 'UPDATE', 'Web-Homepg-16', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('574', 'UPDATE', 'Web-Homepg-16', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('575', 'UPDATE', 'Web-Homepg-17', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('576', 'DELETE', 'Web-Homepg-1', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('577', 'UPDATE', 'Web-Homepg-18', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('578', 'UPDATE', 'Web-Homepg-18', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('579', 'UPDATE', 'Web-Homepg-17', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('580', 'UPDATE', 'Web-Homepg-16', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('581', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('582', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('583', 'UPDATE', 'vehicle', '', '2015-08-28', '108');
INSERT INTO `transaction` VALUES('584', 'INSERT', 'Web', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('585', 'UPDATE', 'Model-AXIO HYBRID', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('586', 'INSERT', 'maker_model', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('587', 'UPDATE', 'vehicle', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('588', 'INSERT', 'Maker', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('589', 'INSERT', 'maker_model', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('590', 'UPDATE', 'Web-Homepg-17', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('591', 'UPDATE', 'News', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('592', 'UPDATE', 'News', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('593', 'UPDATE', 'vehicle', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('594', 'UPDATE', 'vehicle', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('595', 'UPDATE', 'vehicle', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('596', 'UPDATE', 'vehicle:vehicle_modification', '', '2015-08-31', '108');
INSERT INTO `transaction` VALUES('597', 'DELETE', 'News-7', '', '2015-09-02', '81');
INSERT INTO `transaction` VALUES('598', 'UPDATE', 'News', '', '2015-09-02', '108');
INSERT INTO `transaction` VALUES('599', 'UPDATE', 'News', '', '2015-09-02', '108');
INSERT INTO `transaction` VALUES('600', 'DELETE', 'Web-Homepg-16', '', '2015-09-05', '108');
INSERT INTO `transaction` VALUES('601', 'UPDATE', 'vehicle', '', '2015-09-07', '109');
INSERT INTO `transaction` VALUES('602', 'UPDATE', 'vehicle', '', '2015-09-07', '109');
INSERT INTO `transaction` VALUES('603', 'UPDATE', 'vehicle', '', '2015-09-07', '109');
INSERT INTO `transaction` VALUES('604', 'UPDATE', 'vehicle', '', '2015-09-07', '108');
INSERT INTO `transaction` VALUES('605', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('606', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('607', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('608', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('609', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('610', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('611', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('612', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('613', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('614', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('615', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('616', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('617', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('618', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('619', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('620', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('621', 'UPDATE', 'Web-Homepg-18', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('622', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('623', 'UPDATE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('624', 'UPDATE', 'Web-Homepg-17', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('625', 'DELETE', 'Web-Homepg-17', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('626', 'DELETE', 'Web-Homepg-19', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('627', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('628', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('629', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('630', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('631', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('632', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('633', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('634', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('635', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('636', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('637', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('638', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('639', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('640', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('641', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('642', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('643', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('644', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('645', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('646', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('647', 'UPDATE', 'vehicle', '', '2015-09-09', '108');
INSERT INTO `transaction` VALUES('648', 'UPDATE', 'vehicle', '', '2015-09-09', '109');
INSERT INTO `transaction` VALUES('649', 'UPDATE', 'vehicle', '', '2015-09-09', '109');
INSERT INTO `transaction` VALUES('650', 'UPDATE', 'vehicle', '', '2015-09-09', '109');
INSERT INTO `transaction` VALUES('651', 'UPDATE', 'vehicle', '', '2015-09-09', '109');
INSERT INTO `transaction` VALUES('652', 'DELETE', 'Web-Homepg-12', '', '2015-09-10', '108');
INSERT INTO `transaction` VALUES('653', 'DELETE', 'Web-Homepg-23', '', '2015-09-10', '108');
INSERT INTO `transaction` VALUES('654', 'UPDATE', 'Web-Homepg-20', '', '2015-09-11', '108');
INSERT INTO `transaction` VALUES('655', 'UPDATE', 'Web-Homepg-21', '', '2015-09-11', '108');
INSERT INTO `transaction` VALUES('656', 'DELETE', 'Web-Homepg-22', '', '2015-09-11', '108');
INSERT INTO `transaction` VALUES('657', 'UPDATE', 'Web-Homepg-18', '', '2015-09-15', '108');
INSERT INTO `transaction` VALUES('658', 'UPDATE', 'Web-Homepg-20', '', '2015-09-15', '108');
INSERT INTO `transaction` VALUES('659', 'UPDATE', 'Web-Homepg-21', '', '2015-09-15', '108');
INSERT INTO `transaction` VALUES('660', 'DELETE', 'Web-Homepg-5', '', '2015-09-15', '108');
INSERT INTO `transaction` VALUES('661', 'INSERT', 'V_Spec', '', '2015-09-16', '81');
INSERT INTO `transaction` VALUES('662', 'INSERT', 'Web', '', '2015-09-17', '81');
INSERT INTO `transaction` VALUES('663', 'INSERT', 'Web', '', '2015-09-17', '81');
INSERT INTO `transaction` VALUES('664', 'INSERT', 'Web', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('665', 'INSERT', 'Web', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('666', 'INSERT', 'Web', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('667', 'UPDATE', 'vehicle-77', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('668', 'UPDATE', 'vehicle-22', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('669', 'UPDATE', 'vehicle-77', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('670', 'UPDATE', 'vehicle-77', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('671', 'UPDATE', 'vehicle-77', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('672', 'UPDATE', 'vehicle-725', '', '2015-09-25', '81');
INSERT INTO `transaction` VALUES('673', 'UPDATE', 'vehicle-13', '', '2015-09-29', '81');
INSERT INTO `transaction` VALUES('674', 'UPDATE', 'vehicle-13', '', '2015-09-29', '81');
INSERT INTO `transaction` VALUES('675', 'UPDATE', 'vehicle-13', '', '2015-09-29', '81');
INSERT INTO `transaction` VALUES('676', 'UPDATE', 'vehicle-13', '', '2015-09-29', '81');
INSERT INTO `transaction` VALUES('677', 'UPDATE', 'Vehicle-Location-13', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('678', 'UPDATE', 'Vehicle-Location-13', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('679', 'UPDATE', 'Vehicle-Location-13', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('680', 'UPDATE', 'Vehicle-Location-13', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('681', 'UPDATE', 'Vehicle-Location-13', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('682', 'UPDATE', 'Vehicle-Location-13', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('683', 'UPDATE', 'pi_entries-FOB', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('684', 'UPDATE', 'pi_entries-FOB', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('685', 'UPDATE', 'pi_entries-amounts', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('686', 'UPDATE', 'invoice_proForma-completed-{3}', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('687', 'UPDATE', 'vehicle-16', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('688', 'UPDATE', 'vehicle-16', '', '2015-10-02', '81');
INSERT INTO `transaction` VALUES('689', 'UPDATE', 'System code', '', '2015-10-05', '81');
INSERT INTO `transaction` VALUES('690', 'UPDATE', 'pi_entries-amounts', '', '2015-10-19', '81');
INSERT INTO `transaction` VALUES('691', 'UPDATE', 'pi_entries-FOB', '', '2015-10-19', '81');
INSERT INTO `transaction` VALUES('692', 'UPDATE', 'pi_entries-FOB', '', '2015-10-19', '81');
INSERT INTO `transaction` VALUES('693', 'UPDATE', 'invoice_proForma-completed-{4}', '', '2015-10-19', '81');
INSERT INTO `transaction` VALUES('694', 'UPDATE', 'System code', '', '2015-10-19', '81');
INSERT INTO `transaction` VALUES('695', 'UPDATE', 'System code', '', '2015-10-19', '81');
INSERT INTO `transaction` VALUES('696', 'UPDATE', 'System code', '', '2015-10-19', '81');
INSERT INTO `transaction` VALUES('697', 'UPDATE', 'invoice_proForma-completed-{2}', '', '2015-10-20', '81');
INSERT INTO `transaction` VALUES('698', 'INSERT', 'Web', '', '2015-11-03', '81');
INSERT INTO `transaction` VALUES('699', 'INSERT', 'Web', '', '2015-11-05', '81');
INSERT INTO `transaction` VALUES('700', 'DELETE', 'Webdata-22', '', '2015-11-06', '81');
INSERT INTO `transaction` VALUES('701', 'DELETE', 'Webdata-718', '', '2015-11-06', '81');
INSERT INTO `transaction` VALUES('702', 'UPDATE', 'cus_order-2', '', '2015-11-11', '81');
INSERT INTO `transaction` VALUES('703', 'INSERT', 'cus_order-5-{411}', '', '2015-11-11', '81');
INSERT INTO `transaction` VALUES('704', 'UPDATE', 'cus_order-5', '', '2015-11-11', '81');
INSERT INTO `transaction` VALUES('705', 'UPDATE', 'pi_entries-amounts', '', '2015-11-13', '81');
INSERT INTO `transaction` VALUES('706', 'INSERT', 'cus_order--{141}', '', '2015-11-13', '81');
INSERT INTO `transaction` VALUES('707', 'INSERT', 'cus_order-6-{144}', '', '2015-11-13', '81');
INSERT INTO `transaction` VALUES('708', 'INSERT', 'cus_order-7-{9}', '', '2015-11-13', '81');
INSERT INTO `transaction` VALUES('709', 'UPDATE', 'cancel-cus_order-', '', '2015-11-13', '81');
INSERT INTO `transaction` VALUES('710', 'UPDATE', 'cancel-cus_order-2', '', '2015-11-13', '81');
INSERT INTO `transaction` VALUES('711', 'DELETE', 'ProForma Invoice canceled', '', '2015-11-16', '81');
INSERT INTO `transaction` VALUES('712', 'UPDATE', 'cancel-cus_order-5', '', '2015-11-16', '81');
INSERT INTO `transaction` VALUES('713', 'INSERT', 'cus_order-8-{20}', '', '2015-11-16', '81');
INSERT INTO `transaction` VALUES('714', 'UPDATE', 'Customer-1', '', '2015-11-16', '81');
INSERT INTO `transaction` VALUES('715', 'INSERT', 'cus_order--{78}', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('716', 'INSERT', 'cus_order--{121}', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('717', 'INSERT', 'cus_order-4-146', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('718', 'UPDATE', 'cancel-cus_order-6', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('719', 'INSERT', 'cus_order-11-{145}', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('720', 'INSERT', 'cus_order-12-{2}', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('721', 'INSERT', 'cus_order-11-152', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('722', 'DELETE', 'ProForma Invoice canceled', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('723', 'DELETE', 'ProForma Invoice canceled', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('724', 'UPDATE', 'invoice_proForma-completed-{11}', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('725', 'UPDATE', 'pi_entries-amounts', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('726', 'UPDATE', 'invoice_proForma-completed-{11}', '', '2015-11-17', '81');
INSERT INTO `transaction` VALUES('727', 'INSERT', 'Web', '', '2015-11-20', '81');
INSERT INTO `transaction` VALUES('728', 'INSERT', 'Web', '', '2015-11-20', '81');
INSERT INTO `transaction` VALUES('729', 'UPDATE', 'pi_entries-amounts', '', '2015-11-26', '81');
INSERT INTO `transaction` VALUES('730', 'UPDATE', 'invoice_proForma-completed-{12}', '', '2015-11-26', '81');
INSERT INTO `transaction` VALUES('731', 'INSERT', 'Web', '', '2015-12-02', '81');
INSERT INTO `transaction` VALUES('732', 'INSERT', 'Web', '', '2015-12-02', '81');
INSERT INTO `transaction` VALUES('733', 'UPDATE', 'pi_entries-amounts', '', '2015-12-03', '81');
INSERT INTO `transaction` VALUES('734', 'UPDATE', 'invoice_proForma-completed-{25}', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('735', 'UPDATE', 'pi_entries-amounts', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('736', 'UPDATE', 'invoice_proForma-completed-{26}', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('737', 'UPDATE', 'Customer-1', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('738', 'UPDATE', 'Leasing Company', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('739', 'UPDATE', 'Customer-1', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('740', 'UPDATE', 'Customer-1', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('741', 'DELETE', 'ProForma Invoice canceled', '', '2015-12-04', '81');
INSERT INTO `transaction` VALUES('755', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('756', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('757', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('758', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('759', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('760', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('761', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('762', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('763', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('764', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('765', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('766', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('767', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('768', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('769', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('770', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('771', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('772', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('773', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('774', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('775', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('776', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('777', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('778', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('779', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('780', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('781', 'INSERT', 'Web', '', '2015-12-09', '81');
INSERT INTO `transaction` VALUES('831', 'DELETE', 'Webdata-21', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('832', 'DELETE', 'Webdata-21', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('833', 'DELETE', 'Webdata-21', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('834', 'DELETE', 'Clearing Delete-21', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('835', 'DELETE', 'ProForma Invoice canceled', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('836', 'DELETE', 'ProForma Invoice canceled', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('837', 'DELETE', 'ProForma Invoice canceled', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('838', 'DELETE', 'Clearing Delete-277', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('839', 'DELETE', 'Clearing Delete-278', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('840', 'UPDATE', 'pi_entries-amounts', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('841', 'UPDATE', 'invoice_proForma-completed-{49}', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('842', 'DELETE', 'ProForma Invoice canceled', '', '2015-12-11', '81');
INSERT INTO `transaction` VALUES('843', 'UPDATE', 'pi_entries-FOB', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('844', 'UPDATE', 'pi_entries-FOB', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('845', 'UPDATE', 'pi_entries-FOB', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('846', 'UPDATE', 'pi_entries-amounts', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('847', 'UPDATE', 'invoice_proForma-completed-{54}', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('848', 'UPDATE', 'pi_entries-FOB', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('849', 'UPDATE', 'pi_entries-amounts', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('850', 'UPDATE', 'invoice_proForma-completed-{55}', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('851', 'DELETE', 'ProForma Invoice canceled', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('856', 'DELETE', 'Clearing Delete-30', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('857', 'DELETE', 'Clearing Delete-35', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('858', 'DELETE', 'Clearing Delete-22', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('859', 'DELETE', 'Clearing Delete-13', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('860', 'INSERT', 'Web', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('861', 'INSERT', 'Web', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('862', 'INSERT', 'Web', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('863', 'INSERT', 'Web', '', '2015-12-14', '81');
INSERT INTO `transaction` VALUES('864', 'DELETE', 'ProForma Invoice canceled', '', '2015-12-15', '81');
INSERT INTO `transaction` VALUES('865', 'UPDATE', 'vehicle-776', '', '2015-12-18', '81');
INSERT INTO `transaction` VALUES('866', 'UPDATE', 'vehicle-776', '', '2015-12-18', '81');
INSERT INTO `transaction` VALUES('867', 'INSERT', 'credit transfer', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('868', 'INSERT', 'credit transfer', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('869', 'DELETE', 'Credit Transfer-', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('870', 'DELETE', 'Credit Transfer-', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('871', 'DELETE', 'Credit Transfer-', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('872', 'DELETE', 'Credit Transfer-', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('873', 'DELETE', 'Credit Transfer-', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('874', 'DELETE', 'Credit Transfer-', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('875', 'DELETE', 'Credit Transfer-795', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('876', 'DELETE', 'Credit Transfer-804', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('877', 'DELETE', 'Credit Transfer-802', '', '2015-12-21', '81');
INSERT INTO `transaction` VALUES('881', 'UPDATE', 'Vehicle-Location-62', '', '2015-12-22', '81');
INSERT INTO `transaction` VALUES('882', 'UPDATE', 'Vehicle-Location-59', '', '2015-12-22', '81');
INSERT INTO `transaction` VALUES('885', 'UPDATE', 'Vehicle-Location-62', '', '2015-12-22', '81');
INSERT INTO `transaction` VALUES('886', 'INSERT', 'Customer-Mr.Amila Prabath Dissanayake', '', '2015-12-30', '81');
INSERT INTO `transaction` VALUES('887', 'DELETE', 'ProForma Invoice canceled', '', '2016-01-04', '81');
INSERT INTO `transaction` VALUES('888', 'UPDATE', 'vehicle-38', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('889', 'UPDATE', 'vehicle-58', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('890', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('891', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('892', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('893', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('894', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('895', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('896', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('897', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('898', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('899', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('900', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('901', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('902', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('903', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('904', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('905', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('906', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('907', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('908', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('909', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('910', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('911', 'UPDATE', 'vehicle-59', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('912', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('913', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('914', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('915', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('916', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('917', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('918', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('919', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('920', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('921', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('922', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('923', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('924', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('925', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('926', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('927', 'INSERT', 'vehicle_sales', '', '2016-01-05', '81');
INSERT INTO `transaction` VALUES('928', 'DELETE', 'ProForma Invoice canceled', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('929', 'DELETE', 'ProForma Invoice canceled', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('930', 'DELETE', 'ProForma Invoice canceled', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('931', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('932', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('933', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('940', 'Cancel', 'Sales canceled', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('941', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('942', 'Cancel', 'Sales canceled', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('943', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('944', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('945', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('946', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('947', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('948', 'Cancel', 'Sales canceled', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('949', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('950', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('951', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('952', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('953', 'Cancel', 'Sales canceled', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('954', 'UPDATE', 'cus_order-10', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('955', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('956', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('957', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('958', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('959', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('960', 'INSERT', 'vehicle_sales', '', '2016-01-06', '81');
INSERT INTO `transaction` VALUES('961', 'DELETE', 'Leasing Company-5', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('962', 'DELETE', 'Leasing Company-9', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('963', 'DELETE', 'Leasing Company-8', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('964', 'DELETE', 'Leasing Company-7', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('965', 'DELETE', 'Leasing Company-6', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('966', 'UPDATE', 'leasing company-5', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('967', 'UPDATE', 'leasing company-2', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('968', 'UPDATE', 'leasing company-5', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('969', 'UPDATE', 'leasing company-5', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('970', 'UPDATE', 'leasing company-5', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('971', 'UPDATE', 'leasing company-10', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('972', 'DELETE', 'Leasing Company-12', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('973', 'DELETE', 'Leasing Company-11', '', '2016-01-08', '81');
INSERT INTO `transaction` VALUES('974', 'UPDATE', 'leasing company-2', '', '2016-01-11', '81');
INSERT INTO `transaction` VALUES('975', 'UPDATE', 'leasing company-5', '', '2016-01-11', '81');
INSERT INTO `transaction` VALUES('976', 'UPDATE', 'leasing company-5', '', '2016-01-11', '81');
INSERT INTO `transaction` VALUES('977', 'UPDATE', 'leasing company-5', '', '2016-01-11', '81');
INSERT INTO `transaction` VALUES('978', 'UPDATE', 'leasing company-10', '', '2016-01-11', '81');
INSERT INTO `transaction` VALUES('979', 'DELETE', 'Credit Transfer-33', '', '2016-01-11', '81');
INSERT INTO `transaction` VALUES('980', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('981', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('982', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('983', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('984', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('985', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('986', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('987', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('988', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('989', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('990', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('991', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('992', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('993', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('994', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('995', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('996', 'INSERT', 'credit transfer', '', '2016-01-12', '81');
INSERT INTO `transaction` VALUES('997', 'UPDATE', 'invoice_proForma-completed-{25}', '', '2016-01-18', '81');
INSERT INTO `transaction` VALUES('998', 'UPDATE', 'pi_entries-amounts', '', '2016-01-18', '81');
INSERT INTO `transaction` VALUES('999', 'UPDATE', 'invoice_proForma-completed-{62}', '', '2016-01-18', '81');
INSERT INTO `transaction` VALUES('1000', 'UPDATE', 'pi_entries-amounts', '', '2016-01-18', '81');
INSERT INTO `transaction` VALUES('1001', 'UPDATE', 'invoice_proForma-completed-{63}', '', '2016-01-18', '81');
INSERT INTO `transaction` VALUES('1002', 'UPDATE', 'pi_entries-amounts', '', '2016-01-18', '81');
INSERT INTO `transaction` VALUES('1003', 'UPDATE', 'invoice_proForma-completed-{64}', '', '2016-01-18', '81');
INSERT INTO `transaction` VALUES('1004', 'UPDATE', 'vehicle-39', '', '2016-01-19', '81');
INSERT INTO `transaction` VALUES('1005', 'UPDATE', 'vehicle-39', '', '2016-01-19', '81');
INSERT INTO `transaction` VALUES('1006', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1007', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1008', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1009', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1010', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1011', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1012', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1013', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1014', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1015', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1016', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1017', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1018', 'DELETE', 'ProForma Invoice canceled', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1019', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1020', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1021', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1022', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1023', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1024', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1025', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1026', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1027', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1028', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1029', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1030', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1031', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1032', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1033', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1034', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1035', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1036', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1037', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1038', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1039', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1040', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1041', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1042', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1043', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1044', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1045', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1046', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1047', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1048', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1049', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1050', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1051', 'UPDATE', 'credit_transfers', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1052', 'INSERT', 'credit transfer', '', '2016-01-20', '81');
INSERT INTO `transaction` VALUES('1053', 'DELETE', 'Credit Transfer-875', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1054', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1055', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1056', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1057', 'UPDATE', 'credit_transfers', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1058', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1059', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1060', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1061', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1062', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1063', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1064', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1065', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1066', 'DELETE', 'Credit Transfer-889', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1067', 'DELETE', 'Credit Transfer-888', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1068', 'DELETE', 'Credit Transfer-887', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1069', 'INSERT', 'credit transfer', '', '2016-01-22', '81');
INSERT INTO `transaction` VALUES('1070', 'INSERT', 'credit transfer', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1071', 'DELETE', 'Maker-33', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1072', 'UPDATE', 'vehicle-779', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1073', 'DELETE', 'Credit Transfer-898', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1074', 'DELETE', 'Credit Transfer-890', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1075', 'DELETE', 'Credit Transfer-886', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1076', 'INSERT', 'pay_order', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1077', 'INSERT', 'pay_order', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1078', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1079', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1080', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1081', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1082', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1083', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1084', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1085', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1086', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1087', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1088', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1089', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1090', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1091', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1092', 'UPDATE', 'credit_transfers', '', '2016-01-25', '81');
INSERT INTO `transaction` VALUES('1093', 'INSERT', 'Web', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1094', 'INSERT', 'Web', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1095', 'INSERT', 'Web', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1096', 'INSERT', 'Web', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1097', 'INSERT', 'Web', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1098', 'DELETE', 'Maker-45', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1099', 'DELETE', 'Maker-45', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1100', 'DELETE', 'Maker-42', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1101', 'DELETE', 'Maker-45', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1102', 'DELETE', 'Maker-45', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1103', 'DELETE', 'Maker-45', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1104', 'DELETE', 'Maker-45', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1105', 'DELETE', 'Maker-44', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1106', 'DELETE', 'Maker-47', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1107', 'DELETE', 'Maker-47', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1108', 'DELETE', 'Maker-44', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1109', 'DELETE', 'Maker-43', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1110', 'DELETE', 'PO Vehicle-46', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1111', 'DELETE', 'PO Vehicle-48', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1112', 'DELETE', 'PO Vehicle-45', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1113', 'DELETE', 'PO Vehicle-43', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1114', 'DELETE', 'PO Vehicle-48', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1115', 'DELETE', 'PO Vehicle-42', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1116', 'DELETE', 'PO Vehicle-47', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1117', 'DELETE', 'PO Vehicle-41', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1118', 'DELETE', 'PO Vehicle-40', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1119', 'DELETE', 'PO Vehicle-7', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1120', 'DELETE', 'PO Vehicle-6', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1121', 'DELETE', 'PO Vehicle-5', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1122', 'INSERT', 'credit transfer', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1123', 'INSERT', 'credit transfer', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1124', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1125', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1126', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1127', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1128', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1129', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1130', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1131', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1132', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1133', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1134', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1135', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1136', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1137', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1138', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1139', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1140', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1141', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1142', 'UPDATE', 'credit_transfers', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1143', 'INSERT', 'pay_order', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1144', 'INSERT', 'pay_order', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1145', 'INSERT', 'pay_order', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1146', 'INSERT', 'pay_order', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1147', 'INSERT', 'pay_order', '', '2016-01-26', '81');
INSERT INTO `transaction` VALUES('1148', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1149', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1150', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1151', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1152', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1153', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1154', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1155', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1156', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1157', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1158', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1159', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1160', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1161', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1162', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1163', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1164', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1165', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1166', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1167', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1168', 'UPDATE', 'vehicle-780', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1169', 'INSERT', 'credit transfer', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1170', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1171', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1172', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1173', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1174', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1175', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1176', 'INSERT', 'pay_order', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1177', 'UPDATE', 'credit_transfers', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1178', 'UPDATE', 'credit_transfers', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1179', 'UPDATE', 'credit_transfers', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1180', 'UPDATE', 'PO Vehicle-', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1181', 'UPDATE', 'PO Vehicle-', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1182', 'UPDATE', 'PO Vehicle-', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1183', 'UPDATE', 'PO Vehicle-', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1184', 'UPDATE', 'PO Vehicle-', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1185', 'UPDATE', 'PO Vehicle-', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1186', 'UPDATE', 'PO Vehicle-53', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1187', 'UPDATE', 'PO Vehicle-74', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1188', 'UPDATE', 'PO Vehicle-74', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1189', 'UPDATE', 'PO Vehicle-113', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1190', 'DELETE', 'PO Vehicle-130', '', '2016-01-27', '81');
INSERT INTO `transaction` VALUES('1191', 'INSERT', 'credit transfer', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1192', 'DELETE', 'PO Vehicle-109', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1193', 'DELETE', 'PO Vehicle-95', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1194', 'DELETE', 'PO Vehicle-92', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1195', 'UPDATE', 'PO Vehicle-92', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1198', 'DELETE', 'PO Vehicle-53', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1199', 'DELETE', 'PO Vehicle-74', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1200', 'DELETE', 'PO Vehicle-148', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1201', 'DELETE', 'PO Vehicle-159', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1202', 'DELETE', 'PO Vehicle-150', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1203', 'DELETE', 'PO Vehicle-163', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1204', 'DELETE', 'PO Vehicle-165', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1205', 'DELETE', 'PO Vehicle-165', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1206', 'UPDATE', 'PO Vehicle-164', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1207', 'INSERT', 'pay_order', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1208', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1209', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1210', 'INSERT', 'credit transfer', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1211', 'INSERT', 'credit transfer', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1212', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1213', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1214', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1215', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1216', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1217', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1218', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1219', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1220', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1221', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1222', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1223', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1224', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1225', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1226', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1227', 'DELETE', 'Credit Transfer-869', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1228', 'DELETE', 'Credit Transfer-871', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1229', 'DELETE', 'Credit Transfer-874', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1230', 'DELETE', 'Credit Transfer-876', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1231', 'DELETE', 'Credit Transfer-873', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1232', 'DELETE', 'Credit Transfer-877', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1233', 'DELETE', 'Credit Transfer-879', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1234', 'DELETE', 'Credit Transfer-881', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1235', 'DELETE', 'Credit Transfer-883', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1236', 'DELETE', 'Credit Transfer-884', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1237', 'DELETE', 'Credit Transfer-882', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1238', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1239', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1240', 'INSERT', 'credit transfer', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1241', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1242', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1243', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1244', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1245', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1246', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1247', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1248', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1249', 'UPDATE', 'credit_transfers', '', '2016-01-28', '81');
INSERT INTO `transaction` VALUES('1250', 'INSERT', 'pay_order', '', '2016-01-29', '81');
INSERT INTO `transaction` VALUES('1251', 'UPDATE', 'credit_transfers', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1252', 'UPDATE', 'credit_transfers', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1253', 'UPDATE', 'credit_transfers', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1254', 'UPDATE', 'credit_transfers', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1255', 'UPDATE', 'credit_transfers', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1256', 'DELETE', 'Credit Transfer-878', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1257', 'DELETE', 'Credit Transfer-905', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1258', 'DELETE', 'Credit Transfer-906', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1259', 'DELETE', 'Credit Transfer-941', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1260', 'UPDATE', 'credit_transfers', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1261', 'INSERT', 'credit transfer', '', '2016-02-02', '81');
INSERT INTO `transaction` VALUES('1262', 'UPDATE', 'credit_transfers', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1263', 'UPDATE', 'credit_transfers', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1264', 'UPDATE', 'credit_transfers', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1265', 'UPDATE', 'credit_transfers', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1266', 'UPDATE', 'Leasing Company', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1267', 'UPDATE', 'Leasing Company', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1268', 'UPDATE', 'Customer Bank', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1269', 'UPDATE', 'Customer Bank', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1270', 'UPDATE', 'Customer Bank', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1271', 'UPDATE', 'Customer Bank', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1272', 'UPDATE', 'Customer Bank', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1273', 'DELETE', 'Leasing Co-7', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1274', 'DELETE', 'Leasing Co-7', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1275', 'DELETE', 'Customer Bank-7', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1276', 'UPDATE', 'credit_transfers', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1277', 'UPDATE', 'credit_transfers', '', '2016-02-03', '81');
INSERT INTO `transaction` VALUES('1278', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1279', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1280', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1281', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1282', 'DELETE', 'Customer Bank-8', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1283', 'DELETE', 'Customer Bank-8', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1284', 'DELETE', 'Customer Bank-8', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1285', 'DELETE', 'Customer Bank-10', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1286', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1287', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1288', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1289', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1290', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1291', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1292', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1293', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1294', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1295', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1296', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1297', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1298', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1299', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1300', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1301', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1302', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1303', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1304', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1305', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1306', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1307', 'DELETE', 'Customer Bank-12', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1308', 'DELETE', 'Customer Bank-13', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1309', 'DELETE', 'Customer Bank-14', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1310', 'DELETE', 'Customer Bank-15', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1311', 'DELETE', 'Customer Bank-16', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1312', 'UPDATE', 'System Bank', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1313', 'UPDATE', 'credit_transfers', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1314', 'INSERT', 'Customer-fdafa', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1315', 'DELETE', 'Customer-3', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1316', 'UPDATE', 'Customer-2', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1317', 'UPDATE', 'Customer-2', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1318', 'UPDATE', 'Customer-2', '', '2016-02-05', '81');
INSERT INTO `transaction` VALUES('1319', 'INSERT', 'Web', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1320', 'UPDATE', 'invoice_proForma-completed-{55}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1321', 'UPDATE', 'invoice_proForma-completed-{12}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1322', 'UPDATE', 'invoice_proForma-completed-{62}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1323', 'UPDATE', 'invoice_proForma-completed-{63}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1324', 'UPDATE', 'invoice_proForma-completed-{66}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1325', 'UPDATE', 'invoice_proForma-completed-{67}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1326', 'UPDATE', 'invoice_proForma-completed-{68}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1327', 'UPDATE', 'invoice_proForma-completed-{69}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1328', 'UPDATE', 'invoice_proForma-completed-{70}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1332', 'UPDATE', 'invoice_proForma-completed-{74}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1333', 'UPDATE', 'invoice_proForma-completed-{75}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1334', 'UPDATE', 'invoice_proForma-completed-{76}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1335', 'UPDATE', 'invoice_proForma-completed-{77}', '', '2016-02-08', '81');
INSERT INTO `transaction` VALUES('1336', 'INSERT', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1337', 'INSERT', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1338', 'INSERT', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1339', 'INSERT', 'vehicle_sales', '', '2016-02-09', '');
INSERT INTO `transaction` VALUES('1340', 'INSERT', 'vehicle_sales', '', '2016-02-09', '');
INSERT INTO `transaction` VALUES('1341', 'INSERT', 'vehicle_sales', '', '2016-02-09', '');
INSERT INTO `transaction` VALUES('1342', 'INSERT', 'vehicle_sales', '', '2016-02-09', '');
INSERT INTO `transaction` VALUES('1343', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '');
INSERT INTO `transaction` VALUES('1344', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '');
INSERT INTO `transaction` VALUES('1345', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1346', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1347', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1348', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1349', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1350', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1351', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1352', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1353', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1354', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1355', 'DELETE', 'ProForma Invoice canceled', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1356', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1357', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1358', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1359', 'UPDATE', 'vehicle_sales', '', '2016-02-09', '81');
INSERT INTO `transaction` VALUES('1360', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1361', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1362', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1363', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1364', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1365', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1366', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1367', 'UPDATE', 'vehicle_sales', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1368', 'UPDATE', 'vehicle-5', '', '2016-02-10', '81');
INSERT INTO `transaction` VALUES('1382', 'UPDATE', 'vehicle_sales', '', '2016-02-11', '81');
INSERT INTO `transaction` VALUES('1383', 'UPDATE', 'vehicle_sales', '', '2016-02-11', '81');
INSERT INTO `transaction` VALUES('1384', 'UPDATE', 'vehicle_sales', '', '2016-02-11', '81');
INSERT INTO `transaction` VALUES('1385', 'UPDATE', 'vehicle_sales', '', '2016-02-11', '81');
INSERT INTO `transaction` VALUES('1387', 'INSERT', 'sales save', '', '2016-02-11', '81');
INSERT INTO `transaction` VALUES('1388', 'INSERT', 'sales save', '', '2016-02-11', '81');
INSERT INTO `transaction` VALUES('1389', 'UPDATE', 'vehicle_sales', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1390', 'UPDATE', 'pi_entries-amounts', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1391', 'UPDATE', 'invoice_proForma-completed-{79}', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1392', 'UPDATE', 'invoice_proForma-completed-{80}', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1393', 'UPDATE', 'invoice_proForma-completed-{91}', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1394', 'UPDATE', 'invoice_proForma-completed-{92}', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1395', 'UPDATE', 'invoice_proForma-completed-{93}', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1396', 'UPDATE', 'invoice_proForma-completed-{94}', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1397', 'UPDATE', 'invoice_proForma-completed-{95}', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1400', 'INSERT', 'sales save', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1401', 'UPDATE', 'vehicle_sales', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1402', 'UPDATE', 'vehicle_sales', '', '2016-02-12', '81');
INSERT INTO `transaction` VALUES('1407', 'INSERT', 'driver charges', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1408', 'INSERT', 'pay_order', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1409', 'INSERT', 'pay_order', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1410', 'ADD', 'driver payment', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1411', 'INSERT', 'driver charges', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1412', 'ADD', 'driver payment', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1413', 'UPDATE', 'cancel-cus_order-13', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1414', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1415', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1416', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1417', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1418', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1419', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1420', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1421', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1422', 'UPDATE', 'vehicle_sales', '', '2016-02-15', '81');
INSERT INTO `transaction` VALUES('1424', 'INSERT', 'sales save', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1425', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1426', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1427', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1428', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1429', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1430', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1431', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1432', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1433', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1434', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1435', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1436', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1437', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1438', 'UPDATE', 'vehicle_sales', '', '2016-02-16', '81');
INSERT INTO `transaction` VALUES('1439', 'UPDATE', 'leasing company-13', '', '2016-02-17', '81');
INSERT INTO `transaction` VALUES('1440', 'UPDATE', 'Customer-1', '', '2016-02-17', '81');
INSERT INTO `transaction` VALUES('1441', 'UPDATE', 'invoice_proForma-completed-{55}', '', '2016-02-17', '81');
INSERT INTO `transaction` VALUES('1443', 'UPDATE', 'vehicle_modification-781', '', '2016-02-23', '81');
INSERT INTO `transaction` VALUES('1444', 'INSERT', 'Customer-Kamal Perera', '', '2016-03-01', '81');
INSERT INTO `transaction` VALUES('1445', 'UPDATE', 'Customer-4', '', '2016-03-01', '81');
INSERT INTO `transaction` VALUES('1446', 'DELETE', 'Leasing Company-13', '', '2016-03-04', '81');
INSERT INTO `transaction` VALUES('1447', 'UPDATE', 'cancel-cus_order-36', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1448', 'UPDATE', 'cancel-cus_order-36', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1449', 'UPDATE', 'cancel-cus_order-16', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1450', 'INSERT', 'driver charges', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1451', 'UPDATE', 'cancel-cus_order-16', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1452', 'UPDATE', 'cancel-cus_order-16', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1453', 'UPDATE', 'cancel-cus_order-16', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1454', 'CANCEL', 'cancel-drch_balance-', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1455', 'CANCEL', 'cancel-drch_balance-', '', '2016-03-07', '81');
INSERT INTO `transaction` VALUES('1456', 'CANCEL', 'cancel-drch_balance-', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1457', 'CANCEL', 'cancel-drch_balance-', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1458', 'CANCEL', 'cancel-drch_balance-8', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1459', 'CANCEL', 'cancel-drch_balance-35', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1460', 'CANCEL', 'cancel-drch_balance-34', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1461', 'CANCEL', 'cancel-drch_balance-33', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1462', 'CANCEL', 'cancel-drch_balance-32', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1463', 'CANCEL', 'cancel-drch_balance-31', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1464', 'CANCEL', 'cancel-drch_balance-29', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1465', 'CANCEL', 'cancel-drch_balance-28', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1466', 'CANCEL', 'cancel-drch_balance-24', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1467', 'CANCEL', 'cancel-drch_balance-23', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1468', 'CANCEL', 'cancel-drch_balance-18', '', '2016-03-08', '81');
INSERT INTO `transaction` VALUES('1469', 'ADD', 'driver payment', '', '2016-03-10', '81');
INSERT INTO `transaction` VALUES('1470', 'ADD', 'driver payment', '', '2016-03-10', '81');
INSERT INTO `transaction` VALUES('1471', 'UPDATE', 'vehicle-781', '', '2016-03-11', '81');
INSERT INTO `transaction` VALUES('1472', 'UPDATE', 'vehicle-781', '', '2016-03-11', '81');
INSERT INTO `transaction` VALUES('1473', 'UPDATE', 'vehicle-781', '', '2016-03-11', '81');
INSERT INTO `transaction` VALUES('1474', 'INSERT', 'sales save', '', '2016-03-14', '81');
INSERT INTO `transaction` VALUES('1476', 'INSERT', 'sales save', '', '2016-03-14', '81');
INSERT INTO `transaction` VALUES('1477', 'UPDATE', 'vehicle_sales', '14:20:30', '2016-03-14', '81');
INSERT INTO `transaction` VALUES('1478', 'INSERT', 'driver charges', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1479', 'INSERT', 'driver charges', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1480', 'UPDATE', 'vehicle-781~undefined', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1481', 'DELETE', 'Credit Transfer-33', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1482', 'DELETE', 'Leasing Company-13', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1483', 'DELETE', 'Leasing Company-14', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1484', 'DELETE', 'Leasing Company-13', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1485', 'DELETE', 'Leasing Company-10', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1486', 'UPDATE', 'leasing company-2', '', '2016-03-15', '81');
INSERT INTO `transaction` VALUES('1487', 'UPDATE', 'Insurance company-13', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1488', 'UPDATE', 'Insurance company-13', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1489', 'UPDATE', 'Insurance company-14', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1490', 'DELETE', 'Leasing Company-', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1491', 'DELETE', 'Leasing Company-', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1492', 'DELETE', 'Leasing Company-', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1493', 'DELETE', 'Leasing Company-', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1494', 'DELETE', 'Insurance Company-19', '', '2016-03-16', '81');
INSERT INTO `transaction` VALUES('1495', 'UPDATE', 'vehicle_sales', '09:21:01', '2016-03-17', '81');
INSERT INTO `transaction` VALUES('1496', 'UPDATE', 'vehicle_sales', '15:46:48', '2016-03-17', '81');
INSERT INTO `transaction` VALUES('1497', 'UPDATE', 'vehicle_sales', '16:09:10', '2016-03-17', '81');
INSERT INTO `transaction` VALUES('1498', 'UPDATE', 'vehicle_sales', '16:12:01', '2016-03-17', '81');
INSERT INTO `transaction` VALUES('1499', 'UPDATE', 'vehicle_sales', '16:12:58', '2016-03-17', '81');
INSERT INTO `transaction` VALUES('1500', 'UPDATE', 'vehicle_sales', '16:14:10', '2016-03-17', '81');
INSERT INTO `transaction` VALUES('1501', 'UPDATE', 'vehicle_sales', '16:14:38', '2016-03-17', '81');
INSERT INTO `transaction` VALUES('1502', 'INSERT', 'driver charges', '', '2016-03-18', '81');
INSERT INTO `transaction` VALUES('1503', 'INSERT', 'driver charges', '', '2016-03-18', '81');
INSERT INTO `transaction` VALUES('1504', 'ADD', 'driver payment', '', '2016-03-18', '81');
INSERT INTO `transaction` VALUES('1505', 'ADD', 'driver payment', '', '2016-03-18', '81');
INSERT INTO `transaction` VALUES('1506', 'UPDATE', 'vehicle-781~undefined', '', '2016-03-18', '81');
INSERT INTO `transaction` VALUES('1507', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1508', 'UPDATE', 'vehicle-778~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1509', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1510', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1511', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1512', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1513', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1514', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1515', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1516', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1517', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1518', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1519', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1520', 'UPDATE', 'vehicle-779~undefined', '', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1521', 'UPDATE', 'vehicle_sales', '10:39:44', '2016-03-21', '81');
INSERT INTO `transaction` VALUES('1522', 'UPDATE', 'vehicle_sales', '10:45:27', '2016-03-23', '81');
INSERT INTO `transaction` VALUES('1523', 'INSERT', 'Customer-Saman', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1524', 'INSERT', 'Customer-Nimal Weragoda', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1525', 'INSERT', 'Customer-Jayantha', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1526', 'UPDATE', 'Customer-7', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1527', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1528', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1529', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1530', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1531', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1532', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1533', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1534', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1535', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1536', 'INSERT', 'driver charges', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1537', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1538', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1539', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1540', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1541', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1542', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1543', 'ADD', 'driver payment', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1544', 'DELETE', 'Credit Transfer-undefined', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1545', 'DELETE', 'Credit Transfer-undefined', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1546', 'DELETE', 'Credit Transfer-undefined', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1547', 'DELETE', 'Credit Transfer-undefined', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1548', 'DELETE', 'Credit Transfer-undefined', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1549', 'DELETE', 'Credit Transfer-undefined', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1550', 'DELETE', 'Credit Transfer-undefined', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1551', 'DELETE', 'Credit Transfer-5226', '', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1552', 'UPDATE', 'vehicle_sales', '18:11:51', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1553', 'UPDATE', 'vehicle_sales', '18:12:07', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1554', 'UPDATE', 'vehicle_sales', '18:12:27', '2016-03-24', '81');
INSERT INTO `transaction` VALUES('1555', 'UPDATE', 'vehicle_sales', '11:01:23', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1556', 'UPDATE', 'vehicle_sales', '11:15:33', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1557', 'UPDATE', 'vehicle_sales', '11:16:01', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1558', 'UPDATE', 'vehicle_sales', '11:16:37', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1559', 'UPDATE', 'vehicle_sales', '11:16:55', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1560', 'UPDATE', 'vehicle_sales', '11:22:21', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1561', 'UPDATE', 'vehicle_sales', '13:39:58', '2016-03-25', '111');
INSERT INTO `transaction` VALUES('1562', 'UPDATE', 'vehicle_sales', '13:44:24', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1563', 'UPDATE', 'vehicle_sales', '13:44:45', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1564', 'UPDATE', 'vehicle_sales', '13:45:13', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1565', 'UPDATE', 'vehicle_sales', '13:45:34', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1566', 'UPDATE', 'vehicle_sales', '14:17:22', '2016-03-25', '111');
INSERT INTO `transaction` VALUES('1567', 'UPDATE', 'vehicle_sales', '14:19:44', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1568', 'UPDATE', 'vehicle_sales', '14:20:57', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1569', 'UPDATE', 'vehicle_sales', '14:21:56', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1570', 'UPDATE', 'vehicle_sales', '14:22:21', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1571', 'UPDATE', 'vehicle_sales', '14:44:50', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1572', 'UPDATE', 'vehicle_sales', '17:20:32', '2016-03-25', '111');
INSERT INTO `transaction` VALUES('1573', 'UPDATE', 'vehicle_sales', '17:20:43', '2016-03-25', '111');
INSERT INTO `transaction` VALUES('1574', 'INSERT', 'driver charges', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1575', 'ADD', 'driver payment', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1576', 'INSERT', 'driver charges', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1577', 'INSERT', 'driver charges', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1578', 'INSERT', 'driver charges', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1579', 'INSERT', 'driver charges', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1580', 'INSERT', 'driver charges', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1581', 'ADD', 'driver payment', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1582', 'INSERT', 'driver charges', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1583', 'ADD', 'driver payment', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1584', 'ADD', 'driver payment', '', '2016-03-25', '81');
INSERT INTO `transaction` VALUES('1585', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1586', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1587', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1588', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1589', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1590', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1591', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1592', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1593', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1594', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1595', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1596', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1597', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1598', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1599', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1600', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1601', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1602', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1603', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1604', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1605', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1606', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1607', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1608', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1609', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1610', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1611', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1612', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1613', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1614', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1615', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1616', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1617', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1618', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1619', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1620', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1621', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1622', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1623', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1624', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1625', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1626', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1627', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1628', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1629', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1630', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1631', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1632', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1633', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1634', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1635', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1636', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1637', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1638', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1639', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1640', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1641', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1642', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1643', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1644', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1645', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1646', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1647', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1648', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1649', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1650', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1651', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1652', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1653', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1654', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1655', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1656', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1657', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1658', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1659', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1660', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1661', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1662', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1663', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1664', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1665', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1666', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1667', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1668', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1669', 'INSERT', 'driver charges', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1670', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1671', 'ADD', 'driver payment', '', '2016-03-28', '81');
INSERT INTO `transaction` VALUES('1672', 'INSERT', 'driver charges', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1673', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1674', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1675', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1676', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1677', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1678', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1679', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1680', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1681', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1682', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1683', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1684', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1685', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1686', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1687', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1688', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1689', 'ADD', 'driver payment', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1690', 'INSERT', 'driver charges', '', '2016-03-29', '81');
INSERT INTO `transaction` VALUES('1691', 'INSERT', 'driver charges', '', '2016-04-04', '81');
INSERT INTO `transaction` VALUES('1692', 'INSERT', 'driver charges', '', '2016-04-04', '81');
INSERT INTO `transaction` VALUES('1693', 'ADD', 'driver payment', '', '2016-04-04', '81');
INSERT INTO `transaction` VALUES('1694', 'ADD', 'driver payment', '', '2016-04-04', '81');
INSERT INTO `transaction` VALUES('1695', 'ADD', 'driver payment', '', '2016-04-11', '81');
INSERT INTO `transaction` VALUES('1696', 'ADD', 'driver payment', '', '2016-04-11', '81');
INSERT INTO `transaction` VALUES('1697', 'UPDATE', 'vehicle-745', '', '2016-04-18', '81');
INSERT INTO `transaction` VALUES('1698', 'UPDATE', 'vehicle-745', '', '2016-04-18', '81');
INSERT INTO `transaction` VALUES('1699', 'UPDATE', 'vehicle-745', '', '2016-04-18', '81');
INSERT INTO `transaction` VALUES('1700', 'UPDATE', 'System Bank', '', '2016-04-20', '81');
INSERT INTO `transaction` VALUES('1701', 'ADD', 'driver payment', '', '2016-04-20', '81');
INSERT INTO `transaction` VALUES('1702', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1703', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1704', 'DELETE', 'Driver_Balance_a-id-7', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1705', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1706', 'DELETE', 'Driver_Balance_a-id-4', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1707', 'DELETE', 'Driver_Balance_a-id-10', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1708', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1709', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1710', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1711', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1712', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1713', 'ADD', 'driver payment', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1714', 'DELETE', 'Driver_Balance_a-id-66', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1715', 'INSERT', 'driver charges', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1716', 'INSERT', 'driver charges', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1717', 'INSERT', 'driver charges', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1718', 'INSERT', 'driver charges', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1719', 'INSERT', 'driver charges', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1720', 'INSERT', 'driver charges', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1721', 'INSERT', 'driver charges', '', '2016-04-22', '81');
INSERT INTO `transaction` VALUES('1722', 'INSERT', 'credit transfer', '', '2016-04-25', '81');
INSERT INTO `transaction` VALUES('1723', 'INSERT', 'credit transfer', '', '2016-04-25', '81');
INSERT INTO `transaction` VALUES('1724', 'ADD', 'driver payment', '', '2016-04-25', '81');
INSERT INTO `transaction` VALUES('1725', 'UPDATE', 'System Bank', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1726', 'UPDATE', 'System Bank', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1727', 'UPDATE', 'System Bank', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1728', 'UPDATE', 'System Bank', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1729', 'UPDATE', 'System Bank', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1730', 'DELETE', 'PO Vehicle-214', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1731', 'DELETE', 'PO Vehicle-212', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1732', 'DELETE', 'PO Vehicle-222', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1733', 'INSERT', 'pay_order', '', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1734', 'INSESRT', 'vehicle_leasing', '15:06:49', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1735', 'INSESRT', 'vehicle_leasing', '15:07:00', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1736', 'INSESRT', 'vehicle_leasing', '15:07:04', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1737', 'INSESRT', 'vehicle_leasing', '15:07:11', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1738', 'INSESRT', 'vehicle_leasing', '15:07:17', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1739', 'INSESRT', 'vehicle_leasing', '15:34:11', '2016-04-26', '81');
INSERT INTO `transaction` VALUES('1740', 'UPDATE', 'vehicle-782', '', '2016-04-27', '81');
INSERT INTO `transaction` VALUES('1741', 'UPDATE', 'vehicle-782', '', '2016-04-27', '81');
INSERT INTO `transaction` VALUES('1742', 'UPDATE', 'vehicle-782', '', '2016-04-27', '81');
INSERT INTO `transaction` VALUES('1743', 'DELETE', 'System Code-90', '', '2016-05-02', '81');
INSERT INTO `transaction` VALUES('1744', 'INSERT', 'credit transfer', '', '2016-08-30', '81');
INSERT INTO `transaction` VALUES('1745', 'UPDATE', 'credit_transfers', '', '2016-08-30', '81');
INSERT INTO `transaction` VALUES('1746', 'INSERT', 'pay_order', '', '2016-08-30', '81');
INSERT INTO `transaction` VALUES('1747', 'INSERT', 'credit transfer', '', '2016-08-30', '81');
INSERT INTO `transaction` VALUES('1748', 'INSERT', 'credit transfer', '', '2016-08-31', '81');
INSERT INTO `transaction` VALUES('1749', 'UPDATE', 'News', '', '2017-07-24', '81');
INSERT INTO `transaction` VALUES('1750', 'DELETE', 'News-10', '', '2017-07-27', '81');
INSERT INTO `transaction` VALUES('1751', 'DELETE', 'News-10', '', '2017-07-27', '81');
INSERT INTO `transaction` VALUES('1752', 'DELETE', 'News-10', '', '2017-07-27', '81');
INSERT INTO `transaction` VALUES('1755', 'UPDATE', 'News', '', '2017-07-27', '81');
INSERT INTO `transaction` VALUES('1756', 'UPDATE', 'News', '', '2017-07-27', '81');
INSERT INTO `transaction` VALUES('1757', 'UPDATE', 'Maker-11', '', '2017-08-01', '81');
INSERT INTO `transaction` VALUES('1758', 'UPDATE', 'Maker-11', '', '2017-08-01', '81');
INSERT INTO `transaction` VALUES('1759', 'UPDATE', 'News', '', '2017-08-01', '81');
INSERT INTO `transaction` VALUES('1760', 'UPDATE', 'vehicle-784', '', '2018-06-18', '81');
INSERT INTO `transaction` VALUES('1761', 'UPDATE', 'vehicle-785', '', '2018-06-19', '81');
INSERT INTO `transaction` VALUES('1762', 'INSERT', 'Subject', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1763', 'INSERT', 'Subject', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1764', 'DELETE', 'Maker-', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1765', 'INSERT', 'Subject', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1766', 'DELETE', 'Maker-', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1767', 'DELETE', 'Maker-', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1768', 'DELETE', 'Maker-6', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1769', 'DELETE', 'Maker-6', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1770', 'DELETE', 'Maker-6', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1771', 'DELETE', 'Maker-6', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1772', 'DELETE', 'Maker-5', '', '2018-07-02', '81');
INSERT INTO `transaction` VALUES('1773', 'DELETE', 'Maker-4', '', '2018-07-02', '81');


-- Dumping structure for table: `vehicle`

DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `vh_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_index_num` int(11) DEFAULT NULL,
  `vh_code` varchar(45) DEFAULT NULL,
  `supp_id` int(11) NOT NULL,
  `vh_maker_model` int(11) NOT NULL,
  `vh_chassis_code` varchar(45) DEFAULT '',
  `vh_chassis_num` varchar(45) DEFAULT '',
  `engine_code` varchar(45) DEFAULT '',
  `engine_num` varchar(45) DEFAULT '',
  `engine_cc` double DEFAULT '0',
  `package` varchar(45) DEFAULT NULL,
  `vh_year` varchar(15) DEFAULT '',
  `vh_color` varchar(45) DEFAULT NULL,
  `vh_milage` double DEFAULT NULL,
  `vh_options` varchar(45) DEFAULT NULL,
  `fuel_type` varchar(45) DEFAULT NULL COMMENT 'Diesel, Petrol,Gasoline',
  `transmission` varchar(45) DEFAULT NULL COMMENT 'Automatic/Manual',
  `seats` varchar(45) DEFAULT NULL COMMENT '2,4,5',
  `doors` varchar(45) DEFAULT NULL COMMENT '2,4',
  `eval_grade` varchar(45) DEFAULT NULL COMMENT 'S [Exterior: A, Interior:A]',
  `drive_wheels` varchar(45) DEFAULT NULL COMMENT '2WD/4WD',
  `currency_type` varchar(45) DEFAULT NULL COMMENT 'LKR/JPY',
  `color_group` varchar(45) DEFAULT NULL,
  `vh_group` varchar(45) DEFAULT '',
  `additional_options` varchar(45) DEFAULT NULL,
  `bid_date` date DEFAULT NULL,
  `auction_name` varchar(45) DEFAULT NULL,
  `lot_no` varchar(45) DEFAULT NULL,
  `auction_grade` varchar(45) DEFAULT NULL,
  `auc_display_price` double DEFAULT NULL,
  `vh_disp_price` double(10,2) DEFAULT NULL COMMENT 'vehicle sale price',
  `auc_real_price` double DEFAULT NULL,
  `stock_location` varchar(10) DEFAULT NULL COMMENT 'LK/JP',
  `stock_status` varchar(45) DEFAULT NULL COMMENT 'in stock=1/reserved=2/clearing=3/cleard=4/sold=5/10=negotiable',
  `coordinator_id` int(11) DEFAULT NULL,
  `pdf_file` varchar(20) DEFAULT NULL,
  `model_no` varchar(45) DEFAULT NULL,
  `hs_code` varchar(45) DEFAULT NULL,
  `record_status` int(2) DEFAULT '1',
  `vh_is_reg` int(1) DEFAULT '0' COMMENT '1-vehicle is registered in sri lanka',
  PRIMARY KEY (`vh_id`),
  KEY `fk_Vehicle_Maker_model1_idx` (`vh_maker_model`) USING BTREE,
  KEY `fk_Vehicle_Supplier1_idx` (`supp_id`) USING BTREE,
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`vh_maker_model`) REFERENCES `maker_model` (`mod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`supp_id`) REFERENCES `supplier` (`supp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=786 DEFAULT CHARSET=utf8;



-- Dumping data for table: vehicle

INSERT INTO `vehicle` VALUES('1', '1', 'AL1', '2', '15', 'NZT260', '3128301', '1NZ', 'D554564', '1500', '1.5F EX', '2013/4', 'Wine Red', '51254', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '', '2WD', 'JPY', 'BDE9FF', '', '', '2013-04-13', 'USS NAGOYA', '51686', 'S', '2025000', '2300000.00', '2025000', 'JPY', '5', '9', '1.pdf', '', '45646', '1', '0');
INSERT INTO `vehicle` VALUES('2', '2', 'LP1', '4', '15', 'NZT260', '3084270', '1NZ', 'D778375', '1500', '', '2010', 'BLACK', '0', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', 'FFFFFF', '', 'ss', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '3', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('3', '3', 'LP2', '4', '23', 'NZT260', '3143315', '1NZ', 'E626731', '1500', 'G+', '2014', 'PEARL WHITE', '0', 'full option, dvd', 'Gasoline', 'Automatic', '5', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '555', '555.00', '4455', 'LKR', '1', '9', '', '', '', '1', '1');
INSERT INTO `vehicle` VALUES('4', '4', 'LP3', '4', '23', 'NZT260', '3142975', '1NZ', 'E621498', '1500', '', '2014/3', 'PEARL WHITE', '5464', 'full option, dvd', 'Gasoline', 'Automatic', '5', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '49498', '444.00', '546', 'LKR', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('5', '5', 'LP4', '4', '15', 'NZT260', '3147012', '1NZ', 'E679159', '1500', '', '2014', 'PEARL WHITE', '17', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '5523', 'LKR', '3', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('6', '6', 'LP5', '4', '14', 'NHP10', '6263698', '1NZ', '7026898', '1500', 'G', '2014/2', 'PEARL WHITE', '0', 'full option, dvd', 'Gasoline', 'Automatic', '5', '5', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '3200000.00', '0', 'LKR', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('7', '7', 'LP6', '4', '20', 'KDJ150R', 'JTEBH9FJ80-K133210', '1KD', '2389128', '3000', '', '2014', 'BLACK', '0', 'full option, dvd', 'Diesel', 'Automatic', '7', '', '-', '4WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('8', '8', 'LP7', '4', '24', 'KGC10', '0166581', '1KR', '0467871', '1000', '', '2007', 'REARL', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '1', '9', '', '', '', '1', '1');
INSERT INTO `vehicle` VALUES('9', '9', 'LP8', '4', '11', 'ZVW30', '1092880', '2ZR-3JM', '4452844', '1800', '', '2009', 'RED', '0', 'full option, dvd', 'Gasoline', 'Automatic', '5', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '1', '9', '', '', '', '1', '1');
INSERT INTO `vehicle` VALUES('10', '10', 'LP9', '4', '25', 'KSP', '905107103', '1KR', '0514363', '1000', '', '2007', 'WHITE', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '1');
INSERT INTO `vehicle` VALUES('11', '11', 'LP10', '4', '13', 'GP1', '1229013', 'LDA-MF6', '5229073', '1500', '', '2013', 'SILVER', '0', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '1', '9', '', '', '', '1', '1');
INSERT INTO `vehicle` VALUES('12', '12', 'LP11', '4', '14', 'NHP10', '2291809', '1NZ-1LM', '6999558', '1500', 'G', '2014', 'PEARL WHITE', '5109', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '3600000.00', '0', 'LKR', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('13', '13', 'AL2', '2', '23', 'NZT260', '3128300', '', '', '1500', 'A15 G+', '2013/4', 'PEARL', '5', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', 'BDE9FF', '', '', '2013-04-19', 'USS NAGOYA', '50928', 'SA', '205000', '2300000.00', '2025000', 'LKR', '1', '4', '13.pdf', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('14', '14', 'AL3', '2', '15', 'NZT260', '3129547', '', '', '1500', '1.5FEX', '2013/4', 'PEARL', '46', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-04-26', 'USS HOKURIKU', '5510', 'SA', '2121000', '52452.00', '2121000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('15', '15', 'LP12', '4', '15', 'NKE165', '7097965', '1NZ-1LM', 'R254144', '1500', '', '2015', 'PEARL WHITE', '18', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '-', '0000-00-00', ' -', '-', '-', '0', '0.00', '0', 'LKR', '1', '8', '', '', '', '1', '1');
INSERT INTO `vehicle` VALUES('16', '16', 'AL4', '2', '15', 'NZT260', '3128231', '', '', '1500', '1.5FEX', '2013/3', 'WINE RED', '8', 'full option, dvd', 'Gasoline', 'Automatic', '5', '5', '-', '2WD', 'JPY', '', '', '', '2013-04-26', 'USS NAGOYA', '4167', 'SA', '2160000', '500000.00', '2160000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('17', '17', 'LP13', '4', '15', 'NZT260', '3156336', '1NZ', 'E852770', '1500', '', '2015', 'PEARL WHITE', '8', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('18', '18', 'LP14', '4', '17', 'DA64V', '864689', 'K6A', '9378664', '650', '', '2014', 'WHITE', '2269', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '8', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('19', '19', 'AL5', '2', '23', 'NZT260', '3128060', '', '', '1500', 'G', '2013/3', 'PEARL', '6', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', 'C2FFB3', '', '', '2013-04-03', 'BAYAUC', '20192', '8AA', '1861000', '0.00', '1861000', 'JPY', '3', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('20', '20', 'LP15', '4', '14', 'NHP10', '6187685', '1NZ-1LM', '6767268', '1500', '', '2013', 'BLACK', '6123', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('21', '21', 'LP16', '4', '18', '', '', '', '', '0', '', '2008', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('22', '22', 'AL6', '2', '14', 'NHP10', '6055705', '', '', '1500', 'S', '2012/6', 'SILVER', '13866', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'LKR', 'C2FFB3', '', '', '2013-05-24', 'USS NAGOYA', '1240', 'RA', '1380000', '5500000.00', '1380000', 'LKR', '3', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('23', '23', 'LP17', '4', '13', '', '', '', '', '0', '', '', 'LIGHT BLUE', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'LKR', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('24', '24', 'AL7', '4', '11', '', '', '', '', '0', '', '2008', 'SILVER', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('25', '25', 'LP18', '4', '18', '', '', '', '', '0', '', '2008', 'SILVER', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('26', '26', 'LP19', '4', '18', '', '', '', '', '0', '', '2008', 'SILVER', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('27', '27', 'LP20', '4', '11', '', '', '', '', '0', '', '2008', 'SILVER', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('28', '28', 'LP21', '4', '11', '', 'DDD', '', '', '444', '', '2008', 'SILVER', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('29', '29', 'AL7', '2', '18', 'NZE161', '7044612', '', '', '1500', '1.5X', '2013/5', 'WHITE', '4', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', 'C2FFB3', '', '', '2013-05-24', 'USS OSAKA', '70041', 'SA', '1351000', '0.00', '1351000', 'JPY', '4', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('30', '30', 'AL8', '2', '18', 'NZE161', '7023177', '', '', '1500', '1.5X', '2013/13', 'WHITE', '12', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', 'C2FFB3', '', '', '2013-05-24', 'USS NAGOYA', '70123', 'SA', '1360000', '0.00', '1360000', 'JPY', '4', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('31', '31', 'AL9', '2', '14', 'NHP10', '2115092', '', '', '1500', '', '2012/10', 'SILVER', '10170', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', 'FFFFFF', '', '', '2013-05-28', 'JUSAITAMA', '2072', '4BB', '1470000', '0.00', '1470000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('32', '32', 'AL10', '2', '23', 'NZT260', '3120748', '', '', '1500', 'A15G', '2012/09', 'SILVER', '719', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', 'FFFFFF', '', '', '2013-05-30', 'USS TOKYO', '26260', 'SA', '1500000', '0.00', '1500000', 'JPY', '1', '3', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('33', '33', 'AL11', '2', '23', 'NZT260', '3130301', '', '', '1500', 'A15G', '2013/05', 'WINE RED', '30', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', 'FFB82B', '', '', '2013-05-30', 'USS TOKYO', '25363', 'SA', '1900000', '0.00', '1900000', 'JPY', '4', '5', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('34', '34', 'AL12', '2', '23', 'NZT260', '3130262', '', '', '1500', 'A15G', '2013/05', 'WINE RED', '8', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', 'FFB82B', '', '', '2013-05-31', 'JU AICHI', '0223', 'SA', '1623000', '0.00', '1623000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('35', '35', 'AL13', '2', '18', 'NZE161', '7057620', '', '', '1500', '1.5X', '2013/05', 'WHITE', '16', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', '', '', '', '2013-05-31', 'USS OSAKA', '70085', 'SA', '1366000', '500000.00', '1366000', 'JPY', '4', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('36', '36', 'AL14', '2', '15', 'NZT260', '3130338', '', '', '1500', 'FEX', '2013/05', 'WINE RED', '8', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', '', '', '', '2013-05-31', 'USS NAGOYA', '50322', 'SA', '2140000', '0.00', '2140000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('37', '37', 'AL15', '2', '15', 'NZT260', '3127835', '', '', '1500', 'FEX', '2013/03', 'WINE RED', '231', 'full option, dvd', 'Hybride', 'Automatic', '5', '5', '-', '2WD', 'JPY', '', '', '', '2013-05-31', 'USS NAGOYA', '50400', 'SA', '2105000', '50000.00', '2105000', 'JPY', '', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('38', '38', 'AL16', '2', '15', 'NZT260', '3130275', '', '', '1500', 'S', '2013', 'PEARL WHITE', '34', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-05-31', 'USS NAGOYA', '50829', 'SA', '2125000', '4546.00', '2125000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('39', '39', 'AL17', '2', '23', 'NZT260', '3130605', '', '', '1500', 'G', '2013/05', 'WINE RED', '5', 'full option, dvd', 'Gasoline', 'Manual', '5', '4', '-', '2WD', 'JPY', '1CB317', '', '', '2013-05-31', 'USS NAGOYA', '51409', 'SA', '1785000', '158660.00', '1785000', 'JPY', '1', '5', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('40', '40', 'CB1', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('41', '41', 'CB2', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('42', '42', 'CB3', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('43', '43', 'CB4', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('44', '44', 'CB5', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('45', '45', 'CB6', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('46', '46', 'CB7', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('47', '47', 'CB8', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('48', '48', 'CB9', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('49', '49', 'CB10', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('50', '50', 'CB11', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('51', '51', 'CB12', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('52', '52', 'CB13', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('53', '53', 'CB14', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('54', '54', 'CB15', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('55', '55', 'CB16', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('56', '56', 'CB17', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('57', '57', 'CB18', '3', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('58', '58', 'AL18', '2', '14', 'NHP10', '2029237', '', '', '1500', 's', '2012/03', 'LIGHT BLUE', '12600', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '1CB317', '', '', '2013-06-21', 'USS NAGOYA', '1605', 'RA', '1565000', '0.00', '1565000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('59', '59', 'AL19', '2', '15', 'NZT260', '3131403', '', '', '1500', 'FEX', '2013/06', 'PEARL', '10', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-06-21', 'USS NAGOYA', '`50248', 'SA', '1915000', '0.00', '1915000', 'LKR', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('60', '60', 'AL20', '2', '15', 'NZT260', '3131224', '', '', '1500', 'FEX', '2013/06', 'WINE RED', '9', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-06-21', 'USS NAGOYA', '51064', 'SA', '1915000', '0.00', '1915000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('61', '61', 'AL21', '2', '15', 'NZT260', '3131354', '', '', '1500', 'FEX', '2013/06', 'WINE RED', '5', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-06-21', 'USS NAGOYA', '60214', 'SA', '1910000', '0.00', '1910000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('62', '62', 'AL22', '2', '15', 'NZT260', '3131080', '', '', '1500', 'FEX', '2013/06', 'WINE RED', '23', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-06-21', 'USS NAGOYA', '70094', 'SA', '1915000', '0.00', '1915000', 'JPY', '1', '3', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('63', '63', 'AL23', '2', '15', 'NZT260', '3131796', '', '', '1500', 'FEX', '2013/06', 'PEARL', '4', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-06-26', 'CAA CHUBU', '30347', 'SAA', '1930000', '0.00', '1930000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('64', '64', 'AL24', '2', '13', 'GP1', '1136255', '', '', '1300', '10TH ANNIVERSARY', '2012/07', 'PEARL', '3502', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-06-27', 'HANATEN OSAKA', '3407', '6AA', '1443000', '0.00', '1443000', 'JPY', '1', '4', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('65', '65', 'AL25', '2', '14', 'NHP10', '2146645', '', '', '1500', 'G', '2012/12', 'PEARL', '2279', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-06-28', 'USS NAGOYA', '1582', 'RA', '1740000', '0.00', '1740000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('66', '66', 'AL26', '2', '13', 'GP1', '1082428', '', '', '1300', '10TH ANNIVERSARY', '2013/01', 'PEARL', '8973', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-02', 'USS YAKOHAMA', '10136', '5A', '1375000', '0.00', '1375000', 'JPY', '1', '4', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('67', '67', 'AL27', '2', '23', 'NZT260', '3131059', '', '', '1500', 'A15G', '2013/06', 'WINE RED', '3', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-05', 'USS NAGOYA', '70086', 'SA', '1520000', '0.00', '1520000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('68', '68', 'AL28', '2', '18', 'NZE161', '7058961', '', '', '1500', '1.5X', '2013/06', 'PEARL', '3', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-10', 'JAA KASAI', '4277', 'S', '134000', '0.00', '1345000', 'JPY', '1', '3', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('69', '69', 'AL29', '2', '15', 'NZT260', '3131976', '', '', '1500', 'FEX', '2013/07', 'WINE RED', '15', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-12', 'USS NAGOYA', '51486', 'SA', '1940000', '0.00', '1940000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('70', '70', 'AL30', '2', '18', 'NZE161', '7062929', '', '', '1500', '1.5X', '2013/07', 'PEARL', '4', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-12', 'USS NAGOYA', '50662', 'SA', '1315000', '0.00', '1315000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('71', '71', 'AL31', '2', '23', 'NZT160', '31219111', '', '', '1500', '115G', '2013/01', 'WINE RED', '2563', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-16', 'CAA TOKYO', '3149', '3.5DA', '1420000', '0.00', '1420000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('72', '72', 'AL32', '2', '23', 'NZT260', '3132160', '', '', '1500', 'A15G', '2013/07', 'PEARL', '5', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-19', 'USS OSAKA', '615', 'SA', '1597000', '2500000.00', '1597000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('73', '73', 'AL33', '2', '23', 'NZT260', '3132079', '', '', '1500', 'A15G', '2013/07', 'WINE RED', '8', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-19', 'USS OSAKA', '623', 'SA', '1576000', '0.00', '1576000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('74', '74', 'AL34', '2', '18', 'NKE165', '7063856', '', '', '1500', '1.5X', '2013/07', 'PEARL', '5', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-19', 'USS NAGOYA', '51078', 'SA', '1345000', '0.00', '1345000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('75', '75', 'AL35', '2', '15', 'NZT260', '3132742', '', '', '1500', '1.5F', '2013/07', 'PEARL', '5', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-05-19', 'USS NAGOYA', '50007', 'SA', '1935000', '0.00', '1935000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('76', '76', 'AL36', '2', '15', 'NZT260', '3132725', '', '', '1500', '1.5F', '2013/07', 'PEARL', '4', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2013-07-19', 'USS NAGOYA', '50314', 'SA', '1930000', '0.00', '1930000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('77', '77', 'AL37', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('78', '78', 'AL38', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('79', '79', 'AL39', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('80', '80', 'AL40', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('81', '81', 'AL41', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('82', '82', 'AL42', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('83', '83', 'AL43', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('84', '84', 'AL44', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('85', '85', 'AL45', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('86', '86', 'AL46', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('87', '87', 'AL47', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('88', '88', 'AL48', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('89', '89', 'AL49', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('90', '90', 'AL50', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('91', '91', 'AL51', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('92', '92', 'AL52', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('93', '93', 'AL53', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('94', '94', 'AL54', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('95', '95', 'AL55', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('96', '96', 'AL56', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('97', '97', 'AL57', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('98', '98', 'AL58', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('99', '99', 'AL59', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('100', '100', 'AL60', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('101', '101', 'AL61', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('102', '102', 'AL62', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('103', '103', 'AL63', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('104', '104', 'AL64', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('105', '105', 'AL65', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('106', '106', 'AL66', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('107', '107', 'AL67', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('108', '108', 'AL68', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('109', '109', 'AL69', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('110', '110', 'AL70', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('111', '111', 'AL71', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('112', '112', 'AL72', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('113', '113', 'AL73', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('114', '114', 'AL74', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('115', '115', 'AL75', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('116', '116', 'AL76', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('117', '117', 'AL77', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('118', '118', 'AL78', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('119', '119', 'AL79', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('120', '120', 'AL80', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('121', '121', 'AL81', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('122', '122', 'AL82', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('123', '123', 'AL83', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('124', '124', 'AL84', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('125', '125', 'AL85', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('126', '126', 'AL86', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('127', '127', 'AL87', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('128', '128', 'AL88', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('129', '129', 'AL89', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('130', '130', 'AL90', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('131', '131', 'AL91', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('132', '132', 'AL92', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('133', '133', 'AL93', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('134', '134', 'AL94', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('135', '135', 'AL95', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('136', '136', 'AL96', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('137', '137', 'AL97', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('138', '138', 'AL98', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('139', '139', 'AL99', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('140', '140', 'AL100', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('141', '141', 'AL101', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('142', '142', 'AL102', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('143', '143', 'AL103', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('144', '144', 'AL104', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('145', '145', 'AL105', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('146', '146', 'AL106', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('147', '147', 'AL107', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('148', '148', 'AL108', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('149', '149', 'AL109', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('150', '150', 'AL110', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('151', '151', 'AL111', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('152', '152', 'AL112', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('153', '153', 'AL113', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('154', '154', 'AL114', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('155', '155', 'AL115', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('156', '156', 'AL116', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('157', '157', 'AL117', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('158', '158', 'AL118', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('159', '159', 'AL119', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('160', '160', 'AL120', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('161', '161', 'AL121', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('162', '162', 'AL122', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('163', '163', 'AL123', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('164', '164', 'AL124', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('165', '165', 'AL125', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('166', '166', 'AL126', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('167', '167', 'AL127', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('168', '168', 'AL128', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('169', '169', 'AL129', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('170', '170', 'AL130', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('171', '171', 'AL131', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '4', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('172', '172', 'AL132', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('173', '173', 'AL133', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('174', '174', 'AL134', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('175', '175', 'AL135', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('176', '176', 'AL136', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('177', '177', 'AL137', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('178', '178', 'AL138', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('179', '179', 'AL139', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('180', '180', 'AL140', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('181', '181', 'AL141', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('182', '182', 'AL142', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('183', '183', 'AL143', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('184', '184', 'AL144', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('185', '185', 'AL145', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('186', '186', 'AL146', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('187', '187', 'AL147', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('188', '188', 'AL148', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('189', '189', 'AL149', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('190', '190', 'AL150', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('191', '191', 'AL151', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('192', '192', 'AL152', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('193', '193', 'AL153', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('194', '194', 'AL154', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('195', '195', 'AL155', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('196', '196', 'AL156', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('197', '197', 'AL157', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('198', '198', 'AL158', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('199', '199', 'AL159', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('200', '200', 'AL160', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('201', '201', 'AL161', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('202', '202', 'AL162', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('203', '203', 'AL163', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('204', '204', 'AL164', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('205', '205', 'AL165', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '5', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('206', '206', 'AL166', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('207', '207', 'AL167', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('208', '208', 'AL168', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('209', '209', 'AL169', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('210', '210', 'AL170', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('211', '211', 'AL171', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('212', '212', 'AL172', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('213', '213', 'AL173', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('214', '214', 'AL174', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('215', '215', 'AL175', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('216', '216', 'AL176', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('217', '217', 'AL177', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('218', '218', 'AL178', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('219', '219', 'AL179', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('220', '220', 'AL180', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('221', '221', 'AL181', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('222', '222', 'AL182', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('223', '223', 'AL183', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('224', '224', 'AL184', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('225', '225', 'AL185', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('226', '226', 'AL186', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('227', '227', 'AL187', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('228', '228', 'AL188', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('229', '229', 'AL189', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('230', '230', 'AL190', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('231', '231', 'AL191', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('232', '232', 'AL192', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('233', '233', 'AL193', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('234', '234', 'AL194', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('235', '235', 'AL195', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('236', '236', 'AL196', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('237', '237', 'AL197', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('238', '238', 'AL198', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('239', '239', 'AL199', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('240', '240', 'AL200', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('241', '241', 'AL201', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('242', '242', 'AL202', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('243', '243', 'AL203', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('244', '244', 'AL204', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('245', '245', 'AL205', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('246', '246', 'AL206', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('247', '247', 'AL207', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('248', '248', 'AL208', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('249', '249', 'AL209', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('250', '250', 'AL210', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('251', '251', 'AL211', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('252', '252', 'AL212', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('253', '253', 'AL213', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('254', '254', 'AL214', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('255', '255', 'AL215', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('256', '256', 'AL216', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('257', '257', 'AL217', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('258', '258', 'AL218', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('259', '259', 'AL219', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('260', '260', 'AL220', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('261', '261', 'AL221', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('262', '262', 'AL222', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('263', '263', 'AL223', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('264', '264', 'AL224', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('265', '265', 'AL225', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('266', '266', 'AL226', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('267', '267', 'AL227', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('268', '268', 'AL228', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('269', '269', 'AL229', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('270', '270', 'AL230', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('271', '271', 'AL231', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('272', '272', 'AL232', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('273', '273', 'AL233', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('274', '274', 'AL234', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('275', '275', 'AL235', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '4', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('276', '276', 'AL236', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('277', '277', 'AL237', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('278', '278', 'AL238', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('279', '279', 'AL239', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('280', '280', 'AL240', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('281', '281', 'AL241', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('282', '282', 'AL242', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('283', '283', 'AL243', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('284', '284', 'AL244', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('285', '285', 'AL245', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('286', '286', 'AL246', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('287', '287', 'AL247', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('288', '288', 'AL248', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('289', '289', 'AL249', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('290', '290', 'AL250', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('291', '291', 'AL251', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('292', '292', 'AL252', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('293', '293', 'AL253', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('294', '294', 'AL254', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('295', '295', 'AL255', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('296', '296', 'AL256', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('297', '297', 'AL257', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('298', '298', 'AL258', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('299', '299', 'AL259', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('300', '300', 'AL260', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('301', '301', 'AL261', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('302', '302', 'AL262', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('303', '303', 'AL263', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('304', '304', 'AL264', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('305', '305', 'AL265', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('306', '306', 'AL266', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('307', '307', 'AL267', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('308', '308', 'AL268', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('309', '309', 'AL269', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('310', '310', 'AL270', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('311', '311', 'AL271', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('312', '312', 'AL272', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('313', '313', 'AL273', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('314', '314', 'AL274', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('315', '315', 'AL275', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('316', '316', 'AL276', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('317', '317', 'AL277', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('318', '318', 'AL278', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('319', '319', 'AL279', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('320', '320', 'AL280', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('321', '321', 'AL281', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('322', '322', 'AL282', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('323', '323', 'AL283', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('324', '324', 'AL284', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('325', '325', 'AL285', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('326', '326', 'AL286', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('327', '327', 'AL287', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('328', '328', 'AL288', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('329', '329', 'AL289', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('330', '330', 'AL290', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('331', '331', 'AL291', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('332', '332', 'AL292', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('333', '333', 'AL293', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('334', '334', 'AL294', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('335', '335', 'AL295', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('336', '336', 'AL296', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('337', '337', 'AL297', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('338', '338', 'AL298', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('339', '339', 'AL299', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('340', '340', 'AL300', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('341', '341', 'AL301', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('342', '342', 'AL302', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('343', '343', 'AL303', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('344', '344', 'AL304', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('345', '345', 'AL305', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('346', '346', 'AL306', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('347', '347', 'AL307', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('348', '348', 'AL308', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('349', '349', 'AL309', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('350', '350', 'AL310', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('351', '351', 'AL311', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('352', '352', 'AL312', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('353', '353', 'AL313', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('354', '354', 'AL314', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('355', '355', 'AL315', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('356', '356', 'AL316', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('357', '357', 'AL317', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('358', '358', 'AL318', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('359', '359', 'AL319', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('360', '360', 'AL320', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('361', '361', 'AL321', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('362', '362', 'AL322', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('363', '363', 'AL323', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('364', '364', 'AL324', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('365', '365', 'AL325', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('366', '366', 'AL326', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('367', '367', 'AL327', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('368', '368', 'AL328', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('369', '369', 'AL329', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('370', '370', 'AL330', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('371', '371', 'AL331', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('372', '372', 'AL332', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('373', '373', 'AL333', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('374', '374', 'AL334', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('375', '375', 'AL335', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('376', '376', 'AL336', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('377', '377', 'AL337', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('378', '378', 'AL338', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('379', '379', 'AL339', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('380', '380', 'AL340', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('381', '381', 'AL341', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('382', '382', 'AL342', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('383', '383', 'AL343', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('384', '384', 'AL344', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('385', '385', 'AL345', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('386', '386', 'AL346', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('387', '387', 'AL347', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('388', '388', 'AL348', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('389', '389', 'AL349', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('390', '390', 'AL350', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('391', '391', 'AL351', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('392', '392', 'AL352', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('393', '393', 'AL353', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('394', '394', 'AL354', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('395', '395', 'AL355', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('396', '396', 'AL356', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('397', '397', 'AL357', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('398', '398', 'AL358', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('399', '399', 'AL359', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('400', '400', 'AL360', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('401', '401', 'AL361', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('402', '402', 'AL362', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('403', '403', 'AL363', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('404', '404', 'AL364', '2', '14', 'NHP10', '2164928', '', '', '1500', 'S', '2013/3', 'SILVER', '15466', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2014-12-20', 'ARAI KOYOMA', '7072', 'RABB', '1410000', '3600000.00', '1410000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('405', '405', 'AL365', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('406', '406', 'AL366', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('407', '407', 'AL367', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('408', '408', 'AL368', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('409', '409', 'AL369', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('410', '410', 'AL370', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('411', '411', 'AL371', '2', '28', 'U61V', '1605010', '', '', '660', 'CS', '2011/3', 'PEARL', '43713', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '2014-12-20', 'USS KYUSHU', '50340', '4B', '468000', '0.00', '468000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('412', '412', 'AL372', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('413', '413', 'AL373', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('414', '414', 'AL374', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('415', '415', 'AL375', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('416', '416', 'AL376', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('417', '417', 'AL377', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('418', '418', 'AL378', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('419', '419', 'AL379', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('420', '420', 'AL380', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('421', '421', 'AL381', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('422', '422', 'AL382', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('423', '423', 'AL383', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('424', '424', 'AL384', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('425', '425', 'AL385', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('426', '426', 'AL386', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('427', '427', 'AL387', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('428', '428', 'AL388', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('429', '429', 'AL389', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('430', '430', 'AL390', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('431', '431', 'AL391', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('432', '432', 'AL392', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('433', '433', 'AL393', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('434', '434', 'AL394', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('435', '435', 'AL395', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('436', '436', 'AL396', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('437', '437', 'AL397', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('438', '438', 'AL398', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('439', '439', 'AL399', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('440', '440', 'AL400', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('441', '441', 'AL401', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('442', '442', 'AL402', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('443', '443', 'AL403', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('444', '444', 'AL404', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('445', '445', 'AL405', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('446', '446', 'AL406', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('447', '447', 'AL407', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('448', '448', 'AL408', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('449', '449', 'AL409', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('450', '450', 'AL410', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('451', '451', 'AL411', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('452', '452', 'AL412', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('453', '453', 'AL413', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('454', '454', 'AL414', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('455', '455', 'AL415', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('456', '456', 'AL416', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('457', '457', 'AL417', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('458', '458', 'AL418', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('459', '459', 'AL419', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('460', '460', 'AL420', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('461', '461', 'AL421', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('462', '462', 'AL422', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('463', '463', 'AL423', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('464', '464', 'AL424', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('465', '465', 'AL425', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('466', '466', 'AL426', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('467', '467', 'AL427', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('468', '468', 'AL428', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('469', '469', 'AL429', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('470', '470', 'AL430', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('471', '471', 'AL431', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('472', '472', 'AL432', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('473', '473', 'AL433', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('474', '474', 'AL434', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('475', '475', 'AL435', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('476', '476', 'AL436', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('477', '477', 'AL437', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('478', '478', 'AL438', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('479', '479', 'AL439', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('480', '480', 'AL440', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('481', '481', 'AL441', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('482', '482', 'AL442', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('483', '483', 'AL443', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('484', '484', 'AL444', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('485', '485', 'AL445', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('486', '486', 'AL446', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('487', '487', 'AL447', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('488', '488', 'AL448', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('489', '489', 'AL449', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('490', '490', 'AL450', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('491', '491', 'AL451', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('492', '492', 'AL452', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '3800000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('493', '493', 'AL453', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('494', '494', 'AL454', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('495', '495', 'AL455', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('496', '496', 'AL456', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('497', '497', 'AL457', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('498', '498', 'AL458', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '3800000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('499', '499', 'AL459', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('500', '500', 'AL460', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('501', '501', 'AL461', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('502', '502', 'AL462', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('503', '503', 'AL463', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('504', '504', 'AL464', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('505', '505', 'AL465', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('506', '506', 'AL466', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('507', '507', 'AL467', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('508', '508', 'AL468', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('509', '509', 'AL469', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('510', '510', 'AL470', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('511', '511', 'AL471', '2', '14', 'NHP10', '6379753', '', '', '1500', '', '2015/02', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '4025000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('512', '512', 'AL472', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('513', '513', 'AL473', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('514', '514', 'AL474', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('515', '515', 'AL475', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('516', '516', 'AL476', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('517', '517', 'AL477', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('518', '518', 'AL478', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('519', '519', 'AL479', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('520', '520', 'AL480', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('521', '521', 'AL481', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('522', '522', 'AL482', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('523', '523', 'AL483', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('524', '524', 'AL484', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('525', '525', 'AL485', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('526', '526', 'AL486', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('527', '527', 'AL487', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('528', '528', 'AL488', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('529', '529', 'AL489', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('530', '530', 'AL490', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('531', '531', 'AL491', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('532', '532', 'AL492', '2', '14', 'NHP10', '2177825', '', '', '1500', 'G', '2013/3', 'PEARL', '12384', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-04-19', 'USS TOKYO', '26003', '5A', '1455000', '0.00', '1455000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('533', '533', 'AL493', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('534', '534', 'AL494', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('535', '535', 'AL495', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('536', '536', 'AL496', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('537', '537', 'AL497', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('538', '538', 'AL498', '2', '14', 'NHP10', '6164663', '', '', '1500', 'G', '2013/4', 'PEARL', '10710', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-02-27', 'USS NAGOYA', '16459', '5A', '1445000', '3800000.00', '1445000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('539', '539', 'AL499', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('540', '540', 'AL500', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('541', '541', 'AL501', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('542', '542', 'AL502', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('543', '543', 'AL503', '2', '14', 'NHP10', '2422101', '', '', '1500', 'X-URBAN', '2015/02', 'GRAY', '14', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-09-27', 'USS NAGOYA', '50957', 'SA', '0', '4200000.00', '1750000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('544', '544', 'AL504', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('545', '545', 'AL505', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('546', '546', 'AL506', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('547', '547', 'AL507', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('548', '548', 'AL508', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('549', '549', 'AL509', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('550', '550', 'AL510', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('551', '551', 'AL511', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('552', '552', 'AL512', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('553', '553', 'AL513', '2', '18', 'NKE165', '7096321', '', '', '1500', 'G', '2015/1', 'WINE RED', '13', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-02-27', 'USS NAGOYA', '50883', 'SA', '2070000', '0.00', '2070000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('554', '554', 'AL514', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('555', '555', 'AL515', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('556', '556', 'AL516', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('557', '557', 'AL517', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('558', '558', 'AL518', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('559', '559', 'AL519', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('560', '560', 'AL520', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('561', '561', 'AL521', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('562', '562', 'AL522', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('563', '563', 'AL523', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('564', '564', 'AL524', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('565', '565', 'AL525', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('566', '566', 'AL526', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('567', '567', 'AL527', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('568', '568', 'AL528', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('569', '569', 'AL529', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('570', '570', 'AL530', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('571', '571', 'AL531', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('572', '572', 'AL532', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('573', '573', 'AL533', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('574', '574', 'AL534', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('575', '575', 'AL535', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('576', '576', 'AL536', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('577', '577', 'AL537', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('578', '578', 'AL538', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('579', '579', 'AL539', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('580', '580', 'AL540', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('581', '581', 'AL541', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('582', '582', 'AL542', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('583', '583', 'AL543', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('584', '584', 'AL544', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('585', '585', 'AL545', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('586', '586', 'AL546', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('587', '587', 'AL547', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('588', '588', 'AL548', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('589', '589', 'AL549', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('590', '590', 'AL550', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('591', '591', 'AL551', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('592', '592', 'AL552', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('593', '593', 'AL553', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('594', '594', 'AL554', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('595', '595', 'AL555', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('596', '596', 'AL556', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('597', '597', 'AL557', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('598', '598', 'AL558', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('599', '599', 'AL559', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('600', '600', 'AL560', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('601', '601', 'AL561', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('602', '602', 'AL562', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('603', '603', 'AL563', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('604', '604', 'AL564', '2', '22', 'AZEO', '051731', '', '', '0', 'G', '2013/1', 'Black', '9260', 'full option, dvd', 'Electric', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-04-25', 'HAA KOBE', '30544', '4.5BB', '2005000', '0.00', '2005000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('605', '605', 'AL565', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('606', '606', 'AL566', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('607', '607', 'AL567', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('608', '608', 'AL568', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('609', '609', 'AL569', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('610', '610', 'AL570', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('611', '611', 'AL571', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('612', '612', 'AL572', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('613', '613', 'AL573', '2', '16', 'MH44S', '135186', '', '', '660', 'FZ', '2015/4', 'PEARL', '5', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '2015-05-25', 'ONE PRICE', '401008', 'SA', '1133000', '2600000.00', '1133000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('614', '614', 'AL574', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('615', '615', 'AL575', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('616', '616', 'AL576', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('617', '617', 'AL577', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('618', '618', 'AL578', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('619', '619', 'AL579', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('620', '620', 'AL580', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('621', '621', 'AL581', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('622', '622', 'AL582', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('623', '623', 'AL583', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('624', '624', 'AL584', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('625', '625', 'AL585', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('626', '626', 'AL586', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('627', '627', 'AL587', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('628', '628', 'AL588', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('629', '629', 'AL589', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('630', '630', 'AL590', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('631', '631', 'AL591', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('632', '632', 'AL592', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('633', '633', 'AL593', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('634', '634', 'AL594', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('635', '635', 'AL595', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('636', '636', 'AL596', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('637', '637', 'AL597', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('638', '638', 'AL598', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('639', '639', 'AL599', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('640', '640', 'AL600', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('641', '641', 'AL601', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('642', '642', 'AL602', '2', '22', 'ZEO', '019231', '', '', '0', 'G', '2012/10', 'Pearl', '16200', 'full option, dvd', 'Electric', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '1352500980', '4.5B', '1708000', '0.00', '1708000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('643', '643', 'AL603', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('644', '644', 'AL604', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('645', '645', 'AL605', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('646', '646', 'AL606', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('647', '647', 'AL607', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('648', '648', 'AL608', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('649', '649', 'AL609', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('650', '650', 'AL610', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('651', '651', 'AL611', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('652', '652', 'AL612', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('653', '653', 'AL613', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('654', '654', 'AL614', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('655', '655', 'AL615', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('656', '656', 'AL616', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('657', '657', 'AL617', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('658', '658', 'AL618', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('659', '659', 'AL619', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('660', '660', 'AL620', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('661', '661', 'AL621', '2', '16', 'MH44S', '109906', '', '', '660', 'FZ', '2014/11', 'PEARL', '0', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2525000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('662', '662', 'AL622', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('663', '663', 'AL623', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('664', '664', 'AL624', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('665', '665', 'AL625', '2', '16', 'MH44S', '114099', '', '', '660', 'FZ', '2014/11', 'BROWN', '0', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2525000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('666', '666', 'AL626', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('667', '667', 'AL627', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('668', '668', 'AL628', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('669', '669', 'AL629', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('670', '670', 'AL630', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('671', '671', 'AL631', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('672', '672', 'AL632', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('673', '673', 'AL633', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('674', '674', 'AL634', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('675', '675', 'AL635', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('676', '676', 'AL636', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('677', '677', 'AL637', '2', '19', 'AZEO', '050175', '', '', '0', 'X', '2012/11', 'PEARL', '28380', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-06-06', 'USS KYUSHU', '50098', '4B', '1910000', '2800000.00', '1910000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('678', '678', 'AL638', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('679', '679', 'AL639', '2', '19', 'AZEO', '05681', '', '', '0', 'X', '2013/9', 'PEARL', '20757', 'full option, dvd', 'Electric', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-06-06', 'USS KYUSHU', '53174', '4.5B', '2060000', '0.00', '2060000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('680', '680', 'AL640', '2', '19', 'AZEO', '052214', '', '', '0', 'X', '2013/1', 'PEARL', '13503', 'full option, dvd', 'Electric', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-06-06', 'USS KYUSHU', '53183', '4.5B', '218000', '2950000.00', '218000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('681', '681', 'AL641', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('682', '682', 'AL642', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('683', '683', 'AL643', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('684', '684', 'AL644', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('685', '685', 'AL645', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('686', '686', 'AL646', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('687', '687', 'AL647', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('688', '688', 'AL648', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('689', '689', 'AL649', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('690', '690', 'AL650', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('691', '691', 'AL651', '2', '16', 'MH44S', '460261', '', '', '660', '', '2014/11', 'RED', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '2015-08-05', 'BRAND NEW', '', '', '0', '2625000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('692', '692', 'AL652', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('693', '693', 'AL653', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('694', '694', 'AL654', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('695', '695', 'AL655', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('696', '696', 'AL656', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('697', '697', 'AL657', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('698', '698', 'AL658', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('699', '699', 'AL659', '2', '16', 'MH44S', '113359', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2525000.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('700', '700', 'AL660', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('701', '701', 'AL661', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('702', '702', 'AL662', '2', '16', 'MH44S', '116060', '', '', '660', 'FZ', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2525000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('703', '703', 'AL663', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('704', '704', 'AL664', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('705', '705', 'AL665', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('706', '706', 'AL666', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('707', '707', 'AL667', '2', '11', 'SSSS', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('708', '708', 'AL668', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '0.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('709', '709', 'AL669', '2', '16', '', '461753', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '2015-07-22', 'BRAND NEW', '', '', '1400000', '0.00', '1400000', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('710', '710', 'AL670', '2', '16', '', '452982', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '2015-07-21', 'BRAND NEW', '', '', '1400000', '0.00', '1400000', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('711', '711', 'AL671', '2', '16', '', '455378', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '2015-07-21', 'BRAND NEW', '', '', '1400000', '0.00', '1400000', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('712', '712', 'AL672', '2', '16', '', '451440', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '2015-07-21', 'BRAND NEW', '', '', '1400000', '0.00', '1400000', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('713', '713', 'AL673', '2', '19', '', '053286', '', '', '0', 'x', '2013/06', 'vilver', '25963', 'full option, dvd', 'Electric', 'Automatic', '5', '4', '-', '2WD', '', '', '', '', '2015-07-29', 'KCAA', '3176', '5HB', '2800000', '0.00', '2800000', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('714', '714', 'AL674', '2', '18', '', '7120577', '', '', '1500', '', '2015/7', 'Black', '3', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', '', '89FF45', '', '', '2015-07-21', 'BRAND NEW', '', '', '1800000', '0.00', '1800000', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('715', '715', 'AL675', '2', '11', '', '5696908', '', '', '1800', 'S', '2013/9', 'PEARL', '40480', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', '', '89FF45', '', '', '2015-06-25', 'JU GIFU', '33184', 'RB', '1300000', '0.00', '1300000', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('716', '716', 'AL676', '2', '19', 'AZEO', '059438', '', '', '0', 'X', '2013/9', 'PEARL', '12360', '', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-06-09', 'USS YAKOHAMA', '55283', '4.5B', '2055000', '2950000.00', '2055000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('717', '717', 'AL677', '2', '19', 'AZEO', '052817', '', '', '0', 'X', '2013/6', 'PEARL', '13593', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-06-09', 'USS YAKOHAMA', '55392', '4.5 B', '2070000', '0.00', '2070000', 'JPY', '1', '3', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('718', '718', 'AL678', '2', '19', 'AZEO', '100483', '', '', '0', 'X', '2013/12', 'PEARL', '12865', 'full option, dvd', 'Electric', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-06-18', 'USS TOKYO', '26033', '4.5A', '2050000', '2950000.00', '2050000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('719', '719', 'AL679', '2', '19', 'AZEO', '050816', '', '', '0', 'X', '2012/12', 'BLACK', '32063', 'full option, dvd', 'Electric', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-06-30', 'CAA TOKYO', '4158', '4CB', '1769000', '0.00', '1769000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('720', '720', 'AL680', '2', '16', 'MH44S', '118091', '', '', '660', '', '2014/11', 'BLACK', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('721', '721', 'AL681', '2', '16', 'MH44S', '462984', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('722', '722', 'AL682', '2', '16', 'MH44S', '463209', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('723', '723', 'AL683', '2', '16', 'MH44S', '463400', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('724', '724', 'AL684', '2', '16', 'MH44S', '463983', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('725', '725', 'AL685', '2', '16', 'MH44S', '464336', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('726', '726', 'AL686', '2', '16', 'MH44S', '464138', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', 'JPY', '1', '3', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('727', '727', 'AL687', '2', '16', 'MH44S', '464497', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('728', '728', 'AL688', '2', '16', 'MH44S', '464895', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('729', '729', 'AL689', '2', '16', 'MH44S', '465131', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('730', '730', 'AL690', '2', '16', 'MH44S', '464652', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Gasoline', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('731', '731', 'AL691', '2', '16', 'MH44S', '111733', '', '', '660', 'FZ', '2014/10', 'PURPLE', '43', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', 'JPY', '', '', '', '2015-07-15', 'USS TOHOKU', '4105', '5A', '1020000', '0.00', '1020000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('732', '732', 'AL692', '2', '16', 'MH44S', '461509', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('733', '733', 'AL693', '2', '16', 'MH44S', '461521', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('734', '734', 'AL694', '2', '16', 'MH44S', '461547', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('735', '735', 'AL695', '2', '16', 'MH44S', '461558', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '2625000.00', '0', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('736', '736', 'AL696', '2', '16', 'MH44S', '461674', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('737', '737', 'AL697', '2', '16', 'MH44S', '461742', '', '', '660', '', '2014/11', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('738', '738', 'AL698', '2', '16', 'MH44S', '462042', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('739', '739', 'AL699', '2', '16', 'MH44S', '455656', '', '', '660', '', '2014/11', 'PURPLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('740', '740', 'AL700', '2', '16', 'MH44S', '453152', '', '', '660', '', '2014/12', 'PURPLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('741', '741', 'AL701', '2', '16', 'MH44S', '464213', '', '', '660', '', '2014/12', 'PURPLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('742', '742', 'AL702', '2', '27', 'S402M', '0030100', '', '', '1500', 'IZDX', '2012/01', 'WHITE', '82687', 'full option, dvd', 'Gasoline', 'Automatic', '', '4', '-', '2WD', 'JPY', '', '', '', '2015-07-18', 'JU GIFU', '2600', '3.5C', '673000', '0.00', '673000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('743', '743', 'AL703', '2', '14', 'NHP10', '6305578', '', '', '1500', 'G', '2014/6', 'RED', '12000', 'full option, dvd', 'Gasoline', 'Automatic', '5', '5', '-', '2WD', 'JPY', '', '', '', '2015-07-27', 'AUCNET', '13005', '5', '1405000', '50000000.00', '1405000', 'JPY', '1', '1', '743.pdf', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('744', '744', 'AL704', '2', '15', 'NZT260', '3162285', '', '', '1500', 'FEX', '2015/07', 'WINE RED', '6', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-07-28', 'JUSAITAMA', '2570', 'SAA', '2130000', '0.00', '2130000', 'JPY', '1', '5', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('745', '745', 'AL705', '2', '25', 'KSP130', '2113535', '', '', '1000', '', '2014/07', 'BLUE', '0', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2016-04-18', 'ONE PRICE', '1M22302214', '6A', '108000', '0.00', '980000', 'JPY', '1', '3', '', '', '8703.21.69', '1', '0');
INSERT INTO `vehicle` VALUES('746', '746', 'AL706', '2', '13', 'GP5', '4203061', '', '', '1500', 'S', '2015/07', 'PURLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-07-30', 'USS TOKYO', '23187', 'SA', '1910000', '0.00', '1910000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('747', '747', 'AL707', '2', '14', 'NHP10', '2212529', '', '', '1500', 'S', '2013/06', 'LIGHT BLUE', '15367', 'TV, DVD', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '0000-00-00', 'ONE PRICE', '1N155500', '4.5AB', '0', '0.00', '0', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('748', '748', 'AL708', '2', '15', 'NZT260', '3162410', '', '', '1500', 'FEX', '2015/07', 'WINE RED', '38', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-08-04', 'USS YOKOHAMA', '55129', 'SA', '2110000', '0.00', '2110000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('749', '749', 'AL709', '2', '18', 'NKE165', '7122300', '', '', '1500', 'G', '2015/07', 'PEARL', '10', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-05-05', 'USS SAPPORO', '70019', 'SA', '2291000', '0.00', '2291000', 'JPY', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('750', '750', 'AL710', '2', '12', 'RU3', '1108599', '', '', '1500', 'Z', '2015/07', 'PURLE', '12', 'full option, dvd', 'Hybride', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-08-05', 'USS FUKUOKA', '9025', 'SA', '2344000', '0.00', '2344000', 'JPY', '1', '3', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('751', '751', 'AL711', '2', '16', 'MH44S', '461310', '', '', '660', '', '2014/11', 'PURPLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('752', '752', 'AL712', '2', '16', 'MH44S', '461562', '', '', '660', '', '2014/12', 'PURPLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('753', '753', 'AL713', '2', '16', 'MH44S', '462266', '', '', '660', '', '2014/12', 'PURPLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('754', '754', 'AL714', '2', '16', 'MH44S', '462949', '', '', '660', '', '2014/12', 'PURPLE', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('755', '755', 'AL715', '2', '16', 'MH44S', '463326', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('756', '756', 'AL716', '2', '16', 'MH44S', '464155', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('757', '757', 'AL717', '2', '16', 'MH44S', '464516', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '3', '757.pdf', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('758', '758', 'AL718', '2', '16', 'MH44S', '464565', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('759', '759', 'AL719', '2', '16', 'MH44S', '464717', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('760', '760', 'AL720', '2', '16', 'MH44S', '465679', '', '', '660', '', '2014/12', 'PEARL', '0', 'full option, dvd', 'Hybride', 'Automatic', '4', '4', '-', '2WD', '', '', '', '', '0000-00-00', 'BRAND NEW', '', '', '0', '0.00', '0', '', '1', '9', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('761', '761', 'AL721', '2', '19', 'AZEO', '100601', '', '', '0', 'X', '2014/03', 'PEARL', '6875', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-08-08', 'HAAKOBE', '30531', '4.5AA', '2010000', '0.00', '2010000', 'JPY', '1', '9', '761.pdf', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('762', '762', 'AL722', '2', '17', 'DA64V', '856711', '', '', '660', 'PC', '2014/09', 'BLACK', '743', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', '', '', '', '2015-08-11', 'JUSAITANA', '718', '4.5BB', '808000', '0.00', '808000', 'JPY', '1', '9', '762.pdf', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('763', '763', 'AL723', '2', '20', 'GDJ150', '002403', '', '', '2800', 'TX L', '2015/7', 'PEARL WHITE', '499', 'full option, dvd', 'Diesel', 'Automatic', '7', '5', '-', '4WD', 'JPY', '', '', '', '2015-08-18', 'ONE PRICE', '', 'S', '5298000', '0.00', '5298000', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('764', '764', 'AL724', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('765', '765', 'AL725', '2', '11', '', '', '', '', '1500', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('766', '766', 'AL726', '2', '11', '', '1111111', '', '', '0', '', '', '', '0', 'full option, dvd', 'Hybride', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('767', '767', 'AL727', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', 'model', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'Kurunegala', '', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('768', '768', 'AL728', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', 'model', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'Kurunegala', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('769', '769', 'AL729', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', 'model', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'Kurunegala', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('770', '770', 'AL730', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', 'M213', '2WD', 'JPY', '', '', '', '0000-00-00', '-', '-', '-', '0', '', '0', 'Kurunegala', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('771', '771', 'AL731', '2', '11', '', '', '-', '-', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', 'M213', '2WD', 'JPY', '', '', '-', '0000-00-00', '-', '-', '-', '0', '', '0', 'Kurunegala', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('772', '772', 'LP22', '4', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'LKR', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'LKR', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('774', '773', 'AL732', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', '', '3', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('775', '774', 'AL733', '2', '11', '', '', '', '', '0', '', '', '', '0', '', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '1', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('776', '775', 'AL734', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option,cd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '4', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('778', '776', 'AL735', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '2016-03-22', '', '', '', '0', '', '0', 'JPY', '', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('779', '777', 'AL736', '2', '11', '', '', '', '', '0', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', 'FFFFFF', '', '', '2016-03-06', 'USS TOKYO', '456', 'A', '0', '', '0', 'JPY', '', '1', '', 'DKSJD', '8703.21.69', '1', '0');
INSERT INTO `vehicle` VALUES('780', '778', 'AL737', '2', '11', '342234424324', '', '', '', '12154', '', '', '', '0', 'full option, dvd', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '5', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('781', '779', 'AL738', '2', '11', '1654454', '123456789', '32165487', '123465', '2500', 'G', '2015', 'Red', '231', 'full option, dvd', 'Gasoline', 'Automatic', '5', '4', '-', '2WD', 'JPY', 'FFFFFF', '', '', '2016-03-15', 'UUS TOKDOY', '553', 'A', '556000', '', '522145', 'JPY', '4', '1', '', '', '', '1', '0');
INSERT INTO `vehicle` VALUES('782', '780', 'AL739', '2', '11', '1546121', '', '', '', '1500', '', '', '', '0', 'AC , FULL OPTION', 'Electric', 'Manual', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '352600', '', '254600', 'JPY', '1', '1', '782.pdf', '', '8703.21.69', '1', '0');
INSERT INTO `vehicle` VALUES('783', '781', 'AL740', '2', '11', '', '', '', '', '0', '', '', '', '0', '', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '1', '1', '783.pdf', '', '8703.21.69', '1', '0');
INSERT INTO `vehicle` VALUES('784', '782', 'AL741', '2', '11', '34424424', '4242424', '2342', '42424', '43434', '', '', '', '0', '', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '4242424', '', '4242', 'JPY', '1', '1', '', '', '8703.21.69', '1', '0');
INSERT INTO `vehicle` VALUES('785', '783', 'AL742', '2', '11', '', '', '', '', '0', '', '', '', '0', '', 'Gasoline', 'Automatic', '', '', '-', '2WD', 'JPY', '', '', '', '0000-00-00', '', '', '', '0', '', '0', 'JPY', '1', '1', '', '', '8703.21.69', '1', '0');


-- Dumping structure for table: `vehicle_insurance`

DROP TABLE IF EXISTS `vehicle_insurance`;
CREATE TABLE `vehicle_insurance` (
  `vhi_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `coordinator_id` int(11) DEFAULT NULL,
  `sold_price` decimal(10,2) DEFAULT NULL,
  `vhi_date` date DEFAULT NULL,
  `vhi_amount` double DEFAULT '0',
  `in_company_id` int(11) NOT NULL,
  `vhi_valuation_by` varchar(45) DEFAULT NULL,
  `vhi_docs_submitted` varchar(45) DEFAULT NULL,
  `vhi_submit_date` date DEFAULT NULL,
  `vhi_payment_status` varchar(20) DEFAULT NULL COMMENT 'ok=1/pending=2/delaying=3',
  `vhi_deposit_acc` varchar(45) DEFAULT NULL,
  `vhi_additional_info` varchar(45) DEFAULT NULL,
  `vhi_status` int(2) DEFAULT NULL COMMENT 'ok=1 | deleted =99',
  `vhi_confirm` int(2) DEFAULT NULL COMMENT 'default = 0 | after confirmed = 1',
  PRIMARY KEY (`vhi_id`),
  KEY `fk_vehicle_insurance_leasing1_idx` (`in_company_id`) USING BTREE,
  KEY `vehicle_insurance_ibfk_2` (`vh_id`) USING BTREE,
  KEY `vehicle_insurance_ibfk_3` (`cus_id`) USING BTREE,
  CONSTRAINT `vehicle_insurance_ibfk_1` FOREIGN KEY (`in_company_id`) REFERENCES `insurance_company` (`ln_id`) ON UPDATE CASCADE,
  CONSTRAINT `vehicle_insurance_ibfk_3` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5241 DEFAULT CHARSET=utf8;



-- Dumping data for table: vehicle_insurance

INSERT INTO `vehicle_insurance` VALUES('33', '1', '1', '1', '0.00', '2016-03-24', '1211', '2', 'fdaafa', 'fdadfa', '2016-01-27', '3', '1111111111111', 'bbbbbbbbbbbbb', '1', '1');
INSERT INTO `vehicle_insurance` VALUES('5223', '4', '2', '1', '1111.00', '2016-03-17', '6444', '17', '1111', '111', '2016-03-17', '2', '111', '111', '1', '1');
INSERT INTO `vehicle_insurance` VALUES('5224', '779', '1', '1', '100.00', '2016-04-26', '10000', '17', 'sampath', '25', '2016-03-17', '3', '11452148', '20', '1', '1');
INSERT INTO `vehicle_insurance` VALUES('5225', '779', '1', '1', '100.00', '2016-03-17', '100000', '17', '10', '25', '2016-03-17', '3', '10', '10', '1', '0');
INSERT INTO `vehicle_insurance` VALUES('5226', '0', '1', '1', '100.00', '2016-03-17', '200', '17', '100', '100', '2016-03-17', '2', '10066', '10066', '99', '1');
INSERT INTO `vehicle_insurance` VALUES('5227', '779', '1', '1', '0.00', '2016-03-17', '1500', '17', '', '', '2016-03-17', '1', '', '', '1', '0');
INSERT INTO `vehicle_insurance` VALUES('5228', '779', '1', '1', '0.00', '2016-03-17', '200000', '17', '', '', '2016-03-17', '1', '', '', '1', '0');
INSERT INTO `vehicle_insurance` VALUES('5229', '39', '1', '5', '0.00', '2016-04-04', '5000', '17', '', '', '2016-04-04', '2', '', '', '1', '0');
INSERT INTO `vehicle_insurance` VALUES('5240', '1', '1', '9', '5460000.00', '2016-04-26', '1245634', '17', '43456', 'jghjg', '0000-00-00', '3', 'ghkg', 'gkgjk', '1', '0');


-- Dumping structure for table: `vehicle_leasing`

DROP TABLE IF EXISTS `vehicle_leasing`;
CREATE TABLE `vehicle_leasing` (
  `vhl_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `coordinator_id` int(11) DEFAULT NULL,
  `coordinator` varchar(255) DEFAULT NULL,
  `sold_price` decimal(10,2) DEFAULT NULL,
  `vhl_date` date DEFAULT NULL,
  `vhl_amount` decimal(10,2) DEFAULT '0.00',
  `ls_company_id` int(11) NOT NULL,
  `vhl_valuation_by` varchar(45) DEFAULT NULL,
  `vhl_docs_submitted` varchar(45) DEFAULT NULL,
  `vhl_submit_date` date DEFAULT NULL,
  `vhl_payment_status` int(2) DEFAULT NULL COMMENT 'ok=1/pending=2/delaying=3',
  `vhl_deposit_acc` varchar(45) DEFAULT NULL,
  `vhl_additional_info` varchar(45) DEFAULT NULL,
  `payment_type` int(2) DEFAULT NULL COMMENT '0= cheque / 1=cash',
  `vhl_status` int(2) DEFAULT NULL COMMENT 'ok=1 | deleted =99',
  `vhl_confirm` int(2) DEFAULT NULL COMMENT 'default = 0 | after confirmed = 1',
  `vhl_confirmed_amount` decimal(10,2) DEFAULT NULL,
  `advance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`vhl_id`),
  KEY `fk_vehicle_leasing_leasing1_idx` (`ls_company_id`) USING BTREE,
  KEY `vehicle_leasing_ibfk_2` (`vh_id`),
  KEY `vehicle_leasing_ibfk_3` (`cus_id`),
  CONSTRAINT `vehicle_leasing_ibfk_1` FOREIGN KEY (`ls_company_id`) REFERENCES `leasing` (`ls_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `vehicle_leasing_ibfk_2` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `vehicle_leasing_ibfk_3` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;



-- Dumping data for table: vehicle_leasing

INSERT INTO `vehicle_leasing` VALUES('33', '1', '2', '9', '', '', '2016-04-04', '500.00', '2', 'Mr.K.P.M.S.Dharmarathna', 'Permit, Licence', '2016-01-27', '1', '34243', 'ABLC leasing', '', '1', '1', '', '');
INSERT INTO `vehicle_leasing` VALUES('34', '4', '2', '9', '', '', '2016-04-18', '6444.00', '2', '', '', '0000-00-00', '1', '', '', '', '1', '0', '', '');
INSERT INTO `vehicle_leasing` VALUES('35', '779', '2', '1', 'Miura International pvt ltd', '', '2016-03-16', '0.00', '5', '', '', '2016-03-16', '3', '', '', '', '1', '1', '', '');
INSERT INTO `vehicle_leasing` VALUES('49', '6', '', '0', '', '', '2016-04-18', '220000.00', '15', '', '', '2016-04-18', '1', '', '', '', '1', '0', '', '');
INSERT INTO `vehicle_leasing` VALUES('50', '171', '2', '0', '', '', '2016-04-18', '1500000.00', '2', 'gfghfghfghfghfghfghh', 'hfghfgh', '2016-04-18', '1', 'jxhjxf', 'gjchj', '', '0', '0', '', '');
INSERT INTO `vehicle_leasing` VALUES('52', '171', '2', '1', '1', '', '2016-04-18', '11500000.00', '2', 'hjhjhjhj', '', '2016-04-18', '1', 'klkl', 'klkl', '', '0', '0', '', '');
INSERT INTO `vehicle_leasing` VALUES('55', '205', '6', '1', '1', '', '2016-04-18', '4455.00', '10', '434', 'ghfgh', '2016-04-18', '1', 'hfjhfj', 'hjhj', '', '1', '0', '', '');
INSERT INTO `vehicle_leasing` VALUES('63', '37', '5', '9', '9', '4856600.00', '2016-04-19', '50000000.00', '5', '123abc', 'bcs', '2016-04-19', '1', 'abc', 'bcs', '2', '1', '1', '50000000.00', '14500.00');
INSERT INTO `vehicle_leasing` VALUES('64', '37', '5', '9', '9', '4856600.00', '2016-04-19', '50000000.00', '5', '123abc', 'bcs', '2016-04-19', '2', 'abc', 'bcs', '1', '0', '1', '50000000.00', '24500.00');
INSERT INTO `vehicle_leasing` VALUES('65', '37', '5', '7', '7', '4856600.00', '2016-04-19', '50000000.00', '5', '123abc', 'bcs', '2016-04-19', '2', 'abc', 'bcs', '1', '0', '1', '50000000.00', '24500.00');
INSERT INTO `vehicle_leasing` VALUES('67', '37', '6', '7', '<option value=\"1\">Miura International pvt ltd</option><option value=\"2\">MDCC</option><option value=\"3\">Namal Rathnayaka</option><option value=\"4\">Sisira Kumara</option><option value=\"5\">Dr Basnayaka</option><option value=\"6\">Sanogi International</option><', '4856600.00', '2016-04-19', '1252470.00', '15', 'jkhjk', 'cghk', '2016-04-19', '2', 'ghjk', 'cgj', '1', '0', '1', '1252470.00', '1500.00');
INSERT INTO `vehicle_leasing` VALUES('68', '37', '5', '5', 'Miura International pvt ltdMDCCNamal RathnayakaSisira KumaraDr BasnayakaSanogi InternationalDr N.P.G.S.DayarathnePragathi Lanka Pvt LtdAll other customerMr. UpendraAll', '4856600.00', '2016-04-19', '76544789.00', '5', 'dfd', 'sdfgf', '2016-04-19', '2', 'sdg', 'sdg', '2', '0', '1', '76544789.00', '12300.00');
INSERT INTO `vehicle_leasing` VALUES('69', '37', '5', '5', '', '4856600.00', '2016-04-19', '1200.00', '5', 'kj', 'jkl', '2016-04-19', '2', 'h', 'j', '2', '1', '1', '1200.00', '2500.00');
INSERT INTO `vehicle_leasing` VALUES('70', '205', '5', '1', '1', '45000.00', '2016-04-26', '5000.00', '5', 'MR. Aruna', 'Liucense', '2016-04-26', '2', '54646948', 'none', '2', '1', '0', '5000.00', '5000.00');
INSERT INTO `vehicle_leasing` VALUES('71', '205', '5', '6', '1', '45000.00', '2016-04-26', '5000.00', '5', 'MR. Aruna', 'Liucense', '2016-04-26', '2', '54646948', 'more', '2', '1', '0', '5000.00', '5000.00');
INSERT INTO `vehicle_leasing` VALUES('72', '205', '5', '1', '1', '45000.00', '2016-04-26', '5000.00', '5', 'MR. Aruna', 'Liucense', '2016-04-26', '2', '54646948', 'none', '2', '1', '0', '5000.00', '5000.00');
INSERT INTO `vehicle_leasing` VALUES('73', '205', '5', '1', '1', '45000.00', '2016-04-26', '5000.00', '5', 'MR. Aruna', 'Liucense', '2016-04-26', '2', '54646948', 'none', '2', '1', '0', '5000.00', '5000.00');
INSERT INTO `vehicle_leasing` VALUES('74', '205', '5', '1', '1', '45000.00', '2016-04-26', '5000.00', '5', 'MR. Aruna', 'Liucense', '2016-04-26', '2', '54646948', 'none', '2', '1', '0', '5000.00', '5000.00');
INSERT INTO `vehicle_leasing` VALUES('75', '1', '5', '9', '9', '5460000.00', '2016-04-26', '1500000.00', '5', 'abcdd', 'fgdfgdfg', '2016-04-26', '2', 'zdfgdfg', 'fgdfgdfg', '2', '1', '1', '1500000.00', '520000.00');


-- Dumping structure for table: `vehicle_leasing_confirm_list`

DROP TABLE IF EXISTS `vehicle_leasing_confirm_list`;
CREATE TABLE `vehicle_leasing_confirm_list` (
  `leasing_vehicle_confirm_id` int(11) NOT NULL,
  `advance_paid_date` datetime DEFAULT NULL,
  `advance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leasing_amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`leasing_vehicle_confirm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Dumping data for table: vehicle_leasing_confirm_list



-- Dumping structure for table: `vehicle_modification`

DROP TABLE IF EXISTS `vehicle_modification`;
CREATE TABLE `vehicle_modification` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` date DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `vh_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `mod_status` varchar(20) DEFAULT NULL,
  `options` varchar(45) DEFAULT NULL,
  `other_opt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=788 DEFAULT CHARSET=utf8;



-- Dumping data for table: vehicle_modification

INSERT INTO `vehicle_modification` VALUES('1', '2015-08-13', 'initial status of vehicle', '1', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('2', '2015-08-13', 'initial status of vehicle', '2', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('3', '2015-08-13', 'initial status of vehicle', '3', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('4', '2015-08-13', 'initial status of vehicle', '4', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('5', '2015-08-13', 'initial status of vehicle', '5', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('6', '2015-08-13', 'initial status of vehicle', '6', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('7', '2015-08-13', 'initial status of vehicle', '7', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('8', '2015-08-13', 'initial status of vehicle', '8', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('9', '2015-08-13', 'initial status of vehicle', '9', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('10', '2015-08-13', 'initial status of vehicle', '10', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('11', '2015-08-13', 'initial status of vehicle', '11', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('12', '2015-08-13', 'initial status of vehicle', '12', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('13', '2015-08-14', 'initial status of vehicle', '13', '0', '0', 'Default', 'DVD,RC', '');
INSERT INTO `vehicle_modification` VALUES('14', '2015-08-14', 'initial status of vehicle', '14', '0', '0', 'Default', 'DVD,RC,HID LIGHTS,MULTIFUNCTION,POWER WINDOW', '');
INSERT INTO `vehicle_modification` VALUES('15', '2015-08-14', 'initial status of vehicle', '15', '0', '0', 'Default', 'P/STR, F/LIG, AAC, M.F, DVD', '-');
INSERT INTO `vehicle_modification` VALUES('16', '2015-08-14', 'initial status of vehicle', '16', '0', '0', 'Default', 'AAC,MULTIFUNCTION,DVD,PW.', '');
INSERT INTO `vehicle_modification` VALUES('17', '2015-08-14', 'initial status of vehicle', '17', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('18', '2015-08-14', 'initial status of vehicle', '18', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('19', '2015-08-14', 'initial status of vehicle', '19', '0', '0', 'Default', 'AC,DVD,PW,PM,MULTIFUNCTION', '');
INSERT INTO `vehicle_modification` VALUES('20', '2015-08-15', 'initial status of vehicle', '20', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('21', '2015-08-15', 'initial status of vehicle', '21', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('22', '2015-08-15', 'initial status of vehicle', '22', '0', '0', 'Default', 'PUSH START,PS,PW,MULTIFUNCTION,', '');
INSERT INTO `vehicle_modification` VALUES('23', '2015-08-15', 'initial status of vehicle', '23', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('24', '2015-08-15', 'initial status of vehicle', '24', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('25', '2015-08-15', 'initial status of vehicle', '25', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('26', '2015-08-15', 'initial status of vehicle', '26', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('27', '2015-08-15', 'initial status of vehicle', '27', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('28', '2015-08-15', 'initial status of vehicle', '28', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('29', '2015-08-15', 'initial status of vehicle', '29', '0', '0', 'Default', 'PS,PW,DVD,PUSH START,MULTIFUNCTION', '');
INSERT INTO `vehicle_modification` VALUES('30', '2015-08-15', 'initial status of vehicle', '30', '0', '0', 'Default', 'P/ST, P/WN, R/WP', '');
INSERT INTO `vehicle_modification` VALUES('31', '2015-08-15', 'initial status of vehicle', '31', '0', '0', 'Default', 'P/ST, P/WN, ABS, DVD', '');
INSERT INTO `vehicle_modification` VALUES('32', '2015-08-15', 'initial status of vehicle', '32', '0', '0', 'Default', 'P/ST, P/WN, DVD', '');
INSERT INTO `vehicle_modification` VALUES('33', '2015-08-15', 'initial status of vehicle', '33', '0', '0', 'Default', 'P/ST, P/WN, AC', '');
INSERT INTO `vehicle_modification` VALUES('34', '2015-08-15', 'initial status of vehicle', '34', '0', '0', 'Default', 'P/ST, P/WN, R/WP, MF, DVD, AAC', '');
INSERT INTO `vehicle_modification` VALUES('35', '2015-08-15', 'initial status of vehicle', '35', '0', '0', 'Default', 'P/ST, P/WN, P/ST, R/WP, MF', '');
INSERT INTO `vehicle_modification` VALUES('36', '2015-08-15', 'initial status of vehicle', '36', '0', '0', 'Default', 'PU/ST, MF, R/WP, P/WN, P/ST', '');
INSERT INTO `vehicle_modification` VALUES('37', '2015-08-15', 'initial status of vehicle', '37', '0', '0', 'Default', 'PU/ST, AAC, ABS, R/WP, P/WN, P/ST', '');
INSERT INTO `vehicle_modification` VALUES('38', '2015-08-15', 'initial status of vehicle', '38', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('39', '2015-08-15', 'initial status of vehicle', '39', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('40', '2015-08-15', 'initial status of vehicle', '40', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('41', '2015-08-15', 'initial status of vehicle', '41', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('42', '2015-08-15', 'initial status of vehicle', '42', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('43', '2015-08-15', 'initial status of vehicle', '43', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('44', '2015-08-15', 'initial status of vehicle', '44', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('45', '2015-08-15', 'initial status of vehicle', '45', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('46', '2015-08-15', 'initial status of vehicle', '46', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('47', '2015-08-15', 'initial status of vehicle', '47', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('48', '2015-08-15', 'initial status of vehicle', '48', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('49', '2015-08-15', 'initial status of vehicle', '49', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('50', '2015-08-15', 'initial status of vehicle', '50', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('51', '2015-08-15', 'initial status of vehicle', '51', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('52', '2015-08-15', 'initial status of vehicle', '52', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('53', '2015-08-15', 'initial status of vehicle', '53', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('54', '2015-08-15', 'initial status of vehicle', '54', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('55', '2015-08-15', 'initial status of vehicle', '55', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('56', '2015-08-15', 'initial status of vehicle', '56', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('57', '2015-08-15', 'initial status of vehicle', '57', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('58', '2015-08-19', 'initial status of vehicle', '58', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('59', '2015-08-19', 'initial status of vehicle', '59', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('60', '2015-08-19', 'initial status of vehicle', '60', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('61', '2015-08-19', 'initial status of vehicle', '61', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('62', '2015-08-19', 'initial status of vehicle', '62', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('63', '2015-08-19', 'initial status of vehicle', '63', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('64', '2015-08-19', 'initial status of vehicle', '64', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('65', '2015-08-19', 'initial status of vehicle', '65', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('66', '2015-08-19', 'initial status of vehicle', '66', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('67', '2015-08-19', 'initial status of vehicle', '67', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('68', '2015-08-19', 'initial status of vehicle', '68', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('69', '2015-08-19', 'initial status of vehicle', '69', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('70', '2015-08-19', 'initial status of vehicle', '70', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('71', '2015-08-19', 'initial status of vehicle', '71', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('72', '2015-08-19', 'initial status of vehicle', '72', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('73', '2015-08-19', 'initial status of vehicle', '73', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('74', '2015-08-19', 'initial status of vehicle', '74', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('75', '2015-08-19', 'initial status of vehicle', '75', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('76', '2015-08-19', 'initial status of vehicle', '76', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('77', '2015-08-19', 'initial status of vehicle', '77', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('78', '2015-08-19', 'initial status of vehicle', '78', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('79', '2015-08-19', 'initial status of vehicle', '79', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('80', '2015-08-19', 'initial status of vehicle', '80', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('81', '2015-08-19', 'initial status of vehicle', '81', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('82', '2015-08-19', 'initial status of vehicle', '82', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('83', '2015-08-19', 'initial status of vehicle', '83', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('84', '2015-08-19', 'initial status of vehicle', '84', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('85', '2015-08-19', 'initial status of vehicle', '85', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('86', '2015-08-19', 'initial status of vehicle', '86', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('87', '2015-08-19', 'initial status of vehicle', '87', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('88', '2015-08-20', 'initial status of vehicle', '88', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('89', '2015-08-20', 'initial status of vehicle', '89', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('90', '2015-08-20', 'initial status of vehicle', '90', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('91', '2015-08-20', 'initial status of vehicle', '91', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('92', '2015-08-20', 'initial status of vehicle', '92', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('93', '2015-08-20', 'initial status of vehicle', '93', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('94', '2015-08-20', 'initial status of vehicle', '94', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('95', '2015-08-20', 'initial status of vehicle', '95', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('96', '2015-08-20', 'initial status of vehicle', '96', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('97', '2015-08-20', 'initial status of vehicle', '97', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('98', '2015-08-20', 'initial status of vehicle', '98', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('99', '2015-08-20', 'initial status of vehicle', '99', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('100', '2015-08-20', 'initial status of vehicle', '100', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('101', '2015-08-20', 'initial status of vehicle', '101', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('102', '2015-08-20', 'initial status of vehicle', '102', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('103', '2015-08-20', 'initial status of vehicle', '103', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('104', '2015-08-20', 'initial status of vehicle', '104', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('105', '2015-08-20', 'initial status of vehicle', '105', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('106', '2015-08-20', 'initial status of vehicle', '106', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('107', '2015-08-20', 'initial status of vehicle', '107', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('108', '2015-08-20', 'initial status of vehicle', '108', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('109', '2015-08-20', 'initial status of vehicle', '109', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('110', '2015-08-20', 'initial status of vehicle', '110', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('111', '2015-08-20', 'initial status of vehicle', '111', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('112', '2015-08-20', 'initial status of vehicle', '112', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('113', '2015-08-20', 'initial status of vehicle', '113', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('114', '2015-08-20', 'initial status of vehicle', '114', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('115', '2015-08-20', 'initial status of vehicle', '115', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('116', '2015-08-20', 'initial status of vehicle', '116', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('117', '2015-08-20', 'initial status of vehicle', '117', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('118', '2015-08-20', 'initial status of vehicle', '118', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('119', '2015-08-20', 'initial status of vehicle', '119', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('120', '2015-08-20', 'initial status of vehicle', '120', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('121', '2015-08-20', 'initial status of vehicle', '121', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('122', '2015-08-20', 'initial status of vehicle', '122', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('123', '2015-08-20', 'initial status of vehicle', '123', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('124', '2015-08-20', 'initial status of vehicle', '124', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('125', '2015-08-20', 'initial status of vehicle', '125', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('126', '2015-08-20', 'initial status of vehicle', '126', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('127', '2015-08-20', 'initial status of vehicle', '127', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('128', '2015-08-20', 'initial status of vehicle', '128', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('129', '2015-08-20', 'initial status of vehicle', '129', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('130', '2015-08-20', 'initial status of vehicle', '130', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('131', '2015-08-20', 'initial status of vehicle', '131', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('132', '2015-08-20', 'initial status of vehicle', '132', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('133', '2015-08-20', 'initial status of vehicle', '133', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('134', '2015-08-20', 'initial status of vehicle', '134', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('135', '2015-08-20', 'initial status of vehicle', '135', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('136', '2015-08-20', 'initial status of vehicle', '136', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('137', '2015-08-20', 'initial status of vehicle', '137', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('138', '2015-08-20', 'initial status of vehicle', '138', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('139', '2015-08-20', 'initial status of vehicle', '139', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('140', '2015-08-20', 'initial status of vehicle', '140', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('141', '2015-08-20', 'initial status of vehicle', '141', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('142', '2015-08-20', 'initial status of vehicle', '142', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('143', '2015-08-20', 'initial status of vehicle', '143', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('144', '2015-08-20', 'initial status of vehicle', '144', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('145', '2015-08-20', 'initial status of vehicle', '145', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('146', '2015-08-20', 'initial status of vehicle', '146', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('147', '2015-08-20', 'initial status of vehicle', '147', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('148', '2015-08-20', 'initial status of vehicle', '148', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('149', '2015-08-20', 'initial status of vehicle', '149', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('150', '2015-08-20', 'initial status of vehicle', '150', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('151', '2015-08-20', 'initial status of vehicle', '151', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('152', '2015-08-20', 'initial status of vehicle', '152', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('153', '2015-08-20', 'initial status of vehicle', '153', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('154', '2015-08-20', 'initial status of vehicle', '154', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('155', '2015-08-20', 'initial status of vehicle', '155', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('156', '2015-08-20', 'initial status of vehicle', '156', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('157', '2015-08-20', 'initial status of vehicle', '157', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('158', '2015-08-20', 'initial status of vehicle', '158', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('159', '2015-08-20', 'initial status of vehicle', '159', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('160', '2015-08-20', 'initial status of vehicle', '160', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('161', '2015-08-20', 'initial status of vehicle', '161', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('162', '2015-08-20', 'initial status of vehicle', '162', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('163', '2015-08-20', 'initial status of vehicle', '163', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('164', '2015-08-20', 'initial status of vehicle', '164', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('165', '2015-08-20', 'initial status of vehicle', '165', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('166', '2015-08-20', 'initial status of vehicle', '166', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('167', '2015-08-20', 'initial status of vehicle', '167', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('168', '2015-08-20', 'initial status of vehicle', '168', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('169', '2015-08-20', 'initial status of vehicle', '169', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('170', '2015-08-20', 'initial status of vehicle', '170', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('171', '2015-08-20', 'initial status of vehicle', '171', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('172', '2015-08-20', 'initial status of vehicle', '172', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('173', '2015-08-20', 'initial status of vehicle', '173', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('174', '2015-08-20', 'initial status of vehicle', '174', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('175', '2015-08-20', 'initial status of vehicle', '175', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('176', '2015-08-20', 'initial status of vehicle', '176', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('177', '2015-08-20', 'initial status of vehicle', '177', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('178', '2015-08-20', 'initial status of vehicle', '178', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('179', '2015-08-20', 'initial status of vehicle', '179', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('180', '2015-08-20', 'initial status of vehicle', '180', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('181', '2015-08-20', 'initial status of vehicle', '181', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('182', '2015-08-20', 'initial status of vehicle', '182', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('183', '2015-08-20', 'initial status of vehicle', '183', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('184', '2015-08-20', 'initial status of vehicle', '184', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('185', '2015-08-20', 'initial status of vehicle', '185', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('186', '2015-08-20', 'initial status of vehicle', '186', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('187', '2015-08-20', 'initial status of vehicle', '187', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('188', '2015-08-20', 'initial status of vehicle', '188', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('189', '2015-08-20', 'initial status of vehicle', '189', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('190', '2015-08-20', 'initial status of vehicle', '190', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('191', '2015-08-20', 'initial status of vehicle', '191', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('192', '2015-08-20', 'initial status of vehicle', '192', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('193', '2015-08-20', 'initial status of vehicle', '193', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('194', '2015-08-20', 'initial status of vehicle', '194', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('195', '2015-08-20', 'initial status of vehicle', '195', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('196', '2015-08-20', 'initial status of vehicle', '196', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('197', '2015-08-20', 'initial status of vehicle', '197', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('198', '2015-08-20', 'initial status of vehicle', '198', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('199', '2015-08-20', 'initial status of vehicle', '199', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('200', '2015-08-20', 'initial status of vehicle', '200', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('201', '2015-08-20', 'initial status of vehicle', '201', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('202', '2015-08-20', 'initial status of vehicle', '202', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('203', '2015-08-20', 'initial status of vehicle', '203', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('204', '2015-08-20', 'initial status of vehicle', '204', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('205', '2015-08-20', 'initial status of vehicle', '205', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('206', '2015-08-20', 'initial status of vehicle', '206', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('207', '2015-08-20', 'initial status of vehicle', '207', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('208', '2015-08-20', 'initial status of vehicle', '208', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('209', '2015-08-20', 'initial status of vehicle', '209', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('210', '2015-08-20', 'initial status of vehicle', '210', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('211', '2015-08-20', 'initial status of vehicle', '211', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('212', '2015-08-20', 'initial status of vehicle', '212', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('213', '2015-08-20', 'initial status of vehicle', '213', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('214', '2015-08-20', 'initial status of vehicle', '214', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('215', '2015-08-20', 'initial status of vehicle', '215', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('216', '2015-08-20', 'initial status of vehicle', '216', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('217', '2015-08-20', 'initial status of vehicle', '217', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('218', '2015-08-20', 'initial status of vehicle', '218', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('219', '2015-08-20', 'initial status of vehicle', '219', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('220', '2015-08-20', 'initial status of vehicle', '220', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('221', '2015-08-20', 'initial status of vehicle', '221', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('222', '2015-08-20', 'initial status of vehicle', '222', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('223', '2015-08-20', 'initial status of vehicle', '223', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('224', '2015-08-20', 'initial status of vehicle', '224', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('225', '2015-08-20', 'initial status of vehicle', '225', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('226', '2015-08-20', 'initial status of vehicle', '226', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('227', '2015-08-20', 'initial status of vehicle', '227', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('228', '2015-08-20', 'initial status of vehicle', '228', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('229', '2015-08-20', 'initial status of vehicle', '229', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('230', '2015-08-20', 'initial status of vehicle', '230', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('231', '2015-08-20', 'initial status of vehicle', '231', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('232', '2015-08-20', 'initial status of vehicle', '232', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('233', '2015-08-20', 'initial status of vehicle', '233', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('234', '2015-08-20', 'initial status of vehicle', '234', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('235', '2015-08-20', 'initial status of vehicle', '235', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('236', '2015-08-20', 'initial status of vehicle', '236', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('237', '2015-08-20', 'initial status of vehicle', '237', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('238', '2015-08-20', 'initial status of vehicle', '238', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('239', '2015-08-20', 'initial status of vehicle', '239', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('240', '2015-08-20', 'initial status of vehicle', '240', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('241', '2015-08-20', 'initial status of vehicle', '241', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('242', '2015-08-20', 'initial status of vehicle', '242', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('243', '2015-08-20', 'initial status of vehicle', '243', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('244', '2015-08-20', 'initial status of vehicle', '244', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('245', '2015-08-20', 'initial status of vehicle', '245', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('246', '2015-08-20', 'initial status of vehicle', '246', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('247', '2015-08-20', 'initial status of vehicle', '247', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('248', '2015-08-20', 'initial status of vehicle', '248', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('249', '2015-08-20', 'initial status of vehicle', '249', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('250', '2015-08-20', 'initial status of vehicle', '250', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('251', '2015-08-20', 'initial status of vehicle', '251', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('252', '2015-08-20', 'initial status of vehicle', '252', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('253', '2015-08-20', 'initial status of vehicle', '253', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('254', '2015-08-20', 'initial status of vehicle', '254', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('255', '2015-08-20', 'initial status of vehicle', '255', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('256', '2015-08-20', 'initial status of vehicle', '256', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('257', '2015-08-20', 'initial status of vehicle', '257', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('258', '2015-08-20', 'initial status of vehicle', '258', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('259', '2015-08-20', 'initial status of vehicle', '259', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('260', '2015-08-20', 'initial status of vehicle', '260', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('261', '2015-08-20', 'initial status of vehicle', '261', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('262', '2015-08-20', 'initial status of vehicle', '262', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('263', '2015-08-20', 'initial status of vehicle', '263', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('264', '2015-08-20', 'initial status of vehicle', '264', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('265', '2015-08-20', 'initial status of vehicle', '265', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('266', '2015-08-20', 'initial status of vehicle', '266', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('267', '2015-08-20', 'initial status of vehicle', '267', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('268', '2015-08-20', 'initial status of vehicle', '268', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('269', '2015-08-20', 'initial status of vehicle', '269', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('270', '2015-08-20', 'initial status of vehicle', '270', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('271', '2015-08-20', 'initial status of vehicle', '271', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('272', '2015-08-20', 'initial status of vehicle', '272', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('273', '2015-08-20', 'initial status of vehicle', '273', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('274', '2015-08-20', 'initial status of vehicle', '274', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('275', '2015-08-20', 'initial status of vehicle', '275', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('276', '2015-08-20', 'initial status of vehicle', '276', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('277', '2015-08-20', 'initial status of vehicle', '277', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('278', '2015-08-20', 'initial status of vehicle', '278', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('279', '2015-08-20', 'initial status of vehicle', '279', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('280', '2015-08-20', 'initial status of vehicle', '280', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('281', '2015-08-20', 'initial status of vehicle', '281', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('282', '2015-08-20', 'initial status of vehicle', '282', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('283', '2015-08-20', 'initial status of vehicle', '283', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('284', '2015-08-20', 'initial status of vehicle', '284', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('285', '2015-08-20', 'initial status of vehicle', '285', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('286', '2015-08-20', 'initial status of vehicle', '286', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('287', '2015-08-20', 'initial status of vehicle', '287', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('288', '2015-08-20', 'initial status of vehicle', '288', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('289', '2015-08-20', 'initial status of vehicle', '289', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('290', '2015-08-20', 'initial status of vehicle', '290', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('291', '2015-08-20', 'initial status of vehicle', '291', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('292', '2015-08-20', 'initial status of vehicle', '292', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('293', '2015-08-20', 'initial status of vehicle', '293', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('294', '2015-08-20', 'initial status of vehicle', '294', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('295', '2015-08-20', 'initial status of vehicle', '295', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('296', '2015-08-20', 'initial status of vehicle', '296', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('297', '2015-08-20', 'initial status of vehicle', '297', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('298', '2015-08-20', 'initial status of vehicle', '298', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('299', '2015-08-20', 'initial status of vehicle', '299', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('300', '2015-08-20', 'initial status of vehicle', '300', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('301', '2015-08-20', 'initial status of vehicle', '301', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('302', '2015-08-20', 'initial status of vehicle', '302', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('303', '2015-08-20', 'initial status of vehicle', '303', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('304', '2015-08-20', 'initial status of vehicle', '304', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('305', '2015-08-20', 'initial status of vehicle', '305', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('306', '2015-08-20', 'initial status of vehicle', '306', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('307', '2015-08-20', 'initial status of vehicle', '307', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('308', '2015-08-20', 'initial status of vehicle', '308', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('309', '2015-08-20', 'initial status of vehicle', '309', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('310', '2015-08-20', 'initial status of vehicle', '310', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('311', '2015-08-20', 'initial status of vehicle', '311', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('312', '2015-08-20', 'initial status of vehicle', '312', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('313', '2015-08-20', 'initial status of vehicle', '313', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('314', '2015-08-20', 'initial status of vehicle', '314', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('315', '2015-08-20', 'initial status of vehicle', '315', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('316', '2015-08-20', 'initial status of vehicle', '316', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('317', '2015-08-20', 'initial status of vehicle', '317', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('318', '2015-08-20', 'initial status of vehicle', '318', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('319', '2015-08-20', 'initial status of vehicle', '319', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('320', '2015-08-20', 'initial status of vehicle', '320', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('321', '2015-08-20', 'initial status of vehicle', '321', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('322', '2015-08-20', 'initial status of vehicle', '322', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('323', '2015-08-20', 'initial status of vehicle', '323', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('324', '2015-08-20', 'initial status of vehicle', '324', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('325', '2015-08-20', 'initial status of vehicle', '325', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('326', '2015-08-20', 'initial status of vehicle', '326', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('327', '2015-08-20', 'initial status of vehicle', '327', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('328', '2015-08-20', 'initial status of vehicle', '328', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('329', '2015-08-20', 'initial status of vehicle', '329', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('330', '2015-08-20', 'initial status of vehicle', '330', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('331', '2015-08-20', 'initial status of vehicle', '331', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('332', '2015-08-20', 'initial status of vehicle', '332', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('333', '2015-08-20', 'initial status of vehicle', '333', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('334', '2015-08-20', 'initial status of vehicle', '334', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('335', '2015-08-20', 'initial status of vehicle', '335', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('336', '2015-08-20', 'initial status of vehicle', '336', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('337', '2015-08-20', 'initial status of vehicle', '337', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('338', '2015-08-20', 'initial status of vehicle', '338', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('339', '2015-08-20', 'initial status of vehicle', '339', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('340', '2015-08-20', 'initial status of vehicle', '340', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('341', '2015-08-20', 'initial status of vehicle', '341', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('342', '2015-08-20', 'initial status of vehicle', '342', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('343', '2015-08-20', 'initial status of vehicle', '343', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('344', '2015-08-20', 'initial status of vehicle', '344', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('345', '2015-08-20', 'initial status of vehicle', '345', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('346', '2015-08-20', 'initial status of vehicle', '346', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('347', '2015-08-20', 'initial status of vehicle', '347', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('348', '2015-08-20', 'initial status of vehicle', '348', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('349', '2015-08-20', 'initial status of vehicle', '349', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('350', '2015-08-20', 'initial status of vehicle', '350', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('351', '2015-08-20', 'initial status of vehicle', '351', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('352', '2015-08-20', 'initial status of vehicle', '352', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('353', '2015-08-20', 'initial status of vehicle', '353', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('354', '2015-08-20', 'initial status of vehicle', '354', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('355', '2015-08-20', 'initial status of vehicle', '355', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('356', '2015-08-20', 'initial status of vehicle', '356', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('357', '2015-08-20', 'initial status of vehicle', '357', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('358', '2015-08-20', 'initial status of vehicle', '358', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('359', '2015-08-20', 'initial status of vehicle', '359', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('360', '2015-08-20', 'initial status of vehicle', '360', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('361', '2015-08-20', 'initial status of vehicle', '361', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('362', '2015-08-20', 'initial status of vehicle', '362', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('363', '2015-08-20', 'initial status of vehicle', '363', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('364', '2015-08-20', 'initial status of vehicle', '364', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('365', '2015-08-20', 'initial status of vehicle', '365', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('366', '2015-08-20', 'initial status of vehicle', '366', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('367', '2015-08-20', 'initial status of vehicle', '367', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('368', '2015-08-20', 'initial status of vehicle', '368', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('369', '2015-08-20', 'initial status of vehicle', '369', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('370', '2015-08-20', 'initial status of vehicle', '370', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('371', '2015-08-20', 'initial status of vehicle', '371', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('372', '2015-08-20', 'initial status of vehicle', '372', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('373', '2015-08-20', 'initial status of vehicle', '373', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('374', '2015-08-20', 'initial status of vehicle', '374', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('375', '2015-08-20', 'initial status of vehicle', '375', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('376', '2015-08-20', 'initial status of vehicle', '376', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('377', '2015-08-20', 'initial status of vehicle', '377', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('378', '2015-08-20', 'initial status of vehicle', '378', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('379', '2015-08-20', 'initial status of vehicle', '379', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('380', '2015-08-20', 'initial status of vehicle', '380', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('381', '2015-08-20', 'initial status of vehicle', '381', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('382', '2015-08-20', 'initial status of vehicle', '382', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('383', '2015-08-20', 'initial status of vehicle', '383', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('384', '2015-08-20', 'initial status of vehicle', '384', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('385', '2015-08-20', 'initial status of vehicle', '385', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('386', '2015-08-20', 'initial status of vehicle', '386', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('387', '2015-08-20', 'initial status of vehicle', '387', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('388', '2015-08-20', 'initial status of vehicle', '388', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('389', '2015-08-20', 'initial status of vehicle', '389', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('390', '2015-08-20', 'initial status of vehicle', '390', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('391', '2015-08-20', 'initial status of vehicle', '391', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('392', '2015-08-20', 'initial status of vehicle', '392', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('393', '2015-08-20', 'initial status of vehicle', '393', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('394', '2015-08-20', 'initial status of vehicle', '394', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('395', '2015-08-20', 'initial status of vehicle', '395', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('396', '2015-08-20', 'initial status of vehicle', '396', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('397', '2015-08-20', 'initial status of vehicle', '397', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('398', '2015-08-20', 'initial status of vehicle', '398', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('399', '2015-08-20', 'initial status of vehicle', '399', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('400', '2015-08-20', 'initial status of vehicle', '400', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('401', '2015-08-20', 'initial status of vehicle', '401', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('402', '2015-08-20', 'initial status of vehicle', '402', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('403', '2015-08-20', 'initial status of vehicle', '403', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('404', '2015-08-20', 'initial status of vehicle', '404', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('405', '2015-08-20', 'initial status of vehicle', '405', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('406', '2015-08-20', 'initial status of vehicle', '406', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('407', '2015-08-20', 'initial status of vehicle', '407', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('408', '2015-08-20', 'initial status of vehicle', '408', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('409', '2015-08-20', 'initial status of vehicle', '409', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('410', '2015-08-20', 'initial status of vehicle', '410', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('411', '2015-08-20', 'initial status of vehicle', '411', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('412', '2015-08-20', 'initial status of vehicle', '412', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('413', '2015-08-20', 'initial status of vehicle', '413', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('414', '2015-08-20', 'initial status of vehicle', '414', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('415', '2015-08-20', 'initial status of vehicle', '415', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('416', '2015-08-20', 'initial status of vehicle', '416', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('417', '2015-08-20', 'initial status of vehicle', '417', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('418', '2015-08-20', 'initial status of vehicle', '418', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('419', '2015-08-20', 'initial status of vehicle', '419', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('420', '2015-08-20', 'initial status of vehicle', '420', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('421', '2015-08-20', 'initial status of vehicle', '421', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('422', '2015-08-20', 'initial status of vehicle', '422', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('423', '2015-08-20', 'initial status of vehicle', '423', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('424', '2015-08-20', 'initial status of vehicle', '424', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('425', '2015-08-20', 'initial status of vehicle', '425', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('426', '2015-08-20', 'initial status of vehicle', '426', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('427', '2015-08-20', 'initial status of vehicle', '427', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('428', '2015-08-20', 'initial status of vehicle', '428', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('429', '2015-08-20', 'initial status of vehicle', '429', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('430', '2015-08-20', 'initial status of vehicle', '430', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('431', '2015-08-20', 'initial status of vehicle', '431', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('432', '2015-08-20', 'initial status of vehicle', '432', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('433', '2015-08-20', 'initial status of vehicle', '433', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('434', '2015-08-20', 'initial status of vehicle', '434', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('435', '2015-08-20', 'initial status of vehicle', '435', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('436', '2015-08-20', 'initial status of vehicle', '436', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('437', '2015-08-20', 'initial status of vehicle', '437', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('438', '2015-08-20', 'initial status of vehicle', '438', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('439', '2015-08-20', 'initial status of vehicle', '439', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('440', '2015-08-20', 'initial status of vehicle', '440', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('441', '2015-08-20', 'initial status of vehicle', '441', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('442', '2015-08-20', 'initial status of vehicle', '442', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('443', '2015-08-20', 'initial status of vehicle', '443', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('444', '2015-08-20', 'initial status of vehicle', '444', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('445', '2015-08-20', 'initial status of vehicle', '445', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('446', '2015-08-20', 'initial status of vehicle', '446', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('447', '2015-08-20', 'initial status of vehicle', '447', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('448', '2015-08-20', 'initial status of vehicle', '448', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('449', '2015-08-20', 'initial status of vehicle', '449', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('450', '2015-08-20', 'initial status of vehicle', '450', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('451', '2015-08-20', 'initial status of vehicle', '451', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('452', '2015-08-20', 'initial status of vehicle', '452', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('453', '2015-08-20', 'initial status of vehicle', '453', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('454', '2015-08-20', 'initial status of vehicle', '454', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('455', '2015-08-20', 'initial status of vehicle', '455', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('456', '2015-08-20', 'initial status of vehicle', '456', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('457', '2015-08-20', 'initial status of vehicle', '457', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('458', '2015-08-20', 'initial status of vehicle', '458', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('459', '2015-08-20', 'initial status of vehicle', '459', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('460', '2015-08-20', 'initial status of vehicle', '460', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('461', '2015-08-20', 'initial status of vehicle', '461', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('462', '2015-08-20', 'initial status of vehicle', '462', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('463', '2015-08-20', 'initial status of vehicle', '463', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('464', '2015-08-20', 'initial status of vehicle', '464', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('465', '2015-08-20', 'initial status of vehicle', '465', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('466', '2015-08-20', 'initial status of vehicle', '466', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('467', '2015-08-20', 'initial status of vehicle', '467', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('468', '2015-08-20', 'initial status of vehicle', '468', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('469', '2015-08-20', 'initial status of vehicle', '469', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('470', '2015-08-20', 'initial status of vehicle', '470', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('471', '2015-08-20', 'initial status of vehicle', '471', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('472', '2015-08-20', 'initial status of vehicle', '472', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('473', '2015-08-20', 'initial status of vehicle', '473', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('474', '2015-08-20', 'initial status of vehicle', '474', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('475', '2015-08-20', 'initial status of vehicle', '475', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('476', '2015-08-20', 'initial status of vehicle', '476', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('477', '2015-08-20', 'initial status of vehicle', '477', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('478', '2015-08-20', 'initial status of vehicle', '478', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('479', '2015-08-20', 'initial status of vehicle', '479', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('480', '2015-08-20', 'initial status of vehicle', '480', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('481', '2015-08-20', 'initial status of vehicle', '481', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('482', '2015-08-20', 'initial status of vehicle', '482', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('483', '2015-08-20', 'initial status of vehicle', '483', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('484', '2015-08-20', 'initial status of vehicle', '484', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('485', '2015-08-20', 'initial status of vehicle', '485', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('486', '2015-08-20', 'initial status of vehicle', '486', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('487', '2015-08-20', 'initial status of vehicle', '487', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('488', '2015-08-20', 'initial status of vehicle', '488', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('489', '2015-08-20', 'initial status of vehicle', '489', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('490', '2015-08-20', 'initial status of vehicle', '490', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('491', '2015-08-20', 'initial status of vehicle', '491', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('492', '2015-08-20', 'initial status of vehicle', '492', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('493', '2015-08-20', 'initial status of vehicle', '493', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('494', '2015-08-20', 'initial status of vehicle', '494', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('495', '2015-08-20', 'initial status of vehicle', '495', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('496', '2015-08-20', 'initial status of vehicle', '496', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('497', '2015-08-20', 'initial status of vehicle', '497', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('498', '2015-08-20', 'initial status of vehicle', '498', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('499', '2015-08-20', 'initial status of vehicle', '499', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('500', '2015-08-20', 'initial status of vehicle', '500', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('501', '2015-08-20', 'initial status of vehicle', '501', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('502', '2015-08-20', 'initial status of vehicle', '502', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('503', '2015-08-20', 'initial status of vehicle', '503', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('504', '2015-08-20', 'initial status of vehicle', '504', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('505', '2015-08-20', 'initial status of vehicle', '505', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('506', '2015-08-20', 'initial status of vehicle', '506', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('507', '2015-08-20', 'initial status of vehicle', '507', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('508', '2015-08-20', 'initial status of vehicle', '508', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('509', '2015-08-20', 'initial status of vehicle', '509', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('510', '2015-08-20', 'initial status of vehicle', '510', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('511', '2015-08-20', 'initial status of vehicle', '511', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('512', '2015-08-20', 'initial status of vehicle', '512', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('513', '2015-08-20', 'initial status of vehicle', '513', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('514', '2015-08-20', 'initial status of vehicle', '514', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('515', '2015-08-20', 'initial status of vehicle', '515', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('516', '2015-08-20', 'initial status of vehicle', '516', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('517', '2015-08-20', 'initial status of vehicle', '517', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('518', '2015-08-20', 'initial status of vehicle', '518', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('519', '2015-08-20', 'initial status of vehicle', '519', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('520', '2015-08-20', 'initial status of vehicle', '520', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('521', '2015-08-20', 'initial status of vehicle', '521', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('522', '2015-08-20', 'initial status of vehicle', '522', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('523', '2015-08-20', 'initial status of vehicle', '523', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('524', '2015-08-20', 'initial status of vehicle', '524', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('525', '2015-08-20', 'initial status of vehicle', '525', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('526', '2015-08-20', 'initial status of vehicle', '526', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('527', '2015-08-20', 'initial status of vehicle', '527', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('528', '2015-08-20', 'initial status of vehicle', '528', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('529', '2015-08-20', 'initial status of vehicle', '529', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('530', '2015-08-20', 'initial status of vehicle', '530', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('531', '2015-08-20', 'initial status of vehicle', '531', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('532', '2015-08-20', 'initial status of vehicle', '532', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('533', '2015-08-20', 'initial status of vehicle', '533', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('534', '2015-08-20', 'initial status of vehicle', '534', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('535', '2015-08-20', 'initial status of vehicle', '535', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('536', '2015-08-20', 'initial status of vehicle', '536', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('537', '2015-08-20', 'initial status of vehicle', '537', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('538', '2015-08-20', 'initial status of vehicle', '538', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('539', '2015-08-20', 'initial status of vehicle', '539', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('540', '2015-08-20', 'initial status of vehicle', '540', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('541', '2015-08-20', 'initial status of vehicle', '541', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('542', '2015-08-20', 'initial status of vehicle', '542', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('543', '2015-08-20', 'initial status of vehicle', '543', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('544', '2015-08-20', 'initial status of vehicle', '544', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('545', '2015-08-20', 'initial status of vehicle', '545', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('546', '2015-08-20', 'initial status of vehicle', '546', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('547', '2015-08-20', 'initial status of vehicle', '547', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('548', '2015-08-20', 'initial status of vehicle', '548', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('549', '2015-08-20', 'initial status of vehicle', '549', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('550', '2015-08-20', 'initial status of vehicle', '550', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('551', '2015-08-20', 'initial status of vehicle', '551', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('552', '2015-08-20', 'initial status of vehicle', '552', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('553', '2015-08-20', 'initial status of vehicle', '553', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('554', '2015-08-20', 'initial status of vehicle', '554', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('555', '2015-08-20', 'initial status of vehicle', '555', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('556', '2015-08-20', 'initial status of vehicle', '556', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('557', '2015-08-20', 'initial status of vehicle', '557', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('558', '2015-08-20', 'initial status of vehicle', '558', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('559', '2015-08-20', 'initial status of vehicle', '559', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('560', '2015-08-20', 'initial status of vehicle', '560', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('561', '2015-08-20', 'initial status of vehicle', '561', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('562', '2015-08-20', 'initial status of vehicle', '562', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('563', '2015-08-20', 'initial status of vehicle', '563', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('564', '2015-08-20', 'initial status of vehicle', '564', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('565', '2015-08-20', 'initial status of vehicle', '565', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('566', '2015-08-20', 'initial status of vehicle', '566', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('567', '2015-08-20', 'initial status of vehicle', '567', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('568', '2015-08-20', 'initial status of vehicle', '568', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('569', '2015-08-20', 'initial status of vehicle', '569', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('570', '2015-08-20', 'initial status of vehicle', '570', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('571', '2015-08-20', 'initial status of vehicle', '571', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('572', '2015-08-20', 'initial status of vehicle', '572', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('573', '2015-08-20', 'initial status of vehicle', '573', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('574', '2015-08-20', 'initial status of vehicle', '574', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('575', '2015-08-20', 'initial status of vehicle', '575', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('576', '2015-08-20', 'initial status of vehicle', '576', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('577', '2015-08-20', 'initial status of vehicle', '577', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('578', '2015-08-20', 'initial status of vehicle', '578', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('579', '2015-08-20', 'initial status of vehicle', '579', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('580', '2015-08-20', 'initial status of vehicle', '580', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('581', '2015-08-20', 'initial status of vehicle', '581', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('582', '2015-08-20', 'initial status of vehicle', '582', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('583', '2015-08-20', 'initial status of vehicle', '583', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('584', '2015-08-20', 'initial status of vehicle', '584', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('585', '2015-08-20', 'initial status of vehicle', '585', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('586', '2015-08-20', 'initial status of vehicle', '586', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('587', '2015-08-20', 'initial status of vehicle', '587', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('588', '2015-08-20', 'initial status of vehicle', '588', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('589', '2015-08-20', 'initial status of vehicle', '589', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('590', '2015-08-20', 'initial status of vehicle', '590', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('591', '2015-08-20', 'initial status of vehicle', '591', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('592', '2015-08-20', 'initial status of vehicle', '592', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('593', '2015-08-20', 'initial status of vehicle', '593', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('594', '2015-08-20', 'initial status of vehicle', '594', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('595', '2015-08-20', 'initial status of vehicle', '595', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('596', '2015-08-20', 'initial status of vehicle', '596', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('597', '2015-08-20', 'initial status of vehicle', '597', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('598', '2015-08-20', 'initial status of vehicle', '598', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('599', '2015-08-20', 'initial status of vehicle', '599', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('600', '2015-08-20', 'initial status of vehicle', '600', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('601', '2015-08-20', 'initial status of vehicle', '601', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('602', '2015-08-20', 'initial status of vehicle', '602', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('603', '2015-08-20', 'initial status of vehicle', '603', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('604', '2015-08-20', 'initial status of vehicle', '604', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('605', '2015-08-20', 'initial status of vehicle', '605', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('606', '2015-08-20', 'initial status of vehicle', '606', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('607', '2015-08-20', 'initial status of vehicle', '607', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('608', '2015-08-20', 'initial status of vehicle', '608', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('609', '2015-08-20', 'initial status of vehicle', '609', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('610', '2015-08-20', 'initial status of vehicle', '610', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('611', '2015-08-20', 'initial status of vehicle', '611', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('612', '2015-08-20', 'initial status of vehicle', '612', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('613', '2015-08-20', 'initial status of vehicle', '613', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('614', '2015-08-20', 'initial status of vehicle', '614', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('615', '2015-08-20', 'initial status of vehicle', '615', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('616', '2015-08-20', 'initial status of vehicle', '616', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('617', '2015-08-20', 'initial status of vehicle', '617', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('618', '2015-08-20', 'initial status of vehicle', '618', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('619', '2015-08-20', 'initial status of vehicle', '619', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('620', '2015-08-20', 'initial status of vehicle', '620', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('621', '2015-08-20', 'initial status of vehicle', '621', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('622', '2015-08-20', 'initial status of vehicle', '622', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('623', '2015-08-20', 'initial status of vehicle', '623', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('624', '2015-08-20', 'initial status of vehicle', '624', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('625', '2015-08-20', 'initial status of vehicle', '625', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('626', '2015-08-20', 'initial status of vehicle', '626', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('627', '2015-08-20', 'initial status of vehicle', '627', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('628', '2015-08-20', 'initial status of vehicle', '628', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('629', '2015-08-20', 'initial status of vehicle', '629', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('630', '2015-08-20', 'initial status of vehicle', '630', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('631', '2015-08-20', 'initial status of vehicle', '631', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('632', '2015-08-20', 'initial status of vehicle', '632', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('633', '2015-08-20', 'initial status of vehicle', '633', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('634', '2015-08-20', 'initial status of vehicle', '634', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('635', '2015-08-20', 'initial status of vehicle', '635', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('636', '2015-08-20', 'initial status of vehicle', '636', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('637', '2015-08-20', 'initial status of vehicle', '637', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('638', '2015-08-20', 'initial status of vehicle', '638', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('639', '2015-08-20', 'initial status of vehicle', '639', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('640', '2015-08-20', 'initial status of vehicle', '640', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('641', '2015-08-20', 'initial status of vehicle', '641', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('642', '2015-08-20', 'initial status of vehicle', '642', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('643', '2015-08-20', 'initial status of vehicle', '643', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('644', '2015-08-20', 'initial status of vehicle', '644', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('645', '2015-08-20', 'initial status of vehicle', '645', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('646', '2015-08-20', 'initial status of vehicle', '646', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('647', '2015-08-20', 'initial status of vehicle', '647', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('648', '2015-08-20', 'initial status of vehicle', '648', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('649', '2015-08-20', 'initial status of vehicle', '649', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('650', '2015-08-20', 'initial status of vehicle', '650', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('651', '2015-08-20', 'initial status of vehicle', '651', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('652', '2015-08-20', 'initial status of vehicle', '652', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('653', '2015-08-20', 'initial status of vehicle', '653', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('654', '2015-08-20', 'initial status of vehicle', '654', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('655', '2015-08-20', 'initial status of vehicle', '655', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('656', '2015-08-20', 'initial status of vehicle', '656', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('657', '2015-08-20', 'initial status of vehicle', '657', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('658', '2015-08-20', 'initial status of vehicle', '658', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('659', '2015-08-20', 'initial status of vehicle', '659', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('660', '2015-08-20', 'initial status of vehicle', '660', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('661', '2015-08-20', 'initial status of vehicle', '661', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('662', '2015-08-20', 'initial status of vehicle', '662', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('663', '2015-08-20', 'initial status of vehicle', '663', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('664', '2015-08-20', 'initial status of vehicle', '664', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('665', '2015-08-20', 'initial status of vehicle', '665', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('666', '2015-08-20', 'initial status of vehicle', '666', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('667', '2015-08-20', 'initial status of vehicle', '667', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('668', '2015-08-20', 'initial status of vehicle', '668', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('669', '2015-08-20', 'initial status of vehicle', '669', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('670', '2015-08-20', 'initial status of vehicle', '670', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('671', '2015-08-20', 'initial status of vehicle', '671', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('672', '2015-08-20', 'initial status of vehicle', '672', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('673', '2015-08-20', 'initial status of vehicle', '673', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('674', '2015-08-20', 'initial status of vehicle', '674', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('675', '2015-08-20', 'initial status of vehicle', '675', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('676', '2015-08-20', 'initial status of vehicle', '676', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('677', '2015-08-20', 'initial status of vehicle', '677', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('678', '2015-08-20', 'initial status of vehicle', '678', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('679', '2015-08-20', 'initial status of vehicle', '679', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('680', '2015-08-20', 'initial status of vehicle', '680', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('681', '2015-08-20', 'initial status of vehicle', '681', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('682', '2015-08-20', 'initial status of vehicle', '682', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('683', '2015-08-20', 'initial status of vehicle', '683', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('684', '2015-08-20', 'initial status of vehicle', '684', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('685', '2015-08-20', 'initial status of vehicle', '685', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('686', '2015-08-20', 'initial status of vehicle', '686', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('687', '2015-08-20', 'initial status of vehicle', '687', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('688', '2015-08-20', 'initial status of vehicle', '688', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('689', '2015-08-20', 'initial status of vehicle', '689', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('690', '2015-08-20', 'initial status of vehicle', '690', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('691', '2015-08-20', 'initial status of vehicle', '691', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('692', '2015-08-20', 'initial status of vehicle', '692', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('693', '2015-08-20', 'initial status of vehicle', '693', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('694', '2015-08-20', 'initial status of vehicle', '694', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('695', '2015-08-20', 'initial status of vehicle', '695', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('696', '2015-08-20', 'initial status of vehicle', '696', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('697', '2015-08-20', 'initial status of vehicle', '697', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('698', '2015-08-20', 'initial status of vehicle', '698', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('699', '2015-08-20', 'initial status of vehicle', '699', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('700', '2015-08-20', 'initial status of vehicle', '700', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('701', '2015-08-20', 'initial status of vehicle', '701', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('702', '2015-08-20', 'initial status of vehicle', '702', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('703', '2015-08-20', 'initial status of vehicle', '703', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('704', '2015-08-20', 'initial status of vehicle', '704', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('705', '2015-08-20', 'initial status of vehicle', '705', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('706', '2015-08-20', 'initial status of vehicle', '706', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('707', '2015-08-20', 'initial status of vehicle', '707', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('708', '2015-08-20', 'initial status of vehicle', '708', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('709', '2015-08-20', 'initial status of vehicle', '709', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('710', '2015-08-20', 'initial status of vehicle', '710', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('711', '2015-08-20', 'initial status of vehicle', '711', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('712', '2015-08-20', 'initial status of vehicle', '712', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('713', '2015-08-20', 'initial status of vehicle', '713', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('714', '2015-08-20', 'initial status of vehicle', '714', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('715', '2015-08-20', 'initial status of vehicle', '715', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('716', '2015-08-20', 'initial status of vehicle', '716', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('717', '2015-08-20', 'initial status of vehicle', '717', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('718', '2015-08-20', 'initial status of vehicle', '718', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('719', '2015-08-20', 'initial status of vehicle', '719', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('720', '2015-08-20', 'initial status of vehicle', '720', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('721', '2015-08-20', 'initial status of vehicle', '721', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('722', '2015-08-20', 'initial status of vehicle', '722', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('723', '2015-08-20', 'initial status of vehicle', '723', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('724', '2015-08-20', 'initial status of vehicle', '724', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('725', '2015-08-20', 'initial status of vehicle', '725', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('726', '2015-08-20', 'initial status of vehicle', '726', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('727', '2015-08-20', 'initial status of vehicle', '727', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('728', '2015-08-20', 'initial status of vehicle', '728', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('729', '2015-08-20', 'initial status of vehicle', '729', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('730', '2015-08-20', 'initial status of vehicle', '730', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('731', '2015-08-20', 'initial status of vehicle', '731', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('732', '2015-08-20', 'initial status of vehicle', '732', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('733', '2015-08-20', 'initial status of vehicle', '733', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('734', '2015-08-20', 'initial status of vehicle', '734', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('735', '2015-08-20', 'initial status of vehicle', '735', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('736', '2015-08-20', 'initial status of vehicle', '736', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('737', '2015-08-20', 'initial status of vehicle', '737', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('738', '2015-08-20', 'initial status of vehicle', '738', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('739', '2015-08-20', 'initial status of vehicle', '739', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('740', '2015-08-20', 'initial status of vehicle', '740', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('741', '2015-08-20', 'initial status of vehicle', '741', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('742', '2015-08-20', 'initial status of vehicle', '742', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('743', '2015-08-20', 'initial status of vehicle', '743', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('744', '2015-08-20', 'initial status of vehicle', '744', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('745', '2015-08-20', 'initial status of vehicle', '745', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('746', '2015-08-20', 'initial status of vehicle', '746', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('747', '2015-08-20', 'initial status of vehicle', '747', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('748', '2015-08-20', 'initial status of vehicle', '748', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('749', '2015-08-20', 'initial status of vehicle', '749', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('750', '2015-08-20', 'initial status of vehicle', '750', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('751', '2015-08-20', 'initial status of vehicle', '751', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('752', '2015-08-20', 'initial status of vehicle', '752', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('753', '2015-08-20', 'initial status of vehicle', '753', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('754', '2015-08-20', 'initial status of vehicle', '754', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('755', '2015-08-20', 'initial status of vehicle', '755', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('756', '2015-08-20', 'initial status of vehicle', '756', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('757', '2015-08-20', 'initial status of vehicle', '757', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('758', '2015-08-20', 'initial status of vehicle', '758', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('759', '2015-08-20', 'initial status of vehicle', '759', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('760', '2015-08-20', 'initial status of vehicle', '760', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('761', '2015-08-20', 'initial status of vehicle', '761', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('762', '2015-08-20', 'initial status of vehicle', '762', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('763', '2015-08-20', 'initial status of vehicle', '763', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('764', '2015-08-31', 'ssss', '2', '1', '1', 'Done', 'sss', 'ss');
INSERT INTO `vehicle_modification` VALUES('765', '2015-09-16', 'initial status of vehicle', '764', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('766', '2015-09-16', 'initial status of vehicle', '765', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('767', '2015-09-28', 'initial status of vehicle', '766', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('768', '2015-10-05', 'initial status of vehicle', '767', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('769', '2015-10-05', 'initial status of vehicle', '768', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('770', '2015-10-05', 'initial status of vehicle', '769', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('771', '2015-10-05', 'initial status of vehicle', '770', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('772', '2015-10-05', 'initial status of vehicle', '771', '0', '0', 'Default', '', '-');
INSERT INTO `vehicle_modification` VALUES('773', '2015-11-27', 'initial status of vehicle', '772', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('774', '2015-11-30', 'initial status of vehicle', '774', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('775', '2015-12-16', 'initial status of vehicle', '775', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('776', '2015-12-18', 'initial status of vehicle', '776', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('777', '2015-12-18', 'initial status of vehicle', '778', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('778', '2016-01-25', 'initial status of vehicle', '779', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('779', '2016-01-27', 'initial status of vehicle', '780', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('780', '2016-02-08', 'initial status of vehicle', '781', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('782', '2016-02-23', 'new Arrival', '781', '1', '1', 'Done', 'full option', '');
INSERT INTO `vehicle_modification` VALUES('783', '2016-04-27', 'initial status of vehicle', '782', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('784', '2016-08-30', 'initial status of vehicle', '783', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('785', '2018-06-18', 'initial status of vehicle', '784', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('786', '2018-06-19', 'initial status of vehicle', '5', '0', '0', 'Default', '', '');
INSERT INTO `vehicle_modification` VALUES('787', '2018-06-19', 'initial status of vehicle', '785', '0', '0', 'Default', '', '');


-- Dumping structure for table: `vehicle_other`

DROP TABLE IF EXISTS `vehicle_other`;
CREATE TABLE `vehicle_other` (
  `vh_cost_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) NOT NULL,
  `vh_cif_val` double DEFAULT NULL,
  `foreign_rate` double DEFAULT NULL COMMENT 'currency conversion rate',
  `import_date` date DEFAULT NULL,
  `vh_import_duty` double DEFAULT NULL,
  `vh_clearing_charge` double DEFAULT NULL,
  `tax_nbt` double DEFAULT NULL,
  `tot_cost` double DEFAULT NULL,
  `sold_price` double DEFAULT NULL,
  `sold_date` date DEFAULT NULL,
  `cus_id` int(11) DEFAULT '0',
  `vh_reg_num` varchar(12) DEFAULT NULL,
  `vh_purchase_type` varchar(12) DEFAULT NULL COMMENT 'exchange/purchase',
  PRIMARY KEY (`vh_cost_id`),
  KEY `fk_vehicle_amount_Vehicle1_idx` (`vh_id`),
  CONSTRAINT `fk_vehicle_amount_Vehicle1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



-- Dumping data for table: vehicle_other

INSERT INTO `vehicle_other` VALUES('1', '4', '', '234', '2016-01-04', '34242', '323', '4232', '23424', '3223400', '2016-01-25', '0', '', '324242');


-- Dumping structure for table: `vehicle_photo`

DROP TABLE IF EXISTS `vehicle_photo`;
CREATE TABLE `vehicle_photo` (
  `ph_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) NOT NULL,
  `p_title` varchar(45) DEFAULT NULL,
  `p_desc` varchar(100) DEFAULT '',
  `file_1` varchar(45) DEFAULT NULL,
  `file_2` varchar(45) DEFAULT NULL,
  `file_3` varchar(45) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `p_visible` int(1) DEFAULT NULL,
  `p_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`ph_id`),
  KEY `fk_vehicle_photo_Vehicle1_idx` (`vh_id`) USING BTREE,
  CONSTRAINT `vehicle_photo_ibfk_1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8;



-- Dumping data for table: vehicle_photo

INSERT INTO `vehicle_photo` VALUES('1', '1', '', '', 'L_1879693642_1.jpg', 'M_1879693642_1.jpg', 'S_1879693642_1.jpg', '2015-08-13', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('2', '1', '', '', 'L_7382466159_1.jpg', 'M_7382466159_1.jpg', 'S_7382466159_1.jpg', '2015-08-13', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('3', '1', '', '', 'L_3421782860_1.jpg', 'M_3421782860_1.jpg', 'S_3421782860_1.jpg', '2015-08-13', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('4', '1', '', '', 'L_9844476352_1.jpg', 'M_9844476352_1.jpg', 'S_9844476352_1.jpg', '2015-08-13', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('8', '12', '', '', 'L_1365931630_12.jpg', 'M_1365931630_12.jpg', 'S_1365931630_12.jpg', '2015-08-13', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('9', '12', '', '', 'L_3808659454_12.jpg', 'M_3808659454_12.jpg', 'S_3808659454_12.jpg', '2015-08-13', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('10', '12', '', '', 'L_6149808769_12.jpg', 'M_6149808769_12.jpg', 'S_6149808769_12.jpg', '2015-08-13', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('11', '13', '', '', 'L_3138420353_13.jpg', 'M_3138420353_13.jpg', 'S_3138420353_13.jpg', '2015-08-14', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('12', '13', '', '', 'L_7399603114_13.jpg', 'M_7399603114_13.jpg', 'S_7399603114_13.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('13', '13', '', '', 'L_1133956313_13.jpg', 'M_1133956313_13.jpg', 'S_1133956313_13.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('14', '13', '', '', 'L_7332014003_13.jpg', 'M_7332014003_13.jpg', 'S_7332014003_13.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('15', '14', '', '', 'L_431512421_14.jpg', 'M_431512421_14.jpg', 'S_431512421_14.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('16', '14', '', '', 'L_1554263229_14.jpg', 'M_1554263229_14.jpg', 'S_1554263229_14.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('17', '14', '', '', 'L_4387857853_14.jpg', 'M_4387857853_14.jpg', 'S_4387857853_14.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('18', '14', '', '', 'L_8923653145_14.jpg', 'M_8923653145_14.jpg', 'S_8923653145_14.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('19', '16', '', '', 'L_3292048275_16.jpg', 'M_3292048275_16.jpg', 'S_3292048275_16.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('20', '16', '', '', 'L_9471694971_16.jpg', 'M_9471694971_16.jpg', 'S_9471694971_16.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('21', '16', '', '', 'L_9939078520_16.jpg', 'M_9939078520_16.jpg', 'S_9939078520_16.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('22', '16', '', '', 'L_316198258_16.jpg', 'M_316198258_16.jpg', 'S_316198258_16.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('23', '19', '', '', 'L_9843425243_19.jpg', 'M_9843425243_19.jpg', 'S_9843425243_19.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('24', '19', '', '', 'L_280272574_19.jpg', 'M_280272574_19.jpg', 'S_280272574_19.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('25', '19', '', '', 'L_8149634632_19.jpg', 'M_8149634632_19.jpg', 'S_8149634632_19.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('26', '19', '', '', 'L_4962866543_19.jpg', 'M_4962866543_19.jpg', 'S_4962866543_19.jpg', '2015-08-14', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('27', '6', '', '', 'L_9027864770_6.JPG', 'M_9027864770_6.JPG', 'S_9027864770_6.JPG', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('28', '6', '', '', 'L_7793073249_6.JPG', 'M_7793073249_6.JPG', 'S_7793073249_6.JPG', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('29', '6', '', '', 'L_5464837243_6.JPG', 'M_5464837243_6.JPG', 'S_5464837243_6.JPG', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('30', '22', '', '', 'L_6829963331_22.jpg', 'M_6829963331_22.jpg', 'S_6829963331_22.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('31', '22', '', '', 'L_9218707261_22.jpg', 'M_9218707261_22.jpg', 'S_9218707261_22.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('32', '22', '', '', 'L_3541860920_22.jpg', 'M_3541860920_22.jpg', 'S_3541860920_22.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('33', '22', '', '', 'L_1566947498_22.jpg', 'M_1566947498_22.jpg', 'S_1566947498_22.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('34', '29', '', '', 'L_9476932082_29.jpg', 'M_9476932082_29.jpg', 'S_9476932082_29.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('35', '29', '', '', 'L_1963728303_29.jpg', 'M_1963728303_29.jpg', 'S_1963728303_29.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('36', '29', '', '', 'L_5102547560_29.jpg', 'M_5102547560_29.jpg', 'S_5102547560_29.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('37', '29', '', '', 'L_5874801995_29.jpg', 'M_5874801995_29.jpg', 'S_5874801995_29.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('38', '30', '', '', 'L_5788210444_30.jpg', 'M_5788210444_30.jpg', 'S_5788210444_30.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('39', '30', '', '', 'L_4364777728_30.jpg', 'M_4364777728_30.jpg', 'S_4364777728_30.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('40', '30', '', '', 'L_9722573636_30.jpg', 'M_9722573636_30.jpg', 'S_9722573636_30.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('41', '30', '', '', 'L_8278672974_30.jpg', 'M_8278672974_30.jpg', 'S_8278672974_30.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('42', '31', '', '', 'L_7265359768_31.jpg', 'M_7265359768_31.jpg', 'S_7265359768_31.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('43', '31', '', '', 'L_5496363695_31.jpg', 'M_5496363695_31.jpg', 'S_5496363695_31.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('44', '31', '', '', 'L_690010688_31.jpg', 'M_690010688_31.jpg', 'S_690010688_31.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('45', '31', '', '', 'L_1901988205_31.jpg', 'M_1901988205_31.jpg', 'S_1901988205_31.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('46', '32', '', '', 'L_183558310_32.jpg', 'M_183558310_32.jpg', 'S_183558310_32.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('47', '32', '', '', 'L_5819430411_32.jpg', 'M_5819430411_32.jpg', 'S_5819430411_32.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('48', '32', '', '', 'L_548623646_32.jpg', 'M_548623646_32.jpg', 'S_548623646_32.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('49', '32', '', '', 'L_6306740390_32.jpg', 'M_6306740390_32.jpg', 'S_6306740390_32.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('62', '33', '', '', 'L_175142991_33.jpg', 'M_175142991_33.jpg', 'S_175142991_33.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('63', '33', '', '', 'L_6193913090_33.jpg', 'M_6193913090_33.jpg', 'S_6193913090_33.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('64', '33', '', '', 'L_6704373103_33.jpg', 'M_6704373103_33.jpg', 'S_6704373103_33.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('65', '33', '', '', 'L_3274113149_33.jpg', 'M_3274113149_33.jpg', 'S_3274113149_33.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('70', '34', '', '', 'L_8888488397_34.jpg', 'M_8888488397_34.jpg', 'S_8888488397_34.jpg', '2015-08-15', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('71', '34', '', '', 'L_8514674240_34.jpg', 'M_8514674240_34.jpg', 'S_8514674240_34.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('72', '34', '', '', 'L_2144644283_34.jpg', 'M_2144644283_34.jpg', 'S_2144644283_34.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('73', '34', '', '', 'L_8193364799_34.jpg', 'M_8193364799_34.jpg', 'S_8193364799_34.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('74', '35', '', '', 'L_9541378342_35.jpg', 'M_9541378342_35.jpg', 'S_9541378342_35.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('75', '35', '', '', 'L_1926930998_35.jpg', 'M_1926930998_35.jpg', 'S_1926930998_35.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('76', '35', '', '', 'L_4621450081_35.jpg', 'M_4621450081_35.jpg', 'S_4621450081_35.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('77', '35', '', '', 'L_6368550811_35.jpg', 'M_6368550811_35.jpg', 'S_6368550811_35.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('78', '36', '', '', 'L_7640940663_36.jpg', 'M_7640940663_36.jpg', 'S_7640940663_36.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('79', '36', '', '', 'L_5737456600_36.jpg', 'M_5737456600_36.jpg', 'S_5737456600_36.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('80', '36', '', '', 'L_5311865345_36.jpg', 'M_5311865345_36.jpg', 'S_5311865345_36.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('81', '36', '', '', 'L_4963126941_36.jpg', 'M_4963126941_36.jpg', 'S_4963126941_36.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('86', '37', '', '', 'L_6908864537_37.jpg', 'M_6908864537_37.jpg', 'S_6908864537_37.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('87', '37', '', '', 'L_1064412528_37.jpg', 'M_1064412528_37.jpg', 'S_1064412528_37.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('88', '37', '', '', 'L_3492529173_37.jpg', 'M_3492529173_37.jpg', 'S_3492529173_37.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('89', '37', '', '', 'L_405980087_37.jpg', 'M_405980087_37.jpg', 'S_405980087_37.jpg', '2015-08-15', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('90', '38', '', '', 'L_1732237865_38.jpg', 'M_1732237865_38.jpg', 'S_1732237865_38.jpg', '2015-08-19', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('91', '38', '', '', 'L_9094819170_38.jpg', 'M_9094819170_38.jpg', 'S_9094819170_38.jpg', '2015-08-19', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('92', '38', '', '', 'L_8064388907_38.jpg', 'M_8064388907_38.jpg', 'S_8064388907_38.jpg', '2015-08-19', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('93', '38', '', '', 'L_8378768456_38.jpg', 'M_8378768456_38.jpg', 'S_8378768456_38.jpg', '2015-08-19', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('94', '39', '', '', 'L_7258255910_39.jpg', 'M_7258255910_39.jpg', 'S_7258255910_39.jpg', '2015-08-19', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('95', '39', '', '', 'L_7052057920_39.jpg', 'M_7052057920_39.jpg', 'S_7052057920_39.jpg', '2015-08-19', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('96', '39', '', '', 'L_5242674886_39.jpg', 'M_5242674886_39.jpg', 'S_5242674886_39.jpg', '2015-08-19', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('97', '39', '', '', 'L_6868050405_39.jpg', 'M_6868050405_39.jpg', 'S_6868050405_39.jpg', '2015-08-19', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('98', '58', '', '', 'L_5676622367_58.jpg', 'M_5676622367_58.jpg', 'S_5676622367_58.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('99', '58', '', '', 'L_2683041449_58.jpg', 'M_2683041449_58.jpg', 'S_2683041449_58.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('100', '58', '', '', 'L_6540777673_58.jpg', 'M_6540777673_58.jpg', 'S_6540777673_58.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('101', '58', '', '', 'L_4595793779_58.jpg', 'M_4595793779_58.jpg', 'S_4595793779_58.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('102', '59', '', '', 'L_9590514111_59.jpg', 'M_9590514111_59.jpg', 'S_9590514111_59.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('103', '59', '', '', 'L_9893035832_59.jpg', 'M_9893035832_59.jpg', 'S_9893035832_59.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('104', '59', '', '', 'L_503570688_59.jpg', 'M_503570688_59.jpg', 'S_503570688_59.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('106', '59', '', '', 'L_3159893765_59.jpg', 'M_3159893765_59.jpg', 'S_3159893765_59.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('107', '59', '', '', 'L_5057624196_59.jpg', 'M_5057624196_59.jpg', 'S_5057624196_59.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('108', '59', '', '', 'L_1793630733_59.jpg', 'M_1793630733_59.jpg', 'S_1793630733_59.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('109', '59', '', '', 'L_8905347194_59.jpg', 'M_8905347194_59.jpg', 'S_8905347194_59.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('110', '59', '', '', 'L_4510627202_59.jpg', 'M_4510627202_59.jpg', 'S_4510627202_59.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('111', '59', '', '', 'L_805481490_59.jpg', 'M_805481490_59.jpg', 'S_805481490_59.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('112', '60', '', '', 'L_4418408111_60.jpg', 'M_4418408111_60.jpg', 'S_4418408111_60.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('113', '60', '', '', 'L_7875756099_60.jpg', 'M_7875756099_60.jpg', 'S_7875756099_60.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('114', '60', '', '', 'L_6406774832_60.jpg', 'M_6406774832_60.jpg', 'S_6406774832_60.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('115', '60', '', '', 'L_8891150215_60.jpg', 'M_8891150215_60.jpg', 'S_8891150215_60.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('116', '60', '', '', 'L_2915605409_60.jpg', 'M_2915605409_60.jpg', 'S_2915605409_60.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('117', '61', '', '', 'L_6294204513_61.jpg', 'M_6294204513_61.jpg', 'S_6294204513_61.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('118', '61', '', '', 'L_7833134625_61.jpg', 'M_7833134625_61.jpg', 'S_7833134625_61.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('119', '61', '', '', 'L_4645599639_61.jpg', 'M_4645599639_61.jpg', 'S_4645599639_61.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('120', '61', '', '', 'L_8341182325_61.jpg', 'M_8341182325_61.jpg', 'S_8341182325_61.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('125', '62', '', '', 'L_1668859375_62.jpg', 'M_1668859375_62.jpg', 'S_1668859375_62.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('126', '62', '', '', 'L_3556013503_62.jpg', 'M_3556013503_62.jpg', 'S_3556013503_62.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('127', '62', '', '', 'L_3367168288_62.jpg', 'M_3367168288_62.jpg', 'S_3367168288_62.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('128', '62', '', '', 'L_866251885_62.jpg', 'M_866251885_62.jpg', 'S_866251885_62.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('129', '63', '', '', 'L_7140648374_63.jpg', 'M_7140648374_63.jpg', 'S_7140648374_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('130', '63', '', '', 'L_4486491619_63.jpg', 'M_4486491619_63.jpg', 'S_4486491619_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('131', '63', '', '', 'L_9043239918_63.jpg', 'M_9043239918_63.jpg', 'S_9043239918_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('132', '63', '', '', 'L_7047094805_63.jpg', 'M_7047094805_63.jpg', 'S_7047094805_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('133', '63', '', '', 'L_5496372934_63.jpg', 'M_5496372934_63.jpg', 'S_5496372934_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('134', '63', '', '', 'L_8447714229_63.jpg', 'M_8447714229_63.jpg', 'S_8447714229_63.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('135', '63', '', '', 'L_2691354309_63.jpg', 'M_2691354309_63.jpg', 'S_2691354309_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('136', '63', '', '', 'L_7575227590_63.jpg', 'M_7575227590_63.jpg', 'S_7575227590_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('137', '63', '', '', 'L_1424326053_63.jpg', 'M_1424326053_63.jpg', 'S_1424326053_63.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('138', '763', '', '', 'L_6460057827_763.png', 'M_6460057827_763.png', 'S_6460057827_763.png', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('139', '743', '', '', 'L_8351530907_743.jpg', 'M_8351530907_743.jpg', 'S_8351530907_743.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('140', '743', '', '', 'L_7947446610_743.jpg', 'M_7947446610_743.jpg', 'S_7947446610_743.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('141', '743', '', '', 'L_9230381003_743.jpg', 'M_9230381003_743.jpg', 'S_9230381003_743.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('142', '762', '', '', 'L_7972400314_762.jpg', 'M_7972400314_762.jpg', 'S_7972400314_762.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('143', '762', '', '', 'L_9623781316_762.jpg', 'M_9623781316_762.jpg', 'S_9623781316_762.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('144', '762', '', '', 'L_1730542294_762.jpg', 'M_1730542294_762.jpg', 'S_1730542294_762.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('145', '762', '', '', 'L_7964059971_762.png', 'M_7964059971_762.png', 'S_7964059971_762.png', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('146', '761', '', '', 'L_7444198508_761.jpg', 'M_7444198508_761.jpg', 'S_7444198508_761.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('147', '761', '', '', 'L_3163901381_761.jpg', 'M_3163901381_761.jpg', 'S_3163901381_761.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('148', '761', '', '', 'L_2249858351_761.jpg', 'M_2249858351_761.jpg', 'S_2249858351_761.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('149', '761', '', '', 'L_1176946419_761.jpg', 'M_1176946419_761.jpg', 'S_1176946419_761.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('150', '761', '', '', 'L_5166485896_761.png', 'M_5166485896_761.png', 'S_5166485896_761.png', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('151', '761', '', '', 'L_900620836_761.png', 'M_900620836_761.png', 'S_900620836_761.png', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('152', '760', '', '', 'L_1263105063_760.jpg', 'M_1263105063_760.jpg', 'S_1263105063_760.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('153', '760', '', '', 'L_3601774945_760.jpg', 'M_3601774945_760.jpg', 'S_3601774945_760.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('156', '760', '', '', 'L_1694624163_760.jpg', 'M_1694624163_760.jpg', 'S_1694624163_760.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('159', '760', '', '', 'L_4400523165_760.jpg', 'M_4400523165_760.jpg', 'S_4400523165_760.jpg', '2015-08-20', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('164', '750', '', '', 'L_7371980901_750.jpg', 'M_7371980901_750.jpg', 'S_7371980901_750.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('165', '750', '', '', 'L_4187971260_750.jpg', 'M_4187971260_750.jpg', 'S_4187971260_750.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('166', '750', '', '', 'L_6088136746_750.jpg', 'M_6088136746_750.jpg', 'S_6088136746_750.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('167', '750', '', '', 'L_373394750_750.jpg', 'M_373394750_750.jpg', 'S_373394750_750.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('168', '749', '', '', 'L_1503717023_749.jpg', 'M_1503717023_749.jpg', 'S_1503717023_749.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('169', '749', '', '', 'L_5090700234_749.jpg', 'M_5090700234_749.jpg', 'S_5090700234_749.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('170', '749', '', '', 'L_4433203283_749.jpg', 'M_4433203283_749.jpg', 'S_4433203283_749.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('171', '749', '', '', 'L_99794608_749.jpg', 'M_99794608_749.jpg', 'S_99794608_749.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('172', '748', '', '', 'L_5282828342_748.jpg', 'M_5282828342_748.jpg', 'S_5282828342_748.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('173', '748', '', '', 'L_4385407590_748.jpg', 'M_4385407590_748.jpg', 'S_4385407590_748.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('174', '748', '', '', 'L_4419707804_748.jpg', 'M_4419707804_748.jpg', 'S_4419707804_748.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('175', '748', '', '', 'L_5623503746_748.jpg', 'M_5623503746_748.jpg', 'S_5623503746_748.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('176', '747', '', '', 'L_522646396_747.jpg', 'M_522646396_747.jpg', 'S_522646396_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('177', '747', '', '', 'L_4154042894_747.jpg', 'M_4154042894_747.jpg', 'S_4154042894_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('178', '747', '', '', 'L_5486233541_747.jpg', 'M_5486233541_747.jpg', 'S_5486233541_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('179', '747', '', '', 'L_1471501914_747.jpg', 'M_1471501914_747.jpg', 'S_1471501914_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('180', '747', '', '', 'L_5587235763_747.jpg', 'M_5587235763_747.jpg', 'S_5587235763_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('181', '747', '', '', 'L_1071925624_747.jpg', 'M_1071925624_747.jpg', 'S_1071925624_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('182', '747', '', '', 'L_8134922245_747.jpg', 'M_8134922245_747.jpg', 'S_8134922245_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('183', '747', '', '', 'L_3286906043_747.jpg', 'M_3286906043_747.jpg', 'S_3286906043_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('184', '747', '', '', 'L_3706829934_747.jpg', 'M_3706829934_747.jpg', 'S_3706829934_747.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('185', '746', '', '', 'L_824975627_746.jpg', 'M_824975627_746.jpg', 'S_824975627_746.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('186', '746', '', '', 'L_487890588_746.jpg', 'M_487890588_746.jpg', 'S_487890588_746.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('187', '746', '', '', 'L_3520994042_746.jpg', 'M_3520994042_746.jpg', 'S_3520994042_746.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('188', '746', '', '', 'L_2996379029_746.jpg', 'M_2996379029_746.jpg', 'S_2996379029_746.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('189', '745', '', '', 'L_1527372277_745.jpg', 'M_1527372277_745.jpg', 'S_1527372277_745.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('190', '745', '', '', 'L_2926561483_745.jpg', 'M_2926561483_745.jpg', 'S_2926561483_745.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('191', '745', '', '', 'L_6250885506_745.jpg', 'M_6250885506_745.jpg', 'S_6250885506_745.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('192', '745', '', '', 'L_194286098_745.jpg', 'M_194286098_745.jpg', 'S_194286098_745.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('193', '745', '', '', 'L_216483389_745.png', 'M_216483389_745.png', 'S_216483389_745.png', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('194', '745', '', '', 'L_3232378535_745.jpg', 'M_3232378535_745.jpg', 'S_3232378535_745.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('195', '745', '', '', 'L_8206371413_745.jpg', 'M_8206371413_745.jpg', 'S_8206371413_745.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('196', '745', '', '', 'L_8570839501_745.jpg', 'M_8570839501_745.jpg', 'S_8570839501_745.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('197', '744', '', '', 'L_788017911_744.jpg', 'M_788017911_744.jpg', 'S_788017911_744.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('198', '744', '', '', 'L_930834258_744.jpg', 'M_930834258_744.jpg', 'S_930834258_744.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('199', '744', '', '', 'L_4659559149_744.jpg', 'M_4659559149_744.jpg', 'S_4659559149_744.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('200', '744', '', '', 'L_5942600793_744.png', 'M_5942600793_744.png', 'S_5942600793_744.png', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('201', '742', '', '', 'L_3647596854_742.jpg', 'M_3647596854_742.jpg', 'S_3647596854_742.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('202', '742', '', '', 'L_311333839_742.jpg', 'M_311333839_742.jpg', 'S_311333839_742.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('203', '742', '', '', 'L_4163264669_742.jpg', 'M_4163264669_742.jpg', 'S_4163264669_742.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('204', '742', '', '', 'L_1867618341_742.jpg', 'M_1867618341_742.jpg', 'S_1867618341_742.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('205', '742', '', '', 'L_5433256407_742.jpg', 'M_5433256407_742.jpg', 'S_5433256407_742.jpg', '2015-08-20', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('206', '731', '', '', 'L_6942639565_731.jpg', 'M_6942639565_731.jpg', 'S_6942639565_731.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('207', '731', '', '', 'L_7428803159_731.jpg', 'M_7428803159_731.jpg', 'S_7428803159_731.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('208', '731', '', '', 'L_5799354305_731.jpg', 'M_5799354305_731.jpg', 'S_5799354305_731.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('209', '731', '', '', 'L_7885131561_731.jpg', 'M_7885131561_731.jpg', 'S_7885131561_731.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('210', '719', '', '', 'L_8585734730_719.jpg', 'M_8585734730_719.jpg', 'S_8585734730_719.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('211', '719', '', '', 'L_2278178567_719.jpg', 'M_2278178567_719.jpg', 'S_2278178567_719.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('212', '719', '', '', 'L_3433506940_719.png', 'M_3433506940_719.png', 'S_3433506940_719.png', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('213', '719', '', '', 'L_8017117087_719.jpg', 'M_8017117087_719.jpg', 'S_8017117087_719.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('214', '718', '', '', 'L_6477406527_718.jpg', 'M_6477406527_718.jpg', 'S_6477406527_718.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('215', '718', '', '', 'L_2896501659_718.jpg', 'M_2896501659_718.jpg', 'S_2896501659_718.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('216', '718', '', '', 'L_8569943793_718.png', 'M_8569943793_718.png', 'S_8569943793_718.png', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('217', '718', '', '', 'L_1490299575_718.jpg', 'M_1490299575_718.jpg', 'S_1490299575_718.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('218', '717', '', '', 'L_1589771071_717.jpg', 'M_1589771071_717.jpg', 'S_1589771071_717.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('219', '717', '', '', 'L_6870037885_717.jpg', 'M_6870037885_717.jpg', 'S_6870037885_717.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('220', '717', '', '', 'L_5472769257_717.png', 'M_5472769257_717.png', 'S_5472769257_717.png', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('221', '717', '', '', 'L_8435108168_717.jpg', 'M_8435108168_717.jpg', 'S_8435108168_717.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('222', '716', '', '', 'L_3788228714_716.jpg', 'M_3788228714_716.jpg', 'S_3788228714_716.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('223', '716', '', '', 'L_9766133842_716.jpg', 'M_9766133842_716.jpg', 'S_9766133842_716.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('224', '716', '', '', 'L_3698948677_716.jpg', 'M_3698948677_716.jpg', 'S_3698948677_716.jpg', '2015-08-22', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('225', '553', '', '', 'L_5479120756_553.jpg', 'M_5479120756_553.jpg', 'S_5479120756_553.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('226', '553', '', '', 'L_6472003492_553.jpg', 'M_6472003492_553.jpg', 'S_6472003492_553.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('227', '553', '', '', 'L_9296158785_553.jpg', 'M_9296158785_553.jpg', 'S_9296158785_553.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('228', '553', '', '', 'L_980285466_553.jpg', 'M_980285466_553.jpg', 'S_980285466_553.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('229', '411', '', '', 'L_3259341041_411.jpg', 'M_3259341041_411.jpg', 'S_3259341041_411.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('230', '411', '', '', 'L_496269930_411.jpg', 'M_496269930_411.jpg', 'S_496269930_411.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('231', '411', '', '', 'L_8479503993_411.jpg', 'M_8479503993_411.jpg', 'S_8479503993_411.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('232', '411', '', '', 'L_8102010260_411.jpg', 'M_8102010260_411.jpg', 'S_8102010260_411.jpg', '2015-08-24', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('233', '602', '', '', 'L_5463764672_602.jpg', 'M_5463764672_602.jpg', 'S_5463764672_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('234', '602', '', '', 'L_7602233793_602.jpg', 'M_7602233793_602.jpg', 'S_7602233793_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('235', '602', '', '', 'L_6499862903_602.jpg', 'M_6499862903_602.jpg', 'S_6499862903_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('236', '602', '', '', 'L_5883795460_602.jpg', 'M_5883795460_602.jpg', 'S_5883795460_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('237', '602', '', '', 'L_8747966685_602.jpg', 'M_8747966685_602.jpg', 'S_8747966685_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('238', '602', '', '', 'L_8114145523_602.jpg', 'M_8114145523_602.jpg', 'S_8114145523_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('239', '602', '', '', 'L_9384148269_602.jpg', 'M_9384148269_602.jpg', 'S_9384148269_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('240', '602', '', '', 'L_7173908972_602.jpg', 'M_7173908972_602.jpg', 'S_7173908972_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('241', '602', '', '', 'L_4475226700_602.jpg', 'M_4475226700_602.jpg', 'S_4475226700_602.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('242', '642', '', '', 'L_1159799247_642.jpg', 'M_1159799247_642.jpg', 'S_1159799247_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('243', '642', '', '', 'L_6296523818_642.jpg', 'M_6296523818_642.jpg', 'S_6296523818_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('244', '642', '', '', 'L_9692981098_642.jpg', 'M_9692981098_642.jpg', 'S_9692981098_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('245', '642', '', '', 'L_3163742055_642.jpg', 'M_3163742055_642.jpg', 'S_3163742055_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('246', '642', '', '', 'L_6049961945_642.jpg', 'M_6049961945_642.jpg', 'S_6049961945_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('247', '642', '', '', 'L_6371771218_642.jpg', 'M_6371771218_642.jpg', 'S_6371771218_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('248', '642', '', '', 'L_4416083642_642.jpg', 'M_4416083642_642.jpg', 'S_4416083642_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('249', '642', '', '', 'L_3492779326_642.jpg', 'M_3492779326_642.jpg', 'S_3492779326_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('250', '642', '', '', 'L_5495311566_642.jpg', 'M_5495311566_642.jpg', 'S_5495311566_642.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('251', '604', '', '', 'L_9025380699_604.jpg', 'M_9025380699_604.jpg', 'S_9025380699_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('252', '604', '', '', 'L_4155642883_604.jpg', 'M_4155642883_604.jpg', 'S_4155642883_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('253', '604', '', '', 'L_1180953187_604.jpg', 'M_1180953187_604.jpg', 'S_1180953187_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('254', '604', '', '', 'L_2446946934_604.jpg', 'M_2446946934_604.jpg', 'S_2446946934_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('255', '604', '', '', 'L_8570847059_604.jpg', 'M_8570847059_604.jpg', 'S_8570847059_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('256', '604', '', '', 'L_8853454315_604.jpg', 'M_8853454315_604.jpg', 'S_8853454315_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('257', '604', '', '', 'L_8479627901_604.jpg', 'M_8479627901_604.jpg', 'S_8479627901_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('258', '604', '', '', 'L_740866605_604.jpg', 'M_740866605_604.jpg', 'S_740866605_604.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('259', '679', '', '', 'L_4552696407_679.jpg', 'M_4552696407_679.jpg', 'S_4552696407_679.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('260', '679', '', '', 'L_9865860287_679.jpg', 'M_9865860287_679.jpg', 'S_9865860287_679.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('261', '679', '', '', 'L_914304465_679.jpg', 'M_914304465_679.jpg', 'S_914304465_679.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('262', '679', '', '', 'L_8195108920_679.jpg', 'M_8195108920_679.jpg', 'S_8195108920_679.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('263', '677', '', '', 'L_3820337438_677.jpg', 'M_3820337438_677.jpg', 'S_3820337438_677.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('264', '677', '', '', 'L_2315333099_677.jpg', 'M_2315333099_677.jpg', 'S_2315333099_677.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('265', '677', '', '', 'L_7504343702_677.jpg', 'M_7504343702_677.jpg', 'S_7504343702_677.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('266', '677', '', '', 'L_2762245968_677.jpg', 'M_2762245968_677.jpg', 'S_2762245968_677.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('274', '532', '', '', 'L_3799562952_532.jpg', 'M_3799562952_532.jpg', 'S_3799562952_532.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('275', '532', '', '', 'L_9269911786_532.jpg', 'M_9269911786_532.jpg', 'S_9269911786_532.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('276', '532', '', '', 'L_5080582983_532.jpg', 'M_5080582983_532.jpg', 'S_5080582983_532.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('277', '532', '', '', 'L_3071199348_532.jpg', 'M_3071199348_532.jpg', 'S_3071199348_532.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('278', '538', '', '', 'L_1707795481_538.jpg', 'M_1707795481_538.jpg', 'S_1707795481_538.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('279', '538', '', '', 'L_1148741175_538.jpg', 'M_1148741175_538.jpg', 'S_1148741175_538.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('280', '538', '', '', 'L_5772849484_538.jpg', 'M_5772849484_538.jpg', 'S_5772849484_538.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('281', '538', '', '', 'L_6700512724_538.jpg', 'M_6700512724_538.jpg', 'S_6700512724_538.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('282', '538', '', '', 'L_358121320_538.jpg', 'M_358121320_538.jpg', 'S_358121320_538.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('283', '538', '', '', 'L_6525961169_538.jpg', 'M_6525961169_538.jpg', 'S_6525961169_538.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('284', '538', '', '', 'L_7732354360_538.jpg', 'M_7732354360_538.jpg', 'S_7732354360_538.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('285', '404', '', '', 'L_9579310491_404.jpg', 'M_9579310491_404.jpg', 'S_9579310491_404.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('286', '404', '', '', 'L_789826172_404.jpg', 'M_789826172_404.jpg', 'S_789826172_404.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('287', '404', '', '', 'L_805496932_404.jpg', 'M_805496932_404.jpg', 'S_805496932_404.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('289', '613', '', '', 'L_7126087169_613.jpg', 'M_7126087169_613.jpg', 'S_7126087169_613.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('290', '613', '', '', 'L_1777661191_613.jpg', 'M_1777661191_613.jpg', 'S_1777661191_613.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('291', '613', '', '', 'L_3687051660_613.jpg', 'M_3687051660_613.jpg', 'S_3687051660_613.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('292', '699', '', '', 'L_4523785235_699.jpg', 'M_4523785235_699.jpg', 'S_4523785235_699.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('293', '699', '', '', 'L_973402466_699.jpg', 'M_973402466_699.jpg', 'S_973402466_699.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('294', '699', '', '', 'L_4962982772_699.jpg', 'M_4962982772_699.jpg', 'S_4962982772_699.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('296', '702', '', '', 'L_1133491424_702.jpg', 'M_1133491424_702.jpg', 'S_1133491424_702.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('297', '702', '', '', 'L_7167923618_702.jpg', 'M_7167923618_702.jpg', 'S_7167923618_702.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('298', '702', '', '', 'L_1201771493_702.jpg', 'M_1201771493_702.jpg', 'S_1201771493_702.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('299', '702', '', '', 'L_194817665_702.jpg', 'M_194817665_702.jpg', 'S_194817665_702.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('305', '665', '', '', 'L_8944361815_665.jpg', 'M_8944361815_665.jpg', 'S_8944361815_665.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('306', '665', '', '', 'L_3787688221_665.jpg', 'M_3787688221_665.jpg', 'S_3787688221_665.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('308', '665', '', '', 'L_3009655992_665.jpg', 'M_3009655992_665.jpg', 'S_3009655992_665.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('309', '665', '', '', 'L_3953090761_665.jpg', 'M_3953090761_665.jpg', 'S_3953090761_665.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('310', '680', '', '', 'L_5288572772_680.jpg', 'M_5288572772_680.jpg', 'S_5288572772_680.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('311', '680', '', '', 'L_9593435958_680.jpg', 'M_9593435958_680.jpg', 'S_9593435958_680.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('312', '680', '', '', 'L_4570229430_680.jpg', 'M_4570229430_680.jpg', 'S_4570229430_680.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('313', '680', '', '', 'L_5018361127_680.jpg', 'M_5018361127_680.jpg', 'S_5018361127_680.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('318', '699', '', '', 'L_3197318483_699.jpg', 'M_3197318483_699.jpg', 'S_3197318483_699.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('319', '691', '', '', 'L_8655536114_691.jpg', 'M_8655536114_691.jpg', 'S_8655536114_691.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('320', '691', '', '', 'L_3987698988_691.jpg', 'M_3987698988_691.jpg', 'S_3987698988_691.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('322', '691', '', '', 'L_8903545113_691.jpg', 'M_8903545113_691.jpg', 'S_8903545113_691.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('323', '691', '', '', 'L_3573655681_691.jpg', 'M_3573655681_691.jpg', 'S_3573655681_691.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('324', '723', '', '', 'L_1191918347_723.jpg', 'M_1191918347_723.jpg', 'S_1191918347_723.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('325', '723', '', '', 'L_160008999_723.jpg', 'M_160008999_723.jpg', 'S_160008999_723.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('326', '723', '', '', 'L_8850405151_723.jpg', 'M_8850405151_723.jpg', 'S_8850405151_723.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('327', '723', '', '', 'L_3277016105_723.jpg', 'M_3277016105_723.jpg', 'S_3277016105_723.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('328', '723', '', '', 'L_1142547219_723.jpg', 'M_1142547219_723.jpg', 'S_1142547219_723.jpg', '2015-08-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('329', '713', '', '', 'L_7821930409_713.jpg', 'M_7821930409_713.jpg', 'S_7821930409_713.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('330', '713', '', '', 'L_9923777808_713.jpg', 'M_9923777808_713.jpg', 'S_9923777808_713.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('331', '713', '', '', 'L_7708743242_713.jpg', 'M_7708743242_713.jpg', 'S_7708743242_713.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('332', '713', '', '', 'L_2355224378_713.jpg', 'M_2355224378_713.jpg', 'S_2355224378_713.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('334', '492', '', '', 'L_3532518935_492.jpg', 'M_3532518935_492.jpg', 'S_3532518935_492.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('335', '492', '', '', 'L_164659367_492.jpg', 'M_164659367_492.jpg', 'S_164659367_492.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('336', '492', '', '', 'L_843328693_492.jpg', 'M_843328693_492.jpg', 'S_843328693_492.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('337', '492', '', '', 'L_3918116101_492.jpg', 'M_3918116101_492.jpg', 'S_3918116101_492.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('338', '543', '', '', 'L_7233655042_543.jpg', 'M_7233655042_543.jpg', 'S_7233655042_543.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('340', '543', '', '', 'L_9443506225_543.jpg', 'M_9443506225_543.jpg', 'S_9443506225_543.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('341', '543', '', '', 'L_1893630614_543.jpg', 'M_1893630614_543.jpg', 'S_1893630614_543.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('342', '543', '', '', 'L_7828136319_543.jpg', 'M_7828136319_543.jpg', 'S_7828136319_543.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('343', '498', '', '', 'L_9408945511_498.jpg', 'M_9408945511_498.jpg', 'S_9408945511_498.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('344', '498', '', '', 'L_1688437224_498.jpg', 'M_1688437224_498.jpg', 'S_1688437224_498.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('345', '498', '', '', 'L_5774353542_498.jpg', 'M_5774353542_498.jpg', 'S_5774353542_498.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('346', '498', '', '', 'L_908929798_498.jpg', 'M_908929798_498.jpg', 'S_908929798_498.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('347', '613', '', '', 'L_9032183252_613.jpg', 'M_9032183252_613.jpg', 'S_9032183252_613.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('348', '733', '', '', 'L_8691306496_733.jpg', 'M_8691306496_733.jpg', 'S_8691306496_733.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('349', '733', '', '', 'L_3619882240_733.jpg', 'M_3619882240_733.jpg', 'S_3619882240_733.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('350', '733', '', '', 'L_5049275304_733.jpg', 'M_5049275304_733.jpg', 'S_5049275304_733.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('351', '733', '', '', 'L_7425233861_733.jpg', 'M_7425233861_733.jpg', 'S_7425233861_733.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('352', '661', '', '', 'L_7422506678_661.jpg', 'M_7422506678_661.jpg', 'S_7422506678_661.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('353', '661', '', '', 'L_7674450278_661.jpg', 'M_7674450278_661.jpg', 'S_7674450278_661.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('354', '661', '', '', 'L_8499530446_661.jpg', 'M_8499530446_661.jpg', 'S_8499530446_661.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('355', '661', '', '', 'L_6563206468_661.jpg', 'M_6563206468_661.jpg', 'S_6563206468_661.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('356', '728', '', '', 'L_5226976796_728.jpg', 'M_5226976796_728.jpg', 'S_5226976796_728.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('357', '728', '', '', 'L_20791515_728.jpg', 'M_20791515_728.jpg', 'S_20791515_728.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('358', '728', '', '', 'L_9074457967_728.jpg', 'M_9074457967_728.jpg', 'S_9074457967_728.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('359', '728', '', '', 'L_5785402287_728.jpg', 'M_5785402287_728.jpg', 'S_5785402287_728.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('360', '727', '', '', 'L_3963124896_727.jpg', 'M_3963124896_727.jpg', 'S_3963124896_727.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('361', '727', '', '', 'L_8865018072_727.jpg', 'M_8865018072_727.jpg', 'S_8865018072_727.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('362', '727', '', '', 'L_24735461_727.jpg', 'M_24735461_727.jpg', 'S_24735461_727.jpg', '2015-08-28', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('363', '727', '', '', 'L_2400838835_727.jpg', 'M_2400838835_727.jpg', 'S_2400838835_727.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('364', '729', '', '', 'L_3697078716_729.jpg', 'M_3697078716_729.jpg', 'S_3697078716_729.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('365', '729', '', '', 'L_1891299346_729.jpg', 'M_1891299346_729.jpg', 'S_1891299346_729.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('366', '729', '', '', 'L_6703610112_729.jpg', 'M_6703610112_729.jpg', 'S_6703610112_729.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('367', '729', '', '', 'L_1929640439_729.jpg', 'M_1929640439_729.jpg', 'S_1929640439_729.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('368', '730', '', '', 'L_2697594859_730.jpg', 'M_2697594859_730.jpg', 'S_2697594859_730.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('369', '730', '', '', 'L_9016661560_730.jpg', 'M_9016661560_730.jpg', 'S_9016661560_730.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('370', '730', '', '', 'L_9547070530_730.jpg', 'M_9547070530_730.jpg', 'S_9547070530_730.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('371', '730', '', '', 'L_4550105324_730.jpg', 'M_4550105324_730.jpg', 'S_4550105324_730.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('372', '734', '', '', 'L_8838942134_734.jpg', 'M_8838942134_734.jpg', 'S_8838942134_734.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('373', '734', '', '', 'L_8033978724_734.jpg', 'M_8033978724_734.jpg', 'S_8033978724_734.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('374', '734', '', '', 'L_2297396752_734.jpg', 'M_2297396752_734.jpg', 'S_2297396752_734.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('375', '734', '', '', 'L_9179061837_734.jpg', 'M_9179061837_734.jpg', 'S_9179061837_734.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('376', '735', '', '', 'L_3665498211_735.jpg', 'M_3665498211_735.jpg', 'S_3665498211_735.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('377', '735', '', '', 'L_8104050722_735.jpg', 'M_8104050722_735.jpg', 'S_8104050722_735.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('378', '735', '', '', 'L_490181213_735.jpg', 'M_490181213_735.jpg', 'S_490181213_735.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('379', '735', '', '', 'L_6012445394_735.jpg', 'M_6012445394_735.jpg', 'S_6012445394_735.jpg', '2015-08-28', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('380', '715', '', '', 'L_165638285_715.jpg', 'M_165638285_715.jpg', 'S_165638285_715.jpg', '2015-09-07', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('381', '715', '', '', 'L_2703827628_715.jpg', 'M_2703827628_715.jpg', 'S_2703827628_715.jpg', '2015-09-07', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('382', '715', '', '', 'L_4871968124_715.jpg', 'M_4871968124_715.jpg', 'S_4871968124_715.jpg', '2015-09-07', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('383', '712', '', '', 'L_8571690013_712.jpg', 'M_8571690013_712.jpg', 'S_8571690013_712.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('384', '712', '', '', 'L_1793505204_712.jpg', 'M_1793505204_712.jpg', 'S_1793505204_712.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('385', '712', '', '', 'L_3699775766_712.jpg', 'M_3699775766_712.jpg', 'S_3699775766_712.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('386', '712', '', '', 'L_4389818790_712.jpg', 'M_4389818790_712.jpg', 'S_4389818790_712.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('387', '711', '', '', 'L_1571729439_711.jpg', 'M_1571729439_711.jpg', 'S_1571729439_711.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('388', '711', '', '', 'L_9445691085_711.jpg', 'M_9445691085_711.jpg', 'S_9445691085_711.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('389', '711', '', '', 'L_9944925359_711.jpg', 'M_9944925359_711.jpg', 'S_9944925359_711.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('390', '711', '', '', 'L_6624336899_711.jpg', 'M_6624336899_711.jpg', 'S_6624336899_711.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('391', '710', '', '', 'L_8108048234_710.jpg', 'M_8108048234_710.jpg', 'S_8108048234_710.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('392', '710', '', '', 'L_8556944681_710.jpg', 'M_8556944681_710.jpg', 'S_8556944681_710.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('393', '710', '', '', 'L_6848950549_710.jpg', 'M_6848950549_710.jpg', 'S_6848950549_710.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('394', '710', '', '', 'L_7112469775_710.jpg', 'M_7112469775_710.jpg', 'S_7112469775_710.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('395', '709', '', '', 'L_2156492155_709.jpg', 'M_2156492155_709.jpg', 'S_2156492155_709.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('396', '709', '', '', 'L_6191764469_709.jpg', 'M_6191764469_709.jpg', 'S_6191764469_709.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('397', '709', '', '', 'L_6984138684_709.jpg', 'M_6984138684_709.jpg', 'S_6984138684_709.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('398', '709', '', '', 'L_471428553_709.jpg', 'M_471428553_709.jpg', 'S_471428553_709.jpg', '2015-09-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('399', '772', '', '', 'L_760500670_772.jpg', 'M_760500670_772.jpg', 'S_760500670_772.jpg', '2015-11-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('400', '772', '', '', 'L_914941732_772.jpg', 'M_914941732_772.jpg', 'S_914941732_772.jpg', '2015-11-27', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('401', '772', '', '', 'L_894329509_772.jpg', 'M_894329509_772.jpg', 'S_894329509_772.jpg', '2015-11-27', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('402', '758', '', '', 'L_968946618_758.jpg', 'M_968946618_758.jpg', 'S_968946618_758.jpg', '2015-11-30', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('403', '755', '', '', 'L_270411713_755.jpg', 'M_270411713_755.jpg', 'S_270411713_755.jpg', '2015-11-30', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('405', '782', '', '', 'L_147168691_782.jpg', 'M_147168691_782.jpg', 'S_147168691_782.jpg', '2016-04-27', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('406', '782', '', '', 'L_33521757_782.jpg', 'M_33521757_782.jpg', 'S_33521757_782.jpg', '2016-04-27', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('407', '782', '', '', 'L_946354933_782.jpg', 'M_946354933_782.jpg', 'S_946354933_782.jpg', '2016-04-27', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('420', '783', '', '', 'L_1210397943_783.jpg', 'M_1210397943_783.jpg', 'S_1210397943_783.jpg', '2017-10-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('421', '783', '', '', 'L_623487478_783.jpg', 'M_623487478_783.jpg', 'S_623487478_783.jpg', '2017-10-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('422', '783', '', '', 'L_1138706995_783.jpg', 'M_1138706995_783.jpg', 'S_1138706995_783.jpg', '2017-10-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('423', '783', '', '', 'L_961114834_783.jpg', 'M_961114834_783.jpg', 'S_961114834_783.jpg', '2017-10-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('424', '783', '', '', 'L_312152541_783.png', 'M_312152541_783.png', 'S_312152541_783.png', '2017-10-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('425', '783', '', '', 'L_271315380_783.jpg', 'M_271315380_783.jpg', 'S_271315380_783.jpg', '2017-10-09', '1', '1', '1');
INSERT INTO `vehicle_photo` VALUES('428', '785', '', '', 'L_550849831_785.JPG', 'M_550849831_785.JPG', 'S_550849831_785.JPG', '2018-06-19', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('436', '7', '', '', 'L_534411691_7.JPG', 'M_534411691_7.JPG', 'S_534411691_7.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('437', '7', '', '', 'L_727064976_7.JPG', 'M_727064976_7.JPG', 'S_727064976_7.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('438', '7', '', '', 'L_817646875_7.JPG', 'M_817646875_7.JPG', 'S_817646875_7.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('439', '9', '', '', 'L_366071363_9.JPG', 'M_366071363_9.JPG', 'S_366071363_9.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('440', '9', '', '', 'L_446067444_9.JPG', 'M_446067444_9.JPG', 'S_446067444_9.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('441', '9', '', '', 'L_901903103_9.JPG', 'M_901903103_9.JPG', 'S_901903103_9.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('442', '9', '', '', 'L_1389926534_9.JPG', 'M_1389926534_9.JPG', 'S_1389926534_9.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('443', '9', '', '', 'L_891833666_9.JPG', 'M_891833666_9.JPG', 'S_891833666_9.JPG', '2018-06-21', '1', '0', '1');
INSERT INTO `vehicle_photo` VALUES('444', '9', '', '', 'L_865196993_9.JPG', 'M_865196993_9.JPG', 'S_865196993_9.JPG', '2018-06-21', '1', '0', '1');


-- Dumping structure for table: `vh_clearing`

DROP TABLE IF EXISTS `vh_clearing`;
CREATE TABLE `vh_clearing` (
  `clr_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) NOT NULL DEFAULT '0',
  `shipped_date` date DEFAULT NULL,
  `clr_group` varchar(20) DEFAULT NULL,
  `vh_marks_invoice` varchar(20) DEFAULT NULL,
  `coordinator` varchar(45) DEFAULT NULL,
  `driver_name` varchar(45) DEFAULT NULL,
  `vessel` varchar(45) DEFAULT NULL,
  `refunds` decimal(10,2) DEFAULT NULL,
  `clr_st` int(2) DEFAULT NULL COMMENT 'clearing = 3 /  cleared =4',
  `clr_status` varchar(45) DEFAULT NULL COMMENT 'custom status entered by user',
  `arrival_date` date DEFAULT NULL,
  `document_status` varchar(45) DEFAULT NULL,
  `to_clr_agent` date DEFAULT NULL,
  `duty` decimal(10,2) DEFAULT NULL,
  `payorder_by` varchar(45) DEFAULT NULL,
  `insurance` decimal(10,2) DEFAULT NULL,
  `clr_date` date DEFAULT NULL,
  `transport_method` varchar(45) DEFAULT NULL COMMENT 'driver/carrier/customer',
  `transporter_name` varchar(100) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `lc_no` varchar(45) DEFAULT NULL,
  `lc_currency` varchar(45) DEFAULT NULL,
  `lc_amount` decimal(10,2) DEFAULT NULL,
  `lc_bank` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`clr_id`,`vh_id`),
  UNIQUE KEY `vh_id_UNIQUE` (`vh_id`) USING BTREE,
  KEY `fk_vh_clearing_Vehicle1_idx` (`vh_id`) USING BTREE,
  KEY `clr_id` (`clr_id`),
  CONSTRAINT `vh_clearing_ibfk_1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;



-- Dumping data for table: vh_clearing

INSERT INTO `vh_clearing` VALUES('4', '5', '2015-12-14', '', '', '', 'Buddika', 'uss steer', '66546.00', '', '3', '2015-12-14', ' fadfaf', '2015-12-14', '1454.00', '', '', '2015-12-14', '', '654644', '', '41564', '', '', '');
INSERT INTO `vh_clearing` VALUES('5', '4', '2015-12-14', '', '', '', 'udara', 'uss moltoz', '4564.00', '', '4', '2015-12-22', ' fadfaffafafafafafa', '2015-12-14', '14543322.00', '', '', '2015-12-14', '', '0', '', '65000', '', '', '');
INSERT INTO `vh_clearing` VALUES('9', '19', '2015-05-21', '', '', '', 'kumara', 'USS Tokyo', '34343.00', '', '3', '2015-12-15', 'fdafafafdaf', '2016-02-11', '65023.50', '', '', '2016-02-29', '', 'Miura International (pvt) ltd', '', '34245', '', '', '');
INSERT INTO `vh_clearing` VALUES('10', '14', '0000-00-00', '', '', '', 'fdafafda', 'fdafda', '42424.00', '', '', '2016-01-13', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('16', '43', '2016-01-13', '', '', '', 'fafdaa', '', '0.00', '', '', '0000-00-00', '', '0000-00-00', '0.00', '', '', '0000-00-00', '', '0', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('17', '21', '2016-01-13', '', '', '', '', '', '0.00', '', '4', '2016-01-13', ' ', '2016-01-13', '0.00', '', '', '2016-01-13', '', '0', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('18', '33', '2016-01-15', '', '', '', 'dfadfafa', '', '0.00', '', '', '0000-00-00', '', '0000-00-00', '0.00', '', '', '0000-00-00', '', '0', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('20', '23', '2016-01-13', '', '', '', 'fdaf', '', '0.00', '', '4', '2016-01-13', ' ', '2016-01-13', '0.00', '', '', '2016-01-13', '', '0', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('23', '34', '', '', '', '', '', '', '50000.00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('24', '35', '2016-01-07', '', '', '', '', 'dfadafdf', '50000.00', '', '4', '2016-01-21', 'this is the document status fdafafafafafafafa', '2016-01-29', '1314654.00', '', '', '2016-01-03', '', 'Miura', '', '212', '', '', '');
INSERT INTO `vh_clearing` VALUES('25', '36', '2016-01-21', '', '', '', 'fdfa', '', '50000.00', '', '4', '2016-01-21', '', '2016-01-21', '3244.00', '', '', '2016-03-30', '', '0', '', '4412', '', '', '');
INSERT INTO `vh_clearing` VALUES('29', '30', '2016-01-14', '', '', '', '', 'fadadf', '54454.00', '', '4', '2016-01-21', 'fddfaafafa', '2016-01-21', '32421.00', '', '', '2016-01-12', '', 'Miura', '', '342', '', '', '');
INSERT INTO `vh_clearing` VALUES('35', '37', '2016-01-18', '', '', '', 'Kumara', 'USS Oclohoma', '12311.00', '', '4', '2016-01-27', 'Submitted', '2016-03-23', '423423.00', '', '', '2016-03-14', '', 'Miura', '', '1223', '', '', '');
INSERT INTO `vh_clearing` VALUES('43', '171', '2016-01-19', '', '', '', '', 'uss nagoya', '51.00', '', '4', '2016-01-19', ' ', '2016-01-19', '0.00', '', '', '2016-01-19', '', '0', '', '1265', '', '', '');
INSERT INTO `vh_clearing` VALUES('44', '275', '2015-12-09', '', '', '', 'Buddika', 'adffaf', '324242.00', '', '4', '2016-01-29', ' ', '2016-01-19', '0.00', '', '', '2016-01-19', '', '0', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('45', '29', '2016-01-19', '', '', '', 'Buddika', '', '0.00', '', '4', '2016-01-19', ' ', '2016-01-19', '0.00', '', '', '2016-01-19', '', '0', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('46', '205', '2016-01-19', '', '', '', 'ffafa', '', '0.00', '', '4', '2016-01-19', ' ', '2016-01-19', '0.00', '', '', '2016-01-19', '', '0', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('63', '32', '2016-01-19', '', '', '', 'yusi', '', '0.00', '', '4', '2016-01-19', ' ', '2016-01-19', '0.00', '', '', '2016-01-19', '', 'Jagath', '', '1454', '', '', '');
INSERT INTO `vh_clearing` VALUES('64', '13', '2016-02-19', '', '', '', 'fafaf', 'fdafadf', '0.00', '', '', '0000-00-00', '', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('68', '16', '2016-02-11', '', '', '', 'kumara', 'uss ama', '212.00', '', '', '0000-00-00', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('74', '1', '2016-02-27', '', '', '', 'Buddika', 'fafda', '0.00', '', '4', '2016-02-27', ' fafaffaf afdafaffafaf', '2016-02-25', '3111.00', '', '', '2016-03-09', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('78', '22', '2015-05-21', '', '', '', 'Buddika', 'Tokyo Cruise', '34343.00', '', '3', '2015-12-14', 'Not submitted', '2016-03-10', '65023.00', '', '', '2016-03-21', '', 'Miura International (Pvt) Ltd', '', '64165', '', '', '');
INSERT INTO `vh_clearing` VALUES('79', '780', '2015-05-24', '', '', '', 'Kumara', 'USS nagoya', '12455.00', '', '3', '2016-03-16', 'received', '2016-03-18', '546654.00', '', '', '2016-03-08', '', 'Miura', '', '545556', '', '', '');
INSERT INTO `vh_clearing` VALUES('81', '781', '2016-03-10', '', '', '', '', 'MISISIPI', '544545.00', '', '4', '2016-03-23', ' Not Submitted', '2016-03-09', '562000.00', '', '', '2016-03-07', '', 'Miura', '', '12354', '', '', '');
INSERT INTO `vh_clearing` VALUES('82', '47', '2016-03-05', '', '', '', 'Imal', 'IMAL SHIP', '45446.00', '', '4', '2016-03-08', ' submt', '2016-03-10', '45648.00', '', '', '2016-03-19', '', 'Miura', '', '4564', '', '', '');
INSERT INTO `vh_clearing` VALUES('83', '48', '2016-03-16', '', '', '', 'Saman', '', '99999999.99', '', '3', '0000-00-00', ' ', '0000-00-00', '99999999.99', '', '', '2016-03-15', '', 'Internaitonal Shipihj', '', '5649', '', '', '');
INSERT INTO `vh_clearing` VALUES('84', '49', '2016-03-17', '', '', '', 'Santhush', 'USS Toyoka', '1233.00', '', '3', '2016-03-17', ' Submitted to customer', '2016-03-09', '321.00', '', '', '2016-03-13', '', 'Ocean Shiping', '', '3255515', '', '', '');
INSERT INTO `vh_clearing` VALUES('85', '2', '2016-03-17', '', '', '', 'Kamal', '', '2342434.00', '', '3', '2016-03-23', ' none status', '2016-03-24', '213421.00', '', '', '2016-03-22', '', '', '', '342', '', '', '');
INSERT INTO `vh_clearing` VALUES('86', '55', '2016-04-20', '', '', '', 'Buddika', 'USS MISISIPI', '1589220.00', '', '3', '2016-04-20', ' pending docs', '0000-00-00', '25620.00', '', '', '2016-04-28', '', 'Miura International (Pvt) Ltd', '', '1542', '', '', '');
INSERT INTO `vh_clearing` VALUES('87', '56', '2016-04-09', '', '', '', 'Buddika', 'IMALE', '52145.00', '', '3', '2016-04-12', ' ', '0000-00-00', '256800.00', '', '', '2016-04-13', '', 'SMOOTH', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('88', '779', '2016-04-07', '', '', '', 'Buddika', '', '0.00', '', '', '2016-04-13', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('91', '778', '2016-04-19', '', '', '', 'Buddika', 'USS Imoji', '0.00', '', '', '2016-04-20', ' ', '0000-00-00', '650000.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('95', '774', '2016-04-22', '', '', '', 'Kamal', 'USS OSAKA', '5000.00', '', '3', '2016-04-21', ' ', '2016-04-09', '6564654.00', '', '', '2016-04-16', '', 'MIura', '', '1454', '', '', '');
INSERT INTO `vh_clearing` VALUES('96', '776', '2016-04-19', '', '', '', 'Kamal', '26520', '25000.00', '', '4', '2016-04-20', ' ', '2016-04-22', '54644.00', '', '', '2016-04-19', '', 'Miura International (Pvt) Ltd', '', '123456789123456789', '', '', '');
INSERT INTO `vh_clearing` VALUES('97', '769', '2016-04-19', '', '', '', 'Buddika', '', '0.00', '', '3', '0000-00-00', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('98', '768', '2016-04-01', '', '', '', 'Buddika', '', '0.00', '', '3', '0000-00-00', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('99', '770', '2016-04-01', '', '', '', 'Buddika', '', '0.00', '', '3', '0000-00-00', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('102', '767', '2016-04-26', '', '', '', 'Buddika', 'fdfddffdfddf', '2323.00', '', '', '0000-00-00', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `vh_clearing` VALUES('105', '764', '2016-04-29', '', '', '', 'Buddika', 'USS NAGASAKI', '50000.00', '', '3', '2016-04-15', ' ddd', '2016-04-22', '560000.00', '', '', '2016-04-23', '', 'Miura', '', '4564', '', '', '');
INSERT INTO `vh_clearing` VALUES('108', '766', '2016-04-13', '', '', '', 'Kamal', '', '0.00', '', '3', '0000-00-00', ' ', '0000-00-00', '0.00', '', '', '0000-00-00', '', '', '', '', '', '', '');


-- Dumping structure for table: `vh_features`

DROP TABLE IF EXISTS `vh_features`;
CREATE TABLE `vh_features` (
  `vh_ft_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) NOT NULL,
  `vh_ft_syscode` int(11) DEFAULT NULL,
  `ft_status` int(2) DEFAULT '0',
  PRIMARY KEY (`vh_ft_id`),
  UNIQUE KEY `unique_index` (`vh_id`,`vh_ft_syscode`),
  KEY `fk_vh_features_Vehicle1_idx` (`vh_id`) USING BTREE,
  KEY `vh_ft_syscode` (`vh_ft_syscode`) USING BTREE,
  CONSTRAINT `vh_features_ibfk_1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vh_features_ibfk_2` FOREIGN KEY (`vh_ft_syscode`) REFERENCES `syscode` (`sys_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8;



-- Dumping data for table: vh_features

INSERT INTO `vh_features` VALUES('1', '650', '30', '1');
INSERT INTO `vh_features` VALUES('9', '747', '29', '1');
INSERT INTO `vh_features` VALUES('10', '747', '31', '1');
INSERT INTO `vh_features` VALUES('13', '747', '30', '1');
INSERT INTO `vh_features` VALUES('17', '747', '43', '1');
INSERT INTO `vh_features` VALUES('18', '747', '46', '1');
INSERT INTO `vh_features` VALUES('23', '640', '31', '1');
INSERT INTO `vh_features` VALUES('24', '640', '30', '1');
INSERT INTO `vh_features` VALUES('29', '640', '38', '1');
INSERT INTO `vh_features` VALUES('30', '640', '41', '1');
INSERT INTO `vh_features` VALUES('31', '640', '44', '1');
INSERT INTO `vh_features` VALUES('40', '640', '40', '1');
INSERT INTO `vh_features` VALUES('42', '640', '43', '1');
INSERT INTO `vh_features` VALUES('44', '640', '46', '1');
INSERT INTO `vh_features` VALUES('45', '772', '35', '1');
INSERT INTO `vh_features` VALUES('46', '772', '39', '1');
INSERT INTO `vh_features` VALUES('47', '745', '29', '1');
INSERT INTO `vh_features` VALUES('48', '745', '31', '1');
INSERT INTO `vh_features` VALUES('49', '745', '30', '1');
INSERT INTO `vh_features` VALUES('88', '747', '41', '1');
INSERT INTO `vh_features` VALUES('90', '747', '44', '1');
INSERT INTO `vh_features` VALUES('92', '747', '47', '1');
INSERT INTO `vh_features` VALUES('93', '747', '52', '1');
INSERT INTO `vh_features` VALUES('94', '747', '55', '1');
INSERT INTO `vh_features` VALUES('95', '747', '56', '1');
INSERT INTO `vh_features` VALUES('96', '747', '57', '1');
INSERT INTO `vh_features` VALUES('97', '747', '58', '1');
INSERT INTO `vh_features` VALUES('98', '747', '59', '1');
INSERT INTO `vh_features` VALUES('99', '747', '60', '1');
INSERT INTO `vh_features` VALUES('100', '747', '62', '1');
INSERT INTO `vh_features` VALUES('101', '747', '63', '1');
INSERT INTO `vh_features` VALUES('102', '747', '66', '1');
INSERT INTO `vh_features` VALUES('103', '747', '67', '1');
INSERT INTO `vh_features` VALUES('110', '745', '38', '1');
INSERT INTO `vh_features` VALUES('111', '745', '39', '1');
INSERT INTO `vh_features` VALUES('112', '745', '40', '1');
INSERT INTO `vh_features` VALUES('113', '745', '49', '1');
INSERT INTO `vh_features` VALUES('114', '745', '56', '1');
INSERT INTO `vh_features` VALUES('115', '745', '60', '1');
INSERT INTO `vh_features` VALUES('116', '745', '63', '1');
INSERT INTO `vh_features` VALUES('117', '745', '64', '1');
INSERT INTO `vh_features` VALUES('118', '745', '67', '1');
INSERT INTO `vh_features` VALUES('119', '694', '29', '1');
INSERT INTO `vh_features` VALUES('120', '694', '32', '1');
INSERT INTO `vh_features` VALUES('121', '694', '34', '1');
INSERT INTO `vh_features` VALUES('122', '694', '37', '1');
INSERT INTO `vh_features` VALUES('123', '694', '40', '1');
INSERT INTO `vh_features` VALUES('124', '694', '43', '1');
INSERT INTO `vh_features` VALUES('125', '694', '44', '1');
INSERT INTO `vh_features` VALUES('126', '694', '46', '1');
INSERT INTO `vh_features` VALUES('127', '694', '47', '1');
INSERT INTO `vh_features` VALUES('128', '694', '49', '1');
INSERT INTO `vh_features` VALUES('129', '694', '51', '1');
INSERT INTO `vh_features` VALUES('130', '694', '52', '1');
INSERT INTO `vh_features` VALUES('131', '694', '54', '1');
INSERT INTO `vh_features` VALUES('132', '694', '55', '1');
INSERT INTO `vh_features` VALUES('133', '694', '58', '1');
INSERT INTO `vh_features` VALUES('134', '694', '60', '1');
INSERT INTO `vh_features` VALUES('135', '694', '62', '1');
INSERT INTO `vh_features` VALUES('136', '694', '63', '1');
INSERT INTO `vh_features` VALUES('137', '694', '66', '1');
INSERT INTO `vh_features` VALUES('139', '694', '30', '1');
INSERT INTO `vh_features` VALUES('140', '774', '31', '1');
INSERT INTO `vh_features` VALUES('141', '774', '33', '1');
INSERT INTO `vh_features` VALUES('142', '774', '34', '1');
INSERT INTO `vh_features` VALUES('143', '774', '35', '1');
INSERT INTO `vh_features` VALUES('144', '774', '36', '1');
INSERT INTO `vh_features` VALUES('145', '774', '39', '1');
INSERT INTO `vh_features` VALUES('146', '774', '40', '1');
INSERT INTO `vh_features` VALUES('147', '774', '42', '1');
INSERT INTO `vh_features` VALUES('148', '774', '43', '1');
INSERT INTO `vh_features` VALUES('149', '774', '45', '1');
INSERT INTO `vh_features` VALUES('150', '774', '46', '1');
INSERT INTO `vh_features` VALUES('151', '774', '49', '1');
INSERT INTO `vh_features` VALUES('152', '774', '52', '1');
INSERT INTO `vh_features` VALUES('153', '774', '55', '1');
INSERT INTO `vh_features` VALUES('154', '774', '58', '1');
INSERT INTO `vh_features` VALUES('155', '774', '61', '1');
INSERT INTO `vh_features` VALUES('156', '774', '64', '1');
INSERT INTO `vh_features` VALUES('157', '774', '67', '1');
INSERT INTO `vh_features` VALUES('258', '778', '39', '1');
INSERT INTO `vh_features` VALUES('259', '778', '40', '1');
INSERT INTO `vh_features` VALUES('260', '778', '45', '1');
INSERT INTO `vh_features` VALUES('261', '778', '48', '1');
INSERT INTO `vh_features` VALUES('262', '778', '50', '1');
INSERT INTO `vh_features` VALUES('263', '778', '51', '1');
INSERT INTO `vh_features` VALUES('264', '778', '52', '1');
INSERT INTO `vh_features` VALUES('265', '778', '53', '1');
INSERT INTO `vh_features` VALUES('266', '778', '54', '1');
INSERT INTO `vh_features` VALUES('267', '778', '56', '1');
INSERT INTO `vh_features` VALUES('268', '778', '63', '1');
INSERT INTO `vh_features` VALUES('269', '778', '65', '1');
INSERT INTO `vh_features` VALUES('270', '778', '66', '1');
INSERT INTO `vh_features` VALUES('271', '776', '29', '1');
INSERT INTO `vh_features` VALUES('272', '776', '33', '1');
INSERT INTO `vh_features` VALUES('273', '776', '36', '1');
INSERT INTO `vh_features` VALUES('274', '776', '38', '1');
INSERT INTO `vh_features` VALUES('275', '776', '39', '1');
INSERT INTO `vh_features` VALUES('276', '776', '40', '1');
INSERT INTO `vh_features` VALUES('277', '776', '41', '1');
INSERT INTO `vh_features` VALUES('278', '776', '43', '1');
INSERT INTO `vh_features` VALUES('279', '776', '62', '1');
INSERT INTO `vh_features` VALUES('280', '776', '63', '1');
INSERT INTO `vh_features` VALUES('281', '776', '65', '1');
INSERT INTO `vh_features` VALUES('282', '776', '66', '1');
INSERT INTO `vh_features` VALUES('392', '772', '30', '1');
INSERT INTO `vh_features` VALUES('393', '772', '34', '1');
INSERT INTO `vh_features` VALUES('433', '775', '29', '1');
INSERT INTO `vh_features` VALUES('434', '775', '31', '1');
INSERT INTO `vh_features` VALUES('435', '775', '33', '1');
INSERT INTO `vh_features` VALUES('436', '775', '34', '1');
INSERT INTO `vh_features` VALUES('437', '775', '37', '1');
INSERT INTO `vh_features` VALUES('438', '775', '35', '1');
INSERT INTO `vh_features` VALUES('439', '775', '36', '1');
INSERT INTO `vh_features` VALUES('440', '775', '38', '1');
INSERT INTO `vh_features` VALUES('441', '775', '39', '1');
INSERT INTO `vh_features` VALUES('442', '775', '47', '1');
INSERT INTO `vh_features` VALUES('443', '775', '50', '1');
INSERT INTO `vh_features` VALUES('444', '775', '53', '1');
INSERT INTO `vh_features` VALUES('445', '775', '57', '1');
INSERT INTO `vh_features` VALUES('446', '775', '63', '1');
INSERT INTO `vh_features` VALUES('447', '775', '64', '1');
INSERT INTO `vh_features` VALUES('448', '775', '65', '1');
INSERT INTO `vh_features` VALUES('449', '775', '66', '1');
INSERT INTO `vh_features` VALUES('450', '775', '67', '1');
INSERT INTO `vh_features` VALUES('469', '756', '31', '1');
INSERT INTO `vh_features` VALUES('470', '756', '30', '1');
INSERT INTO `vh_features` VALUES('471', '756', '33', '1');
INSERT INTO `vh_features` VALUES('472', '756', '34', '1');
INSERT INTO `vh_features` VALUES('473', '756', '35', '1');
INSERT INTO `vh_features` VALUES('474', '756', '36', '1');
INSERT INTO `vh_features` VALUES('475', '756', '39', '1');
INSERT INTO `vh_features` VALUES('476', '756', '40', '1');
INSERT INTO `vh_features` VALUES('477', '756', '42', '1');
INSERT INTO `vh_features` VALUES('478', '756', '43', '1');
INSERT INTO `vh_features` VALUES('479', '756', '45', '1');
INSERT INTO `vh_features` VALUES('480', '756', '46', '1');
INSERT INTO `vh_features` VALUES('481', '756', '48', '1');
INSERT INTO `vh_features` VALUES('482', '756', '49', '1');
INSERT INTO `vh_features` VALUES('483', '756', '51', '1');
INSERT INTO `vh_features` VALUES('484', '756', '52', '1');
INSERT INTO `vh_features` VALUES('485', '756', '54', '1');
INSERT INTO `vh_features` VALUES('486', '756', '55', '1');
INSERT INTO `vh_features` VALUES('487', '756', '57', '1');
INSERT INTO `vh_features` VALUES('488', '756', '58', '1');
INSERT INTO `vh_features` VALUES('489', '756', '60', '1');
INSERT INTO `vh_features` VALUES('490', '756', '61', '1');
INSERT INTO `vh_features` VALUES('491', '756', '63', '1');
INSERT INTO `vh_features` VALUES('492', '756', '64', '1');
INSERT INTO `vh_features` VALUES('493', '756', '66', '1');
INSERT INTO `vh_features` VALUES('494', '756', '67', '1');
INSERT INTO `vh_features` VALUES('535', '761', '34', '1');
INSERT INTO `vh_features` VALUES('536', '761', '36', '1');
INSERT INTO `vh_features` VALUES('537', '761', '40', '1');
INSERT INTO `vh_features` VALUES('538', '761', '42', '1');
INSERT INTO `vh_features` VALUES('539', '761', '43', '1');
INSERT INTO `vh_features` VALUES('540', '761', '45', '1');
INSERT INTO `vh_features` VALUES('541', '761', '46', '1');
INSERT INTO `vh_features` VALUES('542', '761', '48', '1');
INSERT INTO `vh_features` VALUES('543', '761', '49', '1');
INSERT INTO `vh_features` VALUES('544', '761', '51', '1');
INSERT INTO `vh_features` VALUES('545', '761', '52', '1');
INSERT INTO `vh_features` VALUES('546', '761', '54', '1');
INSERT INTO `vh_features` VALUES('547', '761', '57', '1');
INSERT INTO `vh_features` VALUES('548', '761', '60', '1');
INSERT INTO `vh_features` VALUES('549', '761', '63', '1');


-- Dumping structure for table: `vh_files`

DROP TABLE IF EXISTS `vh_files`;
CREATE TABLE `vh_files` (
  `vhfile_id` int(11) NOT NULL,
  `vh_id` int(11) NOT NULL,
  `file_disp_name` varchar(45) DEFAULT NULL,
  `file_path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vhfile_id`),
  KEY `fk_vh_files_Vehicle1_idx` (`vh_id`) USING BTREE,
  CONSTRAINT `vh_files_ibfk_1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table: vh_files



-- Dumping structure for table: `vh_sales`

DROP TABLE IF EXISTS `vh_sales`;
CREATE TABLE `vh_sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) NOT NULL,
  `vh_code` varchar(45) DEFAULT NULL,
  `marks_sales_invoice` varchar(10) DEFAULT NULL,
  `clearing_id` int(11) DEFAULT NULL,
  `coordinator_id` int(11) DEFAULT NULL,
  `marked_price` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `sold_price` decimal(10,2) DEFAULT NULL,
  `sell_status` int(11) DEFAULT NULL COMMENT 'payment_completed=5/hand_over|payment waiting=8/advanced=9/in_other_sale=10/cancelled=11',
  `current_milage` int(11) DEFAULT NULL,
  `vh_sales_status` int(11) DEFAULT '1' COMMENT 'in stock=1/reserved=2/clearing=3/cleard=4/sold=5/',
  `customer_id` int(11) DEFAULT NULL,
  `lease` decimal(10,2) DEFAULT NULL,
  `registration` decimal(10,2) DEFAULT NULL,
  `modification` decimal(10,2) DEFAULT NULL,
  `advance` decimal(10,2) DEFAULT NULL,
  `sold_date` date DEFAULT NULL,
  `cash` decimal(10,2) DEFAULT NULL,
  `other` decimal(10,2) DEFAULT NULL,
  `record_status` int(2) DEFAULT NULL COMMENT 'active=1/ cancelled=98',
  PRIMARY KEY (`sales_id`),
  KEY `vh_sales_ibfk_2` (`coordinator_id`) USING BTREE,
  KEY `clearing_id` (`clearing_id`),
  KEY `customer_id` (`customer_id`),
  KEY `fk_vh_sales_Vehicle1_idx` (`vh_id`) USING BTREE,
  CONSTRAINT `vh_sales_ibfk_1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`),
  CONSTRAINT `vh_sales_ibfk_3` FOREIGN KEY (`clearing_id`) REFERENCES `vh_clearing` (`clr_id`),
  CONSTRAINT `vh_sales_ibfk_4` FOREIGN KEY (`coordinator_id`) REFERENCES `coordinator` (`coordinator_id`),
  CONSTRAINT `vh_sales_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;



-- Dumping data for table: vh_sales

INSERT INTO `vh_sales` VALUES('1', '1', 'AL1', 'AL1KR', '', '4', '2350006.00', '7651450.08', '5460000.00', '5', '20', '5', '1', '3113.00', '3131.00', '3233.00', '6532.00', '2016-02-10', '8312.00', '5131.00', '1');
INSERT INTO `vh_sales` VALUES('2', '5', 'LP4', 'LP4KR', '', '5', '333.00', '261.00', '465456.00', '8', '215', '1', '2', '', '', '', '', '2016-02-24', '', '', '1');
INSERT INTO `vh_sales` VALUES('23', '75', 'AL35', 'AL35KR', '', '1', '0.00', '0.00', '0.00', '5', '5', '1', '', '', '', '', '', '0000-00-00', '', '', '1');
INSERT INTO `vh_sales` VALUES('28', '89', 'AL49', 'AL49KR', '', '1', '0.00', '0.00', '0.00', '5', '0', '1', '', '', '', '', '', '0000-00-00', '', '', '1');
INSERT INTO `vh_sales` VALUES('30', '70', 'AL30', 'AL30KR', '', '9', '1.00', '2.00', '3.00', '5', '4', '1', '', '', '', '', '', '2016-02-24', '', '', '1');
INSERT INTO `vh_sales` VALUES('31', '33', 'AL', 'ALKR', '9', '1', '233224.00', '324324.00', '32432.00', '5', '332', '4', '1', '4343.00', '4343.00', '455.00', '434.00', '2016-03-31', '50482.00', '34343.00', '1');
INSERT INTO `vh_sales` VALUES('32', '205', 'AL165', 'AL165KR', '', '1', '236.00', '43.00', '45654433.00', '5', '344', '5', '1', '4334.00', '3434.00', '4343.00', '34343.00', '2016-03-21', '4334.00', '434343.00', '1');
INSERT INTO `vh_sales` VALUES('35', '37', 'AL15', 'AL15KR', '35', '9', '5000000.00', '56563000.00', '4856600.00', '5', '231', '0', '1', '0.00', '0.00', '0.00', '0.00', '2016-02-23', '924900.00', '0.00', '1');
INSERT INTO `vh_sales` VALUES('37', '29', 'AL7', 'AL7KR', '45', '9', '5000000.00', '5500000.00', '5600000.00', '5', '4567', '4', '1', '0.00', '0.00', '0.00', '0.00', '2016-02-22', '2900.00', '0.00', '1');
INSERT INTO `vh_sales` VALUES('38', '19', 'AL5', 'AL5KR', '9', '9', '56464.00', '4646.00', '131213.00', '5', '6214', '3', '1', '', '', '', '', '2016-03-16', '', '', '1');
INSERT INTO `vh_sales` VALUES('39', '19', 'AL5', 'AL5KR', '9', '9', '642113.00', '532112.00', '654321.00', '5', '6', '3', '1', '1111.00', '2332.00', '3232.00', '2323.00', '2016-03-22', '3232.00', '3232.00', '1');
INSERT INTO `vh_sales` VALUES('40', '19', 'AL5', 'AL5KR', '9', '9', '523164.00', '123455.00', '123456.00', '5', '6', '3', '1', '4343.00', '4242.00', '224.00', '4242.00', '0000-00-00', '3951.00', '2342.00', '1');
INSERT INTO `vh_sales` VALUES('41', '780', 'AL737', 'AL737KR', '79', '1', '68950000.00', '56000000.00', '151561.00', '8', '0', '5', '2', '0.00', '0.00', '0.00', '52358.00', '2016-03-22', '91289.00', '632.00', '1');
INSERT INTO `vh_sales` VALUES('42', '19', 'AL5', 'AL5KR', '9', '9', '0.00', '0.00', '123456.00', '5', '6', '3', '1', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '0.00', '0.00', '1');
INSERT INTO `vh_sales` VALUES('43', '171', 'AL131', 'AL131KR', '43', '1', '0.00', '55000000.00', '60000000.00', '5', '0', '5', '4', '4000000.00', '20000.00', '0.00', '50000.00', '2016-04-18', '0.00', '0.00', '1');
INSERT INTO `vh_sales` VALUES('44', '275', 'AL235', 'AL235KR', '44', '1', '7500000.00', '85000000.00', '8300000.00', '5', '0', '4', '1', '99999999.99', '99999999.99', '0.00', '0.00', '0000-00-00', '0.00', '0.00', '1');
INSERT INTO `vh_sales` VALUES('45', '22', 'AL6', 'AL6KR', '78', '9', '0.00', '0.00', '0.00', '5', '13866', '3', '1', '0.00', '0.00', '0.00', '0.00', '2016-04-27', '0.00', '0.00', '1');


-- Dumping structure for table: `vh_tech_spec`

DROP TABLE IF EXISTS `vh_tech_spec`;
CREATE TABLE `vh_tech_spec` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_id` int(11) DEFAULT '0',
  `spec_title` varchar(45) DEFAULT NULL,
  `eng_cylinder` varchar(20) DEFAULT NULL,
  `eng_cc` varchar(10) DEFAULT NULL COMMENT '(displacement)',
  `eng_layout` varchar(45) DEFAULT NULL,
  `eng_hpower` varchar(20) DEFAULT NULL,
  `eng_rpm` varchar(20) DEFAULT NULL,
  `eng_torque` varchar(45) DEFAULT NULL,
  `eng_comp_ratio` varchar(45) DEFAULT NULL,
  `perf_max_speed` varchar(20) DEFAULT NULL,
  `perf_accelration` varchar(45) DEFAULT NULL,
  `trans_type` varchar(20) DEFAULT NULL COMMENT 'Automatic/Manual',
  `trans_desc` varchar(45) DEFAULT NULL COMMENT '6-speed with dual-mass flywheel',
  `fuel_cons_city` varchar(45) DEFAULT NULL,
  `fuel_cons_highway` varchar(45) DEFAULT NULL,
  `bd_len` varchar(45) DEFAULT NULL,
  `bd_wid` varchar(45) DEFAULT NULL,
  `bd_hei` varchar(45) DEFAULT NULL,
  `bd_wheelbase` varchar(45) DEFAULT NULL,
  `bd_maxpayload` varchar(45) DEFAULT NULL,
  `bd_curb_weight` varchar(45) DEFAULT NULL,
  `cap_fuel_tank` varchar(45) DEFAULT NULL,
  `cap_luggage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;



-- Dumping data for table: vh_tech_spec

INSERT INTO `vh_tech_spec` VALUES('6', '22', 'ELECTRIC CAR', '80kw', '210km', '', '', '', '', '', '120', '', 'AT', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `vh_tech_spec` VALUES('8', '11', 'Prius spec', '1800CC', '', '', '', '', '', '', '', '', 'Auto', '', 'Hybrid', '', '', '', '', '', '', '', '', '');
INSERT INTO `vh_tech_spec` VALUES('9', '11', 'Prius 1', '4', '', '', '', '', '', '', '240', '5s', 'Auto', '', '', '', '', '', '', '', '', '', '', '');


-- Dumping structure for table: `web_homepg`

DROP TABLE IF EXISTS `web_homepg`;
CREATE TABLE `web_homepg` (
  `wh_id` int(11) NOT NULL AUTO_INCREMENT,
  `wh_section` varchar(11) DEFAULT '' COMMENT 'banner/mid',
  `wh_image` varchar(50) DEFAULT NULL,
  `wh_head1` varchar(45) DEFAULT NULL,
  `wh_head2` varchar(45) DEFAULT NULL,
  `wh_content` varchar(500) DEFAULT NULL,
  `order` int(3) DEFAULT '1',
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`wh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



-- Dumping data for table: web_homepg

INSERT INTO `web_homepg` VALUES('4', 'banner', '55CC27A79A541.jpg', '', '', '', '1', '1');
INSERT INTO `web_homepg` VALUES('6', 'banner', '55CC58D1144FC.jpg', '', '', '', '2', '1');
INSERT INTO `web_homepg` VALUES('10', 'banner', '55D450C25377E.jpg', '', '', '', '1', '1');
INSERT INTO `web_homepg` VALUES('13', 'banner', '55E032E6E061D.jpg', '', '', '', '1', '1');
INSERT INTO `web_homepg` VALUES('18', 'mid', '55E03D189F476.jpg', 'SUZUKI WAGON R', '', 'Unregistered Suzuki wagon r FZ, made in JAPAN,Hybrid vehicle,Zero mileage,2014/11,Push start,Power driving seat,AAC( Climate Control AC),Rear wiper,Engine capacity is 660CC. Automatic transmission,\n4 Seat & 4 Doors with 2WD,retractable mirrors,Carpets,DVD,Bluetooth,Reverse Camera,\nPrice 2,600,000 (negotiable) ', '1', '1');
INSERT INTO `web_homepg` VALUES('20', 'mid', '55EFAAE4903D3.jpg', 'NISSAN LEAF', '', 'The Nissan LEAF is 100% electric. You will never put even a drop of petrol in it. Ever. It produces zero CO2 tailpipe emissions. In fact it doesn’t even have a tailpipe. Instead it depends on one of our most advanced lithium-ion batteries ever developed. Price 2,950,000 (negotiable) ', '1', '1');
INSERT INTO `web_homepg` VALUES('21', 'mid', '55EFABEEB7630.jpg', 'SUZUKI WAGON R STINGRAY', '', 'Unregistered Suzuki wagon r stingray,Red,Zero mileage,2014/10,Push start,Power driving seat,AAC( Climate Control AC),Rear wiper,Auto retractable mirrors,Carpets,DVD,Bluetooth,Reverse Camera,Price 2,700,000 (negotiable) ', '1', '1');
INSERT INTO `web_homepg` VALUES('24', 'banner', '55F1104E620DC.jpg', '', '', '', '1', '1');


-- Dumping structure for table: `web_news`

DROP TABLE IF EXISTS `web_news`;
CREATE TABLE `web_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `heading_1` varchar(45) DEFAULT NULL,
  `content_all` varchar(500) DEFAULT '',
  `posted_date` date DEFAULT NULL,
  `news_status` int(2) DEFAULT '0',
  `image` varchar(45) DEFAULT '',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;



-- Dumping data for table: web_news

INSERT INTO `web_news` VALUES('5', ' Title of your most recent Blog postf', 'Access select and real time bidding your dreaming vehicle with our friendly staff.Just come and see the difference.', '2015-09-02', '1', '55AE02FBE9DCB.jpg');
INSERT INTO `web_news` VALUES('6', 'Traveling 210km on a single charge', 'Nissan range of leaf, 210㎞ in JC08 mode (Ministry of Land, Infrastructure and Transport examination value) ', '2015-09-02', '1', '55C9D0DF06571.jpg');
INSERT INTO `web_news` VALUES('7', 'Testingjh', 'Traveling 210km on a single chargeTraveling 210km on a single charge', '2017-07-24', '1', '5975BF923C8F9.jpg');
INSERT INTO `web_news` VALUES('8', 'iu', 'jhij', '2017-07-24', '1', '5975C4AF63D24.jpg');
INSERT INTO `web_news` VALUES('9', 'df', 'fd', '2017-07-27', '1', '5979D3F70F21B.jpg');
INSERT INTO `web_news` VALUES('11', 'iuui', 'fdf', '2015-09-02', '1', '5979D79D03186.jpg');


-- Dumping structure for table: `web_transaction`

DROP TABLE IF EXISTS `web_transaction`;
CREATE TABLE `web_transaction` (
  `trvh_id` int(11) NOT NULL AUTO_INCREMENT,
  `trwebtype` varchar(255) DEFAULT NULL,
  `vh_code` varchar(11) NOT NULL,
  `tr_time` time DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  `tr_user_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`trvh_id`,`vh_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table: web_transaction



-- Dumping structure for table: `web_vh_data`

DROP TABLE IF EXISTS `web_vh_data`;
CREATE TABLE `web_vh_data` (
  `sdata_id` int(11) NOT NULL AUTO_INCREMENT,
  `vh_id` int(11) NOT NULL,
  `show_data_cus` int(1) DEFAULT NULL,
  `show_price_cus` int(1) DEFAULT NULL,
  `show_data_coordinator` int(1) DEFAULT NULL,
  `show_price_coordinator` int(1) DEFAULT NULL,
  `disp_currency` varchar(10) DEFAULT NULL,
  `spec_id` int(11) DEFAULT '0' COMMENT 'join with ''vh_tech_spec'' table',
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`sdata_id`),
  UNIQUE KEY `index3` (`vh_id`) USING BTREE,
  KEY `fk_web_vh_data_Vehicle1_idx` (`vh_id`) USING BTREE,
  CONSTRAINT `web_vh_data_ibfk_1` FOREIGN KEY (`vh_id`) REFERENCES `vehicle` (`vh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;



-- Dumping data for table: web_vh_data

INSERT INTO `web_vh_data` VALUES('1', '1', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('4', '6', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('5', '12', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('6', '13', '1', '1', '1', '1', 'LKR', '0', '2015-12-09');
INSERT INTO `web_vh_data` VALUES('7', '743', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('9', '538', '1', '1', '1', '1', 'LKR', '0', '2015-12-09');
INSERT INTO `web_vh_data` VALUES('11', '702', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('14', '716', '1', '1', '1', '1', 'LKR', '0', '2016-01-26');
INSERT INTO `web_vh_data` VALUES('19', '511', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('22', '543', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('23', '492', '1', '1', '1', '1', 'LKR', '8', '');
INSERT INTO `web_vh_data` VALUES('24', '498', '1', '1', '1', '1', 'LKR', '8', '');
INSERT INTO `web_vh_data` VALUES('25', '404', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('26', '613', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('27', '699', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('30', '733', '1', '1', '1', '1', 'LKR', '0', '2016-01-26');
INSERT INTO `web_vh_data` VALUES('31', '661', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('32', '665', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('35', '691', '1', '1', '1', '1', 'LKR', '0', '2015-12-09');
INSERT INTO `web_vh_data` VALUES('36', '723', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('37', '727', '1', '1', '1', '1', 'LKR', '0', '2016-01-26');
INSERT INTO `web_vh_data` VALUES('39', '728', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('40', '729', '1', '1', '1', '1', 'LKR', '0', '2015-12-10');
INSERT INTO `web_vh_data` VALUES('41', '730', '1', '1', '1', '1', 'LKR', '0', '2015-12-10');
INSERT INTO `web_vh_data` VALUES('42', '734', '1', '1', '1', '1', 'LKR', '0', '2016-01-26');
INSERT INTO `web_vh_data` VALUES('43', '735', '1', '1', '1', '1', 'LKR', '0', '2016-01-26');
INSERT INTO `web_vh_data` VALUES('45', '16', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('47', '72', '1', '1', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('48', '76', '0', '0', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('49', '37', '0', '0', '0', '0', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('50', '35', '0', '0', '0', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('53', '36', '0', '0', '0', '2', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('54', '31', '1', '0', '1', '1', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('101', '38', '0', '0', '0', '0', 'LKR', '0', '2015-12-14');
INSERT INTO `web_vh_data` VALUES('102', '39', '0', '0', '0', '0', 'LKR', '0', '');
INSERT INTO `web_vh_data` VALUES('103', '62', '0', '0', '0', '0', 'LKR', '0', '2015-12-14');
INSERT INTO `web_vh_data` VALUES('104', '59', '0', '0', '0', '0', 'LKR', '0', '2015-12-14');
INSERT INTO `web_vh_data` VALUES('105', '63', '0', '0', '0', '0', 'LKR', '0', '2016-02-08');


SET FOREIGN_KEY_CHECKS=1; 

