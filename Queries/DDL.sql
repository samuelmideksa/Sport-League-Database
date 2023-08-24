-- !!! use matchID + playerID as PK in stats
-- Create Database
CREATE DATABASE EPL;

-- Create Clubs table
CREATE TABLE Clubs (
  clubID INT IDENTITY(1,1) PRIMARY KEY,
  clubName VARCHAR(255) NOT NULL,
  clubAbbreviation CHAR(3) NOT NULL UNIQUE,
  home INT NOT NULL,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  website VARCHAR(255) NOT NULL,
  twitter VARCHAR(255),
  instagram VARCHAR(255),
  facebook VARCHAR(255),
  youtube VARCHAR(255),
  tikTok VARCHAR(255),
  CHECK (email LIKE '%_@__%.__%'), 
  FOREIGN KEY (home) REFERENCES Venues(venueID)
);

-- Create Venues table
CREATE TABLE Venues (
  venueID INT IDENTITY(1,1) PRIMARY KEY,
  venueName VARCHAR(255) UNIQUE,
  venueLocation VARCHAR(255),
  capacity INT NOT NULL,
  CHECK (venueName NOT LIKE '%[^A-Za-z0-9. \\p{L}]%')
);

-- Create Managers table
CREATE TABLE Managers (
  managerID INT IDENTITY(1,1) PRIMARY KEY,
  firstName VARCHAR(255) NOT NULL,
  middleName VARCHAR(255),
  lastName VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  nationality VARCHAR(255) NOT NULL,
  managerStatus VARCHAR(50) NOT NULL,
  DOB DATE NOT NULL,
  managerBio text,
  salaryAmount MONEY NOT NULL,
  CHECK (email LIKE '%_@__%.__%'),
  CHECK (firstName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (middleName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (lastName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (managerStatus IN('Active', 'Inactive'))
);

-- Create ManagerClub table
CREATE TABLE ClubsManagers (
  clubManagerID INT IDENTITY(1, 1),
  managerID INT,
  clubID INT,
  startDate DATE,
  endDate DATE,
  UNIQUE (managerID, clubID, startDate),
  FOREIGN KEY (managerID) REFERENCES Managers(managerID),
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID)
);

-- Create Players table
CREATE TABLE Players (
  playerID INT IDENTITY(1,1) PRIMARY KEY,
  firstName NVARCHAR(255) NOT NULL,
  middleName VARCHAR(255),
  lastName NVARCHAR(255) NOT NULL,
  DOB DATE NOT NULL,
  cityOB VARCHAR(255) NOT NULL,
  countryOB VARCHAR(255) NOT NULL,
  nationality VARCHAR(255) NOT NULL,
  height INT NOT NULL,
  clubID INT NOT NULL,
  position VARCHAR(255) NOT NULL,
  squadNumber INT NOT NULL,
  salaryAmount MONEY NOT NULL,
  paymentFrequency VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  twitter VARCHAR(255),
  instagram VARCHAR(255),
  facebook VARCHAR(255),
  youtube VARCHAR(255),
  tikTok VARCHAR(255),
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID),
  CHECK (firstName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (middleName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (lastName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (email LIKE '%_@__%.__%'), 
  CHECK (paymentFrequency IN ('monthly', 'annual', 'weekly', 'bi-weekly'))
);



-- Create Officials table
CREATE TABLE Officials (
  officialID INT IDENTITY(1,1) PRIMARY KEY,
  firstName NVARCHAR(255) NOT NULL,
  middleName VARCHAR(255),
  lastName NVARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  maxRole VARCHAR(50) NOT NULL, 
  nationality VARCHAR(255) NOT NULL,
  CHECK (firstName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (middleName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (lastName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (maxRole IN('Referee', 'Assistant referee', 'Fourth official')),
  CHECK (lastName NOT LIKE '%[^A-Za-z. \\p{L}]%'),
  CHECK (email LIKE '%_@__%.__%')
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
  UNIQUE (homeTeamID, awayTeamID, fixtureDate)
  FOREIGN KEY (refereeID) REFERENCES Officials(officialID),
  FOREIGN KEY (assistantReferee1ID) REFERENCES Officials(officialID),
  FOREIGN KEY (assistantReferee2ID) REFERENCES Officials(officialID),
  FOREIGN KEY (fourthOfficialID) REFERENCES Officials(officialID),
  /*CHECK (refereeID IN (SELECT officialID FROM Officials WHERE maxRole = 'Referee')),
  CHECK (assistantReferee1ID IN (
    SELECT officialID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee')
    )
  ),
  CHECK (assistantReferee2ID IN (
    SELECT officialID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee')
    )
  ),
  CHECK (fourthOfficialID IN (
    SELECT officialID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee', 'Fourth official')
    )
  ),
  CHECK (fixtureStatus IN('Scheduled', 'In progress', 'Completed', 'Cancelled', 'Postponed', 'Forfeit', 'Abandoned'))*/
);

-- Create Matches table
CREATE TABLE Matches (
  matchID INT IDENTITY(1,1) PRIMARY KEY,
  fixtureID INT NOT NULL UNIQUE,
  HTHomeTeamScore INT NOT NULL,
  HTAwayTeamScore INT NOT NULL,
  FTHomeTeamScore INT NOT NULL,
  FTAwayTeamScore INT NOT NULL,
  FOREIGN KEY (fixtureID) REFERENCES Fixtures(fixtureID)
);

-- Create AppearanceStats table
CREATE TABLE AppearanceStats (
  appearanceID INT IDENTITY(1,1) PRIMARY KEY,
  apperanceType VARCHAR(50) NOT NULL,
  playerID INT NOT NULL,
  clubFor INT NOT NULL,
  matchID INT NOT NULL,
  UNIQUE (playerID, matchID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (clubFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  CHECK (apperanceType IN('Start', 'Substitution'))
);

--Tables to store match events

-- Create Goals table
CREATE TABLE Goals (
  goalID INT IDENTITY(1,1) PRIMARY KEY,
  matchID INT NOT NULL,
  goalMinute SMALLINT NOT NULL,
  goalType VARCHAR(50) NOT NULL,
  assistBy INT,
  playerID INT NOT NULL,
  clubFor INT NOT NULL,
  clubAt INT NOT NULL,
  UNIQUE (matchID, goalMinute, goalType, assistBy, playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (assistBy) REFERENCES Players(playerID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (clubFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (clubAt) REFERENCES Clubs(clubID),
  CHECK (goalType IN('Headed goal', 'Goal with right foot', 'Goal with left foot', 'Penalty Scored', 'Freekick scored', 'Own goal'))
);

-- Create Penalties table
CREATE TABLE Penalties (
  penaltyID INT IDENTITY(1,1) PRIMARY KEY,
  matchID INT NOT NULL,
  playerID INT NOT NULL,
  penaltyMinute SMALLINT,
  penaltyType VARCHAR(50) NOT NULL,
  converted VARCHAR(5) NOT NULL,
  clubFor INT NOT NULL,
  clubAt INT NOT NULL,
  UNIQUE (matchID, penaltyMinute, penaltyType, playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (clubFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (clubAt) REFERENCES Clubs(clubID),
  CHECK (penaltyType IN('Regular penalty', 'Penalty shootout', 'Retake')),
  CHECK (converted IN('True', 'False'))
);

-- Create Substitutions table
CREATE TABLE Substitutions (
  substitutionID INT IDENTITY(1,1) PRIMARY KEY,
  matchID INT NOT NULL,
  playerInID INT NOT NULL,
  playerOutID INT NOT NULL,
  clubFor INT NOT NULL,
  substitutionMinute SMALLINT NOT NULL,
  description VARCHAR(255),
  UNIQUE (matchID, playerInID, playerOutID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (clubFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (playerInID) REFERENCES Players(playerID),
  FOREIGN KEY (playerOutID) REFERENCES Players(playerID)
);

-- Create Cards table
CREATE TABLE PlayersStats (
  matchID INT NOT NULL,
  playerID INT NOT NULL,
  clubFor INT NOT NULL,
  clubAt INT NOT NULL,
  fouls SMALLINT NOT NULL DEFAULT 0,
  offsides SMALLINT NOT NULL DEFAULT 0,
  headedGoal SMALLINT NOT NULL DEFAULT 0,
  leftFootGoal SMALLINT NOT NULL DEFAULT 0,
  rightFootGoal SMALLINT NOT NULL DEFAULT 0,
  penaltiesScored SMALLINT NOT NULL DEFAULT 0,
  freekickScored SMALLINT NOT NULL DEFAULT 0,
  shot SMALLINT NOT NULL DEFAULT 0,
  shotOnTarget SMALLINT NOT NULL DEFAULT 0,
  hitWoodwork SMALLINT NOT NULL DEFAULT 0,
  bigChanceMissed SMALLINT NOT NULL DEFAULT 0,
  assists SMALLINT NOT NULL DEFAULT 0,
  passes SMALLINT NOT NULL DEFAULT 0,
  bigChancesCreated SMALLINT NOT NULL DEFAULT 0,
  crosses SMALLINT NOT NULL DEFAULT 0,
  throughBalls SMALLINT NOT NULL DEFAULT 0,
  accurateLongBalls SMALLINT NOT NULL DEFAULT 0,
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
  cleanSheet 
  PRIMARY KEY (matchID, playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (clubFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (clubAt) REFERENCES Clubs(clubID)
);

-- Create DisciplineStats table
CREATE TABLE DisciplineStats (
  disciplineStatID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  matchID INT NOT NULL,
  clubFor INT NOT NULL,
  cardMinute SMALLINT NOT NULL,
  cardType VARCHAR(50) NOT NULL,
  description VARCHAR(255),
  UNIQUE (playerID, matchID, cardMinute, cardType),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  CHECK (cardType IN('Yellow', 'Red')),
  FOREIGN KEY (clubFor) REFERENCES Clubs(clubID),
  FOREIGN KEY (clubAgainst) REFERENCES Clubs(clubID)
)

-- Create GoalkeepersStats table
CREATE TABLE GoalkeepersStats (
  goalkeepersStatID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  matchID INT NOT NULL,
  clubFor INT NOT NULL,
  saves SMALLINT NOT NULL DEFAULT 0,
  penaltiesSaved SMALLINT NOT NULL DEFAULT 0,
  punches SMALLINT NOT NULL DEFAULT 0,
  highClaims SMALLINT NOT NULL DEFAULT 0,
  catches SMALLINT NOT NULL DEFAULT 0,
  sweeperClearances SMALLINT NOT NULL DEFAULT 0,
  throwOuts SMALLINT NOT NULL DEFAULT 0,
  goalKicks SMALLINT NOT NULL DEFAULT 0,
  PRIMARY KEY (matchID, playerID),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (clubFor) REFERENCES Clubs(clubID)
);


-- Create PlayerTransactions table
CREATE TABLE PlayerTransactions (
  transactionID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  transactionType VARCHAR(50) NOT NULL,
  fromClub INT,
  toClub INT NOT NULL,
  transactionDate DATE NOT NULL,
  UNIQUE (playerID, fromClub, toClub, transactionDate),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (from) REFERENCES Clubs(clubID),
  FOREIGN KEY (to) REFERENCES Clubs(clubID),
  CHECK (transactionType IN('Loan', 'Transfer', 'Release', 'Resign'))
);

-- Create PlayerContract table
CREATE TABLE PlayersContracts (
  playerContractID INT IDENTITY(1,1) PRIMARY KEY,
  playerID INT NOT NULL,
  clubID INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  contractValue MONEY NOT NULL,
  contractType VARCHAR(50) NOT NULL,
  contractStatus VARCHAR(50) NOT NULL,
  transferFee MONEY,
  buyoutClause MONEY,
  UNIQUE (playerID, clubID, startDate),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID),
  CHECK (contractType IN('Professional', 'Youth Development', 'Academy')),
  CHECK (contractStatus IN('Active', 'Expired', 'Cancelled', 'Terminated'))
);

-- Create ManagerContract table
CREATE TABLE ManagersContracts (
  managerContractID INT IDENTITY(1,1) PRIMARY KEY,
  managerID INT NOT NULL,
  clubID INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  contractStatus VARCHAR(50) NOT NULL,
  UNIQUE (managerID, clubID, startDate),
  FOREIGN KEY (clubID) REFERENCES Clubs(clubID),
  FOREIGN KEY (managerID) REFERENCES Managers(managerID),
  CHECK (contractStatus IN('Active', 'Expired', 'Cancelled', 'Terminated'))
);

-- Create Awards tables for In season monthly awards
CREATE TABLE MonthlyPlayerAwards (
  awardType VARCHAR(100) NOT NULL,
  awardYear INT NOT NULL,
  awardMonth INT NOT NULL,
  playerID INT NOT NULL,
  matchID INT,
  goalID INT,
  PRIMARY KEY (awardYear, awardMonth),
  FOREIGN KEY (playerID) REFERENCES Players(playerID),
  FOREIGN KEY (matchID) REFERENCES Matches(matchID),
  FOREIGN KEY (goalID) REFERENCES Goals(goalID),
  CHECK (awardMonth BETWEEN 1 AND 12),
  CHECK (awardType IN ('Player of the Month', 'Goal of the Month', 'Save of the Month'))
);

CREATE TABLE MOTM (
  awardYear INT,
  awardMonth INT,
  managerID INT,
  PRIMARY KEY (awardYear, awardMonth),
  FOREIGN KEY (managerID) REFERENCES Managers(managerID),
  CHECK (awardMonth BETWEEN 1 AND 12)
);

