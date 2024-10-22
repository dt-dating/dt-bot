CREATE TYPE gender AS ENUM ('male', 'female');
CREATE TYPE education AS ENUM ('', '', '');
CREATE TYPE network_type AS ENUM ('', '', '');

CREATE TABLE users
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) not null,
	age SMALLINT,
	gender gender, 
	education education,
	work VARCHAR(255),
	timestmp timestamp
);

CREATE TABLE Credential
(
	user_id INT,
	phone_number INT,
	password VARCHAR(255)
);

CREATE TABLE UserRating
(
	user_id INT,
	fuck_rate INT,
	hard_poINT_rate INT,
	social_rate INT,
	active_rate INT
);

CREATE TABLE Matches
(
	match_id INT,
	initiator_id INT,
	responder_id INT,
	date_created timestamp
);

CREATE TABLE SocialLinks
(
	user_id SERIAL PRIMARY KEY,
	network_type network_type,
	url VARCHAR(255)
);

CREATE TABLE Photo
(
	user_id SERIAL PRIMARY KEY,
	photo_url VARCHAR(255)
);

CREATE TABLE Message
(
	id SERIAL PRIMARY KEY,
	content JSON
);
