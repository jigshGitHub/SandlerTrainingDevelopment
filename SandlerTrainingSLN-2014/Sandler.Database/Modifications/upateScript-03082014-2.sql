/****** Object:  StoredProcedure [dbo].[sp_AdvancedSearch]    Script Date: 03/07/2014 21:31:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdvancedSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdvancedSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_ArchiveFranchiseeView]    Script Date: 03/07/2014 21:31:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ArchiveFranchiseeView]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ArchiveFranchiseeView]
GO




/****** Object:  StoredProcedure [dbo].[sp_AdvancedSearch]    Script Date: 03/07/2014 21:31:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--exec [sp_AdvancedSearch] @orderBy='COMPANYNAME ASC' ,@pageSize=0,@pageNo=0,@searchText='Holloway',@searchRecordType='Contact'

Create Procedure [dbo].[sp_AdvancedSearch](
	@userId VARCHAR(50)=null,
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@coachId INT=null,
	@franchiseeId INT=null,
	@companyId INT=null,	
	@searchText VARCHAR(MAX)=null,
	@searchRecordType VARCHAR(50)
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@SQLCompWhere VARCHAR(MAX)='',
	@SQLContWhere VARCHAR(MAX)='',
	@SQLOppWhere VARCHAR(MAX)='',
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		

	If(@searchRecordType = 'All')
	Begin
		set @searchRecordType = null
	End
	     
	If @coachId IS NOT NULL
	BEGIN
		SET @SQLCompWhere = ' AND Comp.CoachID = ' + CAST(@coachId AS VARCHAR(10));
		SET @SQLContWhere = ' AND Cont.CoachID = ' + CAST(@coachId AS VARCHAR(10)); 
		SET @SQLOppWhere = ' AND Opp.CoachID = ' + CAST(@coachId AS VARCHAR(10));
	END
		
	If @franchiseeId IS NOT NULL
	BEGIN
		SET @SQLCompWhere = @SQLCompWhere + ' AND Comp.FranchiseeId = ' + CAST(@franchiseeId AS VARCHAR(10));
		SET @SQLContWhere = @SQLContWhere + ' AND Cont.FranchiseeId = ' + CAST(@franchiseeId AS VARCHAR(10));
		SET @SQLOppWhere = @SQLOppWhere + ' AND Opp.FranchiseeId = ' + CAST(@franchiseeId AS VARCHAR(10));
	END	
	
	If @companyId IS NOT NULL
	BEGIN
		SET @SQLCompWhere = @SQLCompWhere + ' AND Comp.companyid = ' + CAST(@companyId AS VARCHAR(10));
		SET @SQLContWhere = @SQLContWhere + ' AND Cont.companyid = ' + CAST(@companyId AS VARCHAR(10));
		SET @SQLOppWhere = @SQLOppWhere + ' AND Opp.companyid = ' + CAST(@companyId AS VARCHAR(10));
	END
	
	If (@userId IS NOT NULL AND @userId != '')
	BEGIN
		SET @SQLCompWhere = @SQLCompWhere + ' AND Comp.CreatedBy = ''' + @userId + '''';
		SET @SQLContWhere = @SQLContWhere + ' AND Cont.CreatedBy = ''' + @userId + '''';
		SET @SQLOppWhere = @SQLOppWhere + ' AND Opp.CreatedBy = ''' + @userId + '''';
	END	 

	If (@searchText IS NOT NULL  AND @searchText != '')
	BEGIN		
		
	SET @SQLContWhere = @SQLContWhere + ' AND (Upper(Cont.LASTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 	
	   SET @SQLContWhere = @SQLContWhere + ' OR Upper(Cont.FIRSTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLContWhere = @SQLContWhere + ')'

	 SET @SQLCompWhere = @SQLCompWhere + ' AND (Upper(Comp.COMPANYNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLCompWhere = @SQLCompWhere + ' OR Upper(Comp.CITY) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLCompWhere = @SQLCompWhere + ' OR Upper(Comp.RepLastName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLCompWhere = @SQLCompWhere + ' OR Upper(Comp.RepFirstName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLCompWhere = @SQLCompWhere + ')'	
	
	   SET @SQLOppWhere = @SQLOppWhere + ' AND (Upper(Opp.COMPANYNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ' OR Upper(Opp.Type) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ' OR Upper(Opp.Status) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ' OR Upper(Opp.Source) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ' OR Upper(Opp.NAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ' OR Upper(Opp.SALESREPLASTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ' OR Upper(Opp.SALESREPFIRSTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ' OR Upper(Opp.ProductTypeName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQLOppWhere = @SQLOppWhere + ')'
	
	END

	SET @SQL = 'select ''Company'' as RecordType,Comp.COMPANIESID as RecordId,
				Comp.COMPANYNAME,Comp.FranchiseeName,
				ISNULL((ISNULL(Comp.RepLastName,'''')+'', '' +ISNULL(Comp.RepFirstName,'''')),'''') POCName,				
				'''' as OppName from vw_companies Comp
				where Comp.IsActive = 1 ' + @SQLCompWhere + '
				union
				select ''Contact'' as RecordType,Cont.CONTACTSID as RecordId,
				Cont.COMPANYNAME,Cont.FranchiseeName,
				ISNULL((ISNULL(Cont.LASTNAME,'''')+'', ''  +ISNULL(Cont.FIRSTNAME,'''')),'''') POCName,
				 '''' as OppName from vw_Contacts Cont
				where Cont.IsActive = 1 ' + @SQLContWhere + '
				union
				select ''Opportunity'' as RecordType,Opp.ID as RecordId,Opp.COMPANYNAME,
				Opp.FranchiseeName,
				ISNULL((ISNULL(Opp.SALESREPLASTNAME,'''')+'', ''  +ISNULL(Opp.SALESREPFIRSTNAME,'''')),'''') POCName,
				Opp.Name as OppName
				from
				vw_Opportunities Opp
				where Opp.IsActive = 1 ' + @SQLOppWhere ;
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount,
				RecordType, RecordId,
				COMPANYNAME,FranchiseeName,POCName, OppName';
	SET @Q = @Q + '	 FROM CTE_pageResult';
	--select @searchRecordType,@pageTop
	IF (@searchRecordType IS NOT NULL And @pageTop is null)
	BEGIN
		SET @Q = @Q + ' WHERE recordtype= ''' + @searchRecordType + '''';
	END	 
	IF (@searchRecordType IS NOT NULL And @pageTop > 0)
	BEGIN 
		SET @Q = @Q + ' WHERE recordtype= ''' + @searchRecordType + '''';
		SET @Q = @Q + ' AND RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	IF (@searchRecordType IS NULL And @pageTop > 0)
	SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_ArchiveFranchiseeView]    Script Date: 03/07/2014 21:31:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_ArchiveFranchiseeView](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@searchText VARCHAR(MAX)=null,-- This is SearchText entered by the User
	@selectForExcel bit = 0 -- for Excel Export
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     

	SET @SQL = '
	SELECT 
	F.ID,
	F.LastName, 
	F.FirstName,
	F.LastCreatedDate,
	F.Name,
	F.WorkEmail, 
	F.OfficePhone,
	F.LastCreatedDate as LastUpdatedDate';
	SET @SQL = @SQL + ' 
	FROM TBL_Franchisee F
	where (F.WorkEmail is null or Upper(F.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
	and F.IsActive = 0';
	 
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




