--stats
CREATE FUNCTION GetPlayerStatistics (
  @playerID INT
)
RETURNS TABLE AS
RETURN (
  SELECT
    CASE
      WHEN P.position = 'Goalkeeper' THEN
        SUM(GS.saves) AS Saves,
        SUM(GS.penaltiesSaved) AS PenaltiesSaved,
        SUM(GS.punches) AS Punches,
        SUM(GS.highClaim) AS HighClaim,
        SUM(GS.catches) AS Catches,
        SUM(GS.sweeperClearances) AS SweeperClearances,
        SUM(GS.throwOuts) AS ThrowOuts,
        SUM(GS.goalKicks) AS GoalKicks,
        SUM(GS.goalsConceded) AS GoalsConceded,
        SUM(GS.errorsLeadingToGoal) AS ErrorsLeadingToGoal,
        SUM(GS.ownGoals) AS OwnGoals,
        SUM(DS.fouls) AS Fouls,
        SUM(Goals.goals) AS Goals,
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Red') AS RedCards,
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Yellow') AS YellowCards,
        COUNT(AppearanceStats.apperanceType) FILTER (WHERE AppearanceStats.apperanceType = 'Start' OR AppearanceStats.apperanceType = 'Substitution') AS Appearances,
        COUNT(Goals.goalID) AS GoalsScored
      WHEN P.position = 'Defender' THEN
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Red') AS RedCards,
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Yellow') AS YellowCards,
        COUNT(AppearanceStats.apperanceType) FILTER (WHERE AppearanceStats.apperanceType = 'Start' OR AppearanceStats.apperanceType = 'Substitution') AS Appearances,
        COUNT(Goals.goalID) AS GoalsScored,
        SUM(DS.goalsConceded) AS GoalsConceded,
        SUM(DS.tackles) AS Tackles,
        SUM(DS.fouls) AS Fouls,
        SUM(DS.offsides) AS Offsides,
        SUM(Goals.goals) AS Goals,
        SUM(Goals.headedGoals) AS HeadedGoals,
        SUM(Goals.goalsWithRightFoot) AS GoalsWithRightFoot,
        SUM(Goals.goalsWithLeftFoot) AS GoalsWithLeftFoot,
        SUM(DS.hitWoodwork) AS HitWoodwork,
        SUM(DS.lastManTackles) AS LastManTackles,
        SUM(DS.blockedShots) AS BlockedShots,
        SUM(DS.interceptions) AS Interceptions,
        SUM(DS.clearances) AS Clearances,
        SUM(DS.headedClearance) AS HeadedClearance,
        SUM(DS.clearancesOffLine) AS ClearancesOffLine,
        SUM(DS.recoveries) AS Recoveries,
        SUM(DS.duelsWon) AS DuelsWon,
        SUM(DS.duelsLost) AS DuelsLost,
        SUM(DS.successful50_50s) AS Successful50_50s,
        SUM(DS.aerialBattlesWon) AS AerialBattlesWon,
        SUM(DS.aerialBattlesLost) AS AerialBattlesLost,
        SUM(DS.ownGoals) AS OwnGoals,
        SUM(DS.errorsLeadingToGoal) AS ErrorsLeadingToGoal,
        SUM(Goals.assists) AS Assists,
        SUM(DS.passes) AS Passes,
        SUM(DS.bigChancesCreated) AS BigChancesCreated,
        SUM(DS.crosses) AS Crosses,
        SUM(DS.throughBalls) AS ThroughBalls,
        SUM(DS.accurateLongBalls) AS AccurateLongBalls
      WHEN P.position = 'Midfielder' THEN
        SUM(DS.errorsLeadingToGoal) AS ErrorsLeadingToGoal,
        SUM(DS.aerialBattlesLost) AS AerialBattlesLost,
        SUM(DS.aerialBattlesWon) AS AerialBattlesWon,
        SUM(DS.successful50_50s) AS Successful50_50s,
        SUM(DS.duelsLost) AS DuelsLost,
        SUM(DS.duelsWon) AS DuelsWon,
        SUM(DS.recoveries) AS Recoveries,
        SUM(DS.headedClearance) AS HeadedClearance,
        SUM(DS.clearances) AS Clearances,
        SUM(DS.interceptions) AS Interceptions,
        SUM(DS.blockedShots) AS BlockedShots,
        SUM(DS.tackles) AS Tackles,
        SUM(DS.offsides) AS Offsides,
        SUM(DS.fouls) AS Fouls,
        SUM(DS.discipline) AS Discipline,
        SUM(DS.accurateLongBalls) AS AccurateLongBalls,
        SUM(DS.throughBalls) AS ThroughBalls,
        SUM(DS.crosses) AS Crosses,
        SUM(DS.bigChancesCreated) AS BigChancesCreated,
        SUM(DS.passesPerMatch) AS PassesPerMatch,
        SUM(DS.passes) AS Passes,
        SUM(DS.assists) AS Assists,
        SUM(DS.teamPlay) AS TeamPlay,
        SUM(DS.bigChancesMissed) AS BigChancesMissed,
        SUM(DS.hitWoodwork) AS HitWoodwork,
        SUM(DS.shotsOnTarget) AS ShotsOnTarget,
        SUM(DS.shots) AS Shots,
        SUM(DS.freekicksScored) AS FreekicksScored,
        SUM(DS.penaltiesScored) AS PenaltiesScored,
        SUM(DS.goalsWithLeftFoot) AS GoalsWithLeftFoot,
        SUM(DS.goalsWithRightFoot) AS GoalsWithRightFoot,
        SUM(DS.headedGoals) AS HeadedGoals,
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Red') AS RedCards,
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Yellow') AS YellowCards,
        COUNT(AppearanceStats.apperanceType) FILTER (WHERE AppearanceStats.apperanceType = 'Start' OR AppearanceStats.apperanceType = 'Substitution') AS Appearances,
        COUNT(Goals.goalID) AS GoalsScored
      WHEN P.position = 'Forward' THEN
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Red') AS RedCards,
        COUNT(DS.cardType) FILTER (WHERE DS.cardType = 'Yellow') AS YellowCards,
        COUNT(AppearanceStats.apperanceType) FILTER (WHERE AppearanceStats.apperanceType = 'Start' OR AppearanceStats.apperanceType = 'Substitution') AS Appearances,
        COUNT(Goals.goalID) AS GoalsScored,
        SUM(DS.headedClearance) AS HeadedClearance,
        SUM(DS.interceptions) AS Interceptions,
        SUM(DS.tackles) AS Tackles,
        SUM(DS.blockedShots) AS BlockedShots,
        SUM(DS.clearances) AS Clearances,
        SUM(DS.offsides) AS Offsides,
        SUM(DS.fouls) AS Fouls,
        SUM(DS.crosses) AS Crosses,
        SUM(DS.bigChancesCreated) AS BigChancesCreated,
        SUM(DS.passes) AS Passes,
        SUM(DS.passesPerMatch) AS PassesPerMatch,
        SUM(DS.assists) AS Assists,
        SUM(DS.bigChancesMissed) AS BigChancesMissed,
        SUM(DS.hitWoodwork) AS HitWoodwork,
        SUM(DS.shotsOnTarget) AS ShotsOnTarget,
        SUM(DS.shots) AS Shots,
        SUM(DS.freekicksScored) AS FreekicksScored,
        SUM(DS.penaltiesScored) AS PenaltiesScored,
        SUM(DS.goalsWithLeftFoot) AS GoalsWithLeftFoot,
        SUM(DS.goalsWithRightFoot) AS GoalsWithRightFoot,
        SUM(DS.headedGoals) AS HeadedGoals
    END
  FROM Players AS P
  LEFT JOIN GoalkeepersStats AS GS ON P.playerID = GS.playerID
  LEFT JOIN DisciplineStats AS DS ON P.playerID = DS.playerID
  LEFT JOIN AppearanceStats ON P.playerID = AppearanceStats.playerID
  LEFT JOIN Goals ON P.playerID = Goals.playerID
  WHERE P.playerID = @playerID
);


