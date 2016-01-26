DROP DATABASE IF EXISTS progettoSIW;
CREATE DATABASE IF NOT EXISTS progettoSIW;

USE progettoSIW;


CREATE TABLE USER (
    USERNAME VARCHAR(100) PRIMARY KEY,
    PASSWORD VARCHAR(100) NOT NULL DEFAULT '',
    PROFILE_NAME VARCHAR(100),
    EMAIL VARCHAR(100) NOT NULL,
    IMAGE_URL VARCHAR(200),
    SOCIAL VARCHAR(100) NOT NULL,
    ADMIN VARCHAR(100) NOT NULL
);

CREATE TABLE CATEGORY(
    TYPE VARCHAR(100) PRIMARY KEY,
    POINTS INT NOT NULL
);

CREATE TABLE DISH (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(500),  
    RATING FLOAT DEFAULT 0,
    IMAGE_URL VARCHAR(100),
    CATEGORY VARCHAR(100) NOT NULL
);

CREATE TABLE DAILYMENU (
    MENUDATE DATE,
    DISH INT NOT NULL,
    PRIMARY KEY (MENUDATE,DISH),
    FOREIGN KEY (DISH) REFERENCES DISH (ID)
);

CREATE TABLE COMMENTDISH (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DISH INT NOT NULL,
    USER VARCHAR(100) NOT NULL,
    COMMENT VARCHAR(500),
    COMMENTDATE DATE,
    FOREIGN KEY (DISH) REFERENCES DISH (ID),
    FOREIGN KEY (USER) REFERENCES USER (USERNAME)
);

CREATE TABLE RATING (
    DISH INT,
    USERNAME VARCHAR(100),
    POINTS FLOAT NOT NULL DEFAULT '0',
    PRIMARY KEY (USERNAME,DISH),
    FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME),
    FOREIGN KEY (DISH) REFERENCES DISH (ID)
);

INSERT INTO RATING(DISH,USERNAME,POINTS)
VALUES (1,"Eliana Cannella",3);

-- CREATE TABLE CHOOSEDDISH (
--     DATA DATE NOT NULL,
--     DISH INT NOT NULL,
--     USERNAME VARCHAR(100) NOT NULL,
--     PRIMARY KEY (DATA,USERNAME,DISH),
--     FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME),
--     FOREIGN KEY (DISH) REFERENCES DISH (ID)
-- );


DELIMITER $$
CREATE PROCEDURE addUser (IN username VARCHAR (100), IN password VARCHAR (100), IN email VARCHAR (100), IN social VARCHAR(100)) 
BEGIN  
INSERT INTO USER (USERNAME, PASSWORD, EMAIL, SOCIAL)
VALUES (username,password, email, social);
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE setImageProfile (IN username VARCHAR(100), IN imageUrl VARCHAR(200))
BEGIN
UPDATE USER
SET USER.IMAGE_URL = imageUrl
WHERE USER.USERNAME = username;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE setAdmin (IN username VARCHAR(100), IN admin VARCHAR(200))
BEGIN
UPDATE USER
SET USER.ADMIN = admin
WHERE USERNAME = username;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE modifyUser (IN username VARCHAR(200), IN email VARCHAR(500), IN image_url VARCHAR(100))
BEGIN
UPDATE USER
SET USER.EMAIL = email, USER.IMAGE_URL = image_url
WHERE USER.USERNAME = username;
END; $$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE modifyDish (IN id INT, IN name VARCHAR(200), IN description VARCHAR(500), IN image_url VARCHAR(100), IN category VARCHAR(100))
BEGIN
UPDATE DISH
SET DISH.NAME = name, DISH.DESCRIPTION = description, DISH.IMAGE_URL = image_url, DISH.CATEGORY = category
WHERE DISH.ID = id;
END; $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE addDish (IN name VARCHAR (100), IN description VARCHAR (100), IN image VARCHAR (100), IN category VARCHAR(100)) 
BEGIN  
INSERT INTO DISH (NAME, DESCRIPTION, IMAGE_URL, CATEGORY)
VALUES (name, description, image, category);
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addRatingDish (IN dishId INT, IN rating FLOAT)
BEGIN
UPDATE DISH
SET DISH.RATING = rating
WHERE ID = dishId;
END; $$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE insertComment(IN dish INT, IN user VARCHAR(100), IN comment VARCHAR(500), IN date DATE)
BEGIN
INSERT INTO COMMENTDISH (DISH, USER, COMMENT, COMMENTDATE)
VALUES (dish,user,comment,date);
END; $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE addRating (IN idDish INT, IN user VARCHAR(100), IN points FLOAT) 
BEGIN  
IF EXISTS (SELECT * FROM RATING WHERE USERNAME=user AND DISH=idDish )
THEN 
UPDATE RATING 
SET RATING.POINTS=points
WHERE RATING.USERNAME=user AND RATING.DISH= idDish;
ELSE
INSERT INTO RATING (DISH, USERNAME, POINTS)
VALUES (idDish, user, points);
END IF;
END; $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE modifyComment (IN commentID INT, IN comment VARCHAR(500))
BEGIN
UPDATE COMMENTDISH
SET COMMENTDISH.COMMENT = comment
WHERE ID = commentID;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE deleteComment (IN commentID INT) 
BEGIN  
DELETE
FROM COMMENTDISH
WHERE COMMENTDISH.ID = commentID;
END; $$
DELIMITER ;

