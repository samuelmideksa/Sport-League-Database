--GetPlayerID
select top 2 * from players
select  dbo.GetPlayerID('Solomon', 'Tadesse', 'Girma', 1, 5) AS playerID;

--GetClubID
select top 2 * from Clubs
select dbo.GetClubID('Adama City') AS clubID

--GetClubName
select top 2 * from Clubs
select dbo.GetClubName(2) AS clubName

--GetVenueID
select top 2 * from Venues
select dbo.GetVenueID('Abebe Bikila Stadium') AS venueID

--GetActiveManagerIDByClub
select top 2 m.managerID, c.clubID, c.clubName, m.firstName from ClubsManagers cm join Clubs c on c.clubID = cm.clubID join Managers m on m.managerID = cm.managerID
select dbo.GetActiveManagerIDByClub(dbo.GetClubID('Adama City')) AS managerID

---------------------------------------------------------------------------------------------------------------------
--GetFixtureID
select top 2 * from Fixtures
select dbo.GetFixtureID(1, 2, '2023-09-01') AS fixtureID

select top 4 f.*, c.clubName, c.clubID from Fixtures f join Clubs c on c.clubID = f.homeTeamID or c.clubID = f.awayTeamID
select dbo.GetFixtureID(dbo.GetClubID('Adama City'), dbo.GetClubID('Hadiya Hossana'), '2023-09-01')

--GetMatchID
select top 2 * from Matches m join fixtures f on f.fixtureID = m.fixtureID
select dbo.GetMatchID(4, 3, '2023-09-01') AS matchID


