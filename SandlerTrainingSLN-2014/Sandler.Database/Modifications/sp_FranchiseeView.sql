/****** Object:  StoredProcedure [dbo].[sp_FranchiseeView]    Script Date: 03/10/2014 17:08:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_FranchiseeView]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_FranchiseeView]
GO


/****** Object:  StoredProcedure [dbo].[sp_FranchiseeView]    Script Date: 03/10/2014 17:08:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[sp_FranchiseeView](
	@userId UniqueIdentifier,
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@searchText VARCHAR(MAX)=null,-- This is SearchText entered by the User
	@selectForExcel bit = 0, -- for Excel Export	
	@isActive BIT = 1
	)
As
BEGIN
	DECLARE @RoleName VARCHAR(256),
	@SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX),
	@coachId INT,
	@franchiseeId INT		     

	Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    SET @SQL = '
			SELECT 
			F.ID,
			F.LastName, 
			F.FirstName,
			F.LastCreatedDate,
			F.Name,
			F.WorkEmail, 
			F.OfficePhone,
			F.LastCreatedDate as LastUpdatedDate
			FROM TBL_Franchisee F
			Where 1 = 1';

	
	
	IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		SET @SQL = @SQL + ' AND (F.WorkEmail IS NULL OR Upper(F.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'') ';
	END
	
	IF @RoleName = 'Coach'
	BEGIN		
		
		Select @coachId = ID FROM TBL_COACH WHERE UserID = @userId;
		
		SET @SQL = @SQL + ' AND F.CoachID = ' + CAST(@coachId AS VARCHAR(10)) ;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		SET @SQL = @SQL + ' AND F.ID = ' + CAST(@franchiseeId AS VARCHAR(10)) ;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		SET @SQL = @SQL + ' AND F.ID = ' + CAST(@franchiseeId AS VARCHAR(10)) ;
		
	END 
	
	SET @SQL = @SQL + ' AND F.IsActive = ' + CAST(@isActive AS VARCHAR(5));
	
	
	--SET @SQL = '
	--SELECT 
	--F.ID,
	--F.LastName, 
	--F.FirstName,
	--F.LastCreatedDate,
	--F.Name,
	--F.WorkEmail, 
	--F.OfficePhone,
	--F.LastCreatedDate as LastUpdatedDate';
	--SET @SQL = @SQL + ' 
	--FROM TBL_Franchisee F
	--where (F.WorkEmail is null or Upper(F.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
	--and F.IsActive = 1';
	 
	-- Add condition is Search Text is Available
	If @searchText is not null and @searchText != ''
	BEGIN
	   SET @SQL = @SQL + ' AND (Upper(F.Name) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(F.LastName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(F.FirstName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(F.WorkEmail) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ')'
	END	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END
	
	PRINT @SQL
	--Casting to int is required in following select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount,
				Cast( ID as int) AS ID,
				LastName,
				FirstName,
				LastCreatedDate,
				Name,
				WorkEmail,
				OfficePhone,
				LastUpdatedDate';
	 
	SET @Q = @Q + '	 FROM CTE_pageResult';

	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END



GO


