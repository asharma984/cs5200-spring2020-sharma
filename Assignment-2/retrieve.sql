SELECT * FROM person WHERE id IN (SELECT id FROM developer);

SELECT * FROM person WHERE id IN (SELECT id FROM developer) AND id = 34;


SELECT * FROM person JOIN developer ON (person.id = developer.id) JOIN website_role ON (developer = developer.id) 
JOIN website ON (website.id = website_role.website) WHERE `name`='twitter' AND role NOT IN ('owner');

SELECT * FROM person JOIN developer ON (person.id = developer.id) JOIN page_role ON (developer= developer.id) 
JOIN page ON (page_role.page = page.id) WHERE role = 'reviewer' AND views <= 300000;

SELECT d.id,pe.first_name from person pe,developer d, page_role pr, website w, page p, widget wid where 
wid.d_type = "heading" and p.title = "Home" and pr.role = "writer" and w.name = "CNET" AND d.id = pr.developer and pr.page = p.id 
and wid.page = p.id and p.website = w.id and d.id = pe.id;


SELECT * FROM website WHERE visits = (SELECT MIN(visits) FROM website);

SELECT name FROM website WHERE id = 678;

SELECT * FROM widget 
JOIN page ON (page.id = widget.page) 
JOIN website ON (website.id = page.website) JOIN page_role ON (page_role.page = page.id) 
JOIN developer ON (page_role.developer = developer.id) JOIN person ON (person.id = developer.id)
WHERE role = 'reviewer' AND username = 'bob' AND d_type = 'youtube';

SELECT website.name, username, role
FROM website, website_role, developer, person
WHERE website.id = website_role.website AND website_role.developer= developer.id AND developer.id = person.id
AND username = 'alice' AND role = 'owner';

SELECT website.name, username, visits
FROM website, website_role, developer, person
WHERE website.id = website_role.website AND website_role.developer= developer.id AND developer.id = person.id
AND username = 'charlie' AND visits > 6000000;


SELECT id, title, views FROM page WHERE views = (SELECT MAX(views) FROM page);
    
SELECT id, title FROM page WHERE id = 234;

SELECT title, username, role FROM page, page_role, developer, person
WHERE page.id = page_role.page AND page_role.developer = developer.id AND developer.id = person.id
AND username='alice' AND role='editor';

SELECT name, SUM(views) AS total_views FROM page, website WHERE page.website = website.id and name = 'CNET';
    
SELECT website.name, AVG(views) AS average_views FROM page, website WHERE page.website = website.id and name = 'Wikipedia';


SELECT widget.name, website.name, page.title FROM widget, page, website
WHERE widget.page = page.id AND page.website = website.id AND website.name = 'CNET' AND page.title = 'home';

SELECT widget.name, d_type, website.name, page.title
FROM widget, page, website WHERE widget.page = page.id AND page.website = website.id 
AND d_type = 'youtube' AND website.name = 'cnn';

SELECT widget.name, d_type, title, username, role
FROM widget, page, page_role, developer, person
WHERE widget.page= page.id AND page.id = page_role.page
AND page_role.developer= developer.id AND developer.id = person.id
AND d_type = 'image' AND username = 'alice' AND role = 'reviewer';

SELECT website.name, COUNT(widget.id) AS count_widget
FROM widget, page, website
WHERE widget.page = page.id AND page.website= website.id AND website.name = 'Wikipedia';


SELECT w.name from developer d, person p, website_priviledge wp, website w where d.id = p.id and p.username = "bob" 
and d.id = wp.developer and w.id = wp.website and wp.priviledge = "delete";

SELECT pg.title from developer d, person p, page_priviledge pp, page pg where d.id = p.id and p.username = "charlie" 
and d.id = pp.developer and pg.id = pp.page and pp.priviledge = "create";