/*
DELIMITER $$
CREATE TRIGGER Update_Rating
AFTER UPDATE ON RATING FOR EACH ROW
BEGIN
UPDATE DISH
SET RATING = (SELECT AVG(POINTS)
                        FROM RATING AS R1
                        WHERE R1.DISH=NEW.DISH)
WHERE DISH.ID=NEW.DISH;

END;$$
DELIMITER ;
*/

INSERT INTO CATEGORY(TYPE,POINTS)
VALUES ('Main Course',1);
INSERT INTO CATEGORY(TYPE,POINTS)
VALUES ('Second Course', 2);
INSERT INTO CATEGORY(TYPE,POINTS)
VALUES ('Side Dish',1);


INSERT INTO DISH (NAME, DESCRIPTION, IMAGE_URL, CATEGORY)
VALUES ('Pasta alla Portofino','La pasta alla Portofino è un gustoso primo piatto che nasce dal delizioso incontro fra il pesto genovese e il sugo di pomodoro. Si narra che l’idea sia nata quando un ristoratore di Portofino, appunto, non aveva sufficiente pesto per soddisfare tutte le ordinazioni e decise, così, di mischiarlo al sugo di pomodoro semplice per aumentare la quantità del condimento.','http://img.tgcom24.mediaset.it/binary/tgcom24/95.$plit/C_4_ricetta_350_upiFoto.jpg', 1);

INSERT INTO DISH (NAME, DESCRIPTION, IMAGE_URL, CATEGORY)
VALUES ('Mezze maniche alla Norcina','Piatto tipico di Perugia e Norcia, caratterizzata dalla presenza fondamentale della salsiccia umbra, dal sapore deciso e notevole.','http://media-cdn.tripadvisor.com/media/photo-s/06/06/e1/a0/da-pallotta-1820.jpg', 1);

INSERT INTO DISH (NAME,IMAGE_URL, CATEGORY)
VALUES ('Farfalle zucchine e gamberetti','http://www.molinodiferro.com/images/ricette/farfalle-gamberetti-zucchine-basilico.jpg', 1);

INSERT INTO DISH (NAME, DESCRIPTION, IMAGE_URL, CATEGORY)
VALUES ('Parmiggiana di melanzane','La parmigiana di melanzane o anche, melanzane alla parmigiana, o semplicemente parmigiana, è un piatto a base di melanzane fritte e gratinate in forno con passata di pomodoro, basilico, aglio e uno o più formaggi inclusi pecorino siciliano, mozzarella, scamorza e caciocavallo.','http://grandenapoli.it/wp-content/uploads/parmigiana-napoletana.jpg', 2);

INSERT INTO DISH (NAME, IMAGE_URL, CATEGORY)
VALUES ('Salsiccia con patate','http://media.gustoblog.it/1/1e6/Patate-in-padella-croccanti-con-salsiccia-586x389.jpg', 2);

INSERT INTO DISH (NAME, IMAGE_URL, CATEGORY)
VALUES ('Merluzzo gratinato','http://lemiericette5.altervista.org/wp-content/uploads/2014/03/98f3fcbfdca555b817c7012204f6d0c4531ee5e83e07b.jpg', 2);

INSERT INTO DISH (NAME, IMAGE_URL, CATEGORY)
VALUES ('Fagiolini','http://static.pourfemme.it/625X0/dieta/pourfemme/it/img/insalata_fagiolini.jpg', 3);
INSERT INTO DISH (NAME, IMAGE_URL, CATEGORY)
VALUES ('Carote','https://www.wellme.it/images/stories/alimentazione/ricette/insalata_carote_crude.jpg', 3);


INSERT INTO DISH (NAME, IMAGE_URL, CATEGORY)
VALUES ('Prova Senza Immagine','', 3);


INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2016-01-25',1);
INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2016-01-25',2);

INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2016-01-25',4);
INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2016-01-25',5);

INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2016-01-25',7);
INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2016-01-25',8);

INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2016-01-07',3);

INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2015-11-06',4);

INSERT INTO DAILYMENU (MENUDATE, DISH)
VALUES ('2015-11-06',7);