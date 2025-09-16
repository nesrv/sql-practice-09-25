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