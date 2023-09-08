---Full Backup
BACKUP DATABASE EPL TO DISK = 'C:\eplBackup\tablesFull1.bak'
GO

BACKUP DATABASE EPL TO DISK = 'C:\eplBackup\tablesFull2.bak' -- final
GO

---Differential Backup
BACKUP DATABASE EPL TO DISK = 'C:\eplBackup\diffEPL.bak' WITH DIFFERENTIAL 
GO
---Differential Backup
BACKUP DATABASE EPL TO DISK = 'C:\eplBackup\diffEPL2.bak' WITH DIFFERENTIAL 
GO

---Log Backup
BACKUP LOG EPL TO DISK = 'C:\eplBackup\logEPL.bak'
GO