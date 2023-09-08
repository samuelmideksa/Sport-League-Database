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
  JOIN Fixtures f ON m.fixtureID = f.fixtureID
  JOIN Venues v ON f.VenueID = v.VenueID

--transfers
CREATE VIEW transfersList
AS
  SELECT p.firstName, p.middleName, p.lastName, dbo.getClubName(pt.fromClub) AS fromClub, dbo.getClubName(pt.toClub) AS toClub, pt.transactionType, pt.transactionDate
  FROM PlayerTransactions pt
  JOIN Players p ON p.playerID = pt.playerID


--players 
CREATE VIEW playersList
AS
  SELECT p.firstName, p.middleName, p.lastName, c.clubID, p.position, p.countryOB
  FROM Players p
  JOIN Clubs c ON c.clubID = p.clubID

--players detail
drop view playersDetailList
CREATE VIEW playersDetailList
AS
  SELECT p.firstName, p.middleName, p.lastName, c.clubID, p.position, p.DOB, p.height, p.countryOB, COUNT(apps.appearanceID) AS appearances, COUNT(g.goalID) AS goals, SUM(ps.assists) AS assists
  FROM Players p
  JOIN Clubs c ON c.clubID = p.clubID
  LEFT JOIN AppearanceStats apps ON apps.playerID = p.playerID
  LEFT JOIN Goals g ON g.playerID = p.playerID
  LEFT JOIN PlayersStats ps ON ps.playerID = p.playerID
  GROUP BY p.firstName, p.middleName, p.lastName, c.clubID, p.position, p.DOB, p.height, p.countryOB, apps.appearanceID, g.goalID, ps.assists


--awards
CREATE VIEW mplWinnersList
AS
  SELECT mpa.awardType, mpa.awardYear, mpa.awardMonth, p.firstName, p.middleName, p.lastName, p.position, g.clubAT, f.fixtureDate
  FROM MonthlyPlayerAwards mpa
  JOIN Players p ON p.playerID = mpa.playerID
  JOIN Goals g ON g.goalID = mpa.goalID
  JOIN Matches m ON g.matchID = m.matchID
  JOIN Fixtures f ON f.fixtureID = m.fixtureID

--MOTM
CREATE VIEW motmWinnersList
AS
  SELECT MOTM.awardYear, MOTM.awardMonth, m.firstName, m.middleName, m.lastName, dbo.GetClubName(c.clubID) AS clubName
  FROM MOTM
  JOIN Managers m ON m.managerID = MOTM.managerID
  JOIN ClubsManagers cm ON cm.managerID = m.managerID
  JOIN Clubs c ON c.clubID = cm.clubID

