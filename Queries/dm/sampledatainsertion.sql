--Venues
INSERT INTO Venues (venueName, venueLocation, capacity)
VALUES
  ('Asme Stadium', 'Addis Ababa', 4000),
  ('Abiy Hersamo Stadium', 'Hossana', 5000),
  ('Addis Ababa Stadium', 'Addis Ababa', 35000),
  ('Arba Minch Stadium', 'Arba Minch', 5000),
  ('Bahir Dar Stadium', 'Bahir Dar', 60000),
  ('Dire Dawa Stadium', 'Dire Dawa', 18000),
  ('Fasiledes Stadium', 'Gondar', 20000),
  ('Hawassa Stadium', 'Hawassa', 25000),
  ('Sodo Stadium', 'Wolaita Sodo', 30000),
  ('Wolkite Stadium', 'Wolkite', 1500);
  select * from venues
delete venues
--Clubs

-- Insert statements for Clubs with venueIDs
INSERT INTO Clubs (clubName, clubAbbreviation, home, city, country, email, website, twitter, instagram, facebook, youtube, tikTok)
VALUES
  ('ACT FC', 'AFC', 11, 'Adama', 'Ethiopia', 'info@adamacityfc.com', 'www.adamacityfc.com', '@AdamaCityFC', '@cityfc', '@AdamaCityFC', 'Adama City FC', '@adamacityfc'),
  ('Hadiya Hossana', 'HAD', 2, 'Hossana', 'Ethiopia', 'info@hadiyahossanafc.com', 'www.hadiyahossanafc.com', '@HadiyaHossana', '@hadiyahossanafc', '@HadiyaHossanaFC', 'Hadiya Hossana FC', '@hadiyahossana'),
  ('Ethiopian Coffee', 'ECF', 3, 'Addis Ababa', 'Ethiopia', 'info@ethiopiancoffeefc.com', 'www.ethiopiancoffeefc.com', '@EthiopianCoffee', '@ethiopiancoffeefc', '@EthiopianCoffeeFC', 'Ethiopian Coffee FC', '@ethiopiancoffeefc'),
  ('Mekelakeya', 'MEK', 3, 'Addis Ababa', 'Ethiopia', 'info@mekelakeyafc.com', 'www.mekelakeyafc.com', '@MekelakeyaFC', '@mekelakeyafc', '@MekelakeyaFC', 'Mekelakeya FC', '@mekelakeyafc'),
  ('Saint George', 'STG', 3, 'Addis Ababa', 'Ethiopia', 'info@saintgeorgefc.com', 'www.saintgeorgefc.com', '@SaintGeorgeFC', '@saintgeorgefc', '@SaintGeorgeFC', 'Saint George FC', '@saintgeorgefc'),
  ('Arba Minch', 'ARM', 4, 'Arba Minch', 'Ethiopia', 'info@arbaminchcityfc.com', 'www.arbaminchcityfc.com', '@ArbaMinchCity', '@arbaminchcityfc', '@ArbaMinchCityFC', 'Arba Minch City FC', '@arbaminchcityfc'),
  ('Bahir Dar Kenema', 'BDK', 5, 'Bahir Dar', 'Ethiopia', 'info@bahirdarkenemafc.com', 'www.bahirdarkenemafc.com', '@BahirDarKenema', '@bahirdarkenemafc', '@BahirDarKenemaFC', 'Bahir Dar Kenema FC', '@bahirdarkenemafc'),
  ('Dire Dawa City', 'DDC', 6, 'Dire Dawa', 'Ethiopia', 'info@diredawacityfc.com', 'www.diredawacityfc.com', '@DireDawaCity', '@diredawacityfc', '@DireDawaCityFC', 'Dire Dawa City FC', '@diredawacityfc'),
  ('Fasil Kenema', 'FSK', 7, 'Gondar', 'Ethiopia', 'info@fasilkenemafc.com', 'www.fasilkenemafc.com', '@FasilKenema', '@fasilkenemafc', '@FasilKenemaFC', 'Fasil Kenema FC', '@fasilkenemafc'),
  ('Sidama Coffee', 'SID', 8, 'Hawassa', 'Ethiopia', 'info@sidamacoffeefc.com', 'www.sidamacoffeefc.com', '@SidamaCoffeeFC', '@sidamacoffeefc', '@SidamaCoffeeFC', 'Sidama Coffee FC', '@sidamacoffeefc'),
  ('Wolaitta Dicha', 'WOL', 9, 'Wolaita Sodo', 'Ethiopia', 'info@wolaittadichafc.com', 'www.wolaittadichafc.com', '@WolaittaDichaFC', '@wolaittadichafc', '@WolaittaDichaFC', 'Wolaitta Dicha FC', '@wolaittadichafc'),
  ('Wolkite City', 'WKC', 10, 'Wolkite', 'Ethiopia', 'info@wolkitecityfc.com', 'www.wolkitecityfc.com', '@WolkiteCityFC', '@wolkitecityfc', '@WolkiteCityFC', 'Wolkite City FC', '@wolkitecityfc');

  select * from Clubs


 -- Insert statements for Managers
INSERT INTO Managers (firstName, middleName, lastName, email, nationality, managerStatus, DOB, managerBio, salaryAmount)
VALUES
  ('Mark', NULL, 'Johnson', 'mark.johnson@example.com', 'England', 'Active', '1980-03-18', 'Experienced manager known for developing disciplined teams and fostering strategic gameplay.', 82000),
  ('Emoty', NULL, 'Wilson', 'emy.wilson@example.com', 'USA', 'Active', '1978-11-27', 'Innovative manager with a strong focus on player development and tactical flexibility.', 79000),
  ('Daniel', NULL, 'Clark', 'daniel.clark@example.com', 'Spain', 'Active', '1985-09-08', 'Strategically-minded manager with a commitment to building strong defensive structures.', 78000),
  ('Edwin', NULL, 'Martinez', 'ED.martinez@example.com', 'Spain', 'Active', '1982-07-14', 'Energetic manager known for fostering an attacking style of play and creative team dynamics.', 82000),
  ('Brian', NULL, 'Harris', 'brian.harris@example.com', 'USA', 'Active', '1973-04-21', 'Accomplished manager with a history of leading teams to domestic and international successes.', 80000),
  ('Habtamu', 'Kebede', 'Tadesse', 'habtamu.tadesse@example.com', 'Ethiopia', 'Active', '1980-03-18', 'Experienced Ethiopian manager known for nurturing local talents and building a strong team ethos.', 82000),
  ('Sara', 'Wondimu', 'Mengistu', 'sara.mengistu@example.com', 'Ethiopia', 'Active', '1978-11-27', 'Dedicated manager with a focus on developing disciplined tactical strategies and player growth.', 79000),
  ('Dawit', 'Birhanu', 'Girma', 'dawit.girma@example.com', 'Ethiopia', 'Active', '1985-09-08', 'Young Ethiopian manager with a passion for innovative tactics and dynamic attacking play.', 78000),
  ('Yohannes', 'Assefa', 'Assefa', 'yohannes.assefa@example.com', 'Ethiopia', 'Active', '1982-07-14', 'Ethiopian manager dedicated to building a cohesive team structure and maximizing player potential.', 82000),
  ('Mulu', 'Mekonnen', 'Alemu', 'mulu.alemu@example.com', 'Ethiopia', 'Active', '1973-04-21', 'Experienced manager with a history of leading teams to domestic successes and international tournaments.', 80000),
  ('Berhanu', 'Tesfaye', 'Tekle', 'brhan.tekle@example.com', 'Ethiopia', 'Active', '1986-12-02', 'Young Ethiopian manager focused on player development and fostering an attacking style of play.', 75000),
  ('Amare', 'Abera', 'Woldemariam', 'amare.woldemariam@example.com', 'Ethiopia', 'Active', '1979-08-05', 'Motivated manager with a commitment to building a strong team culture and developing tactical depth.', 79000),
  ('Hanna', 'Hagos', 'Gebre', 'hanna.gebre@example.com', 'Ethiopia', 'Active', '1981-06-19', 'Strategically-minded manager known for solid defensive tactics and disciplined player development.', 77000),
  ('Cal', NULL, 'Walker', 'cal.walker@example.com', 'England', 'Active', '1986-12-02', 'Energetic and innovative manager with a focus on building a versatile playing style and strong team cohesion.', 75000),
  ('Paul', NULL, 'White', 'paul.white@example.com', 'England', 'Active', '1979-08-05', 'Experienced English manager with a strong history of leading top clubs to domestic and international success.', 79000),
  ('Mariano', NULL, 'Anderson', 'm.anderson@example.com', 'USA', 'Active', '1981-06-19', 'Creative and visionary manager known for fostering a culture of attacking play and player empowerment.', 77000);
  select top 15 * from Clubs
  select top 15 * from Managers

