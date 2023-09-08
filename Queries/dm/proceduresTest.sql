-------------------------------------------------------------------------------------------------------------------
select * from Officials	

-- fix game using AddFixture
DECLARE @homeTeam INT;
DECLARE @awayTeam INT;
DECLARE @venue INT;

-- Test case 1: Valid fixture
-- Fetch the club IDs using the functions
SET @homeTeam = dbo.GetClubID('Adama City');
SET @awayTeam = dbo.GetClubID('Hadiya Hossana');
SET @venue = (SELECT home FROM Clubs WHERE clubID = @homeTeam);

EXEC AddFixture
  @homeTeamID = @homeTeam,
  @awayTeamID = @awayTeam,
  @fixtureDate = '2023-10-01',
  @kickoff = '15:00:00',
  @venueID = @venue,
  @refereeID = 1,
  @assistantReferee1ID = 2,
  @assistantReferee2ID = 4,
  @fourthOfficialID = 10;
  select * from fixtures
  select top 5 clubName from Clubs

-- Test case 2: 
-- Fetch the club IDs using the functions
DECLARE @homeTeam INT;
DECLARE @awayTeam INT;
DECLARE @venue INT;

SET @homeTeam = dbo.GetClubID('Mekelakeya');
SET @awayTeam = dbo.GetClubID('Ethiopian Coffee');
SET @venue = (SELECT home FROM Clubs WHERE clubID = @homeTeam);
EXEC AddFixture
  @homeTeamID = @homeTeam,
  @awayTeamID = @awayTeam,
  @fixtureDate = '2023-09-01',
  @kickoff = '08:30:00',
  @venueID = @venue,
  @refereeID = 1,
  @assistantReferee1ID = 4,
  @assistantReferee2ID = 2,
  @fourthOfficialID = 10;


-- Test case 3: One of the teams busy
-- Fetch the club IDs using the functions
DECLARE @homeTeam INT;
DECLARE @awayTeam INT;
DECLARE @venue INT;

SET @homeTeam = dbo.GetClubID('Adama City');
SET @awayTeam = dbo.GetClubID('Hadiya Hossana');
SET @venue = dbo.GetVenueID('venueName');
EXEC AddFixture
  @homeTeamID = @homeTeam,
  @awayTeamID = @awayTeam,
  @fixtureDate = '2023-09-01',
  @kickoff = '20:00:00',
  @venueID = 2,
  @refereeID = 9,
  @assistantReferee1ID = 10,
  @assistantReferee2ID = 11,
  @fourthOfficialID = 12;


-- Test case 4: Invalid official role
-- Fetch the club IDs using the functions
SET @homeTeam = dbo.GetClubID('Adama City');
SET @awayTeam = dbo.GetClubID('Hadiya Hossana');
SET @venue = dbo.GetVenueID('venueName');
EXEC AddFixture
  @homeTeamID = 6,
  @awayTeamID = 7,
  @fixtureDate = '2023-09-02',
  @kickoff = '14:00:00',
  @venueID = 3,
  @refereeID = 13,
  @assistantReferee1ID = 14,
  @assistantReferee2ID = 15,
  @fourthOfficialID = 16;


-- Test case 5: in Valid fixture
-- Fetch the club IDs using the functions
SET @homeTeam = dbo.GetClubID('Ethiopian Coffee');
SET @awayTeam = dbo.GetClubID('Saint George');
SET @venue = dbo.GetVenueID('Addis Ababa Stadium');
EXEC AddFixture
  @homeTeamID = @homeTeam,
  @awayTeamID = @awayTeam,
  @fixtureDate = '2023-08-29',
  @kickoff = '23:00:00',
  @venueID = @venue,
  @refereeID = 17,
  @assistantReferee1ID = 18,
  @assistantReferee2ID = 19,
  @fourthOfficialID = 20;

-------------------------------------------------------------------------------------------------------------------
--Start match
select * from fixtures
EXEC StartMatch
@fixtureID = 3;
select * from Matches

select f.fixtureID, m.matchID from Matches m join Fixtures f on m.fixtureID = f.fixtureID
select * from Fixtures

--Insert goals
select playerID, clubID from players where clubID = 4 or clubID = 3
EXEC InsertGoalAndUpdateScore
  @matchID = 2,
  @goalMinute = 40,
  @goalType = 'Goal with left foot',
  @playerID = 25,
  @clubFor = 3,
  @clubAgainst = 4;

EXEC InsertGoalAndUpdateScore
  @matchID = 2,
  @goalMinute = 67,
  @goalType = 'Goal with right foot',
  @playerID = 38,
  @clubFor = 3,
  @clubAgainst = 4;

EXEC InsertGoalAndUpdateScore
  @matchID = 2,
  @goalMinute = 92,
  @goalType = 'Headed goal',
  @playerID = 55,
  @clubFor = 4,
  @clubAgainst = 3;

  select * from Matches


  -----------------------
  select playerID, clubID from players where clubID = 4 or clubID = 3

  
--InsertPlayerStats procedure
--InsertPlayerStats procedure
EXEC InsertPlayerStats
  @matchID = 2,
  @playerID = 25,
  @clubFor = 3,
  @clubAt = 4,
  @fouls = 1,
  @offsides = 1,
  @goalsWithLeftFoot = 1,
  @shots = 8,
  @shotsOnTarget = 4,
  @hitWoodwork = 1,
  @bigChancesMissed = 2,
  @passes = 20,
  @bigChancesCreated = 0,
  @crosses = 0,
  @throughBalls = 10,
  @accurateLongBalls  = 5



--InsertGoalkeeperStats procedure
EXEC InsertGoalkeeperStats
  @playerID = 1,
  @matchID = 1,
  @clubFor = 1;
  -- ... (provide values for other parameters)
  ;

--InsertDisciplineStats procedure
EXEC InsertDisciplineStats
  @playerID = 25,
  @matchID = 2,
  @clubFor = 3,
  @cardMinute = 45,
  @cardType = 'Yellow',
  @description = 'Foul';


--InsertPenalties procedure
EXEC InsertPenalties
  @matchID = 2,
  @playerID = 38,
  @penaltyMinute = 75,
  @penaltyType = 'Regular penalty',
  @converted = 'True',
  @clubFor = 3,
  @clubAt = 4;

  select * from Matches
--InsertPlayerAppearance procedure
EXEC InsertPlayerAppearance
  @appearanceType = 'Starter',
  @playerID = 1,
  @clubFor = 1,
  @matchID = 1;


--InsertPlayerSubstitution procedure
EXEC InsertPlayerSubstitution
  @matchID = 2,
  @playerInID = 2,
  @playerOutID = 1,
  @minute = 75,
  @clubFor = 1,
  @clubAgainst = 2;

  ------------------------
  EXEC GetPlayerStatistics
  @playerID = 25;


--UpdateManagerContractStatus procedure
select top 2 * from ManagersContracts mc join Managers m on m.managerID = mc.managerID join ClubsManagers cm on cm.managerID = m.managerID
BEGIN TRANSACTION
EXEC UpdateManagerContractStatus
@managerID = 2,
@startDate = '2022-05-15',
@clubID = 1,
@newContractStatus = 'Terminated'

select top 2 * from ManagersContracts mc join Managers m on m.managerID = mc.managerID join ClubsManagers cm on cm.managerID = m.managerID
ROLLBACK
select top 2 * from ManagersContracts mc join Managers m on m.managerID = mc.managerID join ClubsManagers cm on cm.managerID = m.managerID


--DeleteManager procedure
select top 2 * from Managers
BEGIN TRANSACTION;
EXEC DeleteManager
  @managerID = 1;
select top 2 * from Managers
ROLLBACK
select top 2 * from Managers

--All players stats
EXEC GetAllPlayersWithStats

--
select top 3 * from players
EXEC GetPlayerStatistics
@playerID = 161
