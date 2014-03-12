/****** Object:  StoredProcedure [dbo].[sp_OpportunityView]    Script Date: 02/24/2014 13:06:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_OpportunityView]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_OpportunityView]
GO

/****** Object:  StoredProcedure [dbo].[sp_OpportunityView]    Script Date: 02/24/2014 13:06:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
exec [sp_OpportunityView]'98428801-3032-4EF3-8FF4-4588F7876ECE','ID ASc',0,0,@isActive=0
exec [sp_OpportunityView] '98428801-3032-4ef3-8ff4-4588f7876ece','NAME ASC',50,1
*/
CREATE Procedure [dbo].[sp_OpportunityView]
	@userId UniqueIdentifier,
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT,
	@companyId INT =NULL,
	@searchText VARCHAR(MAX)=null,
	@isActive BIT = 1

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END
	
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		SET @SQL = 'Select *  
		FROM [vw_Opportunities]
		WHERE 1=1';
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		SET @SQL = 'Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = ''' + CAST(@userId AS VARCHAR(100)) + '''';
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		SET @SQL = 'Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID =' + CAST(@franchiseeId AS VARCHAR(10)); 
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		SET @SQL = 'Select vw.*  
		FROM [vw_Opportunities] vw
		WHERE vw.CreatedBy = ' + CAST(@userId AS VARCHAR(20));;
		
	END 
	
	SET @SQL = @SQL + ' AND vw.IsActive = ' + CAST(@isActive AS VARCHAR(5));
	
	IF @companyID IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND COMPANYID = ' + CAST(@companyID AS VARCHAR(10)); 
	END
	
	If @searchText is not null and @searchText != ''
	BEGIN
	   SET @SQL = @SQL + ' AND (Upper(vw.COMPANYNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.Type) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.Status) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.Source) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.NAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.SALESREPLASTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.SALESREPFIRSTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.ProductTypeName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ')'
	END	
	
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	PRINt @SQL
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount,
				COMPANYNAME,
				IndustryId,
				WhyLost,
				Type,
				Status,
				ProductTypeName,
				Source,
				ID,
				COMPANYID,
				CONTACTID,
				NAME,
				ProductID,
				SALESREPLASTNAME,
				SALESREPFIRSTNAME,
				SALESREPLASTNAME + SALESREPFIRSTNAME AS SALESREP,
				STATUSID,
				VALUE,
				WINPROBABILITY,
				WEIGHTEDVALUE,
				CLOSEDATE,
				IsActive,
				OpportunityID,
				SourceID,
				TypeID,
				WhyLostID,
				Description,
				Notes,
				ActualValue,
				ProductCost,
				OppCreationDate,
				Pain,
				LengthofProblem,
				CostToFix,
				Alternatives,
				IsBudgeIdentified,
				IsMoveForward,
				SeconadryContactId1,
				SeconadryContactId2
			 FROM CTE_pageResult 
			 WHERE 1 = 1';

	
	
	
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' AND RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
End



GO


