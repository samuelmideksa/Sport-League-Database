-- Create Database
CREATE DATABASE EPL;

-- Create Seasons table
CREATE TABLE Seasons (
  seasonID INT IDENTITY(1,1) PRIMARY KEY,
  startDate DATE NOT NULL,
  endDate DATE,
  seasonStatus VARCHAR(50),
  CHECK (seasonStatus IN('Upcoming', 'In progress', 'Completed', 'Suspended', 'Postponed', 'Cancelled', 'Ended'))
);

-- Create Clubs table
CREATE TABLE Clubs (
  clubID INT IDENTITY(1,1) PRIMARY KEY,
  clubName VARCHAR(255) NOT NULL,
  clubAbbreviation CHAR(3) NOT NULL,
  home VARCHAR(255) NOT NULL,
  website VARCHAR(255) NOT NULL,
  twitter VARCHAR(255),
  instagram VARCHAR(255),
  facebook VARCHAR(255),
  youtube VARCHAR(255),
  tikTok VARCHAR(255)
);

-- Create Venues table
CREATE TABLE Venues (
  venueID INT IDENTITY(1,1) PRIMARY KEY,
  venueName VARCHAR(255),
  venueLocation VARCHAR(255),
  capacity INT NOT NULL,
  CHECK (venueName NOT LIKE '%[^A-Za-z0-9.\\p{L}]%')
);

-- Create Managers table
CREATE TABLE Managers (
  managerID INT IDENTITY(1,1) PRIMARY KEY,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  nationality VARCHAR(255) NOT NULL,
  managerStatus VARCHAR(50) NOT NULL,
  DOB DATE NOT NULL,
  managerBio text,
  CHECK (firstName NOT LIKE '%[^A-Za-z.\\p{L}]%'),
  CHECK (lastName NOT LIKE '%[^A-Za-z.\\p{L}]%'),
  CHECK (managerStatus IN('Active', 'Inactive'))
);

-- Create ManagerClub table
CREATE TABLE ClubManager (
  managerID INT,
  clubID INT,
  startDate DATE,
  endDate DATE,
  PRIMARY KEY (managerID, clubID),
  FOREIGN KEY (managerID) REFERENCES Managers(managerID),
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID)
);

-- Create Players table
CREATE TABLE Players (
  playerID INT IDENTITY(1,1) PRIMARY KEY,
  firstName NVARCHAR(255) NOT NULL ,
  lastName NVARCHAR(255) NOT NULL,
  DOB DATE NOT NULL,
  cityOB VARCHAR(255) NOT NULL,
  countryOB VARCHAR(255) NOT NULL,
  nationality VARCHAR(255) NOT NULL,
  height INT NOT NULL,
  clubID INT NOT NULL,
  position VARCHAR(255) NOT NULL,
  squadNumber INT NOT NULL,
  twitter VARCHAR(255),
  instagram VARCHAR(255),
  facebook VARCHAR(255),
  youtube VARCHAR(255),
  tikTok VARCHAR(255),
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID),
  CHECK (firstName NOT LIKE '%[^A-Za-z.\\p{L}]%'),
  CHECK (lastName NOT LIKE '%[^A-Za-z.\\p{L}]%')
);

-- Create Officials table
CREATE TABLE Officials (
  officialID INT IDENTITY(1,1) PRIMARY KEY,
  firstName NVARCHAR(255) NOT NULL ,
  highestRole VARCHAR(50) NOT NULL, 
  lastName NVARCHAR(255) NOT NULL ,
  nationality VARCHAR(255) NOT NULL,
  CHECK (firstName NOT LIKE '%[^A-Za-z.\\p{L}]%'),
  CHECK (highestRole IN('Referee', 'Assistant referee', 'Fourth official')),
  CHECK (lastName NOT LIKE '%[^A-Za-z.\\p{L}]%')
);

-- Create Fixtures table
CREATE TABLE Fixtures (
  fixtureID INT IDENTITY(1,1) PRIMARY KEY,
  homeTeamID INT NOT NULL,
  awayTeamID INT NOT NULL,
  fixtureDate DATE NOT NULL,
  kickoff TIME NOT NULL,
  venueID INT NOT NULL,
  refereeID INT NOT NULL,
  assistantReferee1ID INT NOT NULL,
  assistantReferee2ID INT NOT NULL,
  fourthOfficialID INT NOT NULL,
  fixtureStatus VARCHAR(50) NOT NULL,
  FOREIGN KEY (homeTeamID) REFERENCES Clubs(clubID),
  FOREIGN KEY (awayTeamID) REFERENCES Clubs(clubID),
  FOREIGN KEY (venueID) REFERENCES Venues(venueID),
  FOREIGN KEY (refereeID) REFERENCES Officials(officialID),
  FOREIGN KEY (assistantReferee1ID) REFERENCES Officials(officialID),
  FOREIGN KEY (assistantReferee2ID) REFERENCES Officials(officialID),
  FOREIGN KEY (fourthOfficialID) REFERENCES Officials(officialID)/*,
  CHECK (refereeID IN (SELECT officialID FROM Officials WHERE highestRole = 'Referee')),
  CHECK (assistantReferee1ID IN (SELECT officialID FROM Officials WHERE highestRole IN('Referee', 'Assistant referee'))),
  CHECK (assistantReferee2ID IN (SELECT officialID FROM Officials WHERE highestRole IN('Referee', 'Assistant referee'))),
  CHECK (fourthOfficialID IN (SELECT officialID FROM Officials WHERE highestRole IN('Referee', 'Assistant referee', 'Fourth offical'))),
  CHECK (fixtureStatus IN('Scheduled', 'In progress', 'Completed', 'Cancelled', 'Postponed', 'Forfeit', 'Abandoned'))*/
);

-- Create Matches table
CREATE TABLE Matches (
  matchID INT IDENTITY(1,1) PRIMARY KEY,
  fixtureID INT NOT NULL,
  HTHomeTeamScore INT NOT NULL,
  HTAwayTeamScore INT NOT NULL,
  FTHomeTeamScore INT NOT NULL,
  FTAwayTeamScore INT NOT NULL,
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (fixtureID) REFERENCES Fixtures(fixtureID)
);

-- Create AppearanceStats table
CREATE TABLE AppearanceStats (
  appearanceID INT IDENTITY(1,1) PRIMARY KEY,
  apperanceType VARCHAR(50) NOT NULL,
  playerID INT NOT NULL,
  matchID INT NOT NULL,
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  CHECK (apperanceType IN('Start', 'Substitution'))
);

--Tables to store match events

