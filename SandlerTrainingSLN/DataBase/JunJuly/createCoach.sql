USE [SandlerDB]
GO

DECLARE @coachId int

EXECUTE sp_CreateCoach @user_Name = 'necoach', @_email = 'necoach@sandler.com',@region_Name = 'North East', @coach_Id = @coachId OUTPUT; 
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'macoach', @_email = 'macoach@sandler.com',@region_Name = 'Mid-Atlantic', @coach_Id = @coachId OUTPUT; 
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'nccoach', @_email = 'nccoach@sandler.com',@region_Name = 'North Central', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'glcoach', @_email = 'glcoach@sandler.com',@region_Name = 'Great Lakes', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'secoach', @_email = 'secoach@sandler.com',@region_Name = 'South East', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'sccoach', @_email = 'nccoach@sandler.com',@region_Name = 'South Central', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'wcoach', @_email = 'nccoach@sandler.com',@region_Name = 'West', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'cecoach', @_email = 'nccoach@sandler.com',@region_Name = 'Canada-Eastern', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
EXECUTE sp_CreateCoach @user_Name = 'cwoach', @_email = 'nccoach@sandler.com',@region_Name = 'Canada-Western', @coach_Id = @coachId OUTPUT;
PRINT CAST(@coachId as VARCHAR(10));
GO

