Update TBL_SALESCYCLETIME_MAIN SET Link = Null WHERE Id = 1;
Update TBL_SALESCYCLETIME_MAIN SET Link = 'SCTDrill.aspx?drillCategory=3 to 6 Months&drillLevel=2&drillBy=Product' WHERE Id = 2;
Update TBL_SALESCYCLETIME_MAIN SET Link = 'SCTDrill.aspx?drillCategory=6 to 12 Months&drillLevel=3&drillBy=Product' WHERE Id = 3;
Update TBL_SALESCYCLETIME_MAIN SET Link = Null WHERE Id = 4;
Update TBL_SALESCYCLETIME_MAIN SET Link = Null WHERE Id = 5;
Update TBL_SALESCYCLETIME_MAIN SET Link = Null WHERE Id = 6;

INSERT INTO [SandlerDB].[dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name] ,[Color]) SELECT [Category_Name] ,[Color] FROM TBL_PRODSOLD_BYCOMP;
INSERT INTO [SandlerDB].[dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name]) SELECT [Rep_Name] FROM TBL_PRODSOLD_BYREP;

UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 13, Color = '0000FF' WHERE [Category_Name] = 'Leadership'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 20, Color = 'FF0000' WHERE [Category_Name] = 'Sales'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 11, Color = '009966' WHERE [Category_Name] = 'Sandler Online'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 4, Color = 'AA00FF' WHERE [Category_Name] = 'Negotiations'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 4, Color = 'CC6699' WHERE [Category_Name] = 'Strategic Customer Care'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 6, Color = 'FF00FF' WHERE [Category_Name] = 'Consulting'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 9, Color = '8A0008' WHERE [Category_Name] = 'Coaching'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 6, Color = 'FF9966' WHERE [Category_Name] = 'Assessments'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 9, Color = '00AA00' WHERE [Category_Name] = 'Networking Works'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 11, Color = 'CC33FF' WHERE [Category_Name] = 'Strategic Alliances'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 7, Color = '00CCFF' WHERE [Category_Name] = 'Corporate Global'

UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 13, Color = '0000FF' WHERE [Category_Name] = 'Mass Mutual'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 16, Color = 'FF0000' WHERE [Category_Name] = 'Castle Metals'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 7, Color = '009966' WHERE [Category_Name] = 'Fed. Dept. Stores'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 10, Color = 'AA00FF' WHERE [Category_Name] = 'Minnesota Mutual'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 6, Color = '0099CC' WHERE [Category_Name] = 'Robert Half'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 6, Color = 'FF9966' WHERE [Category_Name] = 'Sallie Mae'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 6, Color = '8A0008' WHERE [Category_Name] = 'Lowes'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 16, Color = 'CC6699' WHERE [Category_Name] = 'GE Capital Corp'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 10, Color = 'FF33CC' WHERE [Category_Name] = 'Oracle Systems'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 10, Color = '00FF00' WHERE [Category_Name] = 'BMW Financial'

UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 13, Color = '3366CC' WHERE [Category_Name] = 'Jane Smith'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 26, Color = '993333' WHERE [Category_Name] = 'John Doe'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 17, Color = 'CCCC00' WHERE [Category_Name] = 'Bill Clark'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 31, Color = '993399' WHERE [Category_Name] = 'Harold Frasier'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL2 = 13, Color = '00CCFF' WHERE [Category_Name] = 'Allison Myers'

UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 6 WHERE [Category_Name] = 'Leadership'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 22 WHERE [Category_Name] = 'Sales'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 9 WHERE [Category_Name] = 'Sandler Online'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 3 WHERE [Category_Name] = 'Negotiations'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 3 WHERE [Category_Name] = 'Strategic Customer Care'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 12 WHERE [Category_Name] = 'Consulting'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 6 WHERE [Category_Name] = 'Coaching'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 9 WHERE [Category_Name] = 'Assessments'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 15 WHERE [Category_Name] = 'Networking Works'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 9 WHERE [Category_Name] = 'Strategic Alliances'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 6 WHERE [Category_Name] = 'Corporate Global'

UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 13 WHERE [Category_Name] = 'Mass Mutual'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 16 WHERE [Category_Name] = 'Castle Metals'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 7 WHERE [Category_Name] = 'Fed. Dept. Stores'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 10 WHERE [Category_Name] = 'Minnesota Mutual'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 6 WHERE [Category_Name] = 'Robert Half'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 6 WHERE [Category_Name] = 'Sallie Mae'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 6 WHERE [Category_Name] = 'Lowes'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 16 WHERE [Category_Name] = 'GE Capital Corp'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 10 WHERE [Category_Name] = 'Oracle Systems'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 10 WHERE [Category_Name] = 'BMW Financial'

UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 13, Color = 'ff9900' WHERE [Category_Name] = 'Jane Smith'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 7, Color = 'ff33cc' WHERE [Category_Name] = 'John Doe'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 46, Color = '0afe47' WHERE [Category_Name] = 'Bill Clark'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 27, Color = 'ff3300' WHERE [Category_Name] = 'Harold Frasier'
UPDATE [TBL_SALESCYCLETIME_DRILL] SET Value_DL3 = 7, Color = 'ffff00' WHERE [Category_Name] = 'Allison Myers'