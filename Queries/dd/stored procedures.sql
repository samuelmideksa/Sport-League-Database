

--fix
CREATE PROCEDURE AddFixture (
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
AS
BEGIN
  DECLARE @fixtureID INT;
  DECLARE @venueOccupied INT;
  DECLARE @teamsBusy INT;
  DECLARE @breakStatus VARCHAR(255);

  -- Check if the venue is occupied
  SELECT @venueOccupied = COUNT(*) FROM Fixtures WHERE venueID = @venueID AND fixtureDate = @fixtureDate;

  -- Check if the home or away team have a game on the same day
  SELECT @teamsBusy = COUNT(*) FROM Fixtures WHERE (homeTeamID = @homeTeamID OR awayTeamID = @homeTeamID OR homeTeamID = @awayTeamID OR awayTeamID = @awayTeamID) AND fixtureDate = @fixtureDate;

  IF @venueOccupied <> 0
  BEGIN
    SET @breakStatus = 'Venue occupied for given fixture date';
    SELECT @breakStatus AS ErrorStatus;
    RETURN;
  END;
  
  IF @teamsBusy <> 0
  BEGIN
    SET @breakStatus = 'Either or both of the clubs have a match on the given fixture date';
    SELECT @breakStatus AS ErrorStatus;
    RETURN;
  END;
  

  -- Validate Officials
  IF
  @refereeID NOT IN (SELECT officialID FROM Officials WHERE maxRole = 'Referee') OR
  @assistantReferee1ID NOT IN (SELECT officialID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee')) OR
  @assistantReferee2ID NOT IN (SELECT officialID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee')) OR
  @fourthOfficialID NOT IN (SELECT officialID FROM Officials WHERE maxRole IN('Referee', 'Assistant referee', 'Fourth official'))
  BEGIN
	SET @breakStatus = 'Invalid official(s) role(s)';
	SELECT @breakStatus AS ErrorStatus;
    RETURN;
  END;

  ELSE 
  BEGIN
    -- Insert into Fixtures table
    INSERT INTO Fixtures (homeTeamID, awayTeamID, fixtureDate, kickoff, venueID, refereeID, assistantReferee1ID, assistantReferee2ID, fourthOfficialID, fixtureStatus)
    VALUES (@homeTeamID, @awayTeamID, @fixtureDate, @kickoff, @venueID, @refereeID, @assistantReferee1ID, @assistantReferee2ID, @fourthOfficialID, 'Scheduled');

    -- Get the inserted fixture ID
    SET @fixtureID = SCOPE_IDENTITY();

    SELECT @fixtureID AS FixtureID;
	RETURN;
  END;
END;

--Start Match
CREATE PROCEDURE StartMatch (
  @fixtureID INT
  )
AS
BEGIN
  -- Update fixture status to 'In progress'
  
  DECLARE @KickOff TIME, @fixtureDate DATE;
  SELECT @KickOff = kickoff, @fixtureDate = fixtureDate
  FROM Fixtures 
  WHERE fixtureID = @fixtureID

  IF CAST(GETDATE() AS DATE) > @fixtureDate OR 
   (CAST(GETDATE() AS DATE) = @fixtureDate AND CONVERT(TIME, GETDATE()) > @kickoff)
  BEGIN
    UPDATE Fixtures
    SET fixtureStatus = 'In progress'
    WHERE fixtureID = @fixtureID;

    -- Insert a tuple in Matches table
    INSERT INTO Matches (fixtureID,HTHomeTeamScore, HTAwayTeamScore, FTHomeTeamScore, FTAwayTeamScore)
    VALUES (@fixtureID, 0, 0, 0, 0);

    -- Get the inserted match ID
    DECLARE @matchID INT;
    SET @matchID = SCOPE_IDENTITY();

    -- Return the match ID
    SELECT @matchID AS MatchID;
  END
END;



--insert goal and update score
-- Insert goal and update score
CREATE PROCEDURE InsertGoalAndUpdateScore (
  @insertResult VARCHAR(100) = 'Insertion successful',
  @matchID INT,
  @goalMinute SMALLINT,
  @goalType VARCHAR(50),
  @playerID INT,
  @assistByPlayerID INT = NULL,
  @clubFor INT,
  @clubAgainst INT
)
AS
BEGIN
  BEGIN TRY
    -- Check if the match is still in progress
    DECLARE @matchStatus VARCHAR(50);
    SELECT @matchStatus = f.fixtureStatus FROM Matches m JOIN Fixtures f ON f.fixtureID = m.fixtureID WHERE m.matchID = @matchID;

    IF @matchStatus = 'In progress'
    BEGIN
      DECLARE @goalID INT;
      -- Insert the goal into Goals table
      INSERT INTO Goals (matchID, goalMinute, goalType, playerID, assistBy, clubFor, clubAt)
      VALUES (@matchID, @goalMinute, @goalType, @playerID, @assistByPlayerID, @clubFor, @clubAgainst);

      -- Update the respective team's score in Matches table
      IF @clubFor = (SELECT f.homeTeamID FROM Matches m JOIN Fixtures f ON f.fixtureID = m.fixtureID WHERE m.matchID = @matchID)
      BEGIN
        UPDATE Matches
        SET FTHomeTeamScore = FTHomeTeamScore + 1
        WHERE matchID = @matchID;
      END
      ELSE IF @clubFor = (SELECT f.awayTeamID FROM Matches m JOIN Fixtures f ON f.fixtureID = m.fixtureID WHERE m.matchID = @matchID)
      BEGIN
        UPDATE Matches
        SET FTAwayTeamScore = FTAwayTeamScore + 1
        WHERE matchID = @matchID;
      END;

      SELECT @insertResult AS InsertStatus;

      SET @goalID = SCOPE_IDENTITY();
      -- You can output the ID if you want to use it later
      SELECT @goalID as goalID;
    END
    ELSE
    BEGIN
      SET @insertResult = 'Match is not in progress';
      SELECT @insertResult AS InsertionStatus;
    END;
  END TRY
  BEGIN CATCH
    -- Set failure status
    SET @insertResult = 'Insertion failed';
    SELECT @insertResult AS InsertionStatus;
  END CATCH;
END;



--insert functions/procedures
--insert into playerstats procedure
CREATE PROCEDURE InsertPlayerStats
  @insertResult VARCHAR(100) = 'Insertion successful',
  @matchID INT,
  @playerID INT,
  @clubFor INT,
  @clubAt INT,
  @fouls SMALLINT = 0,
  @offsides SMALLINT = 0,
  @headedGoals SMALLINT = 0,
  @goalsWithLeftFoot SMALLINT = 0,
  @goalsWithRightFoot SMALLINT = 0,
  @penaltiesScored SMALLINT = 0,
  @freekicksScored SMALLINT = 0,
  @shots SMALLINT = 0,
  @shotsOnTarget SMALLINT = 0,
  @hitWoodwork SMALLINT = 0,
  @bigChancesMissed SMALLINT = 0,
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
AS
BEGIN
  BEGIN TRY
    -- Insert the data
    INSERT INTO PlayersStats (
    matchID, playerID, clubFor, clubAt, fouls, offsides, headedGoals, goalsWithLeftFoot, goalsWithRightFoot, penaltiesScored, freekicksScored, shots, shotsOnTarget, hitWoodwork, bigChancesMissed, assists, passes, bigChancesCreated, crosses, throughBalls, accurateLongBalls, tackles, blocks, interceptions, clearances, headedClearances, recoveries, duelsWon, successful50_50s, aerialBattlesWon, aerialBattlesLost, errorsLeadingToGoal, ownGoals
    )
    VALUES (
    @matchID, @playerID, @clubFor, @clubAt, @fouls, @offsides, @headedGoals, @goalsWithLeftFoot, @goalsWithRightFoot, @penaltiesScored, @freekicksScored, @shots, @shotsOnTarget, @hitWoodwork, @bigChancesMissed, @assists, @passes, @bigChancesCreated, @crosses, @throughBalls, @accurateLongBalls, @tackles, @blocks, @interceptions, @clearances, @headedClearances, @recoveries, @duelsWon, @successful50_50s, @aerialBattlesWon, @aerialBattlesLost, @errorsLeadingToGoal, @ownGoals
    );

    SELECT @insertResult AS InsertionStatus;
  END TRY
  BEGIN CATCH
    -- Set failure status
    SET @insertResult = 'Insertion failed';
    SELECT @insertResult AS InsertionStatus;
  END CATCH;
END;



--insert into goalkeeperstats stored procedure
CREATE PROCEDURE InsertGoalkeeperStats
  @insertResult VARCHAR(100) = 'Insertion successful',
  @playerID INT,
  @matchID INT,
  @clubFor INT,
  @saves SMALLINT = 0,
  @penaltiesSaved SMALLINT = 0,
  @punches SMALLINT = 0,
  @highClaims SMALLINT = 0,
  @catches SMALLINT = 0,
  @sweeperClearances SMALLINT = 0,
  @throwOuts SMALLINT = 0,
  @goalKicks SMALLINT = 0
AS
BEGIN
  BEGIN TRY
    -- Insert the data
    INSERT INTO GoalkeepersStats (playerID, matchID, clubFor, saves, penaltiesSaved, punches, highClaims, catches, sweeperClearances, throwOuts, goalKicks)
    VALUES (@playerID, @matchID, @clubFor, @saves, @penaltiesSaved, @punches, @highClaims, @catches, @sweeperClearances, @throwOuts, @goalKicks);
    
    SELECT @insertResult AS InsertionStatus;
  END TRY
  BEGIN CATCH
    -- Set failure status
    SET @insertResult = 'Insertion failed';
    SELECT @insertResult AS InsertionStatus;
  END CATCH;
END;


--to discipline stats
CREATE PROCEDURE InsertDisciplineStats
  @insertResult VARCHAR(100) = 'Insertion successful',
  @playerID INT,
  @matchID INT,
  @clubFor INT,
  @cardMinute SMALLINT,
  @cardType VARCHAR(50),
  @description VARCHAR(255)
AS
BEGIN
  BEGIN TRY
    -- Insert the data
    INSERT INTO DisciplineStats (playerID, matchID, clubFor, cardMinute, cardType, description)
    VALUES (@playerID, @matchID, @clubFor, @cardMinute, @cardType, @description);
    
    SELECT @insertResult AS InsertStatus;
  END TRY
  BEGIN CATCH
    -- Set failure status
    SET @insertResult = 'Insertion failed';
    SELECT @insertResult AS InsertionStatus;
  END CATCH;
END;


--penalties
CREATE PROCEDURE InsertPenalties (
  @insertResult VARCHAR(100) = 'Insertion successful',
  @matchID INT,
  @playerID INT,
  @penaltyMinute SMALLINT,
  @penaltyType VARCHAR(50),
  @converted VARCHAR(5),
  @clubFor INT,
  @clubAt INT
)
AS
BEGIN
  BEGIN TRY
    DECLARE @goalID INT;

    INSERT INTO Penalties (matchID, playerID, penaltyMinute, penaltyType, converted, clubFor, clubAt)
    VALUES (@matchID, @playerID, @penaltyMinute, @penaltyType, @converted, @clubFor, @clubAt);

    IF @penaltyType != 'Penalty shootout' AND
    @converted = 'True'
    BEGIN
      INSERT INTO Goals (matchID, goalMinute, goalType, playerID, clubFor, clubAt)
      VALUES (@matchID, @penaltyMinute, 'Penalty scored', @playerID, @clubFor, @clubAt);

        SET @goalID = SCOPE_IDENTITY();
        SELECT @goalID AS insertedGoalID;
    END;

    SELECT @insertResult AS InsertStatus;
  END TRY
  BEGIN CATCH
    -- Set failure status
    SET @insertResult = 'Insertion failed';
    SELECT @insertResult AS InsertionStatus;  
  END CATCH
END;


--to apperances
CREATE PROCEDURE InsertPlayerAppearance (
  @insertResult VARCHAR(100) = 'Insertion successful',
  @appearanceType VARCHAR(50),
  @playerID INT,
  @clubFor INT,
  @matchID INT
)
AS
BEGIN
  BEGIN TRY
    DECLARE @appearanceID INT;
    INSERT INTO AppearanceStats (apperanceType, playerID, clubFor, matchID)
    VALUES (@appearanceType, @playerID, @clubFor, @matchID);
    
    SELECT @insertResult AS InsertStatus;
    SET @appearanceID = SCOPE_IDENTITY();
    -- You can output the ID if you want to use it later
    SELECT @appearanceID as appearanceID;

  END TRY
  BEGIN CATCH
    -- Set failure status
    SET @insertResult = 'Insertion failed';
    SELECT @insertResult AS InsertionStatus;
  END CATCH;
END;

--to substitutions
CREATE PROCEDURE InsertPlayerSubstitution (
  @insertResult VARCHAR(100) = 'Insertion successful',
  @matchID INT,
  @playerInID INT,
  @playerOutID INT,
  @minute SMALLINT,
  @clubFor INT,
  @clubAgainst INT
)
AS
BEGIN
  BEGIN TRY
    DECLARE @substitutionID INT;

    INSERT INTO Substitution (matchID, playerInID, playerOutID, minute, clubFor, clubAgainst)
    VALUES (@matchID, @playerInID, @playerOutID, @minute, @clubFor, @clubAgainst);

    SELECT @insertResult AS InsertStatus;
    SET @substitutionID = SCOPE_IDENTITY();
    -- You can output the ID if you want to use it later
    SELECT @substitutionID as substitutionID;
  END TRY
  BEGIN CATCH
    -- Set failure status
    SET @insertResult = 'Insertion failed';
    SELECT @insertResult AS InsertionStatus;
  END CATCH;
END;


--update
--managers & managers contracts status
CREATE PROCEDURE UpdateManagerContractStatus (
  @updateResult VARCHAR(100) = 'Update successful',
  @managerID INT,
  @startDate DATE,
  @clubID INT,
  @newContractStatus VARCHAR(50)
)
AS
BEGIN
  BEGIN TRY
    BEGIN TRANSACTION;
    
    UPDATE ManagersContracts
    SET contractStatus = @newContractStatus
    WHERE managerID = @managerID AND startDate = @startDate AND clubID = @clubID;

    IF @newContractStatus IN ('Expired', 'Cancelled', 'Terminated')
    BEGIN
      UPDATE Managers
      SET managerStatus = 'Inactive'
      WHERE managerID = @managerID;

      UPDATE ClubsManagers
      SET endDate = GETDATE()
      WHERE
        managerID = @managerID AND 
        clubID = @clubID AND
        startDate = @startDate;
    END;

    SELECT @updateResult AS updateStatus;

    COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
    ROLLBACK TRANSACTION;

    -- indicate error
    SET @updateResult = 'Update failed';
  END CATCH;
END;


--stored procedure to delete
--managers
CREATE PROCEDURE DeleteManager (
  @deleteResult VARCHAR(100) = 'Delete successful',
  @managerID INT
  )
AS
BEGIN
  BEGIN TRY
    BEGIN TRANSACTION;
	  -- Delete from ManagerContract table
	  DELETE FROM ManagersContracts
	  WHERE managerID = @managerID;
  
	  -- Delete from ClubManager table
	  DELETE FROM ClubsManagers
	  WHERE managerID = @managerID; 
  
	  -- Delete from MOTM table
	  DELETE FROM MOTM
	  WHERE managerID = @managerID;

	  -- Delete from Managers table
	  DELETE FROM Managers
	  WHERE managerID = @managerID;
     
	  SELECT @deleteResult AS deleteStatus;

     COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
    ROLLBACK TRANSACTION;
    
    -- indicate error
    SET @deleteResult = 'Delete failed';
  END CATCH;
END;


--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Position
ON Players (position);

--stored procedure to get player stat by playerID based on position
CREATE PROCEDURE GetPlayerStatistics
  @playerID INT
AS
BEGIN
  DECLARE @position NVARCHAR(50)

  SELECT @position = position FROM Players WHERE playerID = @playerID

  IF @position IS NULL
  BEGIN
    RAISERROR('Player not found', 16, 1)
    RETURN
  END
  IF @position = 'Goalkeeper'
  BEGIN
    SELECT 
      p.firstName,
      p.middleName,
      p.lastName,
      p.clubID,
      p.position,
      COUNT(g.goalID) AS Goals,
      SUM(ps.assists) AS Assists,
      COUNT(apps.appearanceID) AS Appearances,
      SUM(ps.fouls) AS Fouls,
      SUM(CASE WHEN ds.cardType = 'Yellow' THEN 1 ELSE 0 END) AS YellowCards,
      SUM(CASE WHEN ds.cardType = 'Red' THEN 1 ELSE 0 END) AS RedCards,
      SUM(gks.saves) AS Saves,
      SUM(gks.penaltiesSaved) AS PenaltiesSaved,
      SUM(gks.punches) AS Punches,
      SUM(gks.highClaims) AS HighClaim,
      SUM(gks.catches) AS Catches,
      SUM(gks.sweeperClearances) AS SweeperClearances,
      SUM(gks.throwOuts) AS ThrowOuts,
      SUM(gks.goalKicks) AS GoalKicks,
      SUM(ps.errorsLeadingToGoal) AS ErrorsLeadingToGoal,
      SUM(ps.ownGoals) AS OwnGoals
    FROM Players AS p
    LEFT JOIN PlayersStats ps ON p.playerID = ps.playerID
    LEFT JOIN GoalkeepersStats gks ON p.playerID = gks.playerID
    LEFT JOIN DisciplineStats ds ON p.playerID = ds.playerID
    LEFT JOIN AppearanceStats apps ON p.playerID = apps.playerID
    LEFT JOIN Goals g ON p.playerID = g.playerID
    WHERE p.playerID = @playerID
    GROUP BY p.firstName, p.middleName, p.lastName, p.clubID, p.position;
  END
  ELSE IF @position = 'Defender'
  BEGIN
    SELECT 
      p.firstName,
      p.middleName,
      p.lastName,
      p.clubID,
      p.position,
      COUNT(g.goalID) AS Goals,
      SUM(ps.assists) AS Assists,
      COUNT(apps.appearanceID) AS Appearances,
      SUM(ps.fouls) AS Fouls,
      SUM(CASE WHEN ds.cardType = 'Yellow' THEN 1 ELSE 0 END) AS YellowCards,
      SUM(CASE WHEN ds.cardType = 'Red' THEN 1 ELSE 0 END) AS RedCards,
      SUM(ps.tackles) AS Tackles,
      SUM(ps.offsides) AS Offsides,
      SUM(ps.headedGoals) AS HeadedGoals,
      SUM(ps.goalsWithRightFoot) AS GoalsWithRightFoot,
      SUM(ps.goalsWithLeftFoot) AS GoalsWithLeftFoot,
      SUM(ps.hitWoodwork) AS HitWoodwork,
      SUM(ps.blocks) AS Blocks,
      SUM(ps.interceptions) AS Interceptions,
      SUM(ps.clearances) AS Clearances,
      SUM(ps.headedClearances) AS HeadedClearance,
      SUM(ps.recoveries) AS Recoveries,
      SUM(ps.duelsWon) AS DuelsWon,
      SUM(ps.successful50_50s) AS Successful50_50s,
      SUM(ps.aerialBattlesWon) AS AerialBattlesWon,
      SUM(ps.aerialBattlesLost) AS AerialBattlesLost,
      SUM(ps.ownGoals) AS OwnGoals,
      SUM(ps.errorsLeadingToGoal) AS ErrorsLeadingToGoal,
      SUM(ps.passes) AS Passes,
      SUM(ps.bigChancesCreated) AS BigChancesCreated,
      SUM(ps.crosses) AS Crosses,
      SUM(ps.throughBalls) AS ThroughBalls,
      SUM(ps.accurateLongBalls) AS AccurateLongBalls
    FROM Players AS p
    LEFT JOIN PlayersStats ps ON p.playerID = ps.playerID
    LEFT JOIN DisciplineStats ds ON p.playerID = ds.playerID
    LEFT JOIN AppearanceStats apps ON p.playerID = apps.playerID
    LEFT JOIN Goals g ON p.playerID = g.playerID
    WHERE p.playerID = @playerID
    GROUP BY p.firstName, p.middleName, p.lastName, p.clubID, p.position;
  END
  ELSE IF @position = 'Midfielder'
  BEGIN
    SELECT 
      p.firstName,
      p.middleName,
      p.lastName,
      p.clubID,
      p.position,
      COUNT(g.goalID) AS Goals,
      SUM(ps.assists) AS Assists,
      COUNT(apps.appearanceID) AS Appearances,
      SUM(ps.fouls) AS Fouls,
      SUM(CASE WHEN ds.cardType = 'Yellow' THEN 1 ELSE 0 END) AS YellowCards,
      SUM(CASE WHEN ds.cardType = 'Red' THEN 1 ELSE 0 END) AS RedCards,
      SUM(ps.errorsLeadingToGoal) AS ErrorsLeadingToGoal,
      SUM(ps.aerialBattlesLost) AS AerialBattlesLost,
      SUM(ps.aerialBattlesWon) AS AerialBattlesWon,
      SUM(ps.successful50_50s) AS Successful50_50s,
      SUM(ps.duelsWon) AS DuelsWon,
      SUM(ps.recoveries) AS Recoveries,
      SUM(ps.headedClearances) AS HeadedClearance,
      SUM(ps.clearances) AS Clearances,
      SUM(ps.interceptions) AS Interceptions,
      SUM(ps.blocks) AS Blocks,
      SUM(ps.tackles) AS Tackles,
      SUM(ps.offsides) AS Offsides,
      SUM(ps.accurateLongBalls) AS AccurateLongBalls,
      SUM(ps.throughBalls) AS ThroughBalls,
      SUM(ps.crosses) AS Crosses,
      SUM(ps.bigChancesCreated) AS BigChancesCreated,
      AVG(ps.passes) AS PassesPerMatch,
      SUM(ps.passes) AS Passes,
      SUM(ps.bigChancesMissed) AS BigChancesMissed,
      SUM(ps.hitWoodwork) AS HitWoodwork,
      SUM(ps.shotsOnTarget) AS ShotsOnTarget,
      SUM(ps.shots) AS Shots,
      SUM(ps.freekicksScored) AS FreekicksScored,
      SUM(ps.penaltiesScored) AS PenaltiesScored,
      SUM(ps.goalsWithLeftFoot) AS GoalsWithLeftFoot,
      SUM(ps.goalsWithRightFoot) AS GoalsWithRightFoot,
      SUM(ps.headedGoals) AS HeadedGoals
    FROM Players AS p
    LEFT JOIN PlayersStats ps ON p.playerID = ps.playerID
    LEFT JOIN DisciplineStats ds ON p.playerID = ds.playerID
    LEFT JOIN AppearanceStats apps ON p.playerID = apps.playerID
    LEFT JOIN Goals g ON p.playerID = g.playerID
    WHERE p.playerID = @playerID
    GROUP BY p.firstName, p.middleName, p.lastName, p.clubID, p.position;
  END
  ELSE IF @position = 'Forward'
  BEGIN
    SELECT 
      p.firstName,
      p.middleName,
      p.lastName,
      p.clubID,
      p.position,
      COUNT(g.goalID) AS Goals,
      SUM(ps.assists) AS Assists,
      COUNT(apps.appearanceID) AS Appearances,
      SUM(ps.fouls) AS Fouls,
      SUM(CASE WHEN ds.cardType = 'Yellow' THEN 1 ELSE 0 END) AS YellowCards,
      SUM(CASE WHEN ds.cardType = 'Red' THEN 1 ELSE 0 END) AS RedCards,
      SUM(ps.headedClearances) AS HeadedClearance,
      SUM(ps.clearances) AS Clearances,
      SUM(ps.interceptions) AS Interceptions,
      SUM(ps.tackles) AS Tackles,
      SUM(ps.blocks) AS Blocks,
      SUM(ps.offsides) AS Offsides,
      SUM(ps.crosses) AS Crosses,
      SUM(ps.bigChancesCreated) AS BigChancesCreated,
      AVG(ps.passes) AS PassesPerMatch,
      SUM(ps.passes) AS Passes,
      SUM(ps.bigChancesMissed) AS BigChancesMissed,
      SUM(ps.hitWoodwork) AS HitWoodwork,
      SUM(ps.shotsOnTarget) AS ShotsOnTarget,
      SUM(ps.shots) AS Shots,
      SUM(ps.freekicksScored) AS FreekicksScored,
      SUM(ps.penaltiesScored) AS PenaltiesScored,
      SUM(ps.goalsWithLeftFoot) AS GoalsWithLeftFoot,
      SUM(ps.goalsWithRightFoot) AS GoalsWithRightFoot,
      SUM(ps.headedGoals) AS HeadedGoals
    FROM Players AS p
    LEFT JOIN PlayersStats ps ON p.playerID = ps.playerID
    LEFT JOIN DisciplineStats ds ON p.playerID = ds.playerID
    LEFT JOIN AppearanceStats apps ON p.playerID = apps.playerID
    LEFT JOIN Goals g ON p.playerID = g.playerID
    WHERE p.playerID = @playerID
    GROUP BY p.firstName, p.middleName, p.lastName, p.clubID, p.position;
  END
END

-- All Players Stats table procedure
CREATE PROCEDURE GetAllPlayersWithStats
AS
BEGIN
  SELECT 
    p.firstName,
    p.middleName,
    p.lastName,
    p.clubID,
    p.position,
    COUNT(g.goalID) AS Goals,
    SUM(ps.assists) AS Assists,
    COUNT(apps.appearanceID) AS Appearances,
    SUM(ps.fouls) AS Fouls,
    SUM(CASE WHEN ds.cardType = 'Yellow' THEN 1 ELSE 0 END) AS YellowCards,
    SUM(CASE WHEN ds.cardType = 'Red' THEN 1 ELSE 0 END) AS RedCards,
    SUM(ps.tackles) AS Tackles,
    SUM(ps.offsides) AS Offsides,
    SUM(ps.headedGoals) AS HeadedGoals,
    SUM(ps.goalsWithRightFoot) AS GoalsWithRightFoot,
    SUM(ps.goalsWithLeftFoot) AS GoalsWithLeftFoot,
    SUM(ps.hitWoodwork) AS HitWoodwork,
    SUM(ps.blocks) AS Blocks,
    SUM(ps.interceptions) AS Interceptions,
    SUM(ps.clearances) AS Clearances,
    SUM(ps.headedClearances) AS HeadedClearance,
    SUM(ps.duelsWon) AS DuelsWon,
    SUM(ps.successful50_50s) AS Successful50_50s,
    SUM(ps.aerialBattlesWon) AS AerialBattlesWon,
    SUM(ps.aerialBattlesLost) AS AerialBattlesLost,
    SUM(ps.ownGoals) AS OwnGoals,
    SUM(ps.errorsLeadingToGoal) AS ErrorsLeadingToGoal,
    SUM(ps.passes) AS Passes,
    SUM(ps.bigChancesCreated) AS BigChancesCreated,
    SUM(ps.crosses) AS Crosses,
    SUM(ps.throughBalls) AS ThroughBalls,
    SUM(ps.accurateLongBalls) AS AccurateLongBalls,
    SUM(ps.shots) AS Shots,
    SUM(ps.shotsOnTarget) AS ShotsOnTarget,
    SUM(ps.freekicksScored) AS FreekicksScored,
    SUM(ps.penaltiesScored) AS PenaltiesScored,
    SUM(gks.saves) AS Saves,
    SUM(gks.penaltiesSaved) AS PenaltiesSaved,
    SUM(gks.punches) AS Punches,
    SUM(gks.highClaims) AS HighClaims,
    SUM(gks.catches) AS Catches,
    SUM(gks.sweeperClearances) AS SweeperClearances,
    SUM(gks.throwOuts) AS ThrowOuts,
    SUM(gks.goalKicks) AS GoalKicks
  FROM Players AS p
  LEFT JOIN PlayersStats ps ON p.playerID = ps.playerID
  LEFT JOIN GoalkeepersStats gks ON p.playerID = gks.playerID
  LEFT JOIN DisciplineStats ds ON p.playerID = ds.playerID
  LEFT JOIN AppearanceStats apps ON p.playerID = apps.playerID
  LEFT JOIN Goals g ON p.playerID = g.playerID
  GROUP BY p.playerID, p.firstName, p.middleName, p.lastName, p.clubID, p.position;
END;

