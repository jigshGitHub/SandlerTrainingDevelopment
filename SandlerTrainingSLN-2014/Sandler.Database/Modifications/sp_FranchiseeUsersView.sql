/****** Object:  StoredProcedure [dbo].[spName]    Script Date: 05/28/2013 22:44:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_FranchiseeUsersView]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[sp_FranchiseeUsersView]
GO

/****** Object:  StoredProcedure [dbo].[sp_FranchiseeUsersView]    Script Date: 10/16/2014 10:43:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/*
exec [sp_FranchiseeUsersView]'E74F9020-ED15-4CA2-9991-C270397CD322','ID ASc' -- Coach
exec [sp_FranchiseeUsersView]'47E694CC-53FA-4BE7-8EC9-726F7B61C0E7','ID ASc' -- FranchiseeOwner
exec [sp_FranchiseeUsersView]'EC1F32FE-0914-427B-900A-3A4C1302B130','ID ASc' -- FranchiseeUser
exec [sp_FranchiseeUsersView]'EC1F32FE-0914-427B-900A-3A4C1302B130','ID ASc', @searchText = 'User1' -- FranchiseeUser
exec [sp_FranchiseeUsersView] @userId='98428801-3032-4ef3-8ff4-4588f7876ece', @orderBy='LastName ASC', @pageSize=0, @pageNo=0, @searchText=''

*/
CREATE Procedure [dbo].[sp_FranchiseeUsersView]
	@userId UniqueIdentifier,
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT = 0,    
	@pageNo INT = 0,
	@searchText VARCHAR(MAX)=null
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
		FROM [vw_FranchiseeUsers]
		WHERE 1=1';
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		SET @SQL = 'Select vw.*  
		FROM [vw_FranchiseeUsers] vw		
		INNER JOIN TBL_FRANCHISEE f ON f.ID = vw.FranchiseeID
		INNER JOIN TBL_COACH ch ON f.CoachID = ch.ID
		WHERE ch.UserID = ''' + CAST(@userId AS VARCHAR(100)) + '''';
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client' OR @RoleName = 'FranchiseeUser')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		SET @SQL = 'Select vw.*  
		FROM [vw_FranchiseeUsers] vw		
		WHERE vw.FranchiseeID =' + CAST(@franchiseeId AS VARCHAR(10)); 
	END		
	
	If @searchText is not null and @searchText != ''
	BEGIN
	   SET @SQL = @SQL + ' AND ( Upper(vw.FirstName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.LastName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(vw.FranchiseName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ')'
	END	
	
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount
				,UserId
				,UserName
				,FirstName
				,LastName
				,FranchiseeID
				,ID
				,FranchiseeName
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


