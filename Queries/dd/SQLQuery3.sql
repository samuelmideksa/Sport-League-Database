ALTER TABLE Clubs
ADD TotalPoints AS (
  ISNULL((
    SELECT SUM(CASE
                 WHEN g.goalFor = c.clubID THEN 3
                 WHEN g.goalFor IS NULL THEN 1
                 ELSE 0
               END)
    FROM Fixtures f
    JOIN Matches m ON f.fixtureID = m.fixtureID
    JOIN Goals g ON m.matchID = g.matchID
    WHERE (f.homeTeamID = c.clubID OR f.awayTeamID = c.clubID) AND m.fixtureStatus = 'Completed'
  ), 0)
);

CREATE PROCEDURE CalculateStandings
AS
BEGIN
  DECLARE @Rank INT = 1;

  CREATE TABLE #Standings (
    Rank INT,
    clubName VARCHAR(255),
    MatchesPlayed INT,
    MatchesWon INT,
    MatchesDrawn INT,
    MatchesLost INT,
    GoalsFor INT,
    GoalsAt INT,
    GoalDifference INT,
    TotalPoints INT
  );

  DECLARE @ClubID INT;
  DECLARE @ClubName VARCHAR(255);

  DECLARE standings_cursor CURSOR FOR
  SELECT clubID, clubName FROM Clubs;

  OPEN standings_cursor;

  FETCH NEXT FROM standings_cursor INTO @ClubID, @ClubName;

  WHILE @@FETCH_STATUS = 0
  BEGIN
    INSERT INTO #Standings
    SELECT 
      @Rank AS Rank,
      @ClubName AS clubName,
      COUNT AS MatchesPlayed,
      SUM(CASE WHEN m.fixtureStatus = 'Completed' AND g.goalFor = @ClubID THEN 1 ELSE 0 END) AS MatchesWon,
      SUM(CASE WHEN m.fixtureStatus = 'Completed' AND g.goalFor IS NULL THEN 1 ELSE 0 END) AS MatchesDrawn,
      SUM(CASE WHEN m.fixtureStatus = 'Completed' AND g.goalAt = @ClubID THEN 1 ELSE 0 END) AS MatchesLost,
      SUM(CASE WHEN g.goalFor = @ClubID THEN g.goalType ELSE 0 END) AS GoalsFor,
      SUM(CASE WHEN g.goalAt = @ClubID THEN g.goalType ELSE 0 END) AS GoalsAt,
      SUM(CASE WHEN g.goalFor = @ClubID THEN 1 ELSE 0 END) - SUM(CASE WHEN g.goalAt = @ClubID THEN 1 ELSE 0 END) AS GoalDifference,
      SUM(CASE
		WHEN g.goalFor = c.clubID THEN 3
        WHEN g.goalFor IS NULL THEN 1
        ELSE 0
        END)
		FROM Fixtures f
		JOIN Matches m ON f.fixtureID = m.fixtureID
		JOIN Goals g ON m.matchID = g.matchID
		WHERE (f.homeTeamID = c.clubID OR f.awayTeamID = c.clubID) AND m.fixtureStatus = 'Completed'), 0)
    FROM Clubs c
    LEFT JOIN Fixtures f ON c.clubID IN (f.homeTeamID, f.awayTeamID)
    LEFT JOIN Matches m ON f.fixtureID = m.fixtureID
    LEFT JOIN Goals g ON m.matchID = g.matchID
    WHERE c.clubID = @ClubID
    GROUP BY c.clubID, c.clubName, TotalPoints;

    SET @Rank = @Rank + 1;

    FETCH NEXT FROM standings_cursor INTO @ClubID, @ClubName;
  END;

  CLOSE standings_cursor;
  DEALLOCATE standings_cursor;

  SELECT * FROM #Standings;

  DROP TABLE #Standings;
END;


CREATE PROCEDURE CalculateStandings
AS
BEGIN
  SELECT
    RANK() OVER (ORDER BY TotalPoints DESC) AS Rank,
    c.clubName,
    COUNT(*) AS MatchesPlayed,
    SUM(CASE WHEN m.fixtureStatus = 'Completed' AND g.goalFor = c.clubID THEN 1 ELSE 0 END) AS MatchesWon,
    SUM(CASE WHEN m.fixtureStatus = 'Completed' AND g.goalFor IS NULL THEN 1 ELSE 0 END) AS MatchesDrawn,
    SUM(CASE WHEN m.fixtureStatus = 'Completed' AND g.goalAt = c.clubID THEN 1 ELSE 0 END) AS MatchesLost,
    SUM(CASE WHEN g.goalFor = c.clubID THEN g.goalType ELSE 0 END) AS GoalsFor,
    SUM(CASE WHEN g.goalAt = c.clubID THEN g.goalType ELSE 0 END) AS GoalsAt,
    SUM(CASE WHEN g.goalFor = c.clubID THEN 1 ELSE 0 END) - SUM(CASE WHEN g.goalAt = c.clubID THEN 1 ELSE 0 END) AS GoalDifference,
    SUM(CASE WHEN m.fixtureStatus = 'Completed' THEN
             CASE WHEN g.goalFor = c.clubID THEN 3
                  WHEN g.goalFor IS NULL THEN 1
                  ELSE 0
             END
           ELSE 0
    END) AS TotalPoints
  FROM Clubs c
  LEFT JOIN Fixtures f ON c.clubID IN (f.homeTeamID, f.awayTeamID)
  LEFT JOIN Matches m ON f.fixtureID = m.fixtureID
  LEFT JOIN Goals g ON m.matchID = g.matchID
  GROUP BY c.clubID, c.clubName;
END;

EXEC CalculateStandingsEasy;



DECLARE @ClubID INT;
  DECLARE @ClubName VARCHAR(255);

DECLARE standings_cursor CURSOR FOR
SELECT clubID, clubName FROM Clubs;

SELECT f.homeTeamID, m.FTHomeTeamScore, f.awayTeamID, m.FTAwayTeamScore, f.fixtureStatus
FROM Matches m
JOIN Fixtures f ON m.fixtureID = f.fixtureID

