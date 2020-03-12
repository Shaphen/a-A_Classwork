-- PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;

CREATE TABLE user (
  id INTEGER PRIMARY KEY,
  fname text,
  lname text
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  author_id INTEGER,
  title VARCHAR(255),
  body text,

  FOREIGN KEY (author_id) REFERENCES user(id)
);

CREATE TABLE question_follows (
  questions_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body text,
  reply_id INTEGER,
  owner_id INTEGER,

  FOREIGN KEY (reply_id) REFERENCES questions(id),
  FOREIGN KEY (owner_id) REFERENCES user(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  likes INTEGER,

  FOREIGN KEY (likes) REFERENCES user(id),
  FOREIGN KEY (likes) REFERENCES question(id)
);

INSERT INTO
  user (fname, lname)
VALUES
  ('any', 'name'), ('another', 'name');

INSERT INTO
  questions (title, body, author_id)    
VALUES
  ('title','body', 1), ('this','that', 2);


INSERT INTO 
  replies (body, reply_id, owner_id)
VALUES
  ('I am happy flying potato', 1 , 2);  