--functions
-- Create the function to get player ID based on parameters
CREATE FUNCTION GetPlayerID (
  @fName VARCHAR(255),
  @mName VARCHAR(255),
  @lName VARCHAR(255),
  @clubID INT,
  @squadNumber INT
)
RETURNS INT
AS
BEGIN
  DECLARE @playerID INT;

  SELECT @playerID = playerID
  FROM Players
  WHERE 
    firstName = @fName AND
	middleName = @mName AND
    lastName = @lName AND
    clubID = @clubID AND
    squadNumber = @squadNumber;

  RETURN @playerID;
END;


-- Function to get clubID based on clubName
CREATE FUNCTION GetClubID (
  @clubName VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @clubID INT;

  SELECT @clubID = clubID
  FROM Clubs
  WHERE clubName = @clubName;

  RETURN @clubID;
END;

--Function to get clubName from clubID
CREATE FUNCTION GetClubName (
  @clubID INT
)
RETURNS VARCHAR(255)
AS
BEGIN
  DECLARE @clubName VARCHAR(255);

  SELECT @clubName = clubName
  FROM Clubs
  WHERE clubID = @clubID;

  RETURN @clubName;
END;


-- Function to get venueID based on venueName
CREATE FUNCTION GetVenueID (
  @venueName VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @venueID INT;

  SELECT @venueID = venueID
  FROM Venues
  WHERE venueName = @venueName;

  RETURN @venueID;
END;



--functions for retrieving managerID for given club name
CREATE FUNCTION GetActiveManagerIDByClub (
  @clubID VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @managerID INT;

  SELECT @managerID = m.managerID
  FROM Managers m
  JOIN ClubsManagers cm ON m.managerID = cm.managerID
  WHERE 
    cm.clubID = @clubID AND
    m.managerStatus = 'Active' AND
	cm.endDate IS NULL;

  RETURN @managerID;
END;

-- Function to get fixtureID based on homeTeam, awayTeam, and fixtureDate
CREATE FUNCTION GetFixtureID (
  @homeTeamID INT,
  @awayTeamID INT,
  @fixtureDate DATE
)
RETURNS INT
AS
BEGIN
  DECLARE @fixtureID INT;

  SELECT @fixtureID = fixtureID
  FROM Fixtures
  WHERE 
    homeTeamID = @homeTeamID AND
    awayTeamID = @awayTeamID AND
    fixtureDate = @fixtureDate;

  RETURN @fixtureID;
END;

-- Function to get matchID based on homeTeam, awayTeam, and fixtureDate
CREATE FUNCTION GetMatchID (
  @homeTeamID INT,
  @awayTeamID INT,
  @fixtureDate DATE
)
RETURNS INT
AS
BEGIN
  DECLARE @matchID INT;

  SELECT @matchID = matchID
  FROM Matches
  WHERE 
    fixtureID = dbo.GetFixtureID(@homeTeamID, @awayTeamID, @fixtureDate)

  RETURN @matchID;
END;
