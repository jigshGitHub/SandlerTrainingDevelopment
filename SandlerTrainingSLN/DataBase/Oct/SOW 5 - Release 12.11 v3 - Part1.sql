INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
VALUES ('Sales Cycle Time - Entire Portfolio ','Pie3D.swf','SalesCycleTimeMain','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
GO

/****** Object:  StoredProcedure [dbo].[sp_GetSalesCyclePortfolioData]    Script Date: 10/23/2012 16:28:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetSalesCyclePortfolioData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetSalesCyclePortfolioData]
GO

Create Procedure [dbo].[sp_GetSalesCyclePortfolioData]
@userId UNIQUEIDENTIFIER

AS

--sp_configure 'Show Advanced Options', 1
--GO
--RECONFIGURE
--GO
--sp_configure 'Ad Hoc Distributed Queries', 1
--GO
--RECONFIGURE
--GO


--SELECT * INTO @Opportunities FROM OPENROWSET('SQLNCLI', 'Server=localhost\sqlexpress;Trusted_Connection=yes;',
-- 'SET NOCOUNT ON;SET FMTONLY OFF;EXEC SandlerDB.dbo.sp_GetOpportunitiesByUser ''7F31E699-0EC2-46B7-B1EF-C66E1178F726''')
	DECLARE  @Opportunities TABLE
	(
		Id INT,
		OppCreationDate DATETIME,
		CLOSEDATE DATETIME,
		DateDiffInMonths INT,
		MultipleOfSix INT
	)
	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate'
	Begin
    
		INSERT INTO @Opportunities
		Select vw.Id, vw.OppCreationDate, vw.CLOSEDATE, DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE),DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE)/6		
		FROM [vw_Opportunities] vw;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		INSERT INTO @Opportunities
		Select vw.Id, vw.OppCreationDate, vw.CLOSEDATE, DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE),DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE)/6		
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		INSERT INTO @Opportunities
		Select vw.Id, vw.OppCreationDate, vw.CLOSEDATE, DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE),DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE)/6		
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		INSERT INTO @Opportunities
		Select vw.Id, vw.OppCreationDate, vw.CLOSEDATE, DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE),DATEDIFF(month,vw.OppCreationDate,vw.CLOSEDATE)/6		
		FROM [vw_Opportunities] vw
		WHERE vw.CreatedBy = @userId;
		
	END 
	
	SELECT * FROM @Opportunities where CLOSEDATE < GETDATE() order by DateDiffInMonths;
	
--	select COUNT(id), MultipleOfSix,case MultipleOfSix
--when 0 then '0 - 6 Months'
--when 1 then '6 - 12 Months'
--when 2 then '12 - 18 Months'
--when 3 then '18 - 24 Months'
--else '24+ Months'
--end 
--from @Opportunities where CLOSEDATE < GETDATE()
--group by MultipleOfSix;
GO

