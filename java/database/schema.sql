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
--INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (landmarkId, 'name', 'address', 'description', number, true);


INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (1, 'Tokyo National Mueseum', '13-9 Uenokoen, Taito City, Tokyo 110-8712, Japan', 'The Tokyo National Museum is an art museum in Ueno Park in the Taito ward of Tokyo, Japan. It is one of the four museums operated by the National Institutes for Cultural Heritage , is considered the oldest national museum in Japan, is the largest art museum in Japan, and is one of the largest art museums in the world.', 4, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (2, 'Ghibli Museum', '1 Chome-1-83 Shimorenjaku, Mitaka, Tokyo 181-0013, Japan', 'Whimsical museum dedicated to the famed animation studio with a play area, theater & rooftop garden.', 5, true);
<<<<<<< HEAD


=======
>>>>>>> 0f067b8bdbb58cf6bed1b9b0e45f5ede185f81c3
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (3, 'Sensoji Temple', '2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan', 'Sensō-ji is an ancient Buddhist temple located in Asakusa, Tokyo, Japan. This buddhist temple is the oldest and one of the most significant temples in Tokyo.', 10, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (4, 'Ueno Park', 'Japan, 〒110-0007 Tokyo, Taito City, Uenokoen, 池之端三丁目', 'A paradise-like oasis of green in the heart of busy Tokyo, Ueno Park (Ueno Kōen) is the largest green space and one of the most popular tourist attractions in the city. In addition to its lovely grounds, the park also boasts numerous temples and museums to explore.', 8, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (5, 'Meiji Shrine', '1-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-8557, Japan', 'Dedicated to Emperor Meiji and his wife, Empress Shōken, construction of the splendid Meiji Shrine (Meiji Jingū) began in 1915 and was completed in 1926. Although the original structure was destroyed during WWII, it was rebuilt in 1958 and remains one of Tokyo''s most important religious sites.', 4, true);

INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (6, 'Tokyo Skytree', '1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045, Japan', 'The country''s tallest structure (and the world''s tallest freestanding tower), the Tokyo Skytree opened in 2012 and has quickly become one of the city''s most visited tourist attractions thanks to the incredible panoramic views from its restaurant and observation decks.', 3, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (7, 'Kabuki-za Theatre', '4 Chome-12-15 Ginza, Chuo City, Tokyo 104-0061, Japan', 'Tokyo is home to a number of excellent theaters, none as well known as the historic Kabuki-za Theatre in the city''s busy Ginza district, home to famous traditional Kabuki performances. Based upon a medieval, highly skilled, and often burlesque theatrical form including song and dance, the theater''s performances are as popular among tourists as they are with Japanese-speaking people.', 9, true);
<<<<<<< HEAD


INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (8, 'Tsukiji Outer Market', '4 Chome-16番2号 Tsukiji, Chuo City, Tokyo 104-0045, Japan', 'Tsukiji Outer Market is Japan’s “Food Town,” where one can encounter all kinds of traditional Japanese foods. A mixture of wholesale and retail shops, along with numerous restaurants, line the streets, and new culinary trends are born here.', 13, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (9, 'Hachiko Statue', '2 Chome-1 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan', 'Chuken Hachiko is a touching and heartbreaking story of the tight bond between a dog and his master. This statue was built in honor of Chuken Hachiko who eternally waited for his deceased master to return to him.', 78, true);


=======
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (8, 'Tsukiji Outer Market', '4 Chome-16番2号 Tsukiji, Chuo City, Tokyo 104-0045, Japan', 'Tsukiji Outer Market is Japan’s “Food Town,” where one can encounter all kinds of traditional Japanese foods. A mixture of wholesale and retail shops, along with numerous restaurants, line the streets, and new culinary trends are born here.', 13, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (9, 'Hachiko Statue', '2 Chome-1 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan', 'Chuken Hachiko is a touching and heartbreaking story of the tight bond between a dog and his master. This statue was built in honor of Chuken Hachiko who eternally waited for his deceased master to return to him.', 78, true);
>>>>>>> 0f067b8bdbb58cf6bed1b9b0e45f5ede185f81c3
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (10, 'Nakamise-dori Street', '1 Chome-36-3 Asakusa, Taito City, Tokyo 111-0032, Japan', 'Get a feel for old-school Tokyo at one of Japan''s oldest shopping streets, Nakamise-dori, which dates back to the 17th century. Most shops in this arcade have been run by the same families for several generations, serving souvenirs, top-class street food and irresistible snacks.', 32, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (11, 'Tokyo Disneyland', '1-1 Maihama, Urayasu, Chiba 279-0031, Japan', 'Tokyo Disneyland is a 115-acre theme park at the Tokyo Disney Resort in Urayasu, Chiba Prefecture, Japan, near Tokyo. It was the first Disney park to be built outside the United States and it opened on April 15, 1983.', 190, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (12, 'Harajuku', 'Jingumae Shibuya City, Tokyo 150-0001 Japan', 'Harajuku is a district in Shibuya, Tokyo, Japan, that is known internationally as a center of Japanese youth culture and fashion. Shopping and dining options include many small, youth-oriented, independent boutiques and cafés, but the neighborhood also attracts many larger international chain stores with high-end luxury merchandisers extensively represented along Omotesando.', 22, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (13, 'Shinjuku Gyoen National Garden', '11 Naitomachi, Shinjuku City, Tokyo 160-0014, Japan', 'Shinjuku Gyoen is one of Tokyo''s largest and most popular parks. Located just a short walk from Shinjuku Station, the paid park''s spacious lawns, meandering walking paths and tranquil scenery provide a relaxing escape from the busy urban center around it.', 18, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (14, 'Tokyo Dome City', '1 Chome-3-61 Koraku, Bunkyo City, Tokyo 112-8575, Japan', 'Tokyo Dome City is a leisure complex in central Tokyo consisting of the Tokyo Dome baseball stadium, an amusement park, the LaQua spa, a variety of shops and restaurants and Tokyo Dome Hotel. The amusement complex used to be known as Korakuen, named after the former baseball stadium, which in turn was named after Koishikawa Korakuen, a nearby Japanese landscape garden.', 19, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (15, 'Edo-Tokyo Museum', '1 Chome-4-1 Yokoami, Sumida City, Tokyo 130-0015, Japan', 'The Edo-Tokyo Museum is housed in a unique looking building in the Ryogoku district. The museum''s permanent exhibition vividly illustrates the past of Tokyo (known as Edo until 1869) through its exhibits and covers many features of the capital from the Edo Period to relatively recent decades.', 20, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (16, 'Mount Mitake', 'address', 'Mount Mitake is one of the many highlights of the Chichibu-Tama-Kai National Park, which covers more than 1250 square kilometers of forested mountains, hills, gorges and some rural towns in the prefectures of Yamanashi, Saitama, Nagano and Tokyo.', 52, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (17, 'Ryogoku', '1 Chome-3-20 Yokoami, Sumida City, Tokyo 130-0015, Japan', 'Ryogoku is a district of Tokyo where the sumo stadium, many sumo stables, chanko restaurants and other sumo related attractions can be found, and is considered to be the center of the sumo world. Sumo events have been staged in this area for a long time, but until the beginning of the 20th century, sumo tournaments were held outdoors at shrines and temples.', 31, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (18, 'Tokyo Sea Life Park', '6 Chome-2-3 Rinkaicho, Edogawa City, Tokyo 134-8587, Japan', 'Tokyo Sea Life Park is a public aquarium located in Edogawa Ward, Tokyo. Its most important aim is reproducing aquatic habitats in Tokyo and in the world.', 14, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (19, 'Nakano Broadway', '5 Chome-52 Nakano, Nakano City, Tokyo 164-0001, Japan', 'Nakano Broadway is a shopping complex in Tokyo famous for its many stores selling anime items and idol goods, inlcuding more than a dozen small Mandarake stores, which specialize in manga and anime related collectibles. The shopping complex is a short walk from Nakano Station, which is five minute train ride from Shinjuku via the JR Chuo Line.', 45, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (20, 'Sengakuji Temple', '2 Chome-11-1 Takanawa, Minato City, Tokyo 108-0074, Japan', 'Sengakuji is a small temple near Shinagawa Station in Tokyo. The temple is famous for its graveyard where the "47 Ronin" (also known as Akoroshi, the "masterless samurai from Ako") are buried.', 23, true);

INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (1,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Tokyo_National_Museum%2C_Honkan_2010.jpg/1200px-Tokyo_National_Museum%2C_Honkan_2010.jpg');
<<<<<<< HEAD
--
--INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (2,2,'https://image.arrivalguides.com/1230x800/00/8696e6a1843072d16aee646ca33d62ae.jpg');
--INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (3,3,'https://mokolate.com/wp-content/uploads/2016/12/IMG_4687.jpg');
--INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (4,4,'https://th.bing.com/th/id/R.4758d7ef05fb25a24218a3a6a0217c39?rik=DBfhDvaPwBfSJQ&pid=ImgRaw&r=0');
--INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (5,5,'https://cdn7.japanrailpass.com.au/wp-content/uploads/2017/08/Chureito-pagoda-in-foreground-and-mount-fuji-in-background-during-sunrise-time.-Beautiful-nature-and-human-culture.jpg');
--


=======
>>>>>>> 0f067b8bdbb58cf6bed1b9b0e45f5ede185f81c3
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (2,2,'https://mokolate.com/wp-content/uploads/2016/12/IMG_4687.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (3,3,'https://cdn.cheapoguides.com/wp-content/uploads/sites/2/2020/05/sensoji-temple-iStock-1083328636-770x514.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (4,4, 'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/03/a0003134/img/basic/a0003134_main.jpg?20200514174020&q=80');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (5,5, 'https://cdn.shortpixel.ai/spai/w_800+q_glossy+ret_img+to_webp/https://www.timetravelturtle.com/wp-content/uploads/2013/04/Japan-2013-101_new.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (6,6, 'https://anaintercontinental-tokyo.jp/wp-content/uploads/2018/07/Tokyo_Skytree-1024x576.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (7,7, 'https://www.japanistry.com/wp-content/uploads/2017/09/Ginza-Kabuki-za-Gallery.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (8,8, 'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000140/img/basic/a0000140_main.jpg?20201030194232&q=80');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (9,9, 'https://vickiwongandhachi.com/wp-content/uploads/2019/01/shutterstock_190575380_641577798194-816x544.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (10,10, 'https://netmobius.freetls.fastly.net/images-stn-asakusa/61-Nakamise-Shopping-Street-Asakusa2.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (11,11, 'https://d23.com/app/uploads/2018/04/1180w-600h_041318_unique-things-at-tokyo-disneyland-780x440.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (12,12, 'https://s1.it.atcdn.net/wp-content/uploads/2014/03/Harajuku-800x600.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (13,13, 'https://www.japan-guide.com/g18/3034_001_01.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (14,14, 'https://www.japan-guide.com/g18/3039_01.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (15,15, 'https://www.japan-guide.com/g18/3070_01.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (16,16, 'https://www.japan-guide.com/g18/3036_01-1.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (17,17, 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Ryogoku_Great_Sumo_Hall_%28cropped%29.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (18,18, 'https://uniquevenues-en.metro.tokyo.lg.jp/venues/11607/images/mainvisual_01.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (19,19, 'https://cdn.cheapoguides.com/wp-content/uploads/sites/2/2016/12/nakano-broadway-iStock-929361390-770x513.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (20,20, 'https://content.fun-japan.jp/renewal-prod/cms/articles/content/8b6164b7a48e69d252a9d57fa951616a4684ee64.jpg');




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

