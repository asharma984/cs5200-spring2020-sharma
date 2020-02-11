CREATE TABLE `person` (
`id` int AUTO_INCREMENT,
`first_name` varchar(40) NOT NULL,
`last_name` varchar(40) NOT NULL,
`user_name` varchar(40) NOT NULL,
`password` varchar(40) NOT NULL,
`email` varchar(40) NOT NULL,
`dob` Date Default NULL,
 PRIMARY KEY(`id`)
 );
 
 CREATE TABLE `developer` (
  `id` int AUTO_INCREMENT,
  `developer_key` varchar(30),
  PRIMARY KEY (`id`),
  CONSTRAINT `developer_person_generalization`
  FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE 
);

 CREATE TABLE `user` (
  `id` int AUTO_INCREMENT,
  `user_agreement` boolean,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_person_generalization`
  FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `website` (
`id` int AUTO_INCREMENT,
`name` varchar(30),
`description` varchar(255),
`created` date DEFAULT NULL,
`updated` date DEFAULT NULL,
`visits` int,
`developer` int,
PRIMARY KEY (`id`),
CONSTRAINT `website_developer_aggregation`
FOREIGN KEY (`developer`) REFERENCES `developer` (`id`) ON DELETE SET NULL
);

CREATE TABLE `page` (
`id` int AUTO_INCREMENT,
`title` varchar(40),
`description` varchar(255),
`created` date DEFAULT NULL,
`updated` date DEFAULT NULL,
`views` int,
`website` int,
PRIMARY KEY (`id`),
CONSTRAINT `page_website_composition` 
FOREIGN KEY (`website`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `widget` (
`id` int AUTO_INCREMENT,
`name` varchar(30),
`width` int DEFAULT NULL,
`height` int DEFAULT NULL,
`css_class` varchar(120) DEFAULT NULL,
`css_style` varchar(120) DEFAULT NULL,
`text` varchar(120) DEFAULT NULL,
`order` int,
`url` varchar(120),
`shareble` boolean,
`expandable` boolean,
`size` int DEFAULT 2,
`src` varchar(255),
`html` varchar(255),
`d_type` varchar(20),
`page` int,
PRIMARY KEY (`id`),
CONSTRAINT `widget_page_composition` 
FOREIGN KEY (`page`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `address` (
`id` int AUTO_INCREMENT,
`street1` varchar(80),
`street2` varchar(80),
`city` varchar(30),
`state` varchar(30),
`zip` varchar(10),
`primary` boolean,
`person` int,
PRIMARY KEY (`id`),
CONSTRAINT `address_person_composition` 
FOREIGN KEY (`person`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `phone` (
`id` int AUTO_INCREMENT,
`phone` varchar(20),
`primary` boolean,
`person` int,
PRIMARY KEY (`id`),
CONSTRAINT `phone_person_composition` 
FOREIGN KEY (`person`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `role`(
`id` varchar(20),
PRIMARY KEY (`id`)
);
INSERT INTO `role` (`id`) VALUES ('owner');
INSERT INTO `role` (`id`) VALUES ('admin');
INSERT INTO `role` (`id`) VALUES ('writer');
INSERT INTO `role` (`id`) VALUES ('editor');
INSERT INTO `role` (`id`) VALUES ('reviewer');

CREATE TABLE `priviledge`(
`id` varchar(20),
PRIMARY KEY (`id`)
);
INSERT INTO `priviledge` (`id`) VALUES ('create');
INSERT INTO `priviledge` (`id`) VALUES ('read');
INSERT INTO `priviledge` (`id`) VALUES ('update');
INSERT INTO `priviledge` (`id`) VALUES ('delete');


CREATE TABLE `website_priviledge`(
`id` int AUTO_INCREMENT,
`priviledge` varchar(20),
`developer` int,
`website` int,
PRIMARY KEY (`id`),
CONSTRAINT `website_priviledge_enum` 
FOREIGN KEY (`priviledge`) REFERENCES `priviledge` (`id`),
CONSTRAINT `website_priviledge_developer_association` 
FOREIGN KEY (`developer`) REFERENCES `developer` (`id`),
CONSTRAINT `website_priviledge_website_association` 
FOREIGN KEY (`website`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `website_role`(
`id` int AUTO_INCREMENT,
`role` varchar(20),
`developer` int,
`website` int,
PRIMARY KEY (`id`),
CONSTRAINT `website_role_enum` 
FOREIGN KEY (`role`) REFERENCES `role` (`id`),
CONSTRAINT `website_role_developer_association` 
FOREIGN KEY (`developer`) REFERENCES `developer` (`id`),
CONSTRAINT `website_role_website_association` 
FOREIGN KEY (`website`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `page_priviledge`(
`id` int AUTO_INCREMENT,
`priviledge` varchar(20),
`developer` int,
`page` int,
PRIMARY KEY (`id`),
CONSTRAINT `page_priviledge_enums` 
FOREIGN KEY (`priviledge`) REFERENCES `priviledge` (`id`),
CONSTRAINT `page_priviledge_developer_association` 
FOREIGN KEY (`developer`) REFERENCES `developer` (`id`),
CONSTRAINT `page_priviledge_page_association` 
FOREIGN KEY (`page`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `page_role`(
`id` int AUTO_INCREMENT,
`role` varchar(20),
`developer` int,
`page` int,
PRIMARY KEY (`id`),
CONSTRAINT `page_role_enum` 
FOREIGN KEY (`role`) REFERENCES `role` (`id`),
CONSTRAINT `page_role_developer_association` 
FOREIGN KEY (`developer`) REFERENCES `developer` (`id`),
CONSTRAINT `page_role_page_association` 
FOREIGN KEY (`page`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);






