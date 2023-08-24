
-- Insert sample data into Clubs table
INSERT INTO Clubs (clubName, clubAbbreviation, home, city, country, email, website)
VALUES
  ('Manchester United', 'MU', 1, 'Manchester', 'England', 'contact@manutd.com', 'https://www.manutd.com'),
  ('Liverpool FC', 'LFC', 2, 'Liverpool', 'England', 'info@liverpoolfc.com', 'https://www.liverpoolfc.com');

-- Insert sample data into Venues table
INSERT INTO Venues (venueName, venueLocation, capacity)
VALUES
  ('Old Trafford', 'Manchester', 74000),
  ('Anfield', 'Liverpool', 54000);

-- Insert sample data into Managers table
INSERT INTO Managers (firstName, lastName, email, nationality, managerStatus, DOB, salaryAmount)
VALUES
  ('Ole', 'Gunnar Solskjaer', 'ole@manutd.com', 'Norwegian', 'Active', '1973-02-26', 1500000),
  ('Jurgen', 'Klopp', 'jurgen@liverpoolfc.com', 'German', 'Active', '1967-06-16', 2000000);

-- Insert sample data into Players table
INSERT INTO Players (firstName, lastName, DOB, cityOB, countryOB, nationality, height, clubID, position, squadNumber, salaryAmount, paymentFrequency, email)
VALUES
  ('Marcus', 'Rashford', '1997-10-31', 'Manchester', 'England', 'English', 180, 1, 'Forward', 10, 1200000, 'weekly', 'aoll@llol.coc'),
  ('Virgil', 'van Dijk', '1991-07-08', 'Breda', 'Netherlands', 'Dutch', 193, 2, 'Defender', 4, 1500000, 'monthly', '1ikl@lil.coo');
  
-- Insert sample data into Officials table
INSERT INTO Officials (firstName, lastName, email, maxRole, nationality)
VALUES
  ('Mike', 'Dean', 'mike@referees.com', 'Referee', 'English'),
  ('John', 'Smith', 'john@referees.com', 'Assistant referee', 'Scottish');

---------------------

--------------------
-- Insert sample data into Fixtures table
INSERT INTO Fixtures (homeTeamID, awayTeamID, fixtureDate, kickoff, venueID, refereeID, assistantReferee1ID, assistantReferee2ID, fourthOfficialID, fixtureStatus)
VALUES
  (1, 2, '2023-08-20', '15:00:00', 2, 1, 2, 2, 2, 'Scheduled');

-- Insert sample data into Matches table
INSERT INTO Matches (fixtureID, HTHomeTeamScore, HTAwayTeamScore, FTHomeTeamScore, FTAwayTeamScore)
VALUES
  (2, 1, 0, 3, 1);

  select * from players

-- Insert sample data into AppearanceStats table
INSERT INTO AppearanceStats (apperanceType, playerID, matchID)
VALUES
  ('Start', 5, 2),
  ('Substitution', 6, 2);

-- Insert sample data into Goals table
INSERT INTO Goals (matchID, goalMinute, goalType, assistBy, playerID, goalFor, goalAt)
VALUES
  (2, 25, 'Goal with left foot', NULL, 6, 2, 1),
  (2, 67, 'Penalty scored', NULL, 5, 1, 2);

-- Insert sample data into Penalties table
INSERT INTO Penalties (matchID, penaltyMinute, penaltyType, converted, teamFor, teamAt)
VALUES
  (2, 40, 'Regular penalty', 'True', 1, 2),
  (2, 75, 'Penalty shootout', 'False', 1, 2);

-- Insert sample data into Substitutions table
INSERT INTO Substitutions (matchID, playerInID, playerOutID, substitutionMinute, description)
VALUES
  (2, 5, 6, 75, 'Injury substitution');

-- Insert sample data into PlayersStats table
INSERT INTO PlayersStats (matchID, playerID, teamFor, teamAgainst, assists, passes)
VALUES
  (2, 6, 1, 2, 1, 40),
  (2, 5, 2, 1, 0, 60);

  -- Insert sample data into PlayersStats table
INSERT INTO DisciplineStats (playerID, matchID, teamFor, cardMinute, cardType, description)
VALUES
	(5, 2, 2, 50, 'Yellow', 'Tackle'),
	(5, 2, 2, 75, 'Yellow', 'Unsports man like conduct'),
	(5, 2, 2, 75, 'Red', 'two yellow');


-- Insert sample data into GoalkeepersStats table
INSERT INTO GoalkeepersStats (playerID, matchID, teamFor, saves, punches, catches)
VALUES
  (5, 2, 1, 6, 2, 3),
  (6, 2, 2, 3, 1, 2);

-- Insert sample data into PlayerTransactions table
INSERT INTO PlayerTransactions (playerID, transactionType, fromTeam, toTeam, transactionDate)
VALUES
  (5, 'Transfer', 1, 2, '2023-08-10'),
  (6, 'Loan', 2, 1, '2023-08-05');

-- Insert sample data into PlayerContract table
INSERT INTO PlayerContract (playerID, clubID, startDate, endDate, contractValue, contractType,transferFee, contractStatus)
VALUES
  (5, 1, '2023-08-01', '2025-07-31', 5000000, 'Professional', 200, 'Active'),
  (6, 2, '2023-07-15', '2024-06-30', 4000000, 'Professional', 300, 'Active');

-- Insert sample data into ManagerContract table
INSERT INTO ManagerContract (managerID, clubID, startDate, endDate, contractStatus)
VALUES
  (3, 1, '2023-07-01', '2024-06-30', 'Active'),
  (4, 2, '2023-06-15', '2025-05-31', 'Active');

-- Insert sample data into MonthlyPlayerAwards table
INSERT INTO MonthlyPlayerAwards (MonthlyPlayerAwardsID, awardType, awardYear, awardMonth, playerID, matchID, goalID)
VALUES
  (9, 'Player of the Month', 2023, 7, 5, NULL, NULL),
  (10, 'Goal of the Month', 2023, 7, 6, 2, 5);

-- Insert sample data into MOTM table
INSERT INTO MOTM (awardYear, awardMonth, managerID)
VALUES
  (2023, 7, 4),
  (2023, 8, 3);


