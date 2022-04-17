BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP TABLE IF EXISTS itineraries;

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
    name varchar(80) not null,
    address varchar(80) not null,
    description varchar(2000),
    rating int,
    isActive boolean,

    CONSTRAINT pk_landmarks PRIMARY KEY (landmarkId)

);

CREATE TABLE itineraries (
    itineraryId serial,
    itineraryName varchar(50) not null,
    itineraryStart varchar(100) not null,
    landmarkList varchar(25),
    user_id int,

    CONSTRAINT pk_itineraries PRIMARY KEY (itineraryId),
    CONSTRAINT fk_photos_user_Id FOREIGN KEY (user_id) REFERENCES users(user_id)

);

CREATE TABLE photos (

    photoId serial,
    landmarkId int,
    photoUrl varchar(1000),


    CONSTRAINT pk_photos_photoId PRIMARY KEY (photoId),
    CONSTRAINT fk_photos_landmarkId FOREIGN KEY (landmarkId) REFERENCES landmarks(landmarkId)


);


INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (1, 'Tokyo National Mueseum', '13-9 Uenokoen, Taito City, Tokyo 110-8712, Japan', 'The Tokyo National Museum is an art museum in Ueno Park in the Taito ward of Tokyo, Japan. It is one of the four museums operated by the National Institutes for Cultural Heritage , is considered the oldest national museum in Japan, is the largest art museum in Japan, and is one of the largest art museums in the world.', 4, true);
--INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (2, 'Universal Studios Japan', '2 chome 1-33 Sakurajima, Oosakashikonohana-ku, Osaka 554-0031', 'Universal Studios Japan offers world-class entertainment such as authentic attractions and shows, based not only on Hollywood blockbusters but also popular entertainment brands, and a variety of seasonal events entertaining its guests to the fullest. ', 5, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (2, 'Ghibli Museum', '1 Chome-1-83 Shimorenjaku, Mitaka, Tokyo 181-0013, Japan', 'Whimsical museum dedicated to the famed animation studio with a play area, theater & rooftop garden.', 5, true);
--INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (4, 'Fushimi Inari Taisha', '68 Fukakusa Yabunouchicho, Fushimi Ward, Kyoto, 612-0882, Japan', 'Mountainside Shinto shrine dating from 711 A.D. featuring a path with hundreds of traditional gates.', 2, true);
--INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (5, 'Chureito Pagoda (Mt Fuji view)', '3353-1 Arakura, Fujiyoshida, Yamanashi 403-0011, Japan', 'The Chureito Pagoda is a five storied pagoda on the mountainside overlooking Fujiyoshida City and Mount Fuji off in the distance.', 4, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (3, 'Sensoji Temple', '2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan', 'Sensō-ji is an ancient Buddhist temple located in Asakusa, Tokyo, Japan. This buddhist temple is the oldest and one of the most significant temples in Japan.', 10, true);





INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (1,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Tokyo_National_Museum%2C_Honkan_2010.jpg/1200px-Tokyo_National_Museum%2C_Honkan_2010.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (2,2,'https://image.arrivalguides.com/1230x800/00/8696e6a1843072d16aee646ca33d62ae.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (3,3,'https://mokolate.com/wp-content/uploads/2016/12/IMG_4687.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (4,4,'https://th.bing.com/th/id/R.4758d7ef05fb25a24218a3a6a0217c39?rik=DBfhDvaPwBfSJQ&pid=ImgRaw&r=0');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (5,5,'https://cdn7.japanrailpass.com.au/wp-content/uploads/2017/08/Chureito-pagoda-in-foreground-and-mount-fuji-in-background-during-sunrise-time.-Beautiful-nature-and-human-culture.jpg');


-- Add Admin User
INSERT INTO users (username,password_hash,role) VALUES ('testadmin','$2a$10$Vz4hb4fnuCQ2wk2Ytc5VP.fathuJdHiz0OuWHy6vc36pwaIvV3WVy','ROLE_ADMIN');

--Itinerary Dummy Data
INSERT INTO itineraries (itineraryId, itineraryName, itineraryStart, landmarkList, user_id) VALUES (1, 'Tokyo Summer Vacay', 'Hanedakuko, Ota City, Tokyo 144-0041, Japan', '1,2,3', 3);
INSERT INTO itineraries (itineraryId, itineraryName, itineraryStart, landmarkList, user_id) VALUES (2, 'Tokyo Fall Vacay', 'Hanedakuko, Ota City, Tokyo 144-0041, Japan', '4,5', 3);
INSERT INTO itineraries (itineraryId, itineraryName, itineraryStart, landmarkList, user_id) VALUES (3, 'Tokyo Spring Vacay', 'Hanedakuko, Ota City, Tokyo 144-0041, Japan', '2,3,4,5', 3);





-- UPDATING SEQUENCES SO THERE ARE NO CLASHES WHEN APP RUNS WITH EXISTING KEYS...
ALTER SEQUENCE landmarks_landmarkId_seq RESTART WITH 100;
ALTER SEQUENCE itineraries_itineraryId_seq RESTART WITH 100;


COMMIT TRANSACTION;

