CREATE TABLE IF NOT EXISTS USER (
  ID INT NOT NULL AUTO_INCREMENT,
  USER_NAME VARCHAR(100),
  PASSWORD VARCHAR(100),
  SALT INT,
  PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS GAME_PARAMETERS (
  ID INT NOT NULL AUTO_INCREMENT,
  NUMBER_OF_PLAYERS INT,
  DURATION INT,
  INCOME_VALUE INT,
  INCOME_INTERVAL INT,
  COST_SCALE INT,
  PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS GAME (
  ID INT NOT NULL AUTO_INCREMENT,
  GAME_PARAMETERS_ID INT,
  START_TIME INT,
  LAST_UPDATE INT,
  FOREIGN KEY (GAME_PARAMETERS_ID) REFERENCES GAME_PARAMETERS(ID) ON DELETE CASCADE,
  PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS PLAYER (
  ID INT NOT NULL AUTO_INCREMENT,
  USER_ID INT NOT NULL,
  GAME_ID INT NOT NULL,
  MONEY INT,
  SCORE INT,
  FOREIGN KEY (USER_ID) REFERENCES USER(ID) ON DELETE CASCADE,
  FOREIGN KEY (GAME_ID) REFERENCES GAME(ID) ON DELETE CASCADE,
  PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS RECT_BLOCK (
  ID INT NOT NULL AUTO_INCREMENT,
  PLAYER_ID INT NOT NULL,
  GAME_ID INT NOT NULL,
  X INT,
  Y INT,
  WIDTH INT,
  HEIGHT INT,
  FOREIGN KEY (GAME_ID) REFERENCES GAME(ID) ON DELETE CASCADE,
  FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER(ID) ON DELETE CASCADE,
  PRIMARY KEY (ID)
);

INSERT INTO GAME_PARAMETERS (
  NUMBER_OF_PLAYERS,
  DURATION,
  INCOME_VALUE,
  INCOME_INTERVAL,
  COST_SCALE
) VALUES (
  4,
  1000 * 60 * 10,
  10,
  1000,
  1
);