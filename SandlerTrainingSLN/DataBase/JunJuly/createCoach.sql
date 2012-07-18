USE [SandlerDB]
GO

DECLARE @coachId int

EXECUTE sp_CreateCoach @user_Name = 'necoach', @_email = 'necoach@sandler.com',@region_Name = 'North East', @coach_Id = @coachId OUTPUT; 
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'secoach', @_email = 'secoach@sandler.com',@region_Name = 'South East', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'nccoach', @_email = 'nccoach@sandler.com',@region_Name = 'North Central', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
GO

