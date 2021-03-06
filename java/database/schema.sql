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
    funFact1 varchar(250),
    funFact2 varchar(250),
    funFact3 varchar(250),

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



INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (1, 'Tokyo National Museum', '13-9 Uenokoen, Taito City, Tokyo 110-8712, Japan', 'The Tokyo National Museum is an art museum in Ueno Park in the Taito ward of Tokyo, Japan. It is one of four museums operated by the National Institutes for Cultural Heritage, and is considered the oldest national museum in Japan. It is also the largest art museum in Japan, as well as one of the largest in the world.', 4, true, 'Was originally known as the Imperial Museum until 1886.', 'The museum also conducts research and organizes educational events related to its collection.', 'Is an art museum that collects houses, and preserves a collection of art works and archaeological objects of Asia.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (2, 'Ghibli Museum', '1 Chome-1-83 Shimorenjaku, Mitaka, Tokyo 181-0013, Japan', 'Whimsical museum dedicated to the famed animation studio with a play area, theater & rooftop garden.', 5, true,  'was created in 2001.', 'is a museum showcasing the work of the Japanese animation studio Studio Ghibli.', 'Tickets to the Ghibli Museum are only accepted if bought in advance.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (3, 'Sens??-ji Temple', '2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan', 'Sens??-ji is an ancient Buddhist temple located in Asakusa, Tokyo, Japan. This buddhist temple is the oldest and one of the most significant temples in Tokyo.', 10, true,  'This temple was completed in 645, making it Tokyo''s oldest temple.', 'Legend says in the year 628, two brothers fished a statue of Kannon, the goddess of mercy, out of the Sumida River, and even though they put the statue back into the river, it always returned to them.', 'Consequently, Sens??-ji was built nearby for the goddess of Kannon.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (4, 'Ueno Park', 'Japan, ???110-0007 Tokyo, Taito City, Uenokoen, ??????????????????', 'A paradise-like oasis of green in the heart of busy Tokyo, Ueno Park (Ueno K??en) is the largest green space and one of the most popular tourist attractions in the city. In addition to its lovely grounds, the park also boasts numerous temples and museums to explore.', 8, true,  'Contains one of Tokyo''s most popular and lively cherry blossom spots with more than 1000 cherry trees lining its central pathway.', 'Famous for the many museums found on its grounds.', 'Also home to Ueno Zoo, Japan''s first zoological garden.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (5, 'Meiji Shrine', '1-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-8557, Japan', 'Construction of the splendid Meiji Shrine (Meiji Jing??) began in 1915 and was completed in 1926. Although the original structure was destroyed during WWII, it was rebuilt in 1958 and remains one of Tokyo''s most important religious sites.', 4, true,  'Dedicated to the deity of Emperor Meiji, the first emperor of modern Japan.', 'The spacious shrine grounds offer walking paths that are great for a relaxing stroll.', 'Entry into the shrine grounds is marked by a massive torii gate, after which the sights and sounds of the busy city are replaced by a tranquil forest.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (6, 'Tokyo Skytree', '1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045, Japan', 'The country''s tallest structure (and the world''s third tallest freestanding tower), the Tokyo Skytree opened in 2012 and has quickly become one of the city''s most visited tourist attractions thanks to the incredible panoramic views from its restaurant and observation decks.', 3, true,  'Functions as a television broadcasting tower and landmark of Tokyo.', 'With a height of 634 meters, it is the tallest structure in Japan and the second tallest in the world at the time of its completion.', 'The top floor features tall, broad windows that offer some of the best 360 degree panoramic views of the city.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (7, 'Kabuki-za Theatre', '4 Chome-12-15 Ginza, Chuo City, Tokyo 104-0061, Japan', 'Tokyo is home to a number of excellent theaters, none as well known as the historic Kabuki-za Theatre in the city''s busy Ginza district, home to famous traditional Kabuki performances. Based upon a medieval, highly skilled, and often burlesque theatrical form including song and dance, the theater''s performances are as popular among tourists as they are with Japanese-speaking people.', 9, true,  'The principal theater in Tokyo for the traditional kabuki drama form', 'Originally opened by a Meiji era journalist, Fukuchi Gen''ichir??, who wrote kabuki dramas in which Ichikawa Danj??r?? IX and others starred.', 'The theater is now run by the Shochiku Corporation which took over in 1914.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (8, 'Tsukiji Outer Market', '4 Chome-16???2??? Tsukiji, Chuo City, Tokyo 104-0045, Japan', 'Tsukiji Outer Market is Japan???s ???Food Town???, where one can encounter all kinds of traditional Japanese foods. A mixture of wholesale and retail shops, along with numerous restaurants, line the streets, and new culinary trends are born here.', 13, true,  'Resides in a district adjacent to the site of the former Tsukiji Wholesale Market.', 'Consists of a few blocks of wholesale and retail shops, as well as restaurants crowded along narrow lanes.', 'The restaurants are typically open from 5:00 in the morning to around noon or early afternoon.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (9, 'Hachiko Statue', '2 Chome-1 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan', 'Chuken Hachiko is a touching and heartbreaking story of the tight bond between a dog and his master. This statue was built in honor of Chuken Hachiko who eternally waited for his deceased master to return to him.', 78, true,  'Hachiko actually attended the unveiling of his own statue.', 'His story went ???viral??? in 1932 after it was published in the Asahi Shimbun newspaper.', 'One of Tokyo''s most popular meeting points.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (10, 'Nakamise-dori Street', '1 Chome-36-3 Asakusa, Taito City, Tokyo 111-0032, Japan', 'Get a feel for old-school Tokyo at one of Japan''s oldest shopping streets, Nakamise-dori, which dates back to the 17th century. Most shops in this area have been run by the same families for several generations, serving souvenirs, top-class street food and irresistible snacks.', 32, true,  'Best known for its traditional architecture and its proximity to the famous Senso-ji Temple.', 'One of the oldest shopping streets in Japan and it is believed to have been founded by neighbors of Sens??-ji who received permission by a governing warlord to set up shops near the temple???s entrance.', 'Stalls are open daily from 9am to 6pm, but the street is accessible at all times.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (11, 'Tokyo Disneyland', '1-1 Maihama, Urayasu, Chiba 279-0031, Japan', 'Tokyo Disneyland is a 115-acre theme park at the Tokyo Disney Resort in Urayasu, Chiba Prefecture, Japan, near Tokyo. It was the first Disney park to be built outside the United States and opened on April 15, 1983.', 190, true,  'Tokyo DisneySea opened nearby in 2001, as a part of the Tokyo Disney Resort.', 'Brings in over 17 million visitors per year.', 'Over 40 different attractions available to visitors.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (12, 'Harajuku', 'Jingumae Shibuya City, Tokyo 150-0001 Japan', 'Harajuku is a district in Shibuya, Tokyo, Japan, that is known internationally as a center of Japanese youth culture and fashion. Shopping and dining options include many small, youth-oriented, independent boutiques and caf??s, but the neighborhood also attracts many larger international chain stores with high-end luxury merchandisers extensively represented along Omotesando.', 22, true,  'The focal point of Harajuku''s teenage culture is Takeshita Dori and its side streets.', 'Whilst Harajuku is best known for its street style and shopping, be sure to pay a visit to the Meiji Jingu, an impressive shrine located close to the main station in the area.', 'Many fashion trends have started in the Harajuku area.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (13, 'Shinjuku Gyoen National Garden', '11 Naitomachi, Shinjuku City, Tokyo 160-0014, Japan', 'Shinjuku Gyoen is one of Tokyo''s largest and most popular parks. Located just a short walk from Shinjuku Station, the paid park''s spacious lawns, meandering walking paths and tranquil scenery provide a relaxing escape from the busy urban center around it.', 18, true,  'The park was almost completely destroyed during World War II, but was eventually rebuilt and reopened in 1949 as a public park.', 'Consists of three different types of gardens: a traditional Japanese landscape garden, a symmetrically arranged formal French garden, and an English landscape garden.', 'Great place to visit during autumn when the leaves change.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (14, 'Tokyo Dome City', '1 Chome-3-61 Koraku, Bunkyo City, Tokyo 112-8575, Japan', 'Tokyo Dome City is a leisure complex in central Tokyo consisting of the Tokyo Dome baseball stadium, an amusement park, the LaQua spa, a variety of shops and restaurants and Tokyo Dome Hotel. The amusement complex used to be known as Korakuen, named after the former baseball stadium, which in turn was named after Koishikawa Korakuen, a nearby Japanese landscape garden.', 19, true,  'Tokyo Dome, which seats 55,000, is the home stadium of the Yomiuri Giants, a professional baseball team.', 'Tokyo Dome City Attractions is an amusement park with various rides and entertainment facilities, including roller coasters, a ferris wheel and a tower that drops riders from a height of 80 meters.', 'Tokyo Dome Hotel consists of 43 floors and 1006 guest rooms with nice views of the city.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (15, 'Edo-Tokyo Museum', '1 Chome-4-1 Yokoami, Sumida City, Tokyo 130-0015, Japan', 'The Edo-Tokyo Museum is housed in a unique looking building in the Ryogoku district. The museum''s permanent exhibition vividly illustrates the past of Tokyo (known as Edo until 1869) through its exhibits and covers many features of the capital from the Edo Period to relatively recent decades.', 20, true,  'Volunteer guides speaking in English and other languages are available from 13:10 to 14:45.', 'In an interactive way, visitors are able to experience and learn about various aspects of earlier Tokyo, such as the way of life of people, Edo Period architecture, cultural heritage, political climate, commercial situation and more.', 'The museum has a sister museum in the western suburbs of Tokyo, the Edo-Tokyo Open Air Museum, which preserves and exhibits multiple historic buildings.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (16, 'Mount Mitake', 'address', 'Mount Mitake is one of the many highlights of the Chichibu-Tama-Kai National Park, which covers more than 1250 square kilometers of forested mountains, hills, gorges and some rural towns in the prefectures of Yamanashi, Saitama, Nagano and Tokyo.', 52, true,  'Besides a popular shrine, Mount Mitake offers various walking and hiking opportunities in virtually unspoiled nature.', 'This mountain can be reached in less than two hours from central Tokyo, making it a popular escape for people looking for a break from the city.', 'It is believed that Musashi-Mitake Shrine has been serving as a center of mountain worship for almost 2000 years.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (17, 'Ryogoku', '1 Chome-3-20 Yokoami, Sumida City, Tokyo 130-0015, Japan', 'Ryogoku is a district of Tokyo where the sumo stadium, many sumo stables, chanko restaurants and other sumo related attractions can be found, and is considered to be the center of the sumo world. Sumo events have been staged in this area for a long time, but until the beginning of the 20th century, sumo tournaments were held outdoors at shrines and temples.', 31, true,  'In 1909, the first permanent sumo hall was built in the Ryogoku area.', 'Today''s sumo stadium, the current Kokugikan, seats over 10,000 visitors and is the fourth built in Tokyo.', 'Among the several dozens of sumo stables currently in existence, many are located in the Ryogoku area. These are the places where sumo wrestlers live and train.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (18, 'Tokyo Sea Life Park', '6 Chome-2-3 Rinkaicho, Edogawa City, Tokyo 134-8587, Japan', 'Tokyo Sea Life Park is a public aquarium located in Edogawa Ward, Tokyo. Its most important aim is reproducing aquatic habitats in Tokyo and in the world.', 14, true,  'The park is divided into different sections: the deep sea, the Atlantic, Indian Ocean, Caribbean, and local Tokyo Bay aquatic life.', 'There are Arctic and Antarctic habitats as well as a kelp forest, and a section for water birds, including penguins.', 'Children under 12 can enter Tokyo Sea Life Park for free.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (19, 'Nakano Broadway', '5 Chome-52 Nakano, Nakano City, Tokyo 164-0001, Japan', 'Nakano Broadway is a shopping complex in Tokyo famous for its many stores selling anime items and idol goods, inlcuding more than a dozen small Mandarake stores, which specialize in manga and anime related collectibles. The shopping complex is a short walk from Nakano Station, which is five minute train ride from Shinjuku via the JR Chuo Line.', 45, true,  'There are four levels of shopping at Nakano Broadway. The second and third levels are where the many anime and idol related shops are located.', 'Here, shoppers can find manga, magazines, collectors'' items, animation character figurines, idol merchandise, game consoles, video games and animation/idol related CDs.', 'The ground level of the Nakano Broadway has shops selling clothes, shoes, tidbits and second hand goods.');
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive, funFact1, funFact2, funFact3) VALUES (20, 'Sengakuji Temple', '2 Chome-11-1 Takanawa, Minato City, Tokyo 108-0074, Japan', 'Sengakuji is a small temple near Shinagawa Station in Tokyo. The temple is famous for its graveyard where the "47 Ronin" (also known as Akoroshi, the "masterless samurai from Ako") are buried.', 23, true, 'The story of the 47 loyal ronin became highly popular as a kabuki play during the Edo Period, and remains very popular today.', 'Many people visit the temple in order to pay respect to the Akoroshi by burning incense sticks (senko) in the graveyard.', 'December 14 is the anniversary of the 47 ronin''s vengeance.');

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

