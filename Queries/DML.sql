-- Players Stats
CREATE PROCEDURE PlayersListByStat @stat   VARCHAR(50)
-- Goal Keepers stats

-- results list
CREATE VIEW matchList AS
SELECT
  Matches.matchID
  HomeClub.clubName AS HomeClubName,
  Matches.FTHomeTeamScore AS HomeClubFTScore,
  Matches.FTAwayTeamScore AS AwayClubFTScore,
  AwayClub.clubName AS AwayClubName,
  Venues.venueName AS Venue,
  Venues.venueLocation AS VenueLocation,
  Fixtures.fixtureDate,
  Fixtures.kickoff
FROM
  Matches
  INNER JOIN Fixtures ON Matches.fixtureID = Fixtures.fixtureID
  INNER JOIN Clubs AS HomeClub ON Fixtures.homeTeamID = HomeClub.clubID
  INNER JOIN Clubs AS AwayClub ON Fixtures.awayTeamID = AwayClub.clubID
  INNER JOIN Venues ON Fixtures.venueID = Venues.venueID;

SELECT *
FROM matchList
ORDER BY fixtureDate, HomeClubName;

-- result page

--stats and players
CREATE PlayersStats
SELECT
  P.playerID,
  P.firstName + ' ' + P.lastName AS playerName
  C.clubName,
  M.matchID,
  Ap.apperanceType,
  G.goalFor AS goalFor,
  G.goalAt AS goalAt,
  G.Goals,
  Ca.cardType,
  Pe.penaltyType,
  Pe.penaltiesScored,
  --substitution
  Att. teamFor AS attackFor,
  Att.headedGoal,
  Att.leftFootGoal,
  Att.rightFootGoal,
  Att.penaltiesScored,
  Att.freekickScored,
  Att.shot,
  Att.shotOnTarget,
  Att.hitWoodwork,
  Att.bigChanceMissed,
  Def.matchID, 
  Def.teamFor AS defenceFor,
  Def.tackles,
  Def.blocks,
  Def.interceptions,
  Def.clearances,
  Def.headedClearances,
  Def.recoveries,
  Def.duelsWon,
  Def.successful50_50s,
  Def.aerialBattlesWon,
  Def.aerialBattlesLost,
  Def.errorsLeadingToGoal,
  Def.ownGoals,
  
  
  
  FROM Players P
  Clubs C
  Matches M
  AppearanceStats Ap
  Goals G
  Cards Ca
  Penalties Pe
  AttackStats Att