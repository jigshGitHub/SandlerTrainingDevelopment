/****** Object:  StoredProcedure [dbo].[sp_CompanyView]    Script Date: 02/11/2014 23:37:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CompanyView]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CompanyView]
GO

/****** Object:  StoredProcedure [dbo].[sp_CompanyView]    Script Date: 02/11/2014 23:37:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[sp_CompanyView](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@coachId INT=null,
	@franchiseeId INT=null,
	@searchText VARCHAR(MAX)=null,
	@selectForExcel bit = 0 -- This is SearchText entered by the User
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     


	SET @SQL = '
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	p.ProductTypeName,
	i.IndustryTypeName,
	cp.RepLastName + '','' + cp.RepFirstName as Representative, 
	cp.RepLastName,
	cp.RepFirstName,
	p.Id as ProductId,
	i.IndId as IndustryId,
	cp.Address,	
	cp.Zip, 
	cp.CreatedBy, 
	cp.CITY,
	cp.STATE,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	f.CoachID,
	f.ID as FranchiseeId,
	rg.ID AS RegionID,
	rg.Name as RegionName';
	IF (@selectForExcel = 1)
	BEGIN
		SET @SQL = @SQL + ',
		f.Name as FranchiseeName ,
		yno.Description as NewCompanyDesp,
		cp.POCLastName+'', ''+ cp.POCFirstName as POCFullName,
		cp.POCPhone,
		cp.DiscussionTopic,
		cp.ActionStep,
		cp.LASTCONTACT_DATE,
		cp.NEXTCONTACT_DATE,
		cp.CreationDate,
		cp.Country,
		cp.BillingAddress,
		cp.BillingState,
		cp.BillingZip,
		cp.BillingCity,
		cp.BillingCountry,
		cp.CompanyOwnership,
		cp.CompanyDescription,
		cp.POCDepartment,
		cp.POCEmail,
		cp.POCFax,
		cp.AssistantLastName,
		cp.AssistantFirstName,
		cp.AssistantPhone,
		cp.Website,
		cp.EmpQuantity,
		cp.Notes,
		cp.StartTime,
		ynb.Description as BillingDescription  '
	END
	SET @SQL = @SQL + ' 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.IsActive = 1 ';

	If @coachId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.CoachID = ' + CAST(@coachId AS VARCHAR(10));
	END
		
	If @franchiseeId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.ID = ' + CAST(@franchiseeId AS VARCHAR(10));
	END	 
	-- Add condition is Search Text is Available
	If @searchText is not null and @searchText != ''
	BEGIN
	   SET @SQL = @SQL + ' AND (Upper(cp.COMPANYNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(cp.CITY) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(cp.RepLastName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ' OR Upper(cp.RepFirstName) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
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
				Cast( COMPANIESID as int) AS COMPANIESID,
				COMPANYNAME,
				ProductTypeName,
				IndustryTypeName,
				RepLastName,
				RepFirstName,
				Representative,
				Cast( ProductId as int) as ProductId,
				Cast( IndustryId as int) as IndustryId,
				Address,Zip,CreatedBy, 
				CITY,STATE,
				Cast( TotalCompanyValue as int) as TotalCompanyValue,
				Cast( CoachID as int) as CoachID,
				Cast( FranchiseeId as int) as FranchiseeId,
				RegionID,
				RegionName ';
	IF (@selectForExcel = 1)
	BEGIN
		SET @Q = @Q + ',
		FranchiseeName ,
		NewCompanyDesp,
		POCFullName,
		POCPhone,
		DiscussionTopic,
		ActionStep,
		LASTCONTACT_DATE,
		NEXTCONTACT_DATE,
		CreationDate,
		Country,
		BillingAddress,
		BillingState,
		BillingZip,
		BillingCity,
		BillingCountry,
		CompanyOwnership,
		CompanyDescription,
		POCDepartment,
		POCEmail,
		POCFax,
		AssistantLastName,
		AssistantFirstName,
		AssistantPhone,
		Website,
		EmpQuantity,
		Notes,
		StartTime,
		BillingDescription ';
	END 
	SET @Q = @Q + '	 FROM CTE_pageResult';

	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END

