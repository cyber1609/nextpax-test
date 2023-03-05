SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Table structure for table `availabilities`
--

DROP TABLE IF EXISTS `availabilities`;
CREATE TABLE `availabilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `date` date NOT NULL COMMENT '(DC2Type:dateImmutable)',
  `quantity` int(11) NOT NULL,
  `arrival_allowed` tinyint(1) NOT NULL,
  `departure_allowed` tinyint(1) NOT NULL,
  `minimum_stay` int(11) NOT NULL,
  `maximum_stay` int(11) NOT NULL,
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `availabilities`
--

INSERT INTO `availabilities` VALUES(1, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-18', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(3, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-19', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(5, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(7, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-21', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(9, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-22', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(11, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-23', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(13, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-24', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(15, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-25', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(17, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-26', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(19, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-27', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(21, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-28', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(23, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-29', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(25, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-30', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(27, '71438849-47cb-4b00-82de-34fff691f017', '2017-05-31', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(29, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-01', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(31, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-02', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(33, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-03', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(35, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-04', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(37, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-05', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(39, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-06', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(41, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-07', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(43, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-08', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(45, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-09', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(47, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-10', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(49, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-11', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(51, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-12', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(53, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-13', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(55, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-14', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(57, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-15', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(59, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-16', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(61, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-17', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(63, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-18', 0, 0, 1, 1, 21, 1490088361);
INSERT INTO `availabilities` VALUES(65, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-19', 0, 0, 1, 1, 21, 1490088361);
INSERT INTO `availabilities` VALUES(67, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(69, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-21', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(71, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-22', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(73, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-23', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(75, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-24', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(77, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-25', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(79, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-26', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(81, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-27', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(83, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-28', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(85, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-29', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(87, '71438849-47cb-4b00-82de-34fff691f017', '2017-06-30', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(89, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-01', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(91, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-02', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(93, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-03', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(95, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-04', 1, 1, 1, 1, 21, 1492207203);
INSERT INTO `availabilities` VALUES(97, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-05', 1, 1, 1, 1, 21, 1492207203);
INSERT INTO `availabilities` VALUES(99, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-06', 1, 1, 1, 1, 21, 1492207203);
INSERT INTO `availabilities` VALUES(101, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-07', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(103, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-08', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(105, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-09', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(107, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-10', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(109, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-11', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(111, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-12', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(113, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-13', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(115, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-14', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(117, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-15', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(119, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-16', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(121, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-17', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(123, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-18', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(125, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-19', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(127, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(129, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-21', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(131, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-22', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(133, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-23', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(135, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-24', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(137, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-25', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(139, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-26', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(141, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-27', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(143, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-28', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(145, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-29', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(147, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-30', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(149, '71438849-47cb-4b00-82de-34fff691f017', '2017-07-31', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(151, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-01', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(153, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-02', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(155, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-03', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(157, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-04', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(159, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-05', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(161, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-06', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(163, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-07', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(165, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-08', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(167, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-09', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(169, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-10', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(171, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-11', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(173, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-12', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(175, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-13', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(177, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-14', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(179, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-15', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(181, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-16', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(183, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-17', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(185, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-18', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(187, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-19', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(189, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(191, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-21', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(193, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-22', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(195, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-23', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(197, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-24', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(199, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-25', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(201, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-26', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(203, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-27', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(205, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-28', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(207, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-29', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(209, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-30', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(211, '71438849-47cb-4b00-82de-34fff691f017', '2017-08-31', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(213, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-01', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(215, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-02', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(217, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-03', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(219, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-04', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(221, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-05', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(223, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-06', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(225, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-07', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(227, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-08', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(229, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-09', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(231, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-10', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(233, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-11', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(235, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-12', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(237, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-13', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(239, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-14', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(241, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-15', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(243, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-16', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(245, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-17', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(247, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-18', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(249, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-19', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(251, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(253, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-21', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(255, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-22', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(257, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-23', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(259, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-24', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(261, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-25', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(263, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-26', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(265, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-27', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(267, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-28', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(269, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-29', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(271, '71438849-47cb-4b00-82de-34fff691f017', '2017-09-30', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(273, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-01', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(275, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-02', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(277, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-03', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(279, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-04', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(281, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-05', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(283, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-06', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(285, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-07', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(287, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-08', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(289, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-09', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(291, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-10', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(293, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-11', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(295, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-12', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(297, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-13', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(299, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-14', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(301, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-15', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(303, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-16', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(305, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-17', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(307, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-18', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(309, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-19', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(311, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(313, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-21', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(315, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-22', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(317, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-23', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(319, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-24', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(321, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-25', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(323, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-26', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(325, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-27', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(327, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-28', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(329, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-29', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(331, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-30', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(333, '71438849-47cb-4b00-82de-34fff691f017', '2017-10-31', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(335, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-01', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(337, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-02', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(339, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-03', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(341, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-04', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(343, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-05', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(345, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-06', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(347, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-07', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(349, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-08', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(351, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-09', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(353, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-10', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(355, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-11', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(357, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-12', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(359, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-13', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(361, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-14', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(363, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-15', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(365, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-16', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(367, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-17', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(369, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-18', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(371, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-19', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(373, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(375, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-21', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(377, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-22', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(379, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-23', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(381, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-24', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(383, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-25', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(385, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-26', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(387, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-27', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(389, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-28', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(391, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-29', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(393, '71438849-47cb-4b00-82de-34fff691f017', '2017-11-30', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(395, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-01', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(397, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-02', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(399, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-03', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(401, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-04', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(403, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-05', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(405, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-06', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(407, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-07', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(409, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-08', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(411, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-09', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(413, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-10', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(415, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-11', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(417, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-12', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(419, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-13', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(421, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-14', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(423, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-15', 0, 0, 1, 1, 21, 1493277324);
INSERT INTO `availabilities` VALUES(425, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-16', 0, 0, 1, 1, 21, 1493277324);
INSERT INTO `availabilities` VALUES(427, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-17', 0, 0, 1, 1, 21, 1493277324);
INSERT INTO `availabilities` VALUES(429, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-18', 0, 0, 1, 1, 21, 1493277324);
INSERT INTO `availabilities` VALUES(431, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-19', 0, 0, 1, 1, 21, 1493277324);
INSERT INTO `availabilities` VALUES(433, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-20', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(435, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-21', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(437, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-22', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(439, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-23', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(441, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-24', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(443, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-25', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(445, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-26', 1, 1, 1, 1, 21, 1485858784);
INSERT INTO `availabilities` VALUES(447, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-27', 1, 1, 1, 1, 21, 1494550803);
INSERT INTO `availabilities` VALUES(449, '71438849-47cb-4b00-82de-34fff691f017', '2017-12-28', 1, 1, 1, 1, 21, 1494550803);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `duration` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `persons` varchar(255) NOT NULL COMMENT '(DC2Type:integerArray)',
  `weekdays` varchar(255) NOT NULL COMMENT '(DC2Type:integerArray)',
  `minimum_stay` int(11) NOT NULL,
  `maximum_stay` int(11) NOT NULL,
  `extra_person_price` int(11) NOT NULL,
  `extra_person_price_currency` varchar(3) NOT NULL,
  `period_from` date NOT NULL COMMENT '(DC2Type:dateWrap)',
  `period_till` date NOT NULL COMMENT '(DC2Type:dateWrap)',
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` VALUES(1, '71438849-47cb-4b00-82de-34fff691f017', 1, 12300, 'EUR', '1', '0|1|2|3|4|5|6', 1, 21, 0, 'EUR', '2017-05-18', '2017-05-18', 1494946802);
INSERT INTO `prices` VALUES(3, '71438849-47cb-4b00-82de-34fff691f017', 1, 12300, 'EUR', '2|3|4|5|6', '0|1|2|3|4|5|6', 1, 21, 1500, 'EUR', '2017-05-18', '2017-05-18', 1494946802);
INSERT INTO `prices` VALUES(5, '71438849-47cb-4b00-82de-34fff691f017', 1, 10900, 'EUR', '1', '0|1|2|3|4|5|6', 1, 21, 0, 'EUR', '2017-07-04', '2017-07-04', 1494946802);
INSERT INTO `prices` VALUES(7, '71438849-47cb-4b00-82de-34fff691f017', 1, 10900, 'EUR', '2|3|4|5|6', '0|1|2|3|4|5|6', 1, 21, 1500, 'EUR', '2017-07-04', '2017-07-04', 1494946802);
INSERT INTO `prices` VALUES(9, '71438849-47cb-4b00-82de-34fff691f017', 1, 11300, 'EUR', '1', '0|1|2|3|4|5|6', 1, 21, 0, 'EUR', '2017-07-05', '2017-07-05', 1494946802);
INSERT INTO `prices` VALUES(11, '71438849-47cb-4b00-82de-34fff691f017', 1, 11300, 'EUR', '2|3|4|5|6', '0|1|2|3|4|5|6', 1, 21, 1500, 'EUR', '2017-07-05', '2017-07-05', 1494946802);
INSERT INTO `prices` VALUES(13, '71438849-47cb-4b00-82de-34fff691f017', 1, 12500, 'EUR', '1', '0|1|2|3|4|5|6', 1, 21, 0, 'EUR', '2017-07-06', '2017-07-10', 1494946802);
INSERT INTO `prices` VALUES(15, '71438849-47cb-4b00-82de-34fff691f017', 1, 12500, 'EUR', '2|3|4|5|6', '0|1|2|3|4|5|6', 1, 21, 1500, 'EUR', '2017-07-06', '2017-07-10', 1494946802);
INSERT INTO `prices` VALUES(17, '71438849-47cb-4b00-82de-34fff691f017', 1, 11500, 'EUR', '1', '0|1|2|3|4|5|6', 3, 21, 0, 'EUR', '2017-07-06', '2017-07-10', 1494946802);
INSERT INTO `prices` VALUES(19, '71438849-47cb-4b00-82de-34fff691f017', 1, 11500, 'EUR', '2|3|4|5|6', '0|1|2|3|4|5|6', 3, 21, 1500, 'EUR', '2017-07-06', '2017-07-10', 1494946802);
INSERT INTO `prices` VALUES(21, '71438849-47cb-4b00-82de-34fff691f017', 7, 80000, 'EUR', '1', '0|1|2|3|4|5|6', 7, 21, 0, 'EUR', '2017-07-06', '2017-07-10', 1494946802);
INSERT INTO `prices` VALUES(23, '71438849-47cb-4b00-82de-34fff691f017', 7, 80000, 'EUR', '2|3|4|5|6', '0|1|2|3|4|5|6', 7, 21, 1500, 'EUR', '2017-07-06', '2017-07-10', 1494946802);