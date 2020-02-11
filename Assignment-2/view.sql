CREATE VIEW developer_roles_and_privileges AS
SELECT p.first_name,p.last_name,p.username,p.email,w.name,w.visits,w.updated,wr.role AS website_role,wp.priviledge AS website_priviledge,
pg.title,pg.views,pg.updated AS page_updated,pgr.role AS page_role,pg.title AS page_title,pp.priviledge AS page_priviledge,pg.page_id
FROM (((((person AS p 
INNER JOIN developer d ON p.id = d.id) 
INNER JOIN website_role AS wr ON d.id =  wr.developer) 
INNER JOIN website w ON wr.website= w.id) 
LEFT OUTER JOIN page pg ON pg.website = w.id)
LEFT OUTER JOIN page_role AS pgr ON (pgr.developer= d.id AND pgr.page = pg.id)
LEFT OUTER JOIN page_priviledge AS pp ON (pp.developer = d.id AND pg.id = pp.page)
LEFT OUTER JOIN website_priviledge AS wp ON (wp.developer = d.id AND wp.website = w.id));
