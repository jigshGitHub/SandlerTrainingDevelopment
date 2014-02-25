/****** Object:  StoredProcedure [dbo].[sp_ContactView]    Script Date: 02/11/2014 23:37:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ContactView]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ContactView]
GO

/****** Object:  StoredProcedure [dbo].[sp_ContactView]    Script Date: 02/11/2014 23:37:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--exec [sp_ContactView] @orderBy='LASTNAME ASC', @pageSize=0,@pageNo=0,@userId = '98428801-3032-4ef3-8ff4-4588f7876ece'
Create Procedure [dbo].[sp_ContactView](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@coachId INT=null,
	@franchiseeId INT=null,
	@companyId INT=null,
	@userId VARCHAR(500)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     


	SET @SQL = 'select 
	ct.LastName,
	ct.FirstName,
	ct.lastname + '', '' + ct.FirstName as FullName, 
	ct.Phone,
	ct.ReferredBy , 
	ct.Notes , 
	ct.Country, 
	ct.CreatedBy,
	ct.Email, 
	ct.CompanyId,
	cp.COMPANYNAME,
	rg.Name as RegionName,
	ct.ContactsId ,
	cp.FranchiseeId,
	f.CoachID
	from tbl_contacts ct 
    left join tbl_companies cp on ct.companyid = cp.COMPANIESID
    left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId    
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
    where ct.IsActive = 1  ';

	If @coachId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.CoachID = ' + CAST(@coachId AS VARCHAR(10));
	END
		
	If @franchiseeId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND f.ID = ' + CAST(@franchiseeId AS VARCHAR(10));
	END	
	
	If @companyId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND ct.companyid = ' + CAST(@companyId AS VARCHAR(10));
	END
	
	If @userId IS NOT NULL
	BEGIN
		SET @SQL = @SQL + ' AND ct.CreatedBy = ''' + @userId + '''';
	END	 
	  
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
				LastName,
				FirstName,
				FullName, 
				Phone,
				ReferredBy , 
				Notes , 
				Country, 
				CreatedBy,
				Email, 
				COMPANYNAME,
				RegionName,
				Cast( CompanyId as int) as CompanyId,
				Cast( ContactsId as int) as ContactsId,
				Cast( CoachID as int) as CoachID,
				Cast( FranchiseeId as int) as FranchiseeId,
				RegionName
			 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END

