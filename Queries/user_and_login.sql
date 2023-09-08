USE EPL
GO
-- Reader User with reading privilage on tables
CREATE LOGIN reader WITH PASSWORD = 'reader123';
USE EPL
CREATE USER readerUser FOR LOGIN reader;
USE EPL
GRANT SELECT ON Clubs TO readerUser;
GRANT SELECT ON Venues TO readerUser;
GRANT SELECT ON Managers TO readerUser;
GRANT SELECT ON ClubsManagers TO readerUser;
GRANT SELECT ON Players TO readerUser;
GRANT SELECT ON Officials TO readerUser;
GRANT SELECT ON Fixtures TO readerUser;
GRANT SELECT ON Matches TO readerUser;
GRANT SELECT ON AppearanceStats TO readerUser;
GRANT SELECT ON Goals TO readerUser;
GRANT SELECT ON Penalties TO readerUser;
GRANT SELECT ON Substitutions TO readerUser;
GRANT SELECT ON PlayersStats TO readerUser;
GRANT SELECT ON DisciplineStats TO readerUser;
GRANT SELECT ON GoalkeepersStats TO readerUser;
GRANT SELECT ON PlayerTransactions TO readerUser;
GRANT SELECT ON PlayersContracts TO readerUser;
GRANT SELECT ON ManagersContracts TO readerUser;
GRANT SELECT ON MonthlyPlayerAwards TO readerUser;
GRANT SELECT ON MOTM TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetPlayerID TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetClubID TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetClubName TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetVenueID TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetActiveManagerIDByClub TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetFixtureID TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetMatchID TO readerUser;
GRANT EXECUTE ON OBJECT::dbo.GetGoalID TO readerUser;
GRANT SELECT ON dbo.fixturesList TO readerUser;
GRANT SELECT ON dbo.resultsList TO readerUser;
GRANT SELECT ON dbo.transfersList TO readerUser;
GRANT SELECT ON dbo.clubs TO readerUser;
GRANT SELECT ON dbo.playersList TO readerUser;
GRANT SELECT ON dbo.playersDetailList TO readerUser;
GRANT SELECT ON dbo.mplWinnersList TO readerUser;
GRANT SELECT ON dbo.motmWinnersList TO readerUser;




-- data inputer user with selection and insertion privilages on tables
CREATE LOGIN datainputerI WITH PASSWORD = 'datainputerI123';
CREATE USER userDataInputerI FOR LOGIN datainputerI;

GRANT SELECT, INSERT ON Clubs TO userDataInputerI;
GRANT SELECT, INSERT ON Venues TO userDataInputerI;
GRANT SELECT, INSERT ON Managers TO userDataInputerI;
GRANT SELECT, INSERT ON Players TO userDataInputerI;
GRANT SELECT ON Officials TO userDataInputerI;
GRANT SELECT, INSERT, UPDATE ON Fixtures TO userDataInputerI;
GRANT SELECT, INSERT, UPDATE ON Matches TO userDataInputerI;
GRANT SELECT, INSERT ON AppearanceStats TO userDataInputerI;
GRANT SELECT, INSERT ON Goals TO userDataInputerI;
GRANT SELECT, INSERT ON Penalties TO userDataInputerI;
GRANT SELECT, INSERT ON Substitutions TO userDataInputerI;
GRANT SELECT, INSERT ON PlayersStats TO userDataInputerI;
GRANT SELECT, INSERT ON DisciplineStats TO userDataInputerI;
GRANT SELECT, INSERT ON GoalkeepersStats TO userDataInputerI;
GRANT SELECT, INSERT ON MonthlyPlayerAwards TO userDataInputerI;
GRANT SELECT, INSERT ON MOTM TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetPlayerID TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetClubID TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetClubName TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetVenueID TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetActiveManagerIDByClub TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetFixtureID TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetMatchID TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.GetGoalID TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerStats TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.InsertGoalkeeperStats TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.InsertDisciplineStats TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.InsertPenalties TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerAppearance TO userDataInputerI;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerSubstitution TO userDataInputerI;
GRANT SELECT ON dbo.fixturesList TO userDataInputerI;
GRANT SELECT ON dbo.resultsList TO userDataInputerI;
GRANT SELECT ON dbo.transfersList TO userDataInputerI;
GRANT SELECT ON dbo.clubs TO userDataInputerI;
GRANT SELECT ON dbo.playersList TO userDataInputerI;
GRANT SELECT ON dbo.playersDetailList TO userDataInputerI;
GRANT SELECT ON dbo.mplWinnersList TO userDataInputerI;
GRANT SELECT ON dbo.motmWinnersList TO userDataInputerI;



--data inputer level 2 with additional update privilage on tables + access to more tables
CREATE LOGIN datainputerII WITH PASSWORD = 'datainputerII123';

CREATE USER userDataInputerII FOR LOGIN datainputerII;

GRANT SELECT, INSERT, UPDATE ON Clubs TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Venues TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Managers TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON ClubsManagers TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Players TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Officials TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Fixtures TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Matches TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON AppearanceStats TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Goals TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Penalties TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON Substitutions TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON PlayersStats TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON DisciplineStats TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON GoalkeepersStats TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON PlayerTransactions TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON PlayersContracts TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON ManagersContracts TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON MonthlyPlayerAwards TO userDataInputerII;
GRANT SELECT, INSERT, UPDATE ON MOTM TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetPlayerID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetClubID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetClubName TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetVenueID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetActiveManagerIDByClub TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetFixtureID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetMatchID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetGoalID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerStats TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertGoalkeeperStats TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertDisciplineStats TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPenalties TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerAppearance TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerSubstitution TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetPlayerID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetClubID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetClubName TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetVenueID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetActiveManagerIDByClub TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetFixtureID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetMatchID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.GetGoalID TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerStats TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertGoalkeeperStats TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertDisciplineStats TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPenalties TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerAppearance TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertPlayerSubstitution TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.AddFixture TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.StartMatch TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertGoalAndUpdateScore TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.UpdateManagerContractStatus TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.StartMatch TO userDataInputerII;
GRANT EXECUTE ON OBJECT::dbo.InsertGoalAndUpdateScore TO userDataInputerII;
GRANT SELECT ON dbo.fixturesList TO userDataInputerII;
GRANT SELECT ON dbo.resultsList TO userDataInputerII;
GRANT SELECT ON dbo.transfersList TO userDataInputerII;
GRANT SELECT ON dbo.clubs TO userDataInputerII;
GRANT SELECT ON dbo.playersList TO userDataInputerII;
GRANT SELECT ON dbo.playersDetailList TO userDataInputerII;
GRANT SELECT ON dbo.mplWinnersList TO userDataInputerII;
GRANT SELECT ON dbo.motmWinnersList TO userDataInputerII;


--adminstrator with full access to all tables
CREATE LOGIN administrator WITH PASSWORD = 'adminstrator';

CREATE USER userAdminstrator FOR LOGIN administrator;
USE EPL;
ALTER ROLE db_owner ADD MEMBER userAdminstrator;
