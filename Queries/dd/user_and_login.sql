USE EPL
GO
CREATE LOGIN general WITH PASSWORD = 'general123';
CREATE USER generalUser FOR LOGIN general;
GRANT SELECT ON DATABASE EPL TO generalUser;

CREATE LOGIN datainputerI WITH PASSWORD = 'datainputerI123';
CREATE USER userDataInputerI FOR LOGIN datainputerI;
GRANT SELECT, INSERT ON Clubs, Venues, Managers, Players, Officials, Fixtures, Matches, AppearanceStats, Goals, Penalties, Substitutions, PlayersStats, Disciplines, GoalkeepersStats, MonthlyPlayerAwards, MOTM TO userDataInputerI;

CREATE LOGIN datainputerII WITH PASSWORD = 'datainputerII123';
CREATE USER userDataInputerII FOR LOGIN datainputerII;
GRANT SELECT, INSERT, UPDATE ON Clubs, Venues, Managers, ClubsManagers, Players, Officials, Fixtures, Matches, AppearanceStats, Goals, Penalties, Substitutions, PlayersStats, Disciplines, GoalkeepersStats, PlayerContract, ManagerContractMonthlyPlayerAwards, MOTM TO userDataInputerII;

CREATE LOGIN administrator WITH PASSWORD = 'adminstrator';
CREATE USER userAdminstrator FOR LOGIN adminstrator;
GRANT ALL ON DATABASE EPL TO userAdminstrator;