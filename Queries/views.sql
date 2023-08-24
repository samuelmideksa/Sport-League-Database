--fixtures
CREATE VIEW fixturesList
AS
  SELECT dbo.getClubName(f.homeTeamID) AS homeTeam, dbo.getClubName(f.awayTeamID) AS awayTeam, f.fixtureDate, f.kickoff ,v.venueName, v.venueLocation
  FROM Fixtures f
  JOIN Venues v ON f.venueID = v.venueID

--results
CREATE VIEW resultsList
AS
  SELECT dbo.getClubName(f.homeTeamID) AS homeTeam, m.FTHomeTeamScore, dbo.getClubName(f.awayTeamID) AS awayTeam, m.FTAwayTeamScore, f.fixtureDate, v.venueName, v.venueLocation
  FROM Matches m
  JOIN Fixtures f ON m.fixtureID = f.fixtureDate

--transfers
CREATE VIEW transfersList
AS
  SELECT p.firstName, p.middleName, p.lastName, dbo.getClubName(pt.toTeam), p.transactionType, transactionDate
  FROM PlayerTransactions pt
  JOIN Players p ON p.playerID = pt.playerID

/*
--stats
CREATE VIEW 
AS
SELECT p.firstName, p.middleName, p.lastName, c.clubID, p.position
FROM Player p
JOIN playerstats ps ON p.playerID = ps.playerID
JOIN goalkeepersStat gks ON p.playerID = gks.playerID
JOIN goals g ON g.playerID = p.playerID
JOIN DisciplineStats ON ds.playerID = p.playerID
JOIN AppearanceStats ON apps.playerID = p.playerID
*/

--clubs
  PRINT 'Squad'
  SELECT p.firstName, p.middleName, p.lastName, c.clubID, p.position, p.countryOB
  FROM Players p
  WHERE clubID = GetClubID(@clubName)
  PRINT 'Stats'
  SELECT
  SUM(ps.goals),
  SUM(ps.goals)/COUNT(matchID) AS goalsPerMatch,
  SUM(ps.shots),
  SUM(ps.shotsOnTarget),
  (CONCAT(SUM(ps.shotsOnTarget)/SUM(ps.shots)* 100), '%')AS shootingAccuracy,
  SUM(ps.penaltiesScored),
  SUM(ps.bigChancesCreated),
  SUM(ps.hitWoodwork),
  SUM(ps.passes),
  SUM(ps.passesPerMatch),
  SUM(ps.crosses),
  /*COUNT(matchID) FILTER (
    WHERE IF GetClubID(@clubName) = homeTeamID
      THEN
    ) AS cleanSheets
  SUM(ps.goalsConceded),
  SUM(ps.goalsConcededPerMatch),*/
  SUM(gs.saves),
  SUM(ps.tackles),
  SUM(ps.tackleSuccess),
  SUM(ps.blockedShots),
  SUM(ps.interceptions),
  SUM(ps.clearances),
  SUM(ps.headedClearance),
  SUM(ps.aerialBattlesWon),
  SUM(ps.duelsWon),
  SUM(ps.errorsLeadingToGoal),
  SUM(ps.ownGoals),
  COUNT(ds.disciplineStatID) FILTER (WHERE ds.cardType = 'Yellow') AS YellowCards,
  COUNT(ds.disciplineStatID) FILTER (WHERE ds.cardType = 'Red') AS RedCards,
  SUM(ps.fouls),
  SUM(ps.offsides)
  FROM Players
  JOIN Clubs c ON c.clubID = p.clubID
  JOIN playerstats ps ON p.clubFor = ps.clubFor
  JOIN goalkeepersStat gs ON p.clubFor = gs.clubFor
  JOIN goals g ON g.clubFor = p.clubFor
  JOIN DisciplineStats ON ds.clubFor = p.clubFor
  WHERE clubFor = GetClubID(@clubName)


--players 
CREATE VIEW playersList
AS
  SELECT p.firstName, p.middleName, p.lastName, c.clubID, p.position, p.countryOB
  FROM Players p
  JOIN Clubs c ON c.clubID = p.clubID

--players detail
CREATE VIEW playersDetailList
AS
  SELECT p.firstName, p.middleName, p.lastName, c.clubID, p.position, p.DOB, p.height, p.countryOB, COUNT(SELECT appearanceID FROM AppearanceStats WHERE playerID = p.playerID) AS appearances, COUNT(SELECT goalID FROM Goals WHERE playerID = p.playerID) AS goals, COUNT(SELECT goalID FROM Goals WHERE assistBy = p.playerID) AS assists
  FROM Players p
  JOIN Clubs c ON c.clubID = p.clubID
  JOIN AppearanceStats apps ON apps.playerID = p.playerID
  JOIN Goals g ON g.playerID = p.playerID


--awards
CREATE VIEW mplWinnersList
AS
  SELECT mpa.awardType, mpa.awardYear, mpa.awardMonth, p.firstName, p.middleName, p.lastName, p.position, g.goalAT, f.fixtureDate
  FROM MonthlyPlayerAwards mpa
  JOIN Players p ON p.playerID = mpa.playerID
  JOIN Goals g ON g.goalID = mpa.goalID
  JOIN Matches m ON g.matchID = m.matchID
  JOIN Fixtures f ON f.fixtureID = m.fixtureID

--MOTM
CREATE VIEW motmWinnersList
AS
  SELECT MOTM.awardYear, MOTM.awardMonth, m.firstName, m.middleName, m.lastName, (SELECT clubID FROM Clubs WHERE)
  FROM MOTM
  JOIN Managers m ON m.managerID = MOTM.managerID
  JOIN ClubManager cm ON cm.managerID = m.managerID
  JOIN Clubs c ON c.clubID = cm.clubID

