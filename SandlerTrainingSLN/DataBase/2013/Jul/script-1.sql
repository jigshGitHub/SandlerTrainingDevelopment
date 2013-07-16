/****** Object:  StoredProcedure [dbo].[sp_ArchiveCompanyRecord]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ArchiveCompanyRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ArchiveCompanyRecord]
GO

/****** Object:  StoredProcedure [dbo].[sp_ArchiveContactRecord]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ArchiveContactRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ArchiveContactRecord]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedCompanies]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedCompanies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedCompanies]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedCompaniesByCoachId]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedCompaniesByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedCompaniesByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedCompaniesByFrId]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedCompaniesByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedCompaniesByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContacts]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedContacts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByCoachID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedContactsByCoachID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedContactsByCoachID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByCompID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedContactsByCompID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedContactsByCompID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByFrID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedContactsByFrID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedContactsByFrID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByUserID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedContactsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedContactsByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsForCompByUserID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedContactsForCompByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedContactsForCompByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompanies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompanies]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContacts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCompID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCompID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsForCompByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDL]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesForDDL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesForDDL]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByCoachId]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesForDDLByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesForDDLByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByFrId]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesForDDLByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesForDDLByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_UnArchiveCompanyRecord]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UnArchiveCompanyRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UnArchiveCompanyRecord]
GO

/****** Object:  StoredProcedure [dbo].[sp_UnArchiveContactRecord]    Script Date: 07/15/2013 10:04:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UnArchiveContactRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UnArchiveContactRecord]
GO


/****** Object:  StoredProcedure [dbo].[sp_ArchiveCompanyRecord]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_ArchiveCompanyRecord]
	(	
		
		@COMPANIESID int,
		@CurrentUserId varchar(150)
		
	 )
AS
	-- We need to Archive Pipeline,Contacts and Company records
	Update TBL_OPPORTUNITIES Set IsActive = 0, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where COMPANYID = @COMPANIESID
	Update TBL_CONTACTS Set IsActive = 0, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where COMPANYID = @COMPANIESID
	Update TBL_COMPANIES Set IsActive = 0, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where COMPANIESID = @COMPANIESID
	/* SET NOCOUNT ON */
	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_ArchiveContactRecord]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_ArchiveContactRecord]
	(	
		
		@ContactId int,
		@CurrentUserId varchar(150)
		
	 )
AS
	-- We need to Archive Pipeline,Contacts and Company records
	Update TBL_OPPORTUNITIES Set IsActive = 0, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where ContactId = @ContactId
	Update TBL_CONTACTS Set IsActive = 0, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where ContactsId = @ContactId
	/* SET NOCOUNT ON */
	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedCompanies]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetAllArchivedCompanies]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription  
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.IsActive = 0
	ORDER BY COMPANYNAME
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedCompaniesByCoachId]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetAllArchivedCompaniesByCoachId]
	
	(
		@CoachId int
	)
	
AS
		
	SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy,
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName,  
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	and cp.IsActive = 0
	ORDER BY COMPANYNAME
	
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedCompaniesByFrId]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllArchivedCompaniesByFrId]
	
	(
		@FranchiseeId int
	)
	