-- Create Goals table
CREATE TABLE Goals (
  goalID INT IDENTITY(1,1) PRIMARY KEY,
  matchID INT NOT NULL,
  goalType VARCHAR(50) NOT NULL,
  assistBy INT,
  playerID INT NOT NULL,
  goalFor INT NOT NULL,
  goalAt INT NOT NULL,
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (assistBy) REFERENCES Players(playerID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (goalFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (goalAt) REFERENCES Clubs(clubID),
  CHECK (goalType IN('Headed goal', 'Goal with right foot', 'Goal with left foot', 'Penalty Scored', 'Freekick scored', 'Own goal'))
);

-- Create Cards table
CREATE TABLE Cards (
  cardID INT IDENTITY(1,1) PRIMARY KEY,
  matchID INT NOT NULL,
  playerID INT NOT NULL,
  cardMinute SMALLINT NOT NULL,
  cardType VARCHAR(50) NOT NULL,
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  CHECK (cardType IN('Yellow', 'Red'))
);

-- Create Penalties table
CREATE TABLE Penalties (
  penaltyID INT IDENTITY(1,1) PRIMARY KEY,
  matchID INT NOT NULL,
  penaltyMinute SMALLINT,
  penaltyType VARCHAR(50) NOT NULL,
  converted VARCHAR(5) NOT NULL,
  teamFor INT NOT NULL,
  teamAt INT NOT NULL,
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (teamFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (teamAt) REFERENCES Clubs(clubID),
  CHECK (penaltyType IN('Regular penalty', 'Penalty shootout', 'Retake')),
  CHECK (converted IN('True', 'False'))
);

-- Create Substitutions table
CREATE TABLE Substitutions (
  substitutionID INT IDENTITY(1,1) PRIMARY KEY,
  matchID INT NOT NULL,
  playerInID INT NOT NULL,
  playerOutID INT NOT NULL,
  substitutionMinute SMALLINT NOT NULL,
  description VARCHAR(255),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (playerInID) REFERENCES Players(playerID),
  FOREIGN KEY (playerOutID) REFERENCES Players(playerID)
);

-- Create AttackStats table
CREATE TABLE AttackStats (
  attackID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  matchID INT NOT NULL,
  teamFor INT NOT NULL,
  headedGoal SMALLINT NOT NULL DEFAULT 0,
  leftFootGoal SMALLINT NOT NULL DEFAULT 0,
  rightFootGoal SMALLINT NOT NULL DEFAULT 0,
  penaltiesScored SMALLINT NOT NULL DEFAULT 0,
  freekickScored SMALLINT NOT NULL DEFAULT 0,
  shot SMALLINT NOT NULL DEFAULT 0,
  shotOnTarget SMALLINT NOT NULL DEFAULT 0,
  hitWoodwork SMALLINT NOT NULL DEFAULT 0,
  bigChanceMissed SMALLINT NOT NULL DEFAULT 0,
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (teamFor) REFERENCES Clubs(clubID)
);

-- Create TeamPlayStats table
CREATE TABLE TeamPlayStats (
  teamPlayID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  matchID INT NOT NULL,
  teamFor INT NOT NULL,
  assists SMALLINT NOT NULL DEFAULT 0,
  passes SMALLINT NOT NULL DEFAULT 0,
  bigChancesCreated SMALLINT NOT NULL DEFAULT 0,
  crosses SMALLINT NOT NULL DEFAULT 0,
  throughBalls SMALLINT NOT NULL DEFAULT 0,
  accurateLongBalls SMALLINT NOT NULL DEFAULT 0,
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (teamFor) REFERENCES Clubs(clubID)
);

-- Create Discipline table
CREATE TABLE Discipline (
  disciplineID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  matchID INT NOT NULL,
  teamFor INT NOT NULL,
  yellowCards SMALLINT NOT NULL DEFAULT 0,
  redCards SMALLINT NOT NULL DEFAULT 0,
  fouls SMALLINT NOT NULL DEFAULT 0,
  offsides SMALLINT NOT NULL DEFAULT 0,
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (teamFor) REFERENCES Clubs(clubID)
);

-- Create Defence table
CREATE TABLE Defence (
  defenceID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  matchID INT NOT NULL,
  teamFor INT NOT NULL,
  tackles SMALLINT NOT NULL DEFAULT 0,
  blocks SMALLINT NOT NULL DEFAULT 0,
  interceptions SMALLINT NOT NULL DEFAULT 0,
  clearances SMALLINT NOT NULL DEFAULT 0,
  headedClearances SMALLINT NOT NULL DEFAULT 0,
  recoveries SMALLINT NOT NULL DEFAULT 0,
  duelsWon SMALLINT NOT NULL DEFAULT 0,
  successful50_50s SMALLINT NOT NULL DEFAULT 0,
  aerialBattlesWon SMALLINT NOT NULL DEFAULT 0,
  aerialBattlesLost SMALLINT NOT NULL DEFAULT 0,
  errorsLeadingToGoal SMALLINT NOT NULL DEFAULT 0,
  ownGoals SMALLINT NOT NULL DEFAULT 0,
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (teamFor) REFERENCES Clubs(clubID)
);

-- Create Goalkeeping table
CREATE TABLE Goalkeeping (
  goalKeepingID INT IDENTITY(1,1) PRIMARY KEY,
  keeperID INT NOT NULL,
  matchID INT NOT NULL,
  teamFor INT NOT NULL,
  saves SMALLINT NOT NULL DEFAULT 0,
  penaltiesSaved SMALLINT NOT NULL DEFAULT 0,
  punches SMALLINT NOT NULL DEFAULT 0,
  highClaims SMALLINT NOT NULL DEFAULT 0,
  catches SMALLINT NOT NULL DEFAULT 0,
  sweeperClearances SMALLINT NOT NULL DEFAULT 0,
  throwOuts SMALLINT NOT NULL DEFAULT 0,
  goalKicks SMALLINT NOT NULL DEFAULT 0,
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (teamFor) REFERENCES Clubs(clubID)
);


-- Create PlayerTransactions table
CREATE TABLE PlayerTransactions (
  transactionID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  transactionType VARCHAR(50) NOT NULL,
  fromTeam INT,
  toTeam INT NOT NULL,
  transactionDate DATE NOT NULL,
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (fromTeam) REFERENCES Clubs(clubID),
  FOREIGN KEY (toTeam) REFERENCES Clubs(clubID),
  CHECK (transactionType IN('Loan', 'Transfer', 'Release', 'Resign'))
);

-- Create PlayerContract table
CREATE TABLE PlayerContract (
  contractID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  clubID INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  contractValue MONEY NOT NULL,
  contractType VARCHAR(50) NOT NULL,
  contractStatus VARCHAR(50) NOT NULL,
  transferFee MONEY NOT NULL,
  buyoutClause MONEY,
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID),
  CHECK (contractType IN('Professional', 'Youth Development', 'Academy')),
  CHECK (contractStatus IN('Active', 'Expired', 'Cancelled', 'Terminated'))
);

-- Create PlayerSalary table
CREATE TABLE PlayerSalary (
  salaryID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  salaryAmount MONEY NOT NULL,
  paymentFrequency VARCHAR(50) NOT NULL,
  bonuses MONEY,
  bonusPaymentFrequency VARCHAR(50),
  FOREIGN KEY (playerID) REFERENCES Players(playerID)
);

-- Create ManagerContract table
CREATE TABLE ManagerContract (
  contractID INT IDENTITY(1,1) PRIMARY KEY,
  managerID INT NOT NULL,
  clubID INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  contractStatus VARCHAR(50) NOT NULL,
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID),
  FOREIGN KEY (managerID) REFERENCES Managers(managerID),
  CHECK (contractStatus IN('Active', 'Expired', 'Cancelled', 'Terminated'))

);

-- Create ManagerSalary table
CREATE TABLE ManagerSalary (
  salaryID INT IDENTITY(1,1) PRIMARY KEY,
  managerID INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  salaryAmount MONEY NOT NULL,
  paymentFrequency VARCHAR(50) NOT NULL,
  bonuses MONEY,
  bonusPaymentFrequency VARCHAR(50),
  FOREIGN KEY (managerID) REFERENCES Managers(managerID)
);

-- Create Awards tables for In season monthly awards
CREATE TABLE MonthlyPlayerAwards (
  seasonID INT NOT NULL,
  awardType VARCHAR(100) NOT NULL,
  awardYear INT NOT NULL,
  awardMonth INT NOT NULL,
  playerID INT NOT NULL,
  matchID INT,
  goalID INT,
  PRIMARY KEY (seasonID, awardMonth),
  FOREIGN KEY (seasonID) REFERENCES Seasons(seasonID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  CHECK (awardMonth BETWEEN 1 AND 12),
  CHECK (awardType IN ('Player of the Month', 'Goal of the Month', 'Save of the Month'))
);

CREATE TABLE MOTM (
  seasonID INT,
  awardMonth INT,
  managerID INT,
  PRIMARY KEY (seasonID, awardMonth),
  FOREIGN KEY (seasonID) REFERENCES Seasons(seasonID),
  FOREIGN KEY (managerID) REFERENCES Managers(managerID),
  CHECK (awardMonth BETWEEN 1 AND 12)
);


--Add Awards column for Alltime Seasonal awards
ALTER TABLE Seasons
ADD MOTS INT,
  POTS INT,
  YPOTS INT,
  GOTS INT,
  SOTS INT,
  GC INT,
  GB INT,
  GG INT,
  Playmaker INT,
  MIC INT,
  MPG INT,
  FOREIGN KEY (MOTS) REFERENCES Managers(managerID),
  FOREIGN KEY (POTS) REFERENCES Players(playerID),
  FOREIGN KEY (YPOTS) REFERENCES Players(playerID),
  FOREIGN KEY (GOTS) REFERENCES Goals(goalID),
  FOREIGN KEY (SOTS) REFERENCES Players(playerID),
  FOREIGN KEY (GC) REFERENCES Players(playerID),
  FOREIGN KEY (GB) REFERENCES Players(playerID),
  FOREIGN KEY (GG) REFERENCES Players(playerID),
  FOREIGN KEY (Playmaker) REFERENCES Players(playerID),
  FOREIGN KEY (MIC) REFERENCES Clubs(clubID),
  FOREIGN KEY (MPG) REFERENCES Goals(goalID);