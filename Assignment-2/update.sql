UPDATE phone SET phone = '333-444-5555' WHERE 
person = (SELECT id FROM person WHERE username = 'charlie') AND `primary` = 1;

UPDATE widget SET `order` = 3 WHERE name = "head345";
SET @id = (select page from widget WHERE name = "head345");
UPDATE widget SET `order` = `order` - 1 WHERE page = @id and name not in ('head345') order by `order`;


UPDATE page SET title = CONCAT('CNET - ',title)
WHERE website IN (SELECT id FROM website WHERE `name` = 'CNET');
