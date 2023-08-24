drop trigger CheckRefereeAndOfficialsRoles
drop trigger CheckRefereeAndOfficialsRolesR


-- Create the trigger for checking referee and official roles

CREATE TRIGGER CheckRefereeAndOfficialsRolesT
	ON Fixtures
	Instead OF INSERT
	AS
	BEGIN
	  IF NOT EXISTS (
		SELECT 1
		FROM inserted AS i
		WHERE NOT EXISTS (
		  SELECT 1 FROM Officials WHERE officialID = i.refereeID AND maxRole = 'Referee'
		)
		OR NOT EXISTS (
		  SELECT 1 FROM Officials WHERE officialID = i.assistantReferee1ID AND maxRole IN ('Referee', 'Assistant referee')
		)
		OR NOT EXISTS (
		  SELECT 1 FROM Officials WHERE officialID = i.assistantReferee2ID AND maxRole IN ('Referee', 'Assistant referee')
		)
		OR NOT EXISTS (
		  SELECT 1 FROM Officials WHERE officialID = i.fourthOfficialID AND maxRole IN ('Referee', 'Assistant referee', 'Fourth official')
		)
	  )
	  BEGIN
		PRINT 'The inserted fixture has invalid referee or official roles.'
		ROLLBACK TRANSACTION;
		RETURN;
	  END;
	END;

INSERT INTO Officials (firstName, lastName, email, maxRole, nationality)
VALUES
  ('Jook', 'Dean', 'mike@referees.com', 'Fourth official', 'English'),
  ('Temap', 'Kree', 'john@referees.com', 'Assistant referee', 'Ethiopian');

select * from Officials
select * from Fixtures

-- Insert sample data into Fixtures table
INSERT INTO Fixtures (homeTeamID, awayTeamID, fixtureDate, kickoff, venueID, refereeID, assistantReferee1ID, assistantReferee2ID, fourthOfficialID, fixtureStatus)
VALUES
  (2, 1, '2023-10-20', '17:00:00', 2, 4, 2, 5, 1, 'Scheduled');