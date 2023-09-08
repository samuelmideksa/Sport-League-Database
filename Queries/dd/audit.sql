CREATE SERVER AUDIT EPLAudit1  
  TO FILE ( FILEPATH ='C:\eplBackup\eplaudit.sqlaudit')

ALTER SERVER AUDIT EPLAudit1 
	WITH (STATE = ON);
GO

USE EPL
CREATE DATABASE AUDIT SPECIFICATION PlayersAudit
FOR SERVER AUDIT EPLAudit1
ADD (DATABASE_OBJECT_ACCESS_GROUP),
ADD (DATABASE_OBJECT_CHANGE_GROUP),
ADD (DELETE ON DATABASE::[EPL] BY [dbo]),
ADD (INSERT ON DATABASE::[EPL] BY [dbo]),
ADD (SELECT ON DATABASE::[EPL] BY [dbo]),
ADD (UPDATE ON DATABASE::[EPL] BY [dbo])
WITH (STATE = OFF)
GO

USE EPL
ALTER DATABASE AUDIT SPECIFICATION PlayersAudit
FOR SERVER AUDIT EPLAudit1
WITH (STATE = ON);
GO

SELECT 
	event_time,
	action_id,
	statement,
	database_name,
	server_principal_name
 FROM fn_get_audit_file('C:\dbackup\EPLAudit1_3E8CFB13-B5B1-4CD2-ABC5-FCBBE2166D88_0_133379648961170000.sqlaudit', DEFAULT, DEFAULT);
 ------------------------------------------------------------------------------------
 CREATE TABLE PlayersAudit (
  AuditID INTEGER NOT NULL IDENTITY(1, 1),
  playerID INT,
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
);

CREATE TRIGGER TRAuditPlayers
ON EPL.dbo.Players
AFTER INSERT, UPDATE, DELETE
AS
  DECLARE @login_name VARCHAR(30)
 
  SELECT  @login_name = login_name
  FROM    sys.dm_exec_sessions
  WHERE   session_id = @@SPID
 
  IF EXISTS (SELECT 0 FROM Deleted )
  BEGIN
    IF EXISTS (SELECT 0 FROM Inserted )
    BEGIN
      INSERT INTO dbo.PlayersAudit(playerID, firstName, middleName, lastName, DOB, cityOB, countryOB, nationality, height, clubID, position, squadNumber, salaryAmount, paymentFrequency, email, twitter, instagram, facebook, youtube, tikTok, ModifiedBy, ModifiedDate, Operation)  
      SELECT D.playerID, D.firstName, D.middleName, D.lastName, D.DOB, D.cityOB, D.countryOB, D.nationality, D.height, D.clubID, D.position, D.squadNumber, D.salaryAmount, D.paymentFrequency, D.email, D.twitter, D.instagram, D.facebook, D.youtube, D.tikTok, @login_name,  GETDATE(),  'U'
      FROM Deleted D
    END
    ELSE
	BEGIN
      INSERT INTO dbo.PlayersAudit( playerID, firstName, middleName, lastName, DOB, cityOB, countryOB, nationality, height, clubID, position, squadNumber, salaryAmount, paymentFrequency, email, twitter, instagram, facebook, youtube, tikTok, ModifiedBy, ModifiedDate, Operation)  
      SELECT D.playerID, D.firstName, D.middleName, D.lastName, D.DOB, D.cityOB, D.countryOB, D.nationality, D.height, D.clubID, D.position, D.squadNumber, D.salaryAmount, D.paymentFrequency, D.email, D.twitter, D.instagram, D.facebook, D.youtube, D.tikTok, @login_name,  GETDATE(),  'D'
      FROM Deleted D
    END
  END
  ELSE
  BEGIN
  INSERT INTO dbo.PlayersAudit( playerID, firstName, middleName, lastName, DOB, cityOB, countryOB, nationality, height, clubID, position, squadNumber, salaryAmount, paymentFrequency, email, twitter, instagram, facebook, youtube, tikTok, ModifiedBy, ModifiedDate, Operation)  
	SELECT I.playerID, I.firstName, I.middleName, I.lastName, I.DOB, I.cityOB, I.countryOB, I.nationality, I.height, I.clubID, I.position, I.squadNumber, I.salaryAmount, I.paymentFrequency, I.email, I.twitter, I.instagram, I.facebook, I.youtube, I.tikTok, @login_name,  GETDATE(),  'I'
    FROM Inserted I
  END
GO
