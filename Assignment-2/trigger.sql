DELIMITER $$
CREATE TRIGGER `website_role_create`
AFTER INSERT ON `website_role`
FOR EACH ROW
BEGIN
	INSERT INTO `website_priviledge`(`priviledge`, `developer`, `website`) 
    VALUES('read', new.developer, new.website);

	IF new.role = 'owner' THEN
		INSERT INTO `website_priviledge` (`priviledge`, `developer`, `website`)
		VALUES ('create', new.developer, new.website),
		('update', new.developer, new.website),
        ('delete', new.developer, new.website);
	ELSEIF new.role = 'admin' THEN
		INSERT INTO `website_priviledge` (`priviledge`, `developer`, `website`)
		VALUES ('create', new.developer, new.website),
        ('update', new.developer, new.website),
        ('delete', new.developer, new.website);
	ELSEIF new.role = 'writer' THEN
		INSERT INTO `website_priviledge` (`priviledge`, `developer`, `website`)
		VALUES ('create', new.developer, new.website),
        ('update', new.developer, new.website);
	ELSEIF new.role = 'editor' THEN
		INSERT INTO `website_priviledge` (`priviledge`, `developer`, `website`)
		VALUES ('update', new.developer, new.website);
	END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `website_role_update`
AFTER UPDATE ON `website_role`
FOR EACH ROW
BEGIN
	DELETE FROM `website_priviledge` WHERE developer = old.developer AND website = old.website;
	INSERT INTO `website_priviledge` (priviledge, developer, website) 
	VALUES ('read', new.developer, new.website);
    
	IF new.role = 'owner' THEN
		INSERT INTO `website_priviledge` (priviledge, developer, website) 
		VALUES ('create', new.developer, new.website), 
		('update', new.developer, new.website), 
		('delete', new.developer, new.website);
	ELSEIF new.role = 'admin' THEN
		INSERT INTO `website_priviledge` (priviledge, developer, website) 
		VALUES ('create', new.developer, new.website), 
		('update', new.developer, new.website), 
		('delete', new.developer, new.website);
	ELSEIF new.role = 'writer' THEN
		INSERT INTO `website_priviledge` (priviledge, developer, website) 
		VALUES ('create', new.developer, new.website), 
		('update', new.developer, new.website);
	ELSEIF new.role = 'editor' THEN
		INSERT INTO `website_priviledge` (priviledge, developer, website) 
		VALUES ('update', new.developer, new.website);
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `website_role_delete`
AFTER DELETE ON `website_role`
FOR EACH ROW
BEGIN
	DELETE FROM `website_priviledge` WHERE developer= old.developer AND website = old.website;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `page_role_create`
AFTER INSERT ON `page_role`
FOR EACH ROW
BEGIN
	INSERT INTO `page_priviledge` (priviledge, developer, page) 
	VALUES ('read', new.developer, new.page);
	IF new.role = 'owner' OR 'admin' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('create', new.developer, new.page),
        ('update', new.developer, new.page),
        ('delete', new.developer, new.page);
	ELSEIF new.role = 'admin' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('create', new.developer, new.page),
        ('update', new.developer, new.page),
        ('delete', new.developer, new.page);
	ELSEIF new.role = 'writer' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('create', new.developer, new.page),
        ('update', new.developer, new.page);
	ELSEIF new.role = 'editor' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('update', new.developer, new.page);
	END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `page_role_update`
	AFTER UPDATE ON `page_role`
	FOR EACH ROW
BEGIN
	DELETE FROM `page_priviledge` WHERE developer = old.developer AND page = old.page;
	INSERT INTO `page_priviledge` (priviledge, developer, page) 
	VALUES ('read', new.developer, new.page);
	IF new.role = 'owner' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('create', new.developer, new.page),
        ('update', new.developer, new.page),
        ('delete', new.developer, new.page);
	ELSEIF new.role = 'admin' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('create', new.developer, new.page),
        ('update', new.developer, new.page),
        ('delete', new.developer, new.page);
	ELSEIF new.role = 'writer' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('create', new.developer, new.page), 
        ('update', new.developer, new.page);
	ELSEIF new.role = 'editor' THEN
		INSERT INTO `page_priviledge` (priviledge, developer, page) 
		VALUES ('update', new.developer, new.page);
	END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `page_role_delete`
	AFTER DELETE ON `page_role`
	FOR EACH ROW
BEGIN
	DELETE FROM `page_priviledge` WHERE developer = old.developer AND page = old.page;
END$$
DELIMITER ;




