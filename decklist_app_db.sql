#decklist app database
#contains users, decks, cards, comments, privileges, changes

DROP DATABASE IF EXISTS decklist_app_db;
CREATE DATABASE IF NOT EXISTS decklist_app_db;
USE decklist_app_db;


CREATE TABLE IF NOT EXISTS users
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
username VARCHAR(100) UNIQUE NOT NULL);

CREATE TABLE IF NOT EXISTS decks 
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
deck_name VARCHAR(100),
user_id INTEGER NOT NULL,
parent_id INTEGER NULL);

CREATE TABLE IF NOT EXISTS cards 
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
card_name VARCHAR(140), 
qty INTEGER,
deck_id INTEGER,
FOREIGN KEY (deck_id) REFERENCES decks(id));

ALTER TABLE decks ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE decks ADD CONSTRAINT FOREIGN KEY (parent_id) REFERENCES decks(id);

CREATE TABLE IF NOT EXISTS comments
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
comment_title VARCHAR(100),
user_id INTEGER,
parent_id INTEGER);

ALTER TABLE comments ADD CONSTRAINT FOREIGN KEY (parent_id) REFERENCES comments(id);
ALTER TABLE comments ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE IF NOT EXISTS privilege_types
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
privilege_name VARCHAR(50));

CREATE TABLE IF NOT EXISTS user_privileges
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
privilege_id INTEGER,
FOREIGN KEY (privilege_id) REFERENCES privilege_types(id),
user_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(id),
deck_id INTEGER,
FOREIGN KEY (deck_id) REFERENCES decks(id));

#will hold revisions and will track differences between a deck and its children
#may end up being unnecessary since it could be calculated from a deck and its forks
CREATE TABLE IF NOT EXISTS changes
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
user_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(id),
deck_id INTEGER,
FOREIGN KEY (deck_id) REFERENCES decks(id),
comment_id INTEGER,
FOREIGN KEY (comment_id) REFERENCES comments(id));

CREATE TABLE IF NOT EXISTS grouping_types
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
grouping_name VARCHAR(50));

CREATE TABLE IF NOT EXISTS groupings
(id INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
user_id INTEGER,
#grouping_name will commonly be sideboard.  could also be used as changes
grouping_type INTEGER,
FOREIGN KEY (grouping_type) REFERENCES grouping_types(id),
FOREIGN KEY (user_id) REFERENCES users(id),
deck_id INTEGER,
FOREIGN KEY (deck_id) REFERENCES decks(id),
comment_id INTEGER,
FOREIGN KEY (comment_id) REFERENCES comments(id));









