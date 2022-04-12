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
    name varchar(80) not null,
    address varchar(80) not null,
    description varchar(2000),
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


INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (1, 'Tokyo National Mueseum', '13-9 Uenokoen, Taito City, Tokyo 110-8712, Japan', 'The Tokyo National Museum , Tokyo Kokuritsu Hakubutsukan) or TNM is an art museum in Ueno Park in the Taito ward of Tokyo, Japan. It is one of the four museums[a] operated by the National Institutes for Cultural Heritage , is considered the oldest national museum in Japan, is the largest art museum in Japan, and is one of the largest art museums in the world. The museum collects, preserves, and displays a comprehensive collection of artwork and cultural objects from Asia, with a focus on ancient and medieval Japanese art and Asian art along the Silk Road. There is also a large collection of Greco-Buddhist art. The museum holds over 110,000 Cultural Properties, including 89 National Treasures of Japan, 319 Horyuji Treasures, and 644 Important Cultural Properties.[b] In addition, the museum houses over 3000 Cultural Properties deposited by individuals and organizations, including 55 national treasures and 253 important cultural properties (as of March 2019).[2] The museum also conducts research and organizes educational events related to its collection.', 4, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (2, 'Universal Studios Japan', '2 chome 1-33 Sakurajima, Oosakashikonohana-ku, Osaka 554-0031', 'Universal Studios Japan offers world-class entertainment such as authentic attractions and shows, based not only on Hollywood blockbusters but also popular entertainment brands, and a variety of seasonal events entertaining its guests to the fullest. Universal Studios Japan has continued to evolve since its opening and has recently accelerated its growth with the launch of world-class entertainment experiences such as The Wizarding World of Harry Potter, The Flying Dinosaur and Minion Park and Despicable Me Minion Mayhem Ride. SUPER NINTENDO WORLD, a new area where you can enjoy entertainment based on world-renowned Nintendo characters and their worlds.', 5, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (3, 'Ghibli Museum', '1 Chome-1-83 Shimorenjaku, Mitaka, Tokyo 181-0013, Japan', 'Whimsical museum dedicated to the famed animation studio with a play area, theater & rooftop garden.', 5, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (4, 'Fushimi Inari Taisha', '68 Fukakusa Yabunouchicho, Fushimi Ward, Kyoto, 612-0882, Japan', 'Mountainside Shinto shrine dating from 711 A.D. featuring a path with hundreds of traditional gates.', 2, true);
INSERT INTO landmarks (landmarkId, name, address, description, rating , isActive) VALUES (5, 'Chureito Pagoda (Mt Fuji view)', '3353-1 Arakura, Fujiyoshida, Yamanashi 403-0011, Japan', 'The Chureito Pagoda is a five storied pagoda on the mountainside overlooking Fujiyoshida City and Mount Fuji off in the distance. The pagoda is part of the Arakura Sengen Shrine and was built as a peace memorial in 1963 nearly 400 steps up the mountain from the shrines main buildings. The location offers spectacular views of Mount Fuji in combination with the pagoda, especially during the cherry blossom season in mid April when there are hundreds of trees in bloom and during the autumn color season which usually takes place in the first half of November.', 4, true);

INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (1,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Tokyo_National_Museum%2C_Honkan_2010.jpg/1200px-Tokyo_National_Museum%2C_Honkan_2010.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (2,2,'https://image.arrivalguides.com/1230x800/00/8696e6a1843072d16aee646ca33d62ae.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (3,3,'https://mokolate.com/wp-content/uploads/2016/12/IMG_4687.jpg');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (4,4,'https://th.bing.com/th/id/R.ed936323f0a6585fcf6177b48041a839?rik=9k%2bfSbDoZQP1RA&riu=http%3a%2f%2fwww.greenandturquoise.com%2fwp-content%2fuploads%2f2015%2f05%2ffushimiinari.jpg&ehk=ZhB%2f%2fT3NxZG5jak4r6rWe%2f6nalvNnor8QZWgDSfYb30%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO photos (photoId, landmarkId, photoUrl) VALUES (5,5,'https://th.bing.com/th/id/OIP.taN-HZGAAF1NG6gO8FuxJQHaE8?pid=ImgDet&rs=1');


-- Add Admin User
INSERT INTO users (username,password_hash,role) VALUES ('testadmin','$2a$10$Vz4hb4fnuCQ2wk2Ytc5VP.fathuJdHiz0OuWHy6vc36pwaIvV3WVy','ROLE_ADMIN');




-- UPDATING SEQUENCES SO THERE ARE NO CLASHES WHEN APP RUNS WITH EXISTING KEYS...
ALTER SEQUENCE landmarks_landmarkId_seq RESTART WITH 100;




COMMIT TRANSACTION;