AS
		
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy,
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName, 
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress   
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId = @FranchiseeId and cp.IsActive = 0
	ORDER BY COMPANYNAME
	
	
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContacts]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetAllArchivedContacts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted  
 	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID 
    where ct.IsActive = 0  
	Order by cp.COMPANYNAME
	
	
	/* SET NOCOUNT ON */
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByCoachID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetAllArchivedContactsByCoachID]
	
	(
	@CoachID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
    ct.HowManyAttended,
    ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where ct.companyid in (Select CompaniesId from tbl_Companies 
	where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	and ct.IsActive = 0
	Order by cp.COMPANYNAME
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByCompID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create  PROCEDURE [dbo].[sp_GetAllArchivedContactsByCompID]
	
	(
	@CompanyID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where ct.companyid = @CompanyID and ct.IsActive = 0
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByFrID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create  PROCEDURE [dbo].[sp_GetAllArchivedContactsByFrID]
	
	(
	@FranchiseeID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment,ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where ct.IsActive = 0 and ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsByUserID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetAllArchivedContactsByUserID]
	
	(
	@UserID varchar(50)
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where Upper(ct.CreatedBy) = Upper(@UserID)
	and ct.IsActive = 0
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedContactsForCompByUserID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_GetAllArchivedContactsForCompByUserID]
	
	(
	@UserID varchar(50),
	@CompanyID int
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where Upper(ct.CreatedBy) = Upper(@UserID) and ct.COMPANYID = @CompanyID
	and ct.IsActive = 0
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllCompanies]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription  
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.IsActive = 1
	ORDER BY COMPANYNAME
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
	
	(
		@CoachId int
	)
	
AS
		
	SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy,
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName,  
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	and cp.IsActive = 1
	ORDER BY COMPANYNAME
	
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
	
	(
		@CoachId varchar(50),
		@CompanyName varchar(150),
		@CompanyOwnership varchar(50), 
		@CompanyDescription varchar(50),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@IsSameBillingAdrsList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@Country varchar(50),
		@BillingAddress varchar(150),
		@BillingCity varchar(50), 
		@BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Website varchar(80),
		@EmpQuantity varchar(50),
		@Notes varchar(200),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
	)
	
AS

    if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
    
    DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy,
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress    
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.IsActive = 1 and cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = (' + @CoachId + '))'  + ' AND ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + '%' + @CompanyName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Ownership
	if @CompanyOwnership is not null and @CompanyOwnership != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyDescription like ''' + '%' + @CompanyDescription  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + '%' + @RepLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + '%' + @RepFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Emp Quantity
	if @EmpQuantity is not null and @EmpQuantity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.EmpQuantity = (' + @EmpQuantity + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsSameBillingAddress ?
	if @IsSameBillingAdrsList is not null and @IsSameBillingAdrsList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsSameBillingAddress in (' + @IsSameBillingAdrsList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Address
	if @BillingAddress is not null and @BillingAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingAddress like ''' + '%' + @BillingAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Zip
	if @BillingZip is not null and @BillingZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingZip like ''' + '%' + @BillingZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing City
	if @BillingCity is not null and @BillingCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCity like ''' + '%' + @BillingCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing State
	if @BillingState is not null and @BillingState != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingState like ''' + '%' + @BillingState  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Country
	if @BillingCountry is not null and @BillingCountry != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCountry like ''' + '%' + @BillingCountry  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + '%' + @POCLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + '%' + @POCFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + '%' + @POCPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Department
	if @POCDepartment is not null and @POCDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCDepartment like ''' + '%' + @POCDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Email
	if @POCEmail is not null and @POCEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCEmail like ''' + '%' + @POCEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Fax
	if @POCFax is not null and @POCFax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFax like ''' + '%' + @POCFax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant LastName
	if @AssistantLastName is not null and @AssistantLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantLastName like ''' + '%' + @AssistantLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant FirstName
	if @AssistantFirstName is not null and @AssistantFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantFirstName like ''' + '%' + @AssistantFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant Phone
	if @AssistantPhone is not null and @AssistantPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantPhone like ''' + '%' + @AssistantPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Website
	if @Website is not null and @Website != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Website like ''' + '%' + @Website  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN 
    
		
	/*SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp 
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
		
	RETURN*/





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
	
	(
		@FranchiseeId int
	)
	
AS
		
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy,
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName, 
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress   
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId = @FranchiseeId and cp.IsActive = 1
	ORDER BY COMPANYNAME
	
	
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
	
	(
		@FranchiseeId varchar(50),
		@CompanyName varchar(150),
		@CompanyOwnership varchar(50), 
		@CompanyDescription varchar(50),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@IsSameBillingAdrsList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@Country varchar(50),
		@BillingAddress varchar(150),
		@BillingCity varchar(50), 
		@BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Website varchar(80),
		@EmpQuantity varchar(50),
		@Notes varchar(200),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
	
	DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy,
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress   
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.IsActive = 1 and ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + '%' + @CompanyName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Ownership
	if @CompanyOwnership is not null and @CompanyOwnership != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyDescription like ''' + '%' + @CompanyDescription  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + '%' + @RepLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + '%' + @RepFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Emp Quantity
	if @EmpQuantity is not null and @EmpQuantity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.EmpQuantity = (' + @EmpQuantity + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsSameBillingAddress ?
	if @IsSameBillingAdrsList is not null and @IsSameBillingAdrsList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsSameBillingAddress in (' + @IsSameBillingAdrsList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Address
	if @BillingAddress is not null and @BillingAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingAddress like ''' + '%' + @BillingAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Zip
	if @BillingZip is not null and @BillingZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingZip like ''' + '%' + @BillingZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing City
	if @BillingCity is not null and @BillingCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCity like ''' + '%' + @BillingCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing State
	if @BillingState is not null and @BillingState != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingState like ''' + '%' + @BillingState  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Country
	if @BillingCountry is not null and @BillingCountry != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCountry like ''' + '%' + @BillingCountry  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End

	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + '%' + @POCLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + '%' + @POCFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + '%' + @POCPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Department
	if @POCDepartment is not null and @POCDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCDepartment like ''' + '%' + @POCDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Email
	if @POCEmail is not null and @POCEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCEmail like ''' + '%' + @POCEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Fax
	if @POCFax is not null and @POCFax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFax like ''' + '%' + @POCFax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant LastName
	if @AssistantLastName is not null and @AssistantLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantLastName like ''' + '%' + @AssistantLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant FirstName
	if @AssistantFirstName is not null and @AssistantFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantFirstName like ''' + '%' + @AssistantFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant Phone
	if @AssistantPhone is not null and @AssistantPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantPhone like ''' + '%' + @AssistantPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Website
	if @Website is not null and @Website != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Website like ''' + '%' + @Website  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End

	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	
	SET @SQLString = @SQLString + ' AND cp.FranchiseeId =' + @FranchiseeId ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/*SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany  
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	
	
	
	RETURN
	*/





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
	
	(
		@CompanyName varchar(150),
		@CompanyOwnership varchar(50), 
		@CompanyDescription varchar(50),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@IsSameBillingAdrsList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@Country varchar(50),
		@BillingAddress varchar(150),
		@BillingCity varchar(50), 
		@BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Website varchar(80),
		@EmpQuantity varchar(50),
		@Notes varchar(200),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
				
	)
	
AS
	
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
	
	DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, cp.CreatedBy,
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,cp.StartTime,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,
	ynb.Description as BillingDescription
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress  
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.IsActive = 1 and ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + '%' + @CompanyName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Ownership
	if @CompanyOwnership is not null and @CompanyOwnership != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyDescription like ''' + '%' + @CompanyDescription  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + '%' + @RepLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + '%' + @RepFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Emp Quantity
	if @EmpQuantity is not null and @EmpQuantity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.EmpQuantity = (' + @EmpQuantity + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsSameBillingAddress ?
	if @IsSameBillingAdrsList is not null and @IsSameBillingAdrsList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsSameBillingAddress in (' + @IsSameBillingAdrsList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Address
	if @BillingAddress is not null and @BillingAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingAddress like ''' + '%' + @BillingAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Zip
	if @BillingZip is not null and @BillingZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingZip like ''' + '%' + @BillingZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing City
	if @BillingCity is not null and @BillingCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCity like ''' + '%' + @BillingCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing State
	if @BillingState is not null and @BillingState != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingState like ''' + '%' + @BillingState  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Country
	if @BillingCountry is not null and @BillingCountry != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCountry like ''' + '%' + @BillingCountry  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + '%' + @POCLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + '%' + @POCFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + '%' + @POCPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Department
	if @POCDepartment is not null and @POCDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCDepartment like ''' + '%' + @POCDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Email
	if @POCEmail is not null and @POCEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCEmail like ''' + '%' + @POCEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Fax
	if @POCFax is not null and @POCFax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFax like ''' + '%' + @POCFax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant LastName
	if @AssistantLastName is not null and @AssistantLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantLastName like ''' + '%' + @AssistantLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant FirstName
	if @AssistantFirstName is not null and @AssistantFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantFirstName like ''' + '%' + @AssistantFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant Phone
	if @AssistantPhone is not null and @AssistantPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantPhone like ''' + '%' + @AssistantPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Website
	if @Website is not null and @Website != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Website like ''' + '%' + @Website  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	
	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/* Testing Code */

/*
    DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	
	Declare @CompanyName varchar(50);
	Declare @RepLastName varchar(50);
	Declare @RepFirstName varchar(50);
	Declare @POCLastName varchar(50);
	Declare @POCFirstName varchar(50);
	Declare @City varchar(50);
	Declare @State varchar(50);
	Declare @Zip varchar(50);
	Declare @IndustryIdList varchar(50);
	Declare @TotalCompValue varchar(50);
	Declare @IsNewCompanyIdList varchar(50);
	Declare @Address varchar(50);
	Declare @POCPhone varchar(50);
	Declare @DiscussionTopic varchar(50);
	Declare @ActionStep varchar(50);
	Declare @LastContactDate datetime;
	
	Set @CompanyName = null;
	Set @RepLastName = null;
	Set @RepFirstName = null;
	Set @POCLastName = null;
	Set @POCFirstName = null;
	Set @City = null;
	Set @State = null;
	Set @Zip = null;
	Set @IndustryIdList = '5,3';
	Set @TotalCompValue = '1234';
	Set @IsNewCompanyIdList = null;
	Set @Address = null;
	Set @POCPhone = null;
	Set @DiscussionTopic = null;
	Set @ActionStep = null;
	Set @LastContactDate = '8/12/2012';
	
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + @CompanyName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + @RepLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + @RepFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + @Address  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + @Zip  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + @City  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + @State  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + @POCLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + @POCFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + @POCPhone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    Print @SQLString
    --EXEC(@SQLString);
	
		
	
	RETURN
	*/



GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContacts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted  
 	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID 
    where ct.IsActive = 1  
	Order by cp.COMPANYNAME
	
	
	/* SET NOCOUNT ON */
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
	
	(
	@CoachID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
    ct.HowManyAttended,
    ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where ct.companyid in (Select CompaniesId from tbl_Companies 
	where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	and ct.IsActive = 1
	Order by cp.COMPANYNAME
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
	
	(
	    @CoachID varchar(50), 
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
	 End
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted        
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId   
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.IsActive = 1 and 
	ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = (' + @CoachId + ')))'  + ' AND ('
	
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
		
	
	RETURN
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	Order by cp.COMPANYNAME
	*/
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE  PROCEDURE [dbo].[sp_GetAllContactsByCompID]
	
	(
	@CompanyID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where ct.companyid = @CompanyID and ct.IsActive = 1
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrID]
	
	(
	@FranchiseeID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment,ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where ct.IsActive = 1 and ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
	
	(
	    @FranchiseeID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
	)
	
AS
	
	
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
	 End
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted            
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.IsActive = 1 and ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = (' + @FranchiseeID + '))'  + ' AND ('
	
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	*/
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByUserID]
	
	(
	@UserID varchar(50)
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where Upper(ct.CreatedBy) = Upper(@UserID)
	and ct.IsActive = 1
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE  PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
	
	(
	    @UserID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
	 End
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted             
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.IsActive = 1 and ('
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	
	SET @SQLString = @SQLString + ' AND ct.CreatedBy =' + @UserID ;
	
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where Upper(ct.CreatedBy) = Upper(@UserID)
	Order by cp.COMPANYNAME
	*/
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
	
	(
	@UserID varchar(50),
	@CompanyID int
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,ct.CreatedBy,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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
	where Upper(ct.CreatedBy) = Upper(@UserID) and ct.COMPANYID = @CompanyID
	and ct.IsActive = 1
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllContactsSearch]
	
	(
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
			
	)
	
AS
		
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
	 End
	 
	 
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.IsActive = 1 and ('
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/*Select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack    
	Order by cp.COMPANYNAME*/
	
	
	/* SET NOCOUNT ON */
	





GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDL]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetCompaniesForDDL]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME
	FROM TBL_COMPANIES cp
	where cp.IsActive = 1
	ORDER BY COMPANYNAME
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByCoachId]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetCompaniesForDDLByCoachId]
	
	(
		@CoachId int
	)
	
AS
		
	SELECT cp.COMPANIESID,cp.COMPANYNAME
	FROM TBL_COMPANIES cp 
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId)
	and cp.IsActive = 1 
	ORDER BY COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByFrId]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetCompaniesForDDLByFrId]
	
	(
		@FranchiseeId int
	)
	
AS
		
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME
	FROM TBL_COMPANIES cp
	where cp.FranchiseeId = @FranchiseeId 
	and cp.IsActive = 1 
	ORDER BY COMPANYNAME
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_UnArchiveCompanyRecord]    Script Date: 07/15/2013 10:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_UnArchiveCompanyRecord]
	(	
		
		@COMPANIESID int,
		@CurrentUserId varchar(150)
		
	 )
AS
	-- We need to UnArchive Pipeline,Contacts and Company records
	Update TBL_OPPORTUNITIES Set IsActive = 1, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where COMPANYID = @COMPANIESID
	Update TBL_CONTACTS Set IsActive = 1, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where COMPANYID = @COMPANIESID
	Update TBL_COMPANIES Set IsActive = 1, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where COMPANIESID = @COMPANIESID
	/* SET NOCOUNT ON */
	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_UnArchiveContactRecord]    Script Date: 07/15/2013 10:04:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_UnArchiveContactRecord]
	(	
		
		@ContactId int,
		@CurrentUserId varchar(150)
		
	 )
AS
	-- We need to UnArchive Pipeline,Contacts and Company records
	Update TBL_OPPORTUNITIES Set IsActive = 1, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where ContactId = @ContactId
	Update TBL_CONTACTS Set IsActive = 1, UpdatedBy = @CurrentUserId, UpdatedDate = GETDATE() where ContactsId  = @ContactId
	
	/* SET NOCOUNT ON */
	RETURN







GO


