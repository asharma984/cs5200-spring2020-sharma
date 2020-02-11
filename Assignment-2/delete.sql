DELETE FROM address WHERE `primary` = 1 AND person = (SELECT id FROM person WHERE username = 'alice');


SET @contact = (SELECT id FROM page WHERE title = 'contact');
SET @last_order = (SELECT MAX(`order`) FROM widget WHERE page = @contact);
DELETE FROM widget where page IN (SELECT @contact) and `order`= @last_order;

SET @website = (SELECT id FROM website WHERE name='wikipedia');
SET @last_date = (SELECT MAX(updated) FROM page WHERE website = @website );
SET @page_id = (SELECT id FROM page WHERE updated = @last_date and website = @website);
DELETE FROM page WHERE id = @page_id;

DELETE FROM website WHERE `name` = 'CNET';

