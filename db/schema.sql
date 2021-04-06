DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS member_addresses;
DROP TABLE IF EXISTS club_members;
DROP TABLE IF EXISTS clubs;
DROP TABLE IF EXISTS races;
DROP TABLE IF EXISTS race_history;

CREATE TABLE members (
    id INTEGER PRIMARY KEY,
    ussa_id INTEGER NOT NULL UNIQUE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    birthday INTEGER NOT NULL,
    gender BOOLEAN NOT NULL
);

CREATE TABLE member_addresses (
    id INTEGER PRIMARY KEY,
    ussa_id INTEGER UNIQUE,
    phone INTEGER,
    address_1 VARCHAR(30) NOT NULL,
    address_2 VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    region VARCHAR(2) NOT NULL,
    country VARCHAR(3),
    zip INT NOT NULL,
    CONSTRAINT fk_ussa_address FOREIGN KEY (ussa_id) REFERENCES members(ussa_id) ON DELETE SET NULL
);

CREATE TABLE clubs (
    id INTEGER PRIMARY KEY,
    club_id INTEGER UNIQUE,
    club_name VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    region VARCHAR(2) NOT NULL,
    country VARCHAR(3),
    zip INT NOT NULL
);

CREATE TABLE club_members (
    id INTEGER PRIMARY KEY,
    ussa_id INTEGER UNIQUE,
    club_id INTEGER,
    CONSTRAINT fk_ussa_member FOREIGN KEY (ussa_id) REFERENCES members(ussa_id) ON DELETE SET NULL,
    CONSTRAINT fk_club FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

CREATE TABLE races (
    id INTEGER PRIMARY KEY,
    race_id INTEGER UNIQUE,
    race_name VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    region VARCHAR(2) NOT NULL,
    country VARCHAR(3),
    zip INT NOT NULL,
    race_date INT NOT NULL
);

CREATE TABLE race_history (
    id INTEGER PRIMARY KEY,
    ussa_id INTEGER,
    race_id INTEGER,
    points INTEGER NOT NULL,
    finish_place INTEGER NOT NULL,
    CONSTRAINT fk_race_hist FOREIGN KEY (race_id) REFERENCES races(race_id),
    CONSTRAINT fk_ussa_racehist FOREIGN KEY (ussa_id) REFERENCES members(ussa_id) ON DELETE SET NULL
);
    