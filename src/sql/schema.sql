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