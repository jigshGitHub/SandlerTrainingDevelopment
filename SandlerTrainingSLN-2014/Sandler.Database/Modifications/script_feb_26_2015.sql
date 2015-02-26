


CREATE Procedure [dbo].[sp_ArchiveAceMainView](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@coachId INT=null,
	@franchiseeId INT=null,
	@searchText VARCHAR(MAX)=null,
	@selectForExcel bit = 0, -- This is SearchText entered by the User
	@IsDateSearch bit = 0 -- This is SearchText entered by the User
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     


	SET @SQL = '
	SELECT 
	acm.AceId,
	acm.CampaignName,
	acm.EventDate,
	acm.MessageNumber,
	acm.MessageSubject,
	f.ID as FranchiseeId,
	(acm.TotalCountConfirm / acm.TotalCountOutBound) * 100 as ResponseRate,
	acm.MessageSentDate';
	IF (@selectForExcel = 1)
	BEGIN
		SET @SQL = @SQL + ',
		f.Name as FranchiseeName ,
		acm.CreatedDate,
		acm.CreatedBy,
        acm.UpdatedDate,
        acm.UpdatedBy  '
	END
	SET @SQL = @SQL + ' 
	FROM Tbl_AceMainInfo acm
	left join TBL_FRANCHISEE f on f.ID = acm.FranchiseeId
	left join TBL_COACH ch on ch.ID = f.CoachID
	where acm.IsActive = 0 ';

	If @coachId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.CoachID = ' + CAST(@coachId AS VARCHAR(10));
	END
		
	If @franchiseeId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.ID = ' + CAST(@franchiseeId AS VARCHAR(10));
	END	 
	-- Add condition is Search Text is Available
	If @searchText is not null and @searchText != '' and @IsDateSearch = 0
	BEGIN
	   SET @SQL = @SQL + ' AND (Upper(acm.CampaignName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(acm.MessageSubject) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ')'
	END	

	If @searchText is not null and @searchText != '' and @IsDateSearch = 1
	BEGIN
	   SET @SQL = @SQL + ' AND acm.EventDate =  ''' + @searchText  + '''' 
	END	


	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END
	
	--Casting to int is required in following select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount,
				Cast( AceId as int) AS AceId,
				CampaignName,
				Cast( FranchiseeId as int) as FranchiseeId,
				EventDate,
				Cast( ResponseRate as float) as ResponseRate, 
	            MessageNumber,
	            MessageSubject,
	            MessageSentDate';
	IF (@selectForExcel = 1)
	BEGIN
		SET @Q = @Q + ',
		FranchiseeName,
		CreatedDate,
		CreatedBy,
        UpdatedDate,
        UpdatedBy ';
	END 
	SET @Q = @Q + '	 FROM CTE_pageResult';

	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END



GO

/****** Object:  StoredProcedure [dbo].[sp_GetAceCallToActionTypeOptions]    Script Date: 2/26/2015 12:12:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_GetAceCallToActionTypeOptions]

	 

AS

	 SELECT * FROM Tbl_AceCallToActionType ORDER BY CallToActionText 

	 RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAceCampaignTypeOptions]    Script Date: 2/26/2015 12:12:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[sp_GetAceCampaignTypeOptions]

	 

AS

	 SELECT * FROM Tbl_AceCampaignType ORDER BY TypeDescription 

	 RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_AceMainView]    Script Date: 2/26/2015 12:12:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[sp_AceMainView](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@coachId INT=null,
	@franchiseeId INT=null,
	@searchText VARCHAR(MAX)=null,
	@selectForExcel bit = 0, -- This is SearchText entered by the User
	@IsDateSearch bit = 0 -- This is SearchText entered by the User
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     


	SET @SQL = '
	SELECT 
	acm.AceId,
	acm.CampaignName,
	acm.EventDate,
	acm.MessageNumber,
	acm.MessageSubject,
	f.ID as FranchiseeId,
	(acm.TotalCountConfirm / acm.TotalCountOutBound) * 100 as ResponseRate,
	acm.MessageSentDate';
	IF (@selectForExcel = 1)
	BEGIN
		SET @SQL = @SQL + ',
		f.Name as FranchiseeName ,
		acm.CreatedDate,
		acm.CreatedBy,
        acm.UpdatedDate,
        acm.UpdatedBy  '
	END
	SET @SQL = @SQL + ' 
	FROM Tbl_AceMainInfo acm
	left join TBL_FRANCHISEE f on f.ID = acm.FranchiseeId
	left join TBL_COACH ch on ch.ID = f.CoachID
	where acm.IsActive = 1 ';

	If @coachId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.CoachID = ' + CAST(@coachId AS VARCHAR(10));
	END
		
	If @franchiseeId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.ID = ' + CAST(@franchiseeId AS VARCHAR(10));
	END	 
	-- Add condition is Search Text is Available
	If @searchText is not null and @searchText != '' and @IsDateSearch = 0
	BEGIN
	   SET @SQL = @SQL + ' AND (Upper(acm.CampaignName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(acm.MessageSubject) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ')'
	END	

	If @searchText is not null and @searchText != '' and @IsDateSearch = 1
	BEGIN
	   SET @SQL = @SQL + ' AND acm.EventDate =  ''' + @searchText  + '''' 
	END	


	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END
	
	--Casting to int is required in following select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount,
				Cast( AceId as int) AS AceId,
				CampaignName,
				Cast( FranchiseeId as int) as FranchiseeId,
				EventDate,
				Cast( ResponseRate as float) as ResponseRate, 
	            MessageNumber,
	            MessageSubject,
	            MessageSentDate';
	IF (@selectForExcel = 1)
	BEGIN
		SET @Q = @Q + ',
		FranchiseeName,
		CreatedDate,
		CreatedBy,
        UpdatedDate,
        UpdatedBy ';
	END 
	SET @Q = @Q + '	 FROM CTE_pageResult';

	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END



GO