-- Create the function to get player ID based on parameters
CREATE FUNCTION GetPlayerID (
  @fName VARCHAR(255),
  @lName VARCHAR(255),
  @clubName VARCHAR(255),
  @squadNumber INT
)
RETURNS INT
AS
BEGIN
  DECLARE @playerID INT;

  SELECT @playerID = playerID
  FROM Players p
  JOIN Clubs c ON p.clubID = c.clubID
  WHERE 
    p.firstName = @fName AND
    p.lastName = @lName AND
    c.clubName = @clubName AND
    p.squadNumber = @squadNumber;

  RETURN @playerID;
END;



-- Function to get clubID based on clubName
CREATE FUNCTION GetClubID (
  @clubName VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @clubID INT;

  SELECT @clubID = clubID
  FROM Clubs
  WHERE clubName = @clubName;

  RETURN @clubID;
END;

--Function to get clubName from clubID
CREATE FUNCTION GetClubName (
  @clubID INT
)
RETURNS VARCHAR(255)
AS
BEGIN
  DECLARE @clubName INT;

  SELECT @clubName = clubName
  FROM Clubs
  WHERE clubID = @clubID;

  RETURN @clubName;
END;


-- Function to get venueID based on venueName
CREATE FUNCTION GetVenueID (
  @venueName VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @venueID INT;

  SELECT @venueID = venueID
  FROM Venues
  WHERE venueName = @venueName;

  RETURN @venueID;
END;


CREATE FUNCTION GetManagerIDByName (
  @fName VARCHAR(255),
  @mName VARCHAR(255),
  @lName VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @managerID INT;

  SELECT @managerID = managerID
  FROM Managers
  WHERE 
    firstName = @fName AND
	middleName = @mName AND
    lastName = @lName;

  RETURN @managerID;
END;

--functions for retrieving managerID for given club name
CREATE FUNCTION GetActiveManagerIDByClub (
  @clubName VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @managerID INT;

  SELECT @managerID = m.managerID
  FROM Managers m
  JOIN ClubManager cm ON m.managerID = cm.managerID
  JOIN Clubs c ON cm.clubID = c.clubID
  WHERE 
    c.clubName = @clubName AND
    m.managerStatus = 'Active' AND
	cm.endDate IS NULL;

  RETURN @managerID;
END;

-- Function to get fixtureID based on homeTeam, awayTeam, and fixtureDate
CREATE FUNCTION GetFixtureID (
  @homeTeamName VARCHAR(255),
  @awayTeamName VARCHAR(255),
  @fixtureDate DATE
)
RETURNS INT
AS
BEGIN
  DECLARE @fixtureID INT;

  SELECT @fixtureID = fixtureID
  FROM Fixtures
  WHERE 
    homeTeamID = dbo.GetClubID(@homeTeamName) AND
    awayTeamID = dbo.GetClubID(@awayTeamName) AND
    fixtureDate = @fixtureDate;

  RETURN @fixtureID;
END;

-- Function to get matchID based on homeTeam, awayTeam, and fixtureDate
CREATE FUNCTION GetMatchID (
  @homeTeamName VARCHAR(255),
  @awayTeamName VARCHAR(255),
  @fixtureDate DATE
)
RETURNS INT
AS
BEGIN
  DECLARE @matchID INT;

  SELECT @matchID = matchID
  FROM Matches
  WHERE 
    fixtureID = dbo.GetFixtureID(@homeTeamName, @awayTeamName, @fixtureDate)

  RETURN @matchID;
END;

--!! Function to get goalID based on playerName, teamFor, teamAgainst, fixtureDate, and minute
CREATE FUNCTION GetGoalID (
  @playerFName VARCHAR(255),
  @playerMName VARCHAR(255),
  @playerLName VARCHAR(255),
  @squadNumber INT,
  @teamFor INT,
  @teamAgainst INT,
  @fixtureDate DATE,
  @minute SMALLINT
)
RETURNS INT
AS
BEGIN
  DECLARE @goalID INT;

  DECLARE @playerID INT;
  SET @playerID = dbo.findPlayerID(@playerFName, @playerMName, @playerLName, @teamFor, @squadNumber);

  DECLARE @matchID INT;
  IF (
      SELECT matchID
      FROM Fixtures
      WHERE 
        homeTeamID = @teamFor AND
        awayTeamID = @teamAgainst AND
        fixtureDate = @fixtureDate
    ) IS NULL
    BEGIN
    SET @matchID = dbo.GetMatchID(@teamAgainst, @teamFor, @fixtureDate);
  ELSE
    BEGIN
    SET @matchID = dbo.GetMatchID(@teamFor, @teamAgainst, @fixtureDate);

  SELECT @goalID = goalID
  FROM Goals
  WHERE 
    playerID = @playerID AND
    goalAt = @teamAgainst AND
    matchID = @matchID AND
    goalMinute = @minute;

  RETURN @goalID;
END;


--Function to display tables
-- table based on 







--insert functions
--insert into playerstats
CREATE FUNCTION InsertPlayerStats (
  @matchID INT,
  @playerID INT,
  @teamFor INT,
  @fouls SMALLINT = 0,
  @offsides SMALLINT = 0,
  @headedGoal SMALLINT = 0,
  @leftFootGoal SMALLINT = 0,
  @rightFootGoal SMALLINT = 0,
  @penaltiesScored SMALLINT = 0,
  @freekickScored SMALLINT = 0,
  @shot SMALLINT = 0,
  @shotOnTarget SMALLINT = 0,
  @hitWoodwork SMALLINT = 0,
  @bigChanceMissed SMALLINT = 0,
  @assists SMALLINT = 0,
  @passes SMALLINT = 0,
  @bigChancesCreated SMALLINT = 0,
  @crosses SMALLINT = 0,
  @throughBalls SMALLINT = 0,
  @accurateLongBalls SMALLINT = 0,
  @tackles SMALLINT = 0,
  @blocks SMALLINT = 0,
  @interceptions SMALLINT = 0,
  @clearances SMALLINT = 0,
  @headedClearances SMALLINT = 0,
  @recoveries SMALLINT = 0,
  @duelsWon SMALLINT = 0,
  @successful50_50s SMALLINT = 0,
  @aerialBattlesWon SMALLINT = 0,
  @aerialBattlesLost SMALLINT = 0,
  @errorsLeadingToGoal SMALLINT = 0,
  @ownGoals SMALLINT = 0
)
RETURNS INT
AS
BEGIN
  DECLARE @statsID INT;

  INSERT INTO PlayersStats (
    matchID, playerID, teamFor, fouls, offsides, headedGoal, leftFootGoal, rightFootGoal, penaltiesScored, freekickScored, shot, shotOnTarget, hitWoodwork, bigChanceMissed, assists, passes, bigChancesCreated, crosses, throughBalls, accurateLongBalls, tackles, blocks, interceptions, clearances, headedClearances, recoveries, duelsWon, successful50_50s, aerialBattlesWon, aerialBattlesLost, errorsLeadingToGoal, ownGoals)
  VALUES (@matchID, @playerID, @teamFor, @fouls, @offsides, @headedGoal, @leftFootGoal, @rightFootGoal, @penaltiesScored, @freekickScored, @shot, @shotOnTarget, @hitWoodwork, @bigChanceMissed, @assists, @passes, @bigChancesCreated, @crosses, @throughBalls, @accurateLongBalls, @tackles, @blocks, @interceptions, @clearances, @headedClearances, @recoveries, @duelsWon, @successful50_50s, @aerialBattlesWon, @aerialBattlesLost, @errorsLeadingToGoal, @ownGoals);

  SET @statsID = SCOPE_IDENTITY();
  RETURN @statsID;
END;

--insert into goalkeeper stats
CREATE FUNCTION InsertGoalkeeperStats (
  @playerID INT,
  @matchID INT,
  @teamFor INT,
  @saves SMALLINT = 0,
  @punches SMALLINT = 0,
  @catches SMALLINT = 0,
  @goalsConceded SMALLINT = 0,
  @cleanSheets SMALLINT = 0,
  @penaltiesSaved SMALLINT = 0,
  @penaltiesScored SMALLINT = 0
)
RETURNS INT
AS
BEGIN
  DECLARE @statsID INT;

  INSERT INTO GoalkeepersStats (playerID, matchID, teamFor, saves, punches, catches, goalsConceded, cleanSheets, penaltiesSaved, penaltiesScored)
  VALUES (@playerID, @matchID, @teamFor, @saves, @punches, @catches, @goalsConceded, @cleanSheets, @penaltiesSaved, @penaltiesScored);

  SET @statsID = SCOPE_IDENTITY();
  RETURN @statsID;
END;

--to discipline stats
CREATE FUNCTION InsertDisciplineStats (
  @playerID INT,
  @matchID INT,
  @teamFor INT,
  @cardMinute SMALLINT,
  @cardType VARCHAR(50),
  @description VARCHAR(255) = ''
)
RETURNS INT
AS
BEGIN
  DECLARE @statID INT;

  INSERT INTO DisciplineStats (playerID, matchID, teamFor, cardMinute, cardType, description)
  VALUES (@playerID, @matchID, @teamFor, @cardMinute, @cardType, @description);

  SET @statID = SCOPE_IDENTITY();
  RETURN @statID;
END;

--penalties
CREATE FUNCTION InsertPenalties (
  @matchID INT,
  @playerID INT,
  @penaltyMinute SMALLINT,
  @penaltyType VARCHAR(50),
  @converted VARCHAR(5),
  @teamFor INT,
  @teamAt INT
)
RETURNS INT
AS
BEGIN
  DECLARE @penaltyID INT;

  INSERT INTO Penalties (matchID, playerID, penaltyMinute, penaltyType, converted, teamFor, teamAt)
  VALUES (@matchID, @playerID, @penaltyMinute, @penaltyType, @converted, @teamFor, @teamAt);

  SET @penaltyID = SCOPE_IDENTITY();

  IF @penaltyType != 'Penalty shootout'
  BEGIN
    DECLARE @goalID INT;
    INSERT INTO Goals (matchID, goalMinute, goalType, playerID, goalFor, goalAt)
    VALUES (@matchID, @penaltyMinute, 'Penalty scored', @playerID, @teamFor, @teamAt);

    SET @goalID = SCOPE_IDENTITY();
  END;

  RETURN @penaltyID;
END;

--app
CREATE FUNCTION InsertPlayerAppearance (
  @appearanceType VARCHAR(50),
  @playerID INT,
  @matchID INT
)
RETURNS INT
AS
BEGIN
  DECLARE @appearanceID INT;

  INSERT INTO AppearanceStats (apperanceType, playerID, matchID)
  VALUES (@appearanceType, @playerID, @matchID);

  SET @appearanceID = SCOPE_IDENTITY();

  RETURN @appearanceID;
END;

--fix
CREATE FUNCTION AddFixture (
  @homeTeamID INT,
  @awayTeamID INT,
  @fixtureDate DATE,
  @kickoff TIME,
  @venueID INT,
  @refereeID INT,
  @assistantReferee1ID INT,
  @assistantReferee2ID INT,
  @fourthOfficialID INT
)
RETURNS INT AS
BEGIN
  DECLARE @fixtureID INT;
  DECLARE @venueOccupied INT;
  DECLARE @teamsBusy INT;
  DECLARE @InvalidRecords INT;
  DECLARE @breakStatus VARCHAR(255);

  -- Check if the venue is occupied
  SELECT @venueOccupied = COUNT(fixtureID) FROM Fixtures
  WHERE venueID = @venueID AND fixtureDate = @fixtureDate;

  -- Check if the home or away team have a game on the same day
  SELECT @teamsBusy = COUNT(fixtureID) FROM Fixtures
  WHERE (homeTeamID = @homeTeamID OR awayTeamID = @homeTeamID OR homeTeamID = @awayTeamID OR awayTeamID = @awayTeamID)
    AND fixtureDate = @fixtureDate;
  /*
  -- Check if the inserted referee and officials have valid roles
  SELECT @InvalidRecords = COUNT(*)
  FROM inserted i
  LEFT JOIN Officials o1 ON i.refereeID = o1.officialID AND o1.maxRole = 'Referee'
  LEFT JOIN Officials o2 ON i.assistantReferee1ID = o2.officialID AND o2.maxRole IN ('Referee', 'Assistant referee')
  LEFT JOIN Officials o3 ON i.assistantReferee2ID = o3.officialID AND o3.maxRole IN ('Referee', 'Assistant referee')
  LEFT JOIN Officials o4 ON i.fourthOfficialID = o4.officialID AND o4.maxRole IN ('Referee', 'Assistant referee', 'Fourth official')
  WHERE
    o1.officialID IS NULL OR
    o2.officialID IS NULL OR
    o3.officialID IS NULL OR
    o4.officialID IS NULL;
*/
  IF 
  @venueOccupied <> 0
  BEGIN
    SET @breakStatus = 'Venue occupied for given fixture date';
    RETURN @breakStatus;
  END
  IF
  @teamsBusy <> 0 
  BEGIN
    SET @breakStatus = 'Either or both of the clubs have a match on the given fixture date';
    RETURN @breakStatus;
  END
  IF
  /*@InvalidRecords = 0*/
  @refereeID NOT IN (SELECT refereeID FROM Officials WHERE maxRole = 'Referee') OR
  @assistantReferee1ID NOT IN (SELECT refereeID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee')) OR
  @assistantReferee2ID NOT IN (SELECT refereeID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee')) OR
  @fourthOfficialID NOT IN (SELECT refereeID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee', 'Fourth official'))
  BEGIN
    SET @breakStatus = 'Invalid official(s) role(s)';
    RETURN @breakStatus;
  END
  ELSE 
  BEGIN
    -- Insert into Fixtures table
    INSERT INTO Fixtures (homeTeamID, awayTeamID, fixtureDate, kickoff, venueID, refereeID, assistantReferee1ID, assistantReferee2ID, fourthOfficialID, fixtureStatus)
    VALUES (@homeTeamID, @awayTeamID, @fixtureDate, @kickoff, @venueID, @refereeID, @assistantReferee1ID, @assistantReferee2ID, @fourthOfficialID, 'Scheduled');

    -- Get the inserted fixture ID
    SET @fixtureID = SCOPE_IDENTITY();

    RETURN @fixtureID;
  END;
END;


--update
--managers & managers contracts status
CREATE FUNCTION UpdateManagerContractStatus (
  @managerID INT,
  @startDate DATE,
  @clubName VARCHAR(255),
  @newContractStatus VARCHAR(50)
)
RETURNS INT AS
BEGIN
  UPDATE ManagerContract
  SET contractStatus = @newContractStatus
  WHERE managerID = @managerID AND startDate = @startDate AND clubID = GetClubID(@clubName);

  -- Update manager status to 'Inactive' if contract status is 'Expired', 'Cancelled', or 'Terminated', make appropraite changes to Managers & ClubsManagers tables as well
  IF @newContractStatus IN ('Expired', 'Cancelled', 'Terminated')
  BEGIN
    UPDATE Managers
    SET managerStatus = 'Inactive'
    WHERE managerID = @managerID;

    UPDATE ClubsManagers
    SET endDate = GETDATE()
    WHERE
      managerID = @managerID AND 
      clubID = GetClubID(@clubName) AND
      startDate = @startDate;
  END;

  RETURN @@ROWCOUNT;
END;



--stored procedure to delete
--managers
CREATE PROCEDURE DeleteManager (
  @managerID INT
)
AS
BEGIN
  BEGIN TRANSACTION;
  
  -- Delete from ManagerContract table
  DELETE FROM ManagerContract
  WHERE managerID = @managerID;
  
  -- Delete from ClubManager table
  DELETE FROM ClubManager
  WHERE managerID = @managerID;
  
  -- Delete from MOTM table
  DELETE FROM MOTM
  WHERE managerID = @managerID;

  -- Delete from Managers table
  DELETE FROM Managers
  WHERE managerID = @managerID;

  COMMIT TRANSACTION;
END;


--test
--test
DECLARE @foundPlayerID INT;
SET @foundPlayerID = dbo.GetPlayerID('Marcus', 'Rashford', 'Manchester United', 10);
SELECT @foundPlayerID;

DECLARE @clubID INT;
SET @clubID = dbo.GetClubID('Liverpool FC');
SELECT @clubID;

DECLARE @venueID INT;
SET @venueID = dbo.GetVenueID('Anfield');
SELECT @venueID;

DECLARE @managerID INT;
SET @managerID = dbo.GetManagerIDByName('Jurgen', 'Kirubel', 'Klopp');
SELECT @managerID;

DECLARE @activeManagerID INT;
SET @activeManagerID = dbo.GetActiveManagerIDByClub('Liverpool FC');
SELECT @activeManagerID;

select * from fixtures
DECLARE @fixtureID INT;
SET @fixtureID = dbo.GetFixtureID('Liverpool FC', 'Manchester United', '2023-09-20');
SELECT @fixtureID;

DECLARE @matchID INT;
SET @matchID = dbo.GetMatchID('Manchester United', 'Liverpool FC', '2023-08-20');
SELECT @matchID;

DECLARE @goalID INT;
SET @goalID = dbo.GetGoalID('PlayerFirstName', 'PlayerLastName', 2, 1, '2023-08-25', 45);
SELECT @goalID;
