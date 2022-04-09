BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


CREATE TABLE landmarks (
    landmarkId serial,
    address varchar(80) not null,
    description varchar(255),
    rating int,
    isActive boolean,

    CONSTRAINT pk_landmarks PRIMARY KEY (landmarkId)

);

CREATE TABLE photos (

    photoId serial,
    landmarkId int,
    photoUrl varchar(1000),


    CONSTRAINT pk_photos_photoId PRIMARY KEY (photoId),
    CONSTRAINT fk_photos_landmarkId FOREIGN KEY (landmarkId) REFERENCES landmarks(landmarkId)


);






--CREATE TABLE landmarks_reviews (
--    landmarkId int,
--    reviewId int
--
--    CONSTRAINT fk_landmarks FOREIGN KEY (landmarkId),
--    CONSTRAINT fk_reviews FOREIGN KEY (reviewId)
--);
--
--CREATE TABLE reviews (
--    reviewId serial,
--    name varchar(50),
--    title varchar(60),
--    body varchar(255)
--
--    CONSTRAINT pk_reviews PRIMARY KEY (reviewId)
--);
--


--CREATE TABLE itinerary (
--    user_id int,
--    landmarkId int
--
--    CONSTRAINT FK_user FOREIGN KEY (user_id),
--    CONSTRAINT FK_landmarks FOREIGN KEY (landmarkId)
--
--);






INSERT INTO landmarks (landmarkId, address, description, rating , isActive) VALUES (1, 'test road', 'test description1', 4, true);
INSERT INTO landmarks (landmarkId, address, description, rating , isActive) VALUES (2, 'test1 road', 'test description2', 5, true);
INSERT INTO landmarks (landmarkId, address, description, rating , isActive) VALUES (3, 'test2 road', 'test description3', 1, true);
INSERT INTO landmarks (landmarkId, address, description, rating , isActive) VALUES (4, 'test3 road', 'test description4', 2, true);
INSERT INTO landmarks (landmarkId, address, description, rating , isActive) VALUES (5, 'test4 road', 'test description5', 3, true);

INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (1,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/080103_hakkai_fuji.jpg/1200px-080103_hakkai_fuji.jpg');




-- UPDATING SEQUENCES SO THERE ARE NO CLASHES WHEN APP RUNS WITH EXISTING KEYS...
ALTER SEQUENCE landmarks_landmarkId_seq RESTART WITH 100;




COMMIT TRANSACTION;

