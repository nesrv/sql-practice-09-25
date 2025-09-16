SELECT p.message, t.name
FROM posts p
	 JOIN posts_tags pt ON pt.post_id = p.post_id
	 JOIN tags t ON t.tag_id = pt.tag_id;


SELECT p.message, array_agg(t.name ORDER BY t.name) tags
FROM posts p
	 JOIN posts_tags pt ON pt.post_id = p.post_id
	 JOIN tags t ON t.tag_id = pt.tag_id
GROUP BY p.post_id;


SELECT p.message
FROM posts p
	 JOIN posts_tags pt ON pt.post_id = p.post_id
	 JOIN tags t ON t.tag_id = pt.tag_id
WHERE t.name = 'былое и думы'	 
GROUP BY p.post_id;

 SELECT t.name FROM tags t;

 DROP TABLE posts_tags;
 DROP TABLE tags;

 ALTER TABLE posts ADD COLUMN tags text[];

UPDATE posts SET tags = '{"былое и думы","технологии"}'
WHERE post_id = 1;

 UPDATE posts SET tags = '{"былое и думы","семья"}'
WHERE post_id = 2;

 SELECT p.message, p.tags FROM posts p
 WHERE p.tags && '{"семья"}' ;

select DISTINCT unnest (p.tags) from posts p;





 