--ClubMangers
INSERT INTO ClubsManagers (clubID, managerID, startDate, endDate)
VALUES
  (1, 2, '2022-05-15', NULL),
  (2, 3, '2021-10-20', NULL),
  (3, 4, '2020-07-01', NULL),
  (4, 5, '2019-09-10', NULL),
  (5, 6, '2018-03-25', NULL),
  (6, 7, '2022-08-10', NULL),
  (7, 8, '2021-11-05', NULL),
  (8, 9, '2020-09-30', NULL),
  (9, 10, '2019-06-15', NULL),
  (10, 11, '2018-12-01', NULL),
  (11, 12, '2022-04-01', NULL),
  (12, 13, '2021-07-25', NULL);



--players
INSERT INTO Players (firstName, middleName, lastName, DOB, cityOB, countryOB, nationality, height, clubID, position, squadNumber, salaryAmount, paymentFrequency, email, twitter, instagram, facebook, youtube, tikTok) VALUES
  ('Abel','Tesfaye','Gebre','1995-03-15','Adama','Ethiopia','Ethiopian',180,1,'Forward',10,10000,'Monthly','abel@example.com','@abeltesfaye','@abeltesfaye','@abeltesfayeofficial','Abel Tesfaye','@abeltesfaye'),
  ('Solomon','Tadesse','Girma','1992-08-25','Addis Ababa','Ethiopia','Ethiopian',185,1,'Defender',5,8000,'Monthly','solomon@example.com','@solomontad','@solomontad','@solomontadofficial','Solomon Tadesse','@solomontad'),
  ('Yordanos','Lemma','Mulugeta','1997-11-02','Adama','Ethiopia','Ethiopian',173,1,'Midfielder',8,8500,'Monthly','eyerus@example.com','@eyeruslemma','@eyeruslemma','@eyeruslemmaofficial','Eyerus Lemma','@eyeruslemma'),
  ('Mesfin','Bekele','Demeke','1994-06-19','Hawassa','Ethiopia','Ethiopian',182,1,'Goalkeeper',1,7500,'Monthly','mesfin@example.com','@mesfinbekele','@mesfinbekele','@mesfinbekeleofficial','Mesfin Bekele','@mesfinbekele'),
  ('Abayneh','Kebede','Mekonnen','1996-09-10','Addis Ababa','Ethiopia','Ethiopian',177,1,'Forward',9,9500,'Monthly','abayneh@example.com','@abaynehk','@abaynehk','@abaynehkofficial','Abayneh Kebede','@abaynehk'),
  ('Dinknesh','Tekle','Alemu','1998-02-14','Adama','Ethiopia','Ethiopian',165,1,'Midfielder',20,7000,'Monthly','dinknesh@example.com','@dinknesht','@dinknesht','@dinkneshtofficial','Dinknesh Tekle','@dinknesht'),
  ('Getahun','Admasu','Wolde','1993-07-29','Arba Minch','Ethiopia','Ethiopian',179,1,'Defender',4,8200,'Monthly','getahun@example.com','@getahunad','@getahunad','@getahunadofficial','Getahun Admasu','@getahunad'),
  ('Merha','Girma','Woldemariam','1996-12-08','Addis Ababa','Ethiopia','Ethiopian',172,1,'Midfielder',18,7200,'Monthly','meron@example.com','@merongirma','@merongirma','@merongirmaofficial','Meron Girma','@merongirma'),
  ('Amanuel','Seifu','Asfaw','1991-04-17','Addis Ababa','Ethiopia','Ethiopian',183,1,'Forward',11,10500,'Monthly','amanuel@example.com','@amanuelseifu','@amanuelseifu','@amanuelseifuofficial','Amanuel Seifu','@amanuelseifu'),
  ('Halaba','Ayele','Belete','1994-10-03','Adama','Ethiopia','Ethiopian',169,1,'Forward',7,8900,'Monthly','hana@example.com','@hanaayele','@hanaayele','@hanaayeleofficial','Hana Ayele','@hanaayele'),
  ('Daniel','Zewdu','Woldemichael','1997-01-22','Addis Ababa','Ethiopia','Ethiopian',178,1,'Midfielder',15,7800,'Monthly','daniel@example.com','@danielzewdu','@danielzewdu','@danielzewduofficial','Daniel Zewdu','@danielzewdu'),
  ('Yoseph','Worku','Tilahun','1995-09-12','Addis Ababa','Ethiopia','Ethiopian',176,1,'Midfielder',16,7600,'Monthly','yoseph@example.com','@yosephworku','@yosephworku','@yosephworkuofficial','Yoseph Worku','@yosephworku'),
  ('Tsehay','Tesfaye','Lemma','1998-03-28','Adama','Ethiopia','Ethiopian',181,1,'Defender',6,8300,'Monthly','tsehaye@example.com','@tsehayet','@tsehayet','@tsehayetofficial','Tsehaye Tesfaye','@tsehayet'),
  ('Yared','Tefera','Alemu','1993-12-10','Hossana','Ethiopia','Ethiopian',184,1,'Goalkeeper',21,7200,'Monthly','yared@example.com','@yaredtefera','@yaredtefera','@yaredteferaofficial','Yared Tefera','@yaredtefera'),
  ('Selam','Kebede','Hailemariam','1997-05-07','Addis Ababa','Ethiopia','Ethiopian',170,1,'Forward',14,7700,'Monthly','selam@example.com','@selamkebede','@selamkebede','@selamkebedeofficial','Selam Kebede','@selamkebede'),
  ('Raheem','Teferi','Getachew','1996-04-20','Hossana','Ethiopia','Ethiopian',167,2,'Forward',11,7500,'Monthly','rahel@example.com','@rahelteferi','@rahelteferi','@rahelteferiofficial','Rahel Teferi','@rahelteferi'),
  ('Yonas','Mulugeta','Mekonen','1995-11-18','Hossana','Ethiopia','Ethiopian',175,2,'Midfielder',8,7000,'Monthly','yonas@example.com','@yonasmulugeta','@yonasmulugeta','@yonasmulugetaofficial','Yonas Mulugeta','@yonasmulugeta'),
  ('Edom','Gebre','Tsegaye','1994-08-12','Hossana','Ethiopia','Ethiopian',169,2,'Forward',9,7800,'Monthly','edom@example.com','@edomgebre','@edomgebre','@edomgebreofficial','Edom Gebre','@edomgebre'),
  ('Tadesse','Lemma','Kebede','1997-03-05','Hossana','Ethiopia','Ethiopian',180,2,'Defender',5,7200,'Monthly','tadesse@example.com','@tadesselemma','@tadesselemma','@tadesselemmaofficial','Tadesse Lemma','@tadesselemma'),
  ('Fiker','Girma','Alemu','1993-09-08','Hossana','Ethiopia','Ethiopian',175,2,'Midfielder',18,7300,'Monthly','fiker@example.com','@fikergirma','@fikergirma','@fikergirmaofficial','Fiker Girma','@fikergirma'),
  ('Mulu','Teferi','Tilahun','1998-01-31','Hossana','Ethiopia','Ethiopian',168,2,'Forward',7,7600,'Monthly','mulu@example.com','@muluteferi','@muluteferi','@muluteferiofficial','Mulu Teferi','@muluteferi'),
  ('Dawit','Mekonnen','Alemu','1994-07-14','Hossana','Ethiopia','Ethiopian',172,2,'Midfielder',10,7100,'Monthly','dawit@example.com','@dawitmekonnen','@dawitmekonnen','@dawitmekonnenofficial','Dawit Mekonnen','@dawitmekonnen'),
  ('Genet','Abera','Tekle','1996-12-25','Hossana','Ethiopia','Ethiopian',167,2,'Defender',6,7300,'Monthly','genet@example.com','@genetabera','@genetabera','@genetaberaofficial','Genet Abera','@genetabera'),
  ('Fitsum','Bekele','Kebede','1995-02-28','Hossana','Ethiopia','Ethiopian',176,2,'Midfielder',16,7200,'Monthly','fitsum@example.com','@fitsumbekele','@fitsumbekele','@fitsumbekeleofficial','Fitsum Bekele','@fitsumbekele'),
  ('Selamawit','Girma','Demissie','1992-10-10','Hossana','Ethiopia','Ethiopian',170,2,'Midfielder',15,7400,'Monthly','selamawit@example.com','@selamawitgirma','@selamawitgirma','@selamawitgirmaofficial','Selamawit Girma','@selamawitgirma'),
  ('Samuel','Tesfaye','Lemma','1997-07-03','Hossana','Ethiopia','Ethiopian',175,2,'Forward',12,7900,'Monthly','samuel@example.com','@samueltesfaye','@samueltesfaye','@samueltesfayeofficial','Samuel Tesfaye','@samueltesfaye'),
  ('Betelhem','Alemu','Woldemariam','1993-05-22','Hossana','Ethiopia','Ethiopian',168,2,'Defender',3,7100,'Monthly','betelhem@example.com','@betelhemalemu','@betelhemalemu','@betelhemalemuofficial','Betelhem Alemu','@betelhemalemu'),
  ('Yohannes','Mekonnen','Teferi','1998-09-16','Hossana','Ethiopia','Ethiopian',180,2,'Forward',17,7600,'Monthly','yohannes@example.com','@yohannesmekonnen','@yohannesmekonnen','@yohannesmekonnenofficial','Yohannes Mekonnen','@yohannesmekonnen'),
  ('Tigist','Wondimu','Asfaw','1994-03-08','Hossana','Ethiopia','Ethiopian',167,2,'Defender',4,7200,'Monthly','tigist@example.com','@tigistwondimu','@tigistwondimu','@tigistwondimuofficial','Tigist Wondimu','@tigistwondimu'),
  ('Ephrem','Berhanu','Kebede','1996-06-30','Hossana','Ethiopia','Ethiopian',175,2,'Goalkeeper',13,7500,'Monthly','ephrem@example.com','@ephremberhanu','@ephremberhanu','@ephremberhanuofficial','Ephrem Berhanu','@ephremberhanu'),
  ('Tesfaye','Kebede','Girma','1993-09-12','Addis Ababa','Ethiopia','Ethiopian',181,3,'Forward',10,8000,'Monthly','tesfaye@example.com','@tesfayekebede','@tesfayekebede','@tesfayekebedeofficial','Tesfaye Kebede','@tesfayekebede'),
  ('Mulualem','Tilahun','Tadesse','1997-05-30','Hawassa','Ethiopia','Ethiopian',177,3,'Midfielder',8,7500,'Monthly','mulualem@example.com','@mulualemtilahun','@mulualemtilahun','@mulualemtilahunofficial','Mulualem Tilahun','@mulualemtilahun'),
  ('Ahmed','Mohammed','Ali','1994-12-20','Jijiga','Ethiopia','Ethiopian',182,3,'Forward',9,8200,'Monthly','ahmed@example.com','@ahmedmohammed','@ahmedmohammed','@ahmedmohammedofficial','Ahmed Mohammed','@ahmedmohammed'),
  ('Abdi','Abdullahi','Hussein','1996-08-05','Dire Dawa','Ethiopia','Ethiopian',185,3,'Midfielder',7,7800,'Monthly','abdi@example.com','@abdiabdullahi','@abdiabdullahi','@abdiabdullahiofficial','Abdi Abdullahi','@abdiabdullahi'),
  ('Samuel','Daniel','Tesfaye','1995-02-18','Addis Ababa','Ethiopia','Ethiopian',180,3,'Defender',4,7600,'Monthly','samuel@example.com','@samueldaniel','@samueldaniel','@samueldanielofficial','Samuel Daniel','@samueldaniel'),
  ('Hicham','Ali','Benali','1992-07-23','Casablanca','Morocco','Moroccan',178,3,'Midfielder',18,8500,'Monthly','hicham@example.com','@hichamali','@hichamali','@hichamaliofficial','Hicham Benali','@hichamali'),
  ('Girma','Getachew','Fikre','1997-03-12','Addis Ababa','Ethiopia','Ethiopian',183,3,'Forward',11,7900,'Monthly','girma@example.com','@girmagetachew','@girmagetachew','@girmagetachewofficial','Girma Getachew','@girmagetachew'),
  ('Yonatan','Wondimu','Mulu','1996-09-08','Addis Ababa','Ethiopia','Ethiopian',184,3,'Midfielder',6,7700,'Monthly','yonatan@example.com','@yonatanwondimu','@yonatanwondimu','@yonatanwondimuofficial','Yonatan Wondimu','@yonatanwondimu'),
  ('Redouane','Ahmed','El Ghaoui','1994-06-02','Casablanca','Morocco','Moroccan',179,3,'Forward',22,8300,'Monthly','redouane@example.com','@redouaneahmed','@redouaneahmed','@redouaneahmedofficial','Redouane Ahmed','@redouaneahmed'),
  ('Nahom','Alemayehu','Abebe','1993-11-15','Addis Ababa','Ethiopia','Ethiopian',176,3,'Defender',15,7400,'Monthly','nahom@example.com','@nahomalemayehu','@nahomalemayehu','@nahomalemayehuofficial','Nahom Alemayehu','@nahomalemayehu'),
  ('Ayman','Omar','Khalifa','1998-04-28','Cairo','Egypt','Egyptian',182,3,'Midfielder',20,8100,'Monthly','ayman@example.com','@aymanomar','@aymanomar','@aymanomarofficial','Ayman Omar','@aymanomar'),
  ('Asrat','Yimer','Mulu','1995-07-17','Addis Ababa','Ethiopia','Ethiopian',180,3,'Forward',12,7600,'Monthly','asrat@example.com','@asratyimer','@asratyimer','@asratyimerofficial','Asrat Yimer','@asratyimer'),
  ('Ivan','Sergeyevich','Romanov','1994-12-08','Moscow','Russia','Russian',186,3,'Midfielder',23,8400,'Monthly','ivan@example.com','@ivanromanov','@ivanromanov','@ivanromanovofficial','Ivan Romanov','@ivanromanov'),
  ('Alazar','Tadesse','Woldesenbet','1997-08-21','Addis Ababa','Ethiopia','Ethiopian',181,3,'Forward',16,7800,'Monthly','alazar@example.com','@alazartadesse','@alazartadesse','@alazartadesseofficial','Alazar Tadesse','@alazartadesse'),
  ('Oscar','Rodriguez','Silva','1996-03-14','Madrid','Spain','Spanish',180,3,'Goalkeeper',19,7900,'Monthly','oscar@example.com','@oscarrodriguez','@oscarrodriguez','@oscarrodriguezofficial','Oscar Rodriguez','@oscarrodriguez'),
  ('Alemu','Wondimu','Mekonnen','1993-03-10','Addis Ababa','Ethiopia','Ethiopian',176,4,'Forward',9,7800,'Monthly','alemu@example.com','@alemuwondimu','@alemuwondimu','@alemuwondimuofficial','Alemu Wondimu','@alemuwondimu'),
  ('Dawit','Amanuel','Tekle','1994-08-15','Addis Ababa','Ethiopia','Ethiopian',179,4,'Midfielder',7,7600,'Monthly','dawit@example.com','@dawitamanuel','@dawitamanuel','@dawitamanuelofficial','Dawit Amanuel','@dawitamanuel'),
  ('Ahmed','Abdullahi','Hussein','1997-12-20','Dire Dawa','Ethiopia','Ethiopian',182,4,'Forward',10,8000,'Monthly','ahmed@example.com','@ahmedabdullahi','@ahmedabdullahi','@ahmedabdullahiofficial','Ahmed Abdullahi','@ahmedabdullahi'),
  ('Semere','Alem','Girma','1995-05-28','Mekelle','Ethiopia','Ethiopian',180,4,'Forward',11,7900,'Monthly','semere@example.com','@semerealem','@semerealem','@semerealemofficial','Semere Alem','@semerealem'),
  ('Yonas','Mulualem','Mekonnen','1993-08-18','Addis Ababa','Ethiopia','Ethiopian',175,4,'Midfielder',8,7500,'Monthly','yonas@example.com','@yonasmulualem','@yonasmulualem','@yonasmulualemofficial','Yonas Mulualem','@yonasmulualem'),
  ('Emily','Marie','Dubois','1996-01-05','Paris','France','French',168,4,'Forward',5,7700,'Monthly','emily@example.com','@emilydubois','@emilydubois','@emilyduboisofficial','Emily Dubois','@emilydubois'),
  ('Solomon','Gebre','Tadesse','1992-07-12','Addis Ababa','Ethiopia','Ethiopian',182,4,'Defender',3,7400,'Monthly','solomon@example.com','@solomongebre','@solomongebre','@solomongebreofficial','Solomon Gebre','@solomongebre'),
  ('Ruth','Marie','Dubois','1994-04-18','Paris','France','French',171,4,'Midfielder',6,7600,'Monthly','ruth@example.com','@ruthdubois','@ruthdubois','@ruthduboisofficial','Ruth Dubois','@ruthdubois'),
  ('Luel','Tesfaye','Yohannes','1997-03-25','Asmara','Eritrea','Eritrean',178,4,'Forward',12,7800,'Monthly','luel@example.com','@lueltesfaye','@lueltesfaye','@lueltesfayeofficial','Luel Tesfaye','@lueltesfaye'),
  ('Clara','Alem','Tadesse','1993-11-21','Addis Ababa','Ethiopia','Ethiopian',170,4,'Midfielder',14,8000,'Monthly','clara@example.com','@claraalem','@claraalem','@claraalemofficial','Clara Alem','@claraalem'),
  ('Tsion','Marie','Dubois','1997-09-12','Paris','France','French',168,4,'Forward',20,8000,'Monthly','tsion@example.com','@tsiondubois','@tsiondubois','@tsionduboisofficial','Tsion Dubois','@tsiondubois'),
  ('Semir','Ahmed','Ali','1994-03-28','Jijiga','Ethiopia','Ethiopian',184,4,'Goalkeeper',18,7600,'Monthly','semir@example.com','@semirahmed','@semirahmed','@semirahmedofficial','Semir Ahmed','@semirahmed'),
  ('Sara','Alem','Tesfaye','1993-10-15','Addis Ababa','Ethiopia','Ethiopian',170,4,'Midfielder',16,7800,'Monthly','sara@example.com','@saraalem','@saraalem','@saraalemofficial','Sara Alem','@saraalem'),
  ('Yared','Amanuel','Gebre','1996-04-08','Addis Ababa','Ethiopia','Ethiopian',176,4,'Defender',23,7400,'Monthly','yared@example.com','@yaredamanuel','@yaredamanuel','@yaredamanuelofficial','Yared Amanuel','@yaredamanuel'),
  ('Clara','Mulualem','Tadesse','1995-08-10','Addis Ababa','Ethiopia','Ethiopian',173,4,'Forward',19,7900,'Monthly','clara@example.com','@claramulualem','@claramulualem','@claramulualemofficial','Clara Mulualem','@claramulualem'),
  ('Getachew','Wondimu','Abebe','1993-05-15','Addis Ababa','Ethiopia','Ethiopian',179,4,'Forward',9,7800,'Monthly','getachew@example.com','@getachewwondimu','@getachewwondimu','@getachewwondimuofficial','Getachew Wondimu','@getachewwondimu'),
  ('Samuel','Amanuel','Tadesse','1994-10-08','Addis Ababa','Ethiopia','Ethiopian',182,5,'Midfielder',8,7600,'Monthly','samuel@example.com','@samuelamanuel','@samuelamanuel','@samuelamanuelofficial','Samuel Amanuel','@samuelamanuel'),
  ('Ibrahim','Mohammed','Ali','1997-12-20','Dire Dawa','Ethiopia','Ethiopian',184,5,'Forward',10,8000,'Monthly','ibrahim@example.com','@ibrahimmohammed','@ibrahimmohammed','@ibrahimmohammedofficial','Ibrahim Mohammed','@ibrahimmohammed'),
  ('Mesfin','Alem','Girma','1995-03-28','Mekelle','Ethiopia','Ethiopian',180,5,'Forward',11,7900,'Monthly','mesfin@example.com','@mesfinalem','@mesfinalem','@mesfinalemofficial','Mesfin Alem','@mesfinalem'),
  ('Kidus','Gebre','Tadesse','1993-07-25','Addis Ababa','Ethiopia','Ethiopian',175,5,'Midfielder',7,7500,'Monthly','kidus@example.com','@kidusgeb','@kidusgeb','@kidusgebofficial','Kidus Gebre','@kidusgeb'),
  ('Elena','Marie','Dubois','1996-02-12','Paris','France','French',169,5,'Forward',5,7700,'Monthly','elena@example.com','@elenadubois','@elenadubois','@elenaduboisofficial','Elena Dubois','@elenadubois'),
  ('Yonas','Gebre','Tadesse','1992-08-15','Addis Ababa','Ethiopia','Ethiopian',182,5,'Defender',3,7400,'Monthly','yonas@example.com','@yonasgeb','@yonasgeb','@yonasgebofficial','Yonas Gebre','@yonasgeb'),
  ('Sophia','Marie','Dubois','1994-05-18','Paris','France','French',171,5,'Midfielder',6,7600,'Monthly','sophia@example.com','@sophiadubois','@sophiadubois','@sophiaduboisofficial','Sophia Dubois','@sophiadubois'),
  ('Bereket','Tsegaye','Yohannes','1997-02-28','Asmara','Eritrea','Eritrean',178,5,'Forward',12,7800,'Monthly','bereket@example.com','@berekettesfaye','@berekettesfaye','@berekettesfayeofficial','Bereket Tsegaye','@berekettesfaye'),
  ('Fiorella','Maria','Rossi','1993-11-21','Rome','Italy','Italian',170,5,'Forward',19,8000,'Monthly','fiorella@example.com','@fiorellarossi','@fiorellarossi','@fiorellarossiofficial','Fiorella Rossi','@fiorellarossi'),
  ('Getachew','Wondimu','Abebe','1993-05-15','Addis Ababa','Ethiopia','Ethiopian',179,5,'Forward',9,7800,'Monthly','getachew@example.com','@getachewwondimu','@getachewwondimu','@getachewwondimuofficial','Getachew Wondimu','@getachewwondimu'),
  ('Samuel','Amanuel','Tadesse','1994-10-08','Addis Ababa','Ethiopia','Ethiopian',182,5,'Midfielder',8,7600,'Monthly','samuel@example.com','@samuelamanuel','@samuelamanuel','@samuelamanuelofficial','Samuel Amanuel','@samuelamanuel'),
  ('Ibrahim','Mohammed','Ali','1997-12-20','Dire Dawa','Ethiopia','Ethiopian',184,5,'Goalkeeper',10,8000,'Monthly','ibrahim@example.com','@ibrahimmohammed','@ibrahimmohammed','@ibrahimmohammedofficial','Ibrahim Mohammed','@ibrahimmohammed'),
  ('Mesfin','Alem','Girma','1995-03-28','Mekelle','Ethiopia','Ethiopian',180,5,'Forward',11,7900,'Monthly','mesfin@example.com','@mesfinalem','@mesfinalem','@mesfinalemofficial','Mesfin Alem','@mesfinalem'),
  ('Kidus','Gebre','Tadesse','1993-07-25','Addis Ababa','Ethiopia','Ethiopian',175,5,'Midfielder',7,7500,'Monthly','kidus@example.com','@kidusgeb','@kidusgeb','@kidusgebofficial','Kidus Gebre','@kidusgeb'),
  ('Yonas','Gebre','Tadesse','1992-08-15','Addis Ababa','Ethiopia','Ethiopian',182,5,'Defender',3,7400,'Monthly','yonas@example.com','@yonasgeb','@yonasgeb','@yonasgebofficial','Yonas Gebre','@yonasgeb'),
  ('Bereket','Tsegaye','Yohannes','1997-02-28','Asmara','Eritrea','Eritrean',178,5,'Forward',12,7800,'Monthly','bereket@example.com','@berekettesfaye','@berekettesfaye','@berekettesfayeofficial','Bereket Tsegaye','@berekettesfaye'),
  ('Fiorello','Francesco','Rossi','1993-11-21','Rome','Italy','Italian',170,5,'Forward',19,8000,'Monthly','fiorello@example.com','@fiorellorossi','@fiorellorossi','@fiorellorossiofficial','Fiorello Rossi','@fiorellorossi'),
  ('Samuel','Alem','Tekle','1995-04-12','Arba Minch','Ethiopia','Ethiopian',176,6,'Forward',9,7800,'Monthly','samuel@example.com','@samuelalem','@samuelalem','@samuelalemofficial','Samuel Alem','@samuelalem'),
  ('Yohannes','Mulualem','Abebe','1994-09-08','Addis Ababa','Ethiopia','Ethiopian',178,6,'Midfielder',8,7600,'Monthly','yohannes@example.com','@yohannesmulualem','@yohannesmulualem','@yohannesmulualemofficial','Yohannes Abebe','@yohannesmulualem'),
  ('Ibrahim','Abdullahi','Ali','1997-11-20','Arba Minch','Ethiopia','Ethiopian',182,6,'Forward',10,8000,'Monthly','ibrahim@example.com','@ibrahimabdullahi','@ibrahimabdullahi','@ibrahimabdullahiofficial','Ibrahim Abdullahi','@ibrahimabdullahi'),
  ('Henok','Solomon','Girma','1995-02-28','Arba Minch','Ethiopia','Ethiopian',180,6,'Forward',11,7900,'Monthly','henok@example.com','@henoksolomon','@henoksolomon','@henoksolomonofficial','Henok Solomon','@henoksolomon'),
  ('Michael','Gebre','Tadesse','1993-06-15','Arba Minch','Ethiopia','Ethiopian',174,6,'Midfielder',7,7500,'Monthly','michael@example.com','@michaelgeb','@michaelgeb','@michaelgebofficial','Michael Gebre','@michaelgeb'),
  ('Daniel','Mesfin','Tsegaye','1992-08-18','Arba Minch','Ethiopia','Ethiopian',183,6,'Defender',3,7400,'Monthly','daniel@example.com','@danielmesfin','@danielmesfin','@danielmesfinofficial','Daniel Mesfin','@danielmesfin'),
  ('Solomon','Amanuel','Yohannes','1996-03-25','Arba Minch','Ethiopia','Ethiopian',178,6,'Forward',12,7800,'Monthly','solomon@example.com','@solomonamanuel','@solomonamanuel','@solomonamanuelofficial','Solomon Amanuel','@solomonamanuel'),
  ('David','Gebre','Tadesse','1994-05-18','Arba Minch','Ethiopia','Ethiopian',172,6,'Midfielder',6,7600,'Monthly','david@example.com','@davidgeb','@davidgeb','@davidgebofficial','David Gebre','@davidgeb'),
  ('Nathaniel','Tsegaye','Wondimu','1997-01-28','Arba Minch','Ethiopia','Ethiopian',181,6,'Forward',20,8000,'Monthly','nathaniel@example.com','@nathanieltsegaye','@nathanieltsegaye','@nathanieltsegayeofficial','Nathaniel Tsegaye','@nathanieltsegaye'),
  ('Marco','Francesco','Rossi','1993-10-21','Arba Minch','Ethiopia','Italian',174,6,'Forward',19,7900,'Monthly','marco@example.com','@marcorossi','@marcorossi','@marcorossiofficial','Marco Rossi','@marcorossi'),
  ('Natnael','Mesfin','Mekonnen','1994-03-15','Arba Minch','Ethiopia','Ethiopian',175,6,'Forward',21,7800,'Monthly','natnael@example.com','@natnaelmesfin','@natnaelmesfin','@natnaelmesfinofficial','Natnael Mesfin','@natnaelmesfin'),
  ('Yidnekachew','Alem','Tesfaye','1996-09-20','Arba Minch','Ethiopia','Ethiopian',180,6,'Midfielder',15,7600,'Monthly','yidnekachew@example.com','@yidnekachewalem','@yidnekachewalem','@yidnekachewalemofficial','Yidnekachew Alem','@yidnekachewalem'),
  ('Dawit','Mulualem','Assefa','1997-12-10','Arba Minch','Ethiopia','Ethiopian',179,6,'Forward',13,8000,'Monthly','dawit@example.com','@dawitmulualem','@dawitmulualem','@dawitmulualemofficial','Dawit Mulualem','@dawitmulualem'),
  ('Simon','Amanuel','Belete','1995-05-28','Arba Minch','Ethiopia','Ethiopian',182,6,'Goalkeeper',4,7900,'Monthly','simon@example.com','@simonamanuel','@simonamanuel','@simonamanuelofficial','Simon Amanuel','@simonamanuel'),
  ('Getachew','Wondimu','Abebe','1994-06-15','Bahir Dar','Ethiopia','Ethiopian',177,6,'Forward',9,7800,'Monthly','getachew@example.com','@getachewwondimu','@getachewwondimu','@getachewwondimuofficial','Getachew Wondimu','@getachewwondimu'),
  ('Ephrem','Amanuel','Tadesse','1995-11-08','Bahir Dar','Ethiopia','Ethiopian',180,7,'Midfielder',8,7600,'Monthly','ephrem@example.com','@ephreamanuel','@ephreamanuel','@ephreamanuelofficial','Ephrem Amanuel','@ephreamanuel'),
  ('Mohammed','Abdullahi','Ali','1998-01-20','Bahir Dar','Ethiopia','Ethiopian',184,7,'Forward',10,8000,'Monthly','mohammed@example.com','@mohammedali','@mohammedali','@mohammedaliofficial','Mohammed Ali','@mohammedali'),
  ('Abel','Mulualem','Girma','1996-04-28','Bahir Dar','Ethiopia','Ethiopian',178,7,'Forward',11,7900,'Monthly','abel@example.com','@abelmulualem','@abelmulualem','@abelmulualemofficial','Abel Mulualem','@abelmulualem'),
  ('Kidus','Gebre','Tadesse','1994-07-25','Bahir Dar','Ethiopia','Ethiopian',175,7,'Midfielder',7,7500,'Monthly','kidus@example.com','@kidusgeb','@kidusgeb','@kidusgebofficial','Kidus Gebre','@kidusgeb'),
  ('Leonardo','Francesco','Rossi','1993-02-12','Florence','Italy','Italian',176,7,'Forward',5,7700,'Monthly','leonardo@example.com','@leonardorossi','@leonardorossi','@leonardorossiofficial','Leonardo Rossi','@leonardorossi'),
  ('Solomon','Gebre','Tadesse','1992-09-12','Bahir Dar','Ethiopia','Ethiopian',181,7,'Defender',3,7400,'Monthly','solomon@example.com','@solomongebre','@solomongebre','@solomongebreofficial','Solomon Gebre','@solomongebre'),
  ('Mario','Francesco','Rossi','1995-04-18','Milan','Italy','Italian',178,7,'Forward',6,7600,'Monthly','mario@example.com','@mariorossi','@mariorossi','@mariorossiofficial','Mario Rossi','@mariorossi'),
  ('Luel','Tesfaye','Yohannes','1997-05-25','Bahir Dar','Ethiopia','Ethiopian',182,7,'Forward',12,7800,'Monthly','luel@example.com','@lueltesfaye','@lueltesfaye','@lueltesfayeofficial','Luel Tesfaye','@lueltesfaye'),
  ('Filippo','Marco','Rossi','1993-12-21','Rome','Italy','Italian',175,7,'Forward',19,8000,'Monthly','filippo@example.com','@filipporossi','@filipporossi','@filipporossiofficial','Filippo Rossi','@filipporossi'),
  ('Natnael','Tsegaye','Mekonnen','1994-03-28','Bahir Dar','Ethiopia','Ethiopian',179,7,'Forward',14,7800,'Monthly','natnael@example.com','@natnaeltsegaye','@natnaeltsegaye','@natnaeltsegayeofficial','Natnael Tsegaye','@natnaeltsegaye'),
  ('Yidnekachew','Alem','Tesfaye','1996-09-20','Bahir Dar','Ethiopia','Ethiopian',180,7,'Goalkeeper',15,7600,'Monthly','yidnekachew@example.com','@yidnekachewalem','@yidnekachewalem','@yidnekachewalemofficial','Yidnekachew Alem','@yidnekachewalem'),
  ('Dawit','Mulualem','Assefa','1997-12-10','Bahir Dar','Ethiopia','Ethiopian',179,7,'Forward',13,8000,'Monthly','dawit@example.com','@dawitmulualem','@dawitmulualem','@dawitmulualemofficial','Dawit Mulualem','@dawitmulualem'),
  ('Simon','Amanuel','Belete','1995-05-28','Bahir Dar','Ethiopia','Ethiopian',182,7,'Defender',4,7900,'Monthly','simon@example.com','@simonamanuel','@simonamanuel','@simonamanuelofficial','Simon Amanuel','@simonamanuel'),
  ('Getachew','Wondimu','Abebe','1996-03-15','Dire Dawa','Ethiopia','Ethiopian',176,8,'Forward',9,7800,'Monthly','getachew@example.com','@getachewwondimu','@getachewwondimu','@getachewwondimuofficial','Getachew Wondimu','@getachewwondimu'),
  ('Ahmed','Amanuel','Tadesse','1997-11-08','Dire Dawa','Ethiopia','Ethiopian',180,8,'Midfielder',8,7600,'Monthly','ahmed@example.com','@ahmedamanuel','@ahmedamanuel','@ahmedamanuelofficial','Ahmed Amanuel','@ahmedamanuel'),
  ('Abdi','Abdullahi','Ali','1998-01-20','Dire Dawa','Ethiopia','Ethiopian',182,8,'Forward',10,8000,'Monthly','abdi@example.com','@abdiali','@abdiali','@abdialiofficial','Abdi Abdullahi','@abdiali'),
  ('Hassan','Mulualem','Girma','1995-04-28','Dire Dawa','Ethiopia','Ethiopian',178,8,'Forward',11,7900,'Monthly','hassan@example.com','@hassangirma','@hassangirma','@hassangirmaofficial','Hassan Girma','@hassangirma'),
  ('Kidus','Gebre','Tadesse','1993-07-25','Dire Dawa','Ethiopia','Ethiopian',175,8,'Midfielder',7,7500,'Monthly','kidus@example.com','@kidusgeb','@kidusgeb','@kidusgebofficial','Kidus Gebre','@kidusgeb'),
  ('Leonardo','Francesco','Rossi','1993-02-12','Florence','Italy','Italian',176,8,'Forward',5,7700,'Monthly','leonardo@example.com','@leonardorossi','@leonardorossi','@leonardorossiofficial','Leonardo Rossi','@leonardorossi'),
  ('Solomon','Gebre','Tadesse','1992-09-12','Dire Dawa','Ethiopia','Ethiopian',181,8,'Defender',3,7400,'Monthly','solomon@example.com','@solomongebre','@solomongebre','@solomongebreofficial','Solomon Gebre','@solomongebre'),
  ('Mario','Francesco','Rossi','1995-04-18','Milan','Italy','Italian',178,8,'Forward',6,7600,'Monthly','mario@example.com','@mariorossi','@mariorossi','@mariorossiofficial','Mario Rossi','@mariorossi'),
  ('Luel','Tesfaye','Yohannes','1997-05-25','Dire Dawa','Ethiopia','Ethiopian',182,8,'Forward',12,7800,'Monthly','luel@example.com','@lueltesfaye','@lueltesfaye','@lueltesfayeofficial','Luel Tesfaye','@lueltesfaye'),
  ('Filippo','Marco','Rossi','1993-12-21','Rome','Italy','Italian',175,8,'Forward',19,8000,'Monthly','filippo@example.com','@filipporossi','@filipporossi','@filipporossiofficial','Filippo Rossi','@filipporossi'),
  ('Natnael','Tsegaye','Mekonnen','1996-03-28','Dire Dawa','Ethiopia','Ethiopian',179,8,'Forward',14,7800,'Monthly','natnael@example.com','@natnaeltsegaye','@natnaeltsegaye','@natnaeltsegayeofficial','Natnael Tsegaye','@natnaeltsegaye'),
  ('Yidnekachew','Alem','Tesfaye','1996-09-20','Dire Dawa','Ethiopia','Ethiopian',180,8,'Midfielder',15,7600,'Monthly','yidnekachew@example.com','@yidnekachewalem','@yidnekachewalem','@yidnekachewalemofficial','Yidnekachew Alem','@yidnekachewalem'),
  ('Dawit','Mulualem','Assefa','1997-12-10','Dire Dawa','Ethiopia','Ethiopian',179,8,'Forward',13,8000,'Monthly','dawit@example.com','@dawitmulualem','@dawitmulualem','@dawitmulualemofficial','Dawit Mulualem','@dawitmulualem'),
  ('Simon','Amanuel','Belete','1995-05-28','Dire Dawa','Ethiopia','Ethiopian',182,8,'Goalkeeper',4,7900,'Monthly','simon@example.com','@simonamanuel','@simonamanuel','@simonamanuelofficial','Simon Amanuel','@simonamanuel'),
  ('Getachew','Wondimu','Abebe','1995-04-15','Gondar','Ethiopia','Ethiopian',176,9,'Forward',9,7800,'Monthly','getachew@example.com','@getachewwondimu','@getachewwondimu','@getachewwondimuofficial','Getachew Wondimu','@getachewwondimu'),
  ('Abel','Amanuel','Tadesse','1996-11-08','Gondar','Ethiopia','Ethiopian',179,9,'Midfielder',8,7600,'Monthly','abel@example.com','@abelamanuel','@abelamanuel','@abelamanuelofficial','Abel Amanuel','@abelamanuel'),
  ('Mohammed','Abdullahi','Ali','1997-01-20','Gondar','Ethiopia','Ethiopian',181,9,'Forward',10,8000,'Monthly','mohammed@example.com','@mohammedali','@mohammedali','@mohammedaliofficial','Mohammed Ali','@mohammedali'),
  ('Dawit','Mulualem','Girma','1994-04-28','Gondar','Ethiopia','Ethiopian',178,9,'Forward',11,7900,'Monthly','dawit@example.com','@dawitmulualem','@dawitmulualem','@dawitmulualemofficial','Dawit Mulualem','@dawitmulualem'),
  ('Kidus','Gebre','Tadesse','1992-07-25','Gondar','Ethiopia','Ethiopian',175,9,'Midfielder',7,7500,'Monthly','kidus@example.com','@kidusgeb','@kidusgeb','@kidusgebofficial','Kidus Gebre','@kidusgeb'),
  ('Leonardo','Francesco','Rossi','1993-02-12','Florence','Italy','Italian',176,9,'Forward',5,7700,'Monthly','leonardo@example.com','@leonardorossi','@leonardorossi','@leonardorossiofficial','Leonardo Rossi','@leonardorossi'),
  ('Solomon','Gebre','Tadesse','1993-09-12','Gondar','Ethiopia','Ethiopian',181,9,'Defender',3,7400,'Monthly','solomon@example.com','@solomongebre','@solomongebre','@solomongebreofficial','Solomon Gebre','@solomongebre'),
  ('Mario','Francesco','Rossi','1995-04-18','Milan','Italy','Italian',178,9,'Forward',6,7600,'Monthly','mario@example.com','@mariorossi','@mariorossi','@mariorossiofficial','Mario Rossi','@mariorossi'),
  ('Luel','Tesfaye','Yohannes','1997-05-25','Gondar','Ethiopia','Ethiopian',182,9,'Forward',12,7800,'Monthly','luel@example.com','@lueltesfaye','@lueltesfaye','@lueltesfayeofficial','Luel Tesfaye','@lueltesfaye'),
  ('Filippo','Marco','Rossi','1993-12-21','Rome','Italy','Italian',175,9,'Forward',19,8000,'Monthly','filippo@example.com','@filipporossi','@filipporossi','@filipporossiofficial','Filippo Rossi','@filipporossi'),
  ('Wondwossen','Tsegaye','Assefa','1995-04-15','Hawassa','Ethiopia','Ethiopian',175,9,'Forward',9,7800,'Monthly','wondwossen@example.com','@wondwossentsegaye','@wondwossentsegaye','@wondwossentsegayeofficial','Wondwossen Tsegaye','@wondwossentsegaye'),
  ('Eyob','Amanuel','Tadesse','1997-11-08','Hawassa','Ethiopia','Ethiopian',180,9,'Midfielder',8,7600,'Monthly','eyob@example.com','@eyobamanuel','@eyobamanuel','@eyobamanuelofficial','Eyob Amanuel','@eyobamanuel'),
  ('Yoatam','Thomas','Tadesse','1992-07-25','Addis Ababa','Ethiopia','Ethiopian',175,10,'Midfielder',7,7500,'Monthly','tesfaye@example.com','@tesfayegeb','@tesfayegeb','@tesfayegebofficial','Tesfaye Gebre','@yoyoyegeb'),
  ('Wayne','Gebre','Bilen','1992-07-25','Addis Ababa','Ethiopia','Ethiopian',175,10,'Midfielder',7,7500,'Monthly','tesfaye@example.com','@tesfayegeb','@tesfayegeb','@tesfayegebofficial','Tesfaye Gebre','@tesfayegebre'),
  ('Natnael','Mulualem','Assefa','1993-04-15','Addis Ababa','Ethiopia','Ethiopian',175,10,'Forward',9,7800,'Monthly','natnael@example.com','@tsegayemulualem','@tsegayemulualem','@tsegayemulualemofficial','Tsegaye Assefa','@tsegayemulualem'),
  ('Alem','Amanuel','Tadesse','1996-11-08','Addis Ababa','Ethiopia','Ethiopian',180,10,'Midfielder',8,7600,'Monthly','alem@example.com','@alemamanuel','@alemamanuel','@alemamanuelofficial','Alem Amanuel','@alemamanuel'),
  ('Abdullahi','Abdi','Ali','1997-01-20','Addis Ababa','Ethiopia','Ethiopian',183,10,'Goalkeeper',10,8000,'Monthly','abdullahi@example.com','@abdullahiali','@abdullahiali','@abdullahaliofficial','Abdullahi Ali','@abdullahiali'),
  ('Girma','Mulualem','Girma','1994-04-28','Addis Ababa','Ethiopia','Ethiopian',178,10,'Forward',11,7900,'Monthly','girma@example.com','@girmamulualem','@girmamulualem','@girmamulualemofficial','Girma Mulualem','@girmamulualem'),
  ('Tesfaye','Gebre','Tadesse','1992-07-25','Addis Ababa','Ethiopia','Ethiopian',175,10,'Midfielder',7,7500,'Monthly','tesfaye@example.com','@tesfayegeb','@tesfayegeb','@tesfayegebofficial','Tesfaye Gebre','@tesfayegeb'),
  ('Ephrem','Mulualem','Tsegaye','1995-03-12','Addis Ababa','Ethiopia','Ethiopian',176,10,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Ephrem Mulualem','@ephremmulualem'),
  ('Solomon','Mulualem','Assefa','1993-09-28','Addis Ababa','Ethiopia','Ethiopian',181,10,'Defender',3,7400,'Monthly','solomon@example.com','@solomonassefa','@solomonassefa','@solomonassefaofficial','Solomon Assefa','@solomonassefa'),
  ('Daniel','Mulualem','Tadesse','1994-06-18','Addis Ababa','Ethiopia','Ethiopian',177,10,'Midfielder',6,7600,'Monthly','daniel@example.com','@danielmulualem','@danielmulualem','@danielmulualemofficial','Daniel Mulualem','@danielmulualem'),
  ('Tewodros','Gebre','Mekonnen','1993-12-25','Addis Ababa','Ethiopia','Ethiopian',179,10,'Defender',2,7300,'Monthly','tewodros@example.com','@tewodrosg','@tewodrosg','@tewodrosgofficial','Tewodros Gebre','@tewodrosg'),
  ('Yonatan','Mulualem','Tadesse','1997-05-11','Addis Ababa','Ethiopia','Ethiopian',182,10,'Midfielder',5,7800,'Monthly','yonatan@example.com','@yonatanmulualem','@yonatanmulualem','@yonatanmulualemofficial','Yonatan Tadesse','@yonatanmulualem'),
  ('Alex','Berhe','Tsegaye','1995-03-12','Addis Ababa','Ethiopia','Ethiopian',176,10,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Ephrem Mulualem','@ephremmulualem'),
  ('Lealem','Wegagen','Berhanu','1995-03-12','Addis Ababa','Ethiopia','Ethiopian',176,10,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Ephrem Mulualem','@ephremmulualem'),
  ('Ayano','Mulualem','Tsegaye','1995-03-12','Addis Ababa','Ethiopia','Ethiopian',176,10,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Ephrem Mulualem','@ephremmulualem'),
  ('Tsegaye','Mulualem','Assefa','1993-04-15','Arba Minch','Ethiopia','Ethiopian',175,11,'Forward',9,7800,'Monthly','tsegaye@example.com','@tsegayemulualem','@tsegayemulualem','@tsegayemulualemofficial','Tsegaye Assefa','@tsegayemulualem'),
  ('Alem','Amanuel','Tadesse','1996-11-08','Arba Minch','Ethiopia','Ethiopian',180,11,'Midfielder',8,7600,'Monthly','alem@example.com','@alemamanuel','@alemamanuel','@alemamanuelofficial','Alem Amanuel','@alemamanuel'),
  ('Abdullahi','Abdi','Ali','1997-01-20','Arba Minch','Ethiopia','Ethiopian',183,11,'Forward',10,8000,'Monthly','abdullahi@example.com','@abdullahiali','@abdullahiali','@abdullahaliofficial','Abdullahi Ali','@abdullahiali'),
  ('Girma','Mulualem','Girma','1994-04-28','Arba Minch','Ethiopia','Ethiopian',178,11,'Forward',11,7900,'Monthly','girma@example.com','@girmamulualem','@girmamulualem','@girmamulualemofficial','Girma Mulualem','@girmamulualem'),
  ('Tesfaye','Gebre','Tadesse','1992-07-25','Arba Minch','Ethiopia','Ethiopian',175,11,'Midfielder',7,7500,'Monthly','tesfaye@example.com','@tesfayegeb','@tesfayegeb','@tesfayegebofficial','Tesfaye Gebre','@tesfayegeb'),
  ('Ephrem','Mulualem','Tsegaye','1995-03-12','Arba Minch','Ethiopia','Ethiopian',176,11,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Ephrem Mulualem','@ephremmulualem'),
  ('Solomon','Mulualem','Assefa','1993-09-28','Arba Minch','Ethiopia','Ethiopian',181,11,'Defender',3,7400,'Monthly','solomon@example.com','@solomonassefa','@solomonassefa','@solomonassefaofficial','Solomon Assefa','@solomonassefa'),
  ('Daniel','Mulualem','Tadesse','1994-06-18','Arba Minch','Ethiopia','Ethiopian',177,11,'Midfielder',6,7600,'Monthly','daniel@example.com','@danielmulualem','@danielmulualem','@danielmulualemofficial','Daniel Mulualem','@danielmulualem'),
  ('Tewodros','Gebre','Mekonnen','1993-12-25','Arba Minch','Ethiopia','Ethiopian',179,11,'Defender',2,7300,'Monthly','tewodros@example.com','@tewodrosg','@tewodrosg','@tewodrosgofficial','Tewodros Gebre','@tewodrosg'),
  ('Yonatan','Mulualem','Tadesse','1997-05-11','Arba Minch','Ethiopia','Ethiopian',182,11,'Goalkeeper',5,7800,'Monthly','yonatan@example.com','@yonatanmulualem','@yonatanmulualem','@yonatanmulualemofficial','Yonatan Tadesse','@yonatanmulualem'),
  ('Daniel','Mulualem','Michael','1994-06-18','Arba Minch','Ethiopia','Ethiopian',177,11,'Midfielder',6,7600,'Monthly','daniel@example.com','@danielmulualem','@danielmulualem','@danielmulualemofficial','Daniel Mulualem','@danielmulualem'),
  ('Amde','Mulualem','Tadesse','1994-06-18','Arba Minch','Ethiopia','Ethiopian',177,11,'Midfielder',6,7600,'Monthly','daniel@example.com','@danielmulualem','@danielmulualem','@danielmulualemofficial','Daniel Mulualem','@danielmulualem'),
  ('Beture','Hayle','Tadesse','1994-06-18','Arba Minch','Ethiopia','Ethiopian',177,11,'Midfielder',6,7600,'Monthly','daniel@example.com','@danielmulualem','@danielmulualem','@danielmulualemofficial','Daniel Mulualem','@danielmulualem'),
  ('Natnael','Mulualem','Assefa','1993-04-15','Bahir Dar','Ethiopia','Ethiopian',175,12,'Forward',9,7800,'Monthly','natnael@example.com','@tsegayemulualem','@tsegayemulualem','@tsegayemulualemofficial','Tsegaye Assefa','@tsegayemulualem'),
  ('Alem','Amanuel','Tadesse','1996-11-08','Bahir Dar','Ethiopia','Ethiopian',180,12,'Midfielder',8,7600,'Monthly','alem@example.com','@alemamanuel','@alemamanuel','@alemamanuelofficial','Alem Amanuel','@alemamanuel'),
  ('Abdullahi','Abdi','Ali','1997-01-20','Bahir Dar','Ethiopia','Ethiopian',183,12,'Forward',10,8000,'Monthly','abdullahi@example.com','@abdullahiali','@abdullahiali','@abdullahaliofficial','Abdullahi Ali','@abdullahiali'),
  ('Girma','Mulualem','Girma','1994-04-28','Bahir Dar','Ethiopia','Ethiopian',178,12,'Forward',11,7900,'Monthly','girma@example.com','@girmamulualem','@girmamulualem','@girmamulualemofficial','Girma Mulualem','@girmamulualem'),
  ('Tesfaye','Gebre','Tadesse','1992-07-25','Bahir Dar','Ethiopia','Ethiopian',175,12,'Midfielder',7,7500,'Monthly','tesfaye@example.com','@tesfayegeb','@tesfayegeb','@tesfayegebofficial','Tesfaye Gebre','@tesfayegeb'),
  ('Ephrem','Mulualem','Tsegaye','1995-03-12','Bahir Dar','Ethiopia','Ethiopian',176,12,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Ephrem Mulualem','@ephremmulualem'),
  ('Solomon','Mulualem','Assefa','1993-09-28','Bahir Dar','Ethiopia','Ethiopian',181,12,'Defender',3,7400,'Monthly','solomon@example.com','@solomonassefa','@solomonassefa','@solomonassefaofficial','Solomon Assefa','@solomonassefa'),
  ('Daniel','Mulualem','Tadesse','1994-06-18','Bahir Dar','Ethiopia','Ethiopian',177,12,'Midfielder',6,7600,'Monthly','daniel@example.com','@danielmulualem','@danielmulualem','@danielmulualemofficial','Daniel Mulualem','@danielmulualem'),
  ('Tewodros','Gebre','Mekonnen','1993-12-25','Bahir Dar','Ethiopia','Ethiopian',179,12,'Defender',2,7300,'Monthly','tewodros@example.com','@tewodrosg','@tewodrosg','@tewodrosgofficial','Tewodros Gebre','@tewodrosg'),
  ('Yonatan','Mulualem','Tadesse','1997-05-11','Bahir Dar','Ethiopia','Ethiopian',182,12,'Goalkeeper',5,7800,'Monthly','yonatan@example.com','@yonatanmulualem','@yonatanmulualem','@yonatanmulualemofficial','Yonatan Tadesse','@yonatanmulualem'),
  ('Yohannes','Mulualem','Tsegaye','1995-03-12','Bahir Dar','Ethiopia','Ethiopian',176,12,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Yohannes Bri','@yohannesmmulualem'),
  ('Jarol','Keree','Belom','1995-03-12','Rio de Janerio','Brazil','Brazilian',176,12,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Keree Mulualem','@jaamulualem'),
  ('Tadyos','Mulualem','Tsegaye','1995-03-12','Bahir Dar','Ethiopia','Ethiopian',176,12,'Forward',12,7700,'Monthly','ephrem@example.com','@ephremmulualem','@ephremmulualem','@ephremmulualemofficial','Tadiyos Mulualem','@Tadiyosmulualem');




-- Sample data for Officials (additional 8 records)
INSERT INTO Officials (firstName, lastName, email, maxRole, nationality)
VALUES
    ('Christopher', 'Thomas', 'christopher.thomas@example.com', 'Referee', 'Canada'),
    ('Maria', 'Garcia', 'maria.garcia@example.com', 'Assistant referee', 'Spain'),
    ('Robert', 'Miller', 'robert.miller@example.com', 'Assistant referee', 'USA'),
    ('Jessica', 'Brown', 'jessica.brown@example.com', 'Assistant referee', 'England'),
    ('Samuel', 'Davis', 'samuel.davis@example.com', 'Fourth official', 'England'),
    ('Zerihun', 'Teka', 'zerihun.teka@example.com', 'Referee', 'Ethiopia'),
    ('Alemnesh', 'Mulugeta', 'alemnesh.mulugeta@example.com', 'Assistant referee', 'Ethiopia'),
    ('Tewodros', 'Desta', 'tewodros.desta@example.com', 'Assistant referee', 'Ethiopia'),
    ('Meseret', 'Tadesse', 'meseret.tadesse@example.com', 'Assistant referee', 'Ethiopia'),
    ('Kassa', 'Gebre', 'kassa.gebre@example.com', 'Fourth official', 'Ethiopia'),
    ('Genet', 'Tessema', 'genet.tessema@example.com', 'Referee', 'Ethiopia'),
    ('Tsegaye', 'Kebede', 'tsegaye.kebede@example.com', 'Assistant referee', 'Ethiopia'),
    ('Selamawit', 'Abebe', 'selamawit.abebe@example.com', 'Fourth official', 'Ethiopia'),
    ('Sophia', 'Wilson', 'sophia.wilson@example.com', 'Assistant referee', 'USA'),
    ('Ryan', 'Martinez', 'ryan.martinez@example.com', 'Assistant referee', 'Spain'),
    ('Olivia', 'Jones', 'olivia.jones@example.com', 'Fourth official', 'Canada');

-- Sample data for PlayerTransactions (additional 8 records)

-- Sample data for PlayerContracts (additional 8 records)
INSERT INTO PlayersContracts (clubID, playerID, startDate, endDate, contractValue, contractType, contractStatus)
VALUES
    (1, 8, '2022-09-15', '2023-07-14', 1100000, 'Professional', 'Expired'),
    (2, 25, '2023-01-30', '2025-12-31', 1200000, 'Professional', 'Active'),
    (4, 86, '2022-07-01', '2024-06-30', 900000, 'Professional', 'Active'),
    (5, 17, '2023-02-20', '2024-02-19', 750000, 'Professional', 'Active'),
    (6, 35, '2023-03-18', '2025-03-17', 1400000, 'Professional', 'Active'),
    (7, 49, '2023-04-10', '2024-04-09', 1000000, 'Academy', 'Active'),
    (8, 100, '2023-05-25', '2024-05-24', 800000, 'Professional', 'Active'),
    (4, 62, '2023-06-15', '2023-12-31', 600000, 'Professional', 'Active');

--manager contracts
INSERT INTO ManagersContracts (managerID, clubID, startDate, endDate, contractStatus)
VALUES
  (2, 1, '2022-05-15', '2023-05-15', 'Active'),
  (3, 2, '2021-10-20', '2025-10-20', 'Active'),
  (4, 3, '2020-07-01', '2024-07-01', 'Active'),
  (5, 4, '2019-09-10', '2024-09-10', 'Active'),
  (6, 5, '2018-03-25', '2017-03-25', 'Active'),
  (7, 6, '2022-08-10', '2028-08-10', 'Active'),
  (8, 7, '2021-11-05', '2024-11-05', 'Active'),
  (9, 8, '2020-09-30', '2024-09-30', 'Active'),
  (10, 9, '2019-06-15', '2024-06-15', 'Active'),
  (11, 10, '2018-12-01', '2014-12-01', 'Active'),
  (12, 11, '2022-04-01', '2024-04-01', 'Active'),
  (13, 12, '2021-07-25', '2029-07-25', 'Terminated'),
  (14, 10, '2022-04-01', '2023-04-27', 'Expired'),
  (6, 5, '2022-04-01', '2021-04-01', 'Expired'),
  (1, 1, '2022-04-01', '2020-04-01', 'Expired'),
  (2, 6, '2022-04-01', '2026-01-01', 'Terminated')
  ;


-- Sample data for MonthlyPlayerAwards (additional 5 records)
INSERT INTO MonthlyPlayerAwards (awardType, awardYear, awardMonth, playerID, matchID, goalID)
VALUES
    ('Player of the Month', 2023, 3, 8, NULL, NULL),
    ('Player of the Month', 2023, 4, 11, Null, NULL),
    ('Player of the Month', 2023, 5, 8, NULL, NULL),
    ('Player of the Month', 2023, 6, 10, NULL, NULL),
    ('Player of the Month', 2023, 7, 20, NULL, NULL);

INSERT INTO MOTM (awardYear, awardMonth, managerID)
VALUES
    (2023, 3, 5),
    (2023, 4, 5),
    (2023, 5, 5),
    (2023, 6, 4),
    (2023, 7, 8);


	select * from players where clubID = 11 or clubID = 12 order by clubID
--insert starting 11 of a match
INSERT INTO AppearanceStats (apperanceType, playerID, clubFor, matchID)
VALUES
	('Start', 161, 11, 1),
	('Start', 153, 11, 1),
	('Start', 154, 11, 1),
	('Start', 155, 11, 1),
	('Start', 156, 11, 1),
	('Start', 157, 11, 1),
	('Start', 163, 11, 1),
	('Start', 152, 11, 1),
	('Start', 159, 11, 1),
	('Start', 162, 11, 1),
	('Start', 158, 11, 1),
	('Start', 174, 12, 1),
	('Start', 177, 12, 1),
	('Start', 176, 12, 1),
	('Start', 175, 12, 1),
	('Start', 170, 12, 1),
	('Start', 169, 12, 1),
	('Start', 167, 12, 1),
	('Start', 177, 12, 1),
	('Start', 168, 12, 1),
	('Start', 166, 12, 1),
	('Start', 173, 12, 1);