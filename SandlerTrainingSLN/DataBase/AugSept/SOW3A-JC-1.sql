ALTER TABLE Tbl_AppointmentsSource ADD ColorCode VARCHAR(6);
GO

Update Tbl_AppointmentsSource SET ColorCode = '00CC66' WHERE ApptSourceId = 1;
Update Tbl_AppointmentsSource SET ColorCode = '0099FF' WHERE ApptSourceId = 2;
Update Tbl_AppointmentsSource SET ColorCode = 'FF3300' WHERE ApptSourceId = 3;
Update Tbl_AppointmentsSource SET ColorCode = '9900CC' WHERE ApptSourceId = 4;
Update Tbl_AppointmentsSource SET ColorCode = 'CC6600' WHERE ApptSourceId = 5;
GO

ALTER TABLE Tbl_AppointmentsSource
ALTER COLUMN ColorCode VARCHAR(6) NOT NULL
GO