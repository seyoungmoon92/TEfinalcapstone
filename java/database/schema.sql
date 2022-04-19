BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP TABLE IF EXISTS itineraries;
SET client_encoding = 'UTF8';
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

INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (2, 'Ghibli Museum', '1 Chome-1-83 Shimorenjaku, Mitaka, Tokyo 181-0013, Japan', 'Whimsical museum dedicated to the famed animation studio with a play area, theater & rooftop garden.', 5, true);

INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (3, 'Sensoji Temple', '2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan', 'Sensō-ji is an ancient Buddhist temple located in Asakusa, Tokyo, Japan. This buddhist temple is the oldest and one of the most significant temples in Tokyo.', 10, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (4, 'Ueno Park', 'Japan, 〒110-0007 Tokyo, Taito City, Uenokoen, 池之端三丁目', 'A paradise-like oasis of green in the heart of busy Tokyo, Ueno Park (Ueno Kōen) is the largest green space and one of the most popular tourist attractions in the city. In addition to its lovely grounds, the park also boasts numerous temples and museums to explore.', 8, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (5, 'Meiji Shrine', '1-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-8557, Japan', 'Dedicated to Emperor Meiji and his wife, Empress Shōken, construction of the splendid Meiji Shrine (Meiji Jingū) began in 1915 and was completed in 1926. Although the original structure was destroyed during WWII, it was rebuilt in 1958 and remains one of Tokyo''s most important religious sites.', 4, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (6, 'Tokyo Skytree', '1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045, Japan', 'The country''s tallest structure (and the world''s tallest freestanding tower), the Tokyo Skytree opened in 2012 and has quickly become one of the city''s most visited tourist attractions thanks to the incredible panoramic views from its restaurant and observation decks.', 3, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (7, 'Kabuki-za Theatre', '4 Chome-12-15 Ginza, Chuo City, Tokyo 104-0061, Japan', 'Tokyo is home to a number of excellent theaters, none as well known as the historic Kabuki-za Theatre in the city''s busy Ginza district, home to famous traditional Kabuki performances. Based upon a medieval, highly skilled, and often burlesque theatrical form including song and dance, the theater''s performances are as popular among tourists as they are with Japanese-speaking people.', 9, true);

INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (8, 'Tsukiji Outer Market', '4 Chome-16番2号 Tsukiji, Chuo City, Tokyo 104-0045, Japan', 'Tsukiji Outer Market is Japan’s “Food Town,” where one can encounter all kinds of traditional Japanese foods. A mixture of wholesale and retail shops, along with numerous restaurants, line the streets, and new culinary trends are born here.', 13, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (9, 'Hachiko Statue', '2 Chome-1 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan', 'Chuken Hachiko is a touching and heartbreaking story of the tight bond between a dog and his master. This statue was built in honor of Chuken Hachiko who eternally waited for his deceased master to return to him.', 78, true);

INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (10, 'Nakamise-dori Street', '1 Chome-36-3 Asakusa, Taito City, Tokyo 111-0032, Japan', 'Get a feel for old-school Tokyo at one of Japan''s oldest shopping streets, Nakamise-dori, which dates back to the 17th century. Most shops in this arcade have been run by the same families for several generations, serving souvenirs, top-class street food and irresistible snacks.', 32, true);


INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (1,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Tokyo_National_Museum%2C_Honkan_2010.jpg/1200px-Tokyo_National_Museum%2C_Honkan_2010.jpg');

INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (2,2,'https://mokolate.com/wp-content/uploads/2016/12/IMG_4687.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (3,3,'https://cdn.cheapoguides.com/wp-content/uploads/sites/2/2020/05/sensoji-temple-iStock-1083328636-770x514.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (4,4, 'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/03/a0003134/img/basic/a0003134_main.jpg?20200514174020&q=80');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (5,5, 'https://cdn.shortpixel.ai/spai/w_800+q_glossy+ret_img+to_webp/https://www.timetravelturtle.com/wp-content/uploads/2013/04/Japan-2013-101_new.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (6,6, 'https://anaintercontinental-tokyo.jp/wp-content/uploads/2018/07/Tokyo_Skytree-1024x576.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (7,7, 'https://www.japanistry.com/wp-content/uploads/2017/09/Ginza-Kabuki-za-Gallery.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (8,8, 'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000140/img/basic/a0000140_main.jpg?20201030194232&q=80');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (9,9, 'https://vickiwongandhachi.com/wp-content/uploads/2019/01/shutterstock_190575380_641577798194-816x544.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (10,10, 'https://netmobius.freetls.fastly.net/images-stn-asakusa/61-Nakamise-Shopping-Street-Asakusa2.jpg');


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

