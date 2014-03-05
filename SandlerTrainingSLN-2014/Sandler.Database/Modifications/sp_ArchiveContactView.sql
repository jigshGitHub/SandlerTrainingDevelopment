IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ArchiveContactView]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ArchiveContactView]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--select * from tbl_contacts ct where ct.isactive=0
Create Procedure [dbo].[sp_ArchiveContactView](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 
	@coachId INT=null,
	@franchiseeId INT=null,
	@companyId INT=null,
	@userId VARCHAR(500)=null,
	@selectForExcel bit = 0,	
	@searchText VARCHAR(MAX)=null
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
	f.CoachID ';
	IF @selectForExcel = 1 
	BEGIN
		SET @SQL = @SQL + ',
		ct.DiscussionTopic,
		ct.ACTIONSTEP, 
		ct.Birthday,
		ct.Anniversary,
		ct.CompanyYears,
		ct.BossName,
		ct.LAST_CONTACT_DATE,
		ct.NEXT_CONTACT_DATE,
		ct.StartTime,
		apts.ApptSourceName, 
		cs.CourseName, 
		ct.CourseTrainingDate,
		ysn.Description as NewApptDesp,
		ysr.Description as IsRegisteredForTraining,
		ysre.Description as IsEmailSubscription,
		ysrc.Description as NeedCallBack,
		f.Name as FranchiseeName,
		rg.ID as RegionID,
		ct.Title, 
		ct.ContactsDepartment , 
		ct.ContactsRole ,
		ct.MobilePhone , 
		ct.HomePhone , 
		ct.Fax , 
		ct.PersonalEmail ,
		ct.Address , 
		ct.City , 
		ct.State , 
		ct.Zip , 
		ct.LastAttemptedDate, 
		ct.LastEmailedDate , 
		ct.LastMeetingDate , 
		ct.LetterSentDate, 
		ct.SpouseName, 
		ct.TrainingCourseName, 
		ct.HowManyAttended,
		ct.CompanyNameWhereTrainingConducted,
		uCreated.UserName as CreatedByUser  ';
	END
	SET @SQL = @SQL + ' 			
 	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID 
    left outer join dbo.aspnet_Users AS uCreated WITH (NOLOCK) ON CAST(uCreated.UserId AS VARCHAR(200)) = ct.CreatedBy
    where ct.IsActive = 0  ';

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
	If @searchText is not null and @searchText != ''
	BEGIN
	   SET @SQL = @SQL + ' AND (Upper(CT.LASTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 	
	   SET @SQL = @SQL + ' OR Upper(CT.FIRSTNAME) like ''' + '%' + Upper(@searchText)  + '%' + '''' 
	   SET @SQL = @SQL + ')'
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
				RegionName ';
	IF @selectForExcel = 1 
	BEGIN
		SET @Q = @Q + ',
		DiscussionTopic,
		ACTIONSTEP, 
		Birthday,
		Anniversary,
		CompanyYears,
		BossName,
		LAST_CONTACT_DATE,
		NEXT_CONTACT_DATE,
		StartTime,
		ApptSourceName, 
		CourseName, 
		CourseTrainingDate,
		NewApptDesp,
		IsRegisteredForTraining,
		IsEmailSubscription,
		NeedCallBack,
		FranchiseeName,
		RegionID,
		Title, 
		ContactsDepartment , 
		ContactsRole ,
		MobilePhone , 
		HomePhone , 
		Fax , 
		PersonalEmail ,
		Address , 
		City , 
		State , 
		Zip , 
		LastAttemptedDate, 
		LastEmailedDate , 
		LastMeetingDate , 
		LetterSentDate, 
		SpouseName, 
		TrainingCourseName, 
		HowManyAttended,
		CompanyNameWhereTrainingConducted,
		CreatedByUser  ';
	END
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END

