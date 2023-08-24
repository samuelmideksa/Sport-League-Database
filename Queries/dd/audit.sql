CREATE SERVER AUDIT Sample_Audit  
    TO FILE ( FILEPATH ='C:\path\')

ALTER SERVER AUDIT Sample_Audit 
	WITH (STATE = ON);
GO

USE [DatabaseName]
CREATE DATABASE AUDIT SPECIFICATION [Sample DatabaseAuditSpecification]
FOR SERVER AUDIT [Sample_Audit]
ADD (DATABASE_OBJECT_ACCESS_GROUP),
ADD (DATABASE_OBJECT_CHANGE_GROUP),
ADD (DELETE ON DATABASE::[STUDENTGRADE] BY [dbo]),
ADD (INSERT ON DATABASE::[STUDENTGRADE] BY [dbo]),
ADD (SELECT ON DATABASE::[STUDENTGRADE] BY [dbo]),
ADD (UPDATE ON DATABASE::[STUDENTGRADE] BY [dbo])
WITH (STATE = OFF)
GO

USE [DatabaseName]
ALTER DATABASE AUDIT SPECIFICATION [SampleDatabaseAuditSpecification]
FOR SERVER AUDIT [Sample_Audit]
WITH (STATE = ON);
GO

SELECT 
	event_time,
	action_id,
	statement,
	database_name,
	server_principal_name
 FROM fn_get_audit_file('E:\Audittest\Sample_Audit.sqlaudit', DEFAULT, DEFAULT);

 ------------------------------------------------------------------------------------
 CREATE TABLE PlayersAudit (
  playerID INT IDENTITY(1,1),
  firstName NVARCHAR(255) NOT NULL,
  middleName VARCHAR(255),
  lastName NVARCHAR(255) NOT NULL,
  DOB DATE NOT NULL,
  cityOB VARCHAR(255) NOT NULL,
  countryOB VARCHAR(255) NOT NULL,
  nationality VARCHAR(255) NOT NULL,
  height INT NOT NULL,
  clubID INT NOT NULL,
  position VARCHAR(255) NOT NULL,
  squadNumber INT NOT NULL,
  salaryAmount MONEY NOT NULL,
  paymentFrequency VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  twitter VARCHAR(255),
  instagram VARCHAR(255),
  facebook VARCHAR(255),
  youtube VARCHAR(255),
  tikTok VARCHAR(255),
  ModifiedBy VARCHAR(128) ,
  ModifiedDate DATETIME ,
  Operation CHAR(1),
  PRIMARY KEY CLUSTERED (AuditID) 
)

CREATE TRIGGER  TRAuditPlayers ON EPL.dbo.Players
  FOR INSERT, UPDATE, DELETE
AS
  DECLARE @login_name VARCHAR(30)
 
  SELECT  @login_name = login_name
  FROM    sys.dm_exec_sessions
  WHERE   session_id = @@SPID
 
  IF EXISTS (SELECT 0 FROM Deleted )
    BEGIN
      IF EXISTS (SELECT 0 FROM Inserted )
        BEGIN
          INSERT INTO dbo.PlayersAudit(
            playerID,
						firstName,
						middleName,
						lastName,
						DOB,
						cityOB,
						countryOB,
						nationality,
						height,
						clubID,
						position,
						squadNumber,
						salaryAmount,
						paymentFrequency,
						email,
						twitter,
						instagram,
						facebook,
						youtube,
						tikTok,
						ModifiedBy,
						ModifiedDate,
						Operation
            )  
          SELECT
            D.playerID,
						D.firstName,
						D.middleName,
						D.lastName,
						D.DOB,
						D.cityOB,
						D.countryOB,
						D.nationality,
						D.height,
						D.clubID,
						D.position,
						D.squadNumber,
						D.salaryAmount,
						D.paymentFrequency,
						D.email,
						D.twitter,
						D.instagram,
						D.facebook,
						D.youtube,
						D.tikTok,
						D.ModifiedBy,
						D.ModifiedDate,
						D.Operation,
            @login_name, 
            GETDATE(), 
            'U'
          FROM Deleted D
        END
      ELSE
				BEGIN
          INSERT INTO dbo.PlayersAudit(
            playerID,
						firstName,
						middleName,
						lastName,
						DOB,
						cityOB,
						countryOB,
						nationality,
						height,
						clubID,
						position,
						squadNumber,
						salaryAmount,
						paymentFrequency,
						email,
						twitter,
						instagram,
						facebook,
						youtube,
						tikTok,
						ModifiedBy,
						ModifiedDate,
						Operation
            )  
          SELECT
            D.playerID,
						D.firstName,
						D.middleName,
						D.lastName,
						D.DOB,
						D.cityOB,
						D.countryOB,
						D.nationality,
						D.height,
						D.clubID,
						D.position,
						D.squadNumber,
						D.salaryAmount,
						D.paymentFrequency,
						D.email,
						D.twitter,
						D.instagram,
						D.facebook,
						D.youtube,
						D.tikTok,
						D.ModifiedBy,
						D.ModifiedDate,
						D.Operation,
            @login_name, 
            GETDATE(), 
            'D'
          FROM Deleted D
        END
	  END
	ELSE
	BEGIN
    INSERT INTO dbo.PlayersAudit(
      playerID,
			firstName,
			middleName,
			lastName,
			DOB,
			cityOB,
			countryOB,
			nationality,
			height,
			clubID,
			position,
			squadNumber,
			salaryAmount,
			paymentFrequency,
			email,
			twitter,
			instagram,
			facebook,
			youtube,
			tikTok,
			ModifiedBy,
			ModifiedDate,
			Operation
      )  
    SELECT
      I.playerID,
			I.firstName,
			I.middleName,
			I.lastName,
			I.DOB,
			I.cityOB,
			I.countryOB,
			I.nationality,
			I.height,
			I.clubID,
			I.position,
			I.squadNumber,
			I.salaryAmount,
			I.paymentFrequency,
			I.email,
			I.twitter,
			I.instagram,
			I.facebook,
			I.youtube,
			I.tikTok,
			I.ModifiedBy,
			I.ModifiedDate,
			I.Operation,
      @login_name, 
      GETDATE(), 
      'U'
          FROM Deleted D
        END
GO

INSERT INTO Players(
	firstName,
	middleName,
	lastName,
	DOB,
	cityOB,
	countryOB,
	nationality,
	height,
	clubID,
	position,
	squadNumber,
	salaryAmount,
	paymentFrequency,
	email,
	twitter,
	instagram,
	facebook,
	youtube,
	tikTok,    
) 
VALUES
('John', 'Michael', 'Doe', '1995-08-15', 'Los Angeles', 'USA', 'American', 180, 101, 'Forward', 10, 1000000, 'Monthly', 'john.doe@example.com', '@johndoe', '@johndoe_insta', '/johndoeofficial', '/johndoeyoutube', '@johndoetiktok'),
('Sophia', 'Elizabeth', 'Smith', '1998-03-10', 'New York', 'USA', 'American', 170, 201, 'Defender', 5, 800000, 'Monthly', 'sophia.smith@example.com', '@sophiasmith', '@sophiasmith_insta', '/sophiaofficial', '/sophiayoutube', '@sophiatiktok'),
('Liam', 'David', 'Brown', '1996-11-22', 'Manchester', 'UK', 'British', 185, 301, 'Midfielder', 8, 950000, 'Monthly', 'liam.brown@example.com', '@liambrown', '@liambrown_insta', '/liamofficial', '/liamyoutube', '@liamtiktok'),
('Emma', 'Louise', 'Johnson', '1997-05-25', 'London', 'UK', 'British', 165, 201, 'Midfielder', 7, 750000, 'Monthly', 'emma.johnson@example.com', '@emmalou', '@emmalou_insta', '/emmaofficial', '/emma_youtube', '@emmatiktok');
GO



update DBSampleTrigger.dbo.STUDENT
Set StuFname='yyyy'
where StudentID=1


Delete 
From DBSampleTrigger.dbo.STUDENT
where StudentID=3

Select * 
FRom dbo.StudentAudit

Select * 
FRom dbo.STUDENT