/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100432
Source Host           : localhost:3306
Source Database       : node_jwt1

Target Server Type    : MYSQL
Target Server Version : 100432
File Encoding         : 65001

Date: 2024-04-21 20:19:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'phone', 'good', '1234', '2024-04-21 14:56:58', '2024-04-21 14:56:58', '5');
INSERT INTO `products` VALUES ('2', 'notebook', 'good', '1234', '2024-04-21 14:57:20', '2024-04-21 14:57:20', '5');
INSERT INTO `products` VALUES ('4', 'airpod', 'good', '1234', '2024-04-21 15:02:59', '2024-04-21 15:02:59', '5');
INSERT INTO `products` VALUES ('5', 'mac', 'good', '1234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `emailToken` varchar(255) DEFAULT NULL,
  `isVerified` tinyint(4) DEFAULT 0,
  `refreshToken` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Lilit', 'Madoyan', '1@gmail.com', '$2b$10$aQFyMIzm..CiQrZ5c.LXUud94iTZsdR4UkAarfEZ.TBM7.BFDdO5q', '5C5588', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IkxpbGl0Iiwic3VybmFtZSI6Ik1hZG95YW4iLCJlbWFpbCI6IjFAZ21haWwuY29tIiwiaXNWZXJpZmllZCI6MCwiaWF0IjoxNzEzNzAyMTI0LCJleHAiOjE3MTM3MDM2MjR9.IGQ0YzUM42Jr0P-zS7ozmvja0zn7j16O1oZCB1wzN2w', null, '2024-04-21 12:22:04', '2024-04-21 12:22:04');
INSERT INTO `users` VALUES ('2', 'Lilit1', 'Madoyan', '11@gmail.com', '$2b$10$JxmEG3n3PAFMStj1CPXsl.cSK8KAXjG67vWjdYreQqSRFPLodxW.m', '8E8C28', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwibmFtZSI6IkxpbGl0MSIsInN1cm5hbWUiOiJNYWRveWFuIiwiZW1haWwiOiIxMUBnbWFpbC5jb20iLCJpc1ZlcmlmaWVkIjowLCJpYXQiOjE3MTM3MDI1MjMsImV4cCI6MTcxMzcwNDAyM30.4q6nF0aKy20U52viRc1umNU6B9lSQ80re8hrUx0fpZg', null, '2024-04-21 12:28:43', '2024-04-21 12:28:43');
INSERT INTO `users` VALUES ('3', 'Lilit2', 'Madoyan', '12@gmail.com', '$2b$10$FDutib5j0sCJEM4O8e9LKuugEeKybYTKQA82U127Ik5HJrZVuYly.', 'D3D3BB', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywibmFtZSI6IkxpbGl0MiIsInN1cm5hbWUiOiJNYWRveWFuIiwiZW1haWwiOiIxMkBnbWFpbC5jb20iLCJpc1ZlcmlmaWVkIjowLCJpYXQiOjE3MTM3MDI1MzAsImV4cCI6MTcxMzcwNDAzMH0.NZ-j9xIx064_LgGdRx01Tw50IIw6JprThmxJRCK97zM', null, '2024-04-21 12:28:50', '2024-04-21 12:28:50');
INSERT INTO `users` VALUES ('4', 'Lilit4', 'Madoyan', '4@gmail.com', '$2b$10$.TfLbjZaNCQKHRcw5EnXVObcReWPgUE0mQLkNEcHPTmzSlQq/WCI.', 'ACE102', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwibmFtZSI6IkxpbGl0NCIsInN1cm5hbWUiOiJNYWRveWFuIiwiZW1haWwiOiI0QGdtYWlsLmNvbSIsImlzVmVyaWZpZWQiOjEsInR5cGUiOm51bGwsImlhdCI6MTcxMzcwNDI5MywiZXhwIjoxNzEzNzA1NzkzfQ.dQOA20NeCBFPk749_BNmDScBHURa4eptPP6qIfB8PM0', null, '2024-04-21 12:55:06', '2024-04-21 12:58:13');
INSERT INTO `users` VALUES ('5', 'Lilit5', 'Madoyan', '5@gmail.com', '$2b$10$sH2c0dOBoPejRlBK9DXKw.qQaaMkZHnbS4CkZybqjXZXzVJFZ6kbG', 'F340F3', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6IkxpbGl0NSIsInN1cm5hbWUiOiJNYWRveWFuIiwiZW1haWwiOiI1QGdtYWlsLmNvbSIsImlzVmVyaWZpZWQiOjEsInR5cGUiOm51bGwsImlhdCI6MTcxMzcxMTM3MiwiZXhwIjoxNzEzNzEyODcyfQ.VlXPJlMru9Pb80e1VaGCgMnTIjK-Cj5NGSXkVBiAJk0', null, '2024-04-21 13:30:13', '2024-04-21 14:56:12');
SET FOREIGN_KEY_CHECKS=1;
