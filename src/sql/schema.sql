-- Create Item Table
CREATE TABLE item (
  id              integer GENERATED ALWAYS AS IDENTITY,
  genre           varchar(100),
  author          varchar(100),
  source          varchar(100),
  label           varchar(100),
  publish_date    date,
  archived        boolean
  PRIMARY KEY(id)
);

-- Create MusicAlbum Table
CREATE TABLE music_album (
  id              integer GENERATED ALWAYS AS IDENTITY,
  publish_date    date,
  on_spotify      boolean,
  genre_id        int references genre(id),
  PRIMARY KEY(id)
);

-- Create Genre Table
CREATE TABLE genre(
  id              integer GENERATED ALWAYS AS IDENTITY,
  name            varchar(100),
  PRIMARY KEY(id)
);


CREATE TABLE Authors (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR (255),
  last_name VARCHAR (255),
  items TEXT []
  PRIMARY KEY(id)
);

CREATE TABLE games (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  author_id INT REFERENCES authors (id),
  can_be_archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE books (
       id INT GENERATED ALWAYS AS IDENTITY,
       publisher VARCHAR(255),
       cover_state VARCHAR(255),
       publish_date DATE,
       label_id INT REFERENCES labels(id),
       FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE labels (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        title VARCHAR(255),
        color VARCHAR(255),
        items TEXT []
);