/*
Executed in 139 10/25 11:07PM
*/
USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 10/25/2012 21:23:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllEvents]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetBlastEmailGroupsByRole]    Script Date: 10/25/2012 21:23:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBlastEmailGroupsByRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBlastEmailGroupsByRole]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCallList]    Script Date: 10/25/2012 21:23:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCallList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCallList]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 10/25/2012 21:23:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetAllEvents]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int
 
	)

AS

		

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin')

	 Begin

		 -- full access to all companies and contacts

		 Select NextContact_date as Date, 'Contact due - '+ CompanyName as Description, POCPhone as Phone From TBL_Companies where NextContact_date is not null

	    Union

	    Select Next_Contact_date as Date, 'Contact due - ' + LastName+','+FirstName as Description, Phone as Phone from TBL_CONTACTS where Next_Contact_date is not null

	    Union

	    Select BirthDay as Date, 'Birthday - ' + LastName+','+FirstName as Description, Phone as Phone from TBL_CONTACTS where BirthDay is not null

	    Union

	    Select Anniversary as Date, 'Anniversary - ' + LastName+','+FirstName as Description, Phone as Phone from TBL_CONTACTS  where Anniversary is not null

	    Union

	    Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 
	   

	 End

    

    if (@Role = 'Coach')

	 Begin

		 -- full access to all companies and contacts within their region

		 Select c.NextContact_date as Date, 'Contact due - '+ c.CompanyName as Description, c.POCPhone as Phone From TBL_Companies c 

		 join TBL_FRANCHISEE f on c.FranchiseeId = f.ID   join TBL_COACH ch on f.CoachID = ch.ID  

		 where c.NextContact_date is not null and ch.RegionID = @RegionId

	    Union

	    Select ct.Next_Contact_date as Date, 'Contact due - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID 

	    where ct.Next_Contact_date is not null and ch.RegionID = @RegionId

	    Union

	    Select ct.BirthDay as Date, 'Birthday - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  

 	   where ct.BirthDay is not null and ch.RegionID = @RegionId

	    Union

	    Select ct.Anniversary as Date, 'Anniversary - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID   

 	   where ct.Anniversary is not null and ch.RegionID = @RegionId

	    Union

	    Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 

	 End




    if (@Role = 'FranchiseeOwner' or @Role = 'Client')

    Begin

        Select c.NextContact_date as Date, 'Contact due - '+ c.CompanyName as Description, c.POCPhone as Phone From TBL_Companies c 

		 join TBL_FRANCHISEE f on c.FranchiseeId = f.ID where c.NextContact_date is not null and f.ID = @FranchiseeId

	    Union

	    Select ct.Next_Contact_date as Date, 'Contact due - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct
 
	   join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.Next_Contact_date is not null and f.ID = @FranchiseeId

	    Union

	    Select ct.BirthDay as Date, 'Birthday - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.BirthDay is not null and f.ID = @FranchiseeId

	    Union

	    Select ct.Anniversary as Date, 'Anniversary - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.Anniversary is not null and f.ID = @FranchiseeId

	    Union

	    Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 
    End




    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.Next_Contact_date as Date, 'Contact due - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    where ct.Next_Contact_date is not null and ct.CreatedBy = @UserId

	    Union
 
	   Select ct.BirthDay as Date, 'Birthday - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

 	   where ct.BirthDay is not null and ct.CreatedBy = @UserId

	    Union

	    Select ct.Anniversary as Date, 'Anniversary - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    where ct.Anniversary is not null and ct.CreatedBy = @UserId

	    Union

 	   Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 

    End

    

	 RETURN



GO

/****** Object:  StoredProcedure [dbo].[sp_GetBlastEmailGroupsByRole]    Script Date: 10/25/2012 21:23:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE  PROCEDURE [dbo].[sp_GetBlastEmailGroupsByRole]

	 (

	 @Role varchar(50)

	 )

AS

		

	 if @Role = 'FranchiseeUser'
 
	Begin

	     Select Id, ' ' + BlastGroupName as BlastGroupName From TBL_BlastEmailGroup where ForFrUser = 1 and IsActive = 1
 
	End

	 if @Role = 'FranchiseeOwner' or @Role = 'Client'

	 Begin
 
		Select Id, ' ' + BlastGroupName as BlastGroupName From TBL_BlastEmailGroup where ForFrOwner = 1 and IsActive = 1

	 End
 
	if @Role = 'Coach'

	 Begin

		 Select Id, ' ' + BlastGroupName as BlastGroupName From TBL_BlastEmailGroup where ForCoach = 1 and IsActive = 1

	 End

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin')

	 Begin

		 Select Id, ' ' + BlastGroupName as BlastGroupName From TBL_BlastEmailGroup where ForCorporate = 1 and IsActive = 1

	 End
 
    




	 RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetCallList]    Script Date: 10/25/2012 21:23:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE  PROCEDURE [dbo].[sp_GetCallList]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int
 
	)

AS

		

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin')

	 Begin

		 Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct 

		 join tbl_companies cp on ct.companyid = cp.COMPANIESID
 
		where ct.LAST_CONTACT_DATE is not null and

		 -- Last contact date is within 30 days period
 
		ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
	End

    

    if (@Role = 'Coach')

	 Begin

	    Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 join TBL_FRANCHISEE f on cp.FranchiseeId = f.ID  join TBL_COACH ch on f.CoachID = ch.ID

		 where ct.LAST_CONTACT_DATE is not null and ch.RegionID = @RegionId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
	End

    

    if (@Role = 'FranchiseeOwner' or @Role = 'Client')

    Begin

        Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 join TBL_FRANCHISEE f on cp.FranchiseeId = f.ID

		 where ct.LAST_CONTACT_DATE is not null and f.ID = @FranchiseeId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
    End

    

    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 where ct.LAST_CONTACT_DATE is not null and ct.CreatedBy = @UserId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME

    

    End

    

	 RETURN
 



GO


