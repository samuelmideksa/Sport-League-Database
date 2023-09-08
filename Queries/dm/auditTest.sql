-- test trigger and audit

INSERT INTO Players( firstName, middleName, lastName, DOB, cityOB, countryOB, nationality, height, clubID, position, squadNumber, salaryAmount, paymentFrequency, email, twitter, instagram, facebook, youtube, tikTok) 
VALUES
--('Abebe', 'Michael', 'Doe', '1995-08-15', 'Los Angeles', 'USA', 'American', 180, 10, 'Forward', 3, 1000000, 'Monthly', 'john.doe@example.com', '@johndoe', '@johndoe_insta', '/johndoeofficial', '/johndoeyoutube', '@johndoetiktok'),
--('Sophia', 'Elizabeth', 'Smith', '1998-03-10', 'New York', 'USA', 'American', 9, 11, 'Defender', 2, 800000, 'Monthly', 'sophia.smith@example.com', '@sophiasmith', '@sophiasmith_insta', '/sophiaofficial', '/sophiayoutube', '@sophiatiktok'),
--('Liam', 'David', 'Brown', '1996-11-22', 'Manchester', 'UK', 'British', 185, 12, 'Midfielder', 2, 950000, 'Monthly', 'liam.brown@example.com', '@liambrown', '@liambrown_insta', '/liamofficial', '/liamyoutube', '@liamtiktok'),
('qqqq', 'Louise', 'Johnson', '1997-05-25', 'London', 'UK', 'British', 165, 8, 'Midfielder', 1, 750000, 'Monthly', 'emma.johnson@example.com', '@emmalou', '@emmalou_insta', '/emmaofficial', '/emma_youtube', '@emmatiktok');
select * from Clubs

SELECT * FROM dbo.PlayersAudit


UPDATE EPL.dbo.Players
SET firstName='toure'
WHERE playerID=175
SELECT * FROM dbo.PlayersAudit


select top 3 * from Players
DELETE EPL.dbo.Players
WHERE playerID = 8
DELETE EPL.dbo.PlayersContracts
WHERE playerID = 8
DELETE EPL.dbo.MonthlyPlayerAwards
WHERE playerID = 8
SELECT * FROM dbo.PlayersAudit

