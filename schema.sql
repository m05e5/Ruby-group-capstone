CREATE DATABASE catalog;

CREATE TABLE genre (
  id   INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE music_album (
  id           INT GENERATED ALWAYS AS IDENTITY,
  on_spotify   BOOLEAN,
  publish_date DATE,
  genre_id     INT,
  author_id    INT,
  label_id     INT,
  archived     BOOLEAN,
  PRIMARY KEY(id),
  FOREIGN KEY(genre_id) REFERENCES genre(id),
  FOREIGN KEY(author_id) REFERENCES author(id),  FOREIGN KEY(label_id) REFERENCES label(id)
);
