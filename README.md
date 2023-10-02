Conceptual Database Description





The database is designed to manage information related to a Football league.
It includes tables to store data about clubs, venues, managers, players, officials, fixtures, matches, statistics, events, transactions, contracts, salaries, and awards.


The "Clubs" table stores details about the football clubs participating in the league. It includes attributes such as ClubID, ClubName, ClubAbbreviation, City, Country, Email, Website, and social media handles.

The "Venues" table contains information about the venues where matches are played. It includes attributes like VenueID, VenueName, VenueLocation, and Capacity.

The "Managers" table stores data about the team managers. It includes attributes such as ManagerID, FirstName, LastName, Email, Nationality, ManagerStatus, Date of Birth (DOB), ManagerBio, and SalaryAmount.

* The database stores data of Which Manager managed which Club with a time window. It includes attributes like endDate and startDate.
	(multiple managers can manage multiple clubs, one-on-one at a time)

The "Players" table stores details about the football players. It includes attributes like PlayerID, FirstName, LastName, DOB, CityOfBirth, CountryOfBirth, Nationality, Height, ClubID, Position, SquadNumber, SalaryAmount, PaymentFrequency, and social media handles.

The "Officials" table contains data about the match officials, including referees and assistant referees. It includes attributes such as OfficialID, FirstName, LastName, Email, and Nationality.

* The database stores a fixture of planned match between two Clubs. It includes attributes like FixtureDate, KickoffTime and FixtureStatus.
	(multiple clubs get fixed with multiple other clubs)

* The database stores specific matches played between two Clubs. It includes attributes like Half Time HomeTeam Score,  Half Time AwayTeamScore, Final Time HomeTeamScore, and Final Time AwayTeamScore.
	(multiple clubs can play with multiple other clubs)

* The database stores player appearances in matches, including attributes like AppearanceType (start or substitution)
	(multiple players can appear in multiple matches)

* The database stores every Goals scored by players in matches. It includes attributes like goalID, goalType (penalty, header, out of box, ...) and minute goal scored at
	(multiple players score multiple goals in multiple matches)

* The database stores every penalty awarded to teams in matches. It includes attributes like penalty ID, penalty Type (penalty shootout, retake, regular, ...) and minute penalty awarded at
	(multiple penalties can be awarded to multiple teams in multiple matches)

* The database stores every substitution of a player by another player in matches. It includes attributes like substitution minute
	(multiple players can substitute multiple players in multiple matches)

* The database stores every players match stats (number of item collected). It includes attributes like numbers of goals, fouls, cards, offensive and defensive activities, ...
	(one player gets one match stat for one match, multiple for multiple matches)

* The same way the database stores every goalies match stats (number of item collected). It includes attributes like numbers of goals, fouls, cards, offensive and defensive activities, ...
	(one player gets one match goal keeping stat for one match, multiple for multiple matches)

* The database stores Player Transactions data throughout the seson to tracks player transfers, loans, and releases. It includes attributes like TransactionType, and TransactionDate.
	(multiple players can get transacted from/to multiple teams)

* The database stores PlayerContract with a Club stores player contracts, including attributes like ContractID, StartDate, EndDate, ContractValue, ContractType, ContractStatus, TransferFee, and BuyoutClause.
	(multiple players sign multiple contracts with multiple teams, one at a time)

* The database stores Managers Contract with a Club stores player contracts, including attributes like ContractID, StartDate, EndDate, ContractValue, and ContractStatus.
	(multiple managers sign multiple contracts with multiple teams, one at a time)

* The data base stores Monthly Player Awards winners and MOTM (manager of the month) winners throughout the season.It include attributes like award ID, award type, year, and month.
