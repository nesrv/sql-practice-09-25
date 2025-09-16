CREATE TABLE posts(
    post_id integer PRIMARY KEY,
    message text
);


CREATE TABLE tags(
    tag_id integer PRIMARY KEY,
    name text
);

CREATE TABLE posts_tags(
    post_id integer REFERENCES posts(post_id),
    tag_id integer REFERENCES tags(tag_id)
);



INSERT INTO posts(post_id,message) VALUES
    (1, 'Перечитывал пейджер, много думал.'),
    (2, 'Это было уже весной и я отнес елку обратно.');


INSERT INTO tags(tag_id,name) VALUES
    (1, 'былое и думы'), (2, 'технологии'), (3, 'семья');

INSERT INTO posts_tags(post_id,tag_id) VALUES
    (1,1), (1,2), (2,1), (2,3);