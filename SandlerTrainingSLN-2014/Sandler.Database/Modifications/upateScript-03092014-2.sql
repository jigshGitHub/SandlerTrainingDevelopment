/****** Object:  StoredProcedure [dbo].[sp_GetAllTasksByDate]    Script Date: 03/09/2014 20:12:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllTasksByDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllTasksByDate]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllTasks]    Script Date: 03/09/2014 20:12:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllTasks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllTasks]
GO


/****** Object:  StoredProcedure [dbo].[sp_GetAllTasksByDate]    Script Date: 03/09/2014 20:12:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE  PROCEDURE [dbo].[sp_GetAllTasksByDate]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int,
	 
	 @SelDate datetime
 
	)

AS

	 -- CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101)) 
	 
	 
	 if (@Role = 'Corporate' or @Role = 'SiteAdmin' or @Role = 'HomeOfficeAdmin')

	 Begin

		 -- full access to all companies and contacts
		Select CompaniesId as UniqueID, StartTime,
		CONVERT(DATETIME,CONVERT(varchar(10),NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(NextContact_date) + 1,101)) AS NextDay,
		CompanyName as Description, IsNull(DiscussionTopic,'') as Topic,POCPhone as Phone From TBL_Companies 
		where NextContact_date is not null and DiscussionTopic is not null and DiscussionTopic != ''
		and CONVERT(DATETIME,CONVERT(varchar(10),NextContact_date,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
		

	    Union

	    Select ContactsId as UniqueID, StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(Next_Contact_date) + 1,101)) AS NextDay,
	    LastName+','+FirstName as Description, IsNull(DiscussionTopic,'') as Topic,Phone as Phone 
	    from TBL_CONTACTS where Next_Contact_date is not null
	    and DiscussionTopic is not null and DiscussionTopic != ''
	    and CONVERT(DATETIME,CONVERT(varchar(10),Next_Contact_date,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	    
	    Union

	    Select ContactsId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(BirthDay) + 1,101)) AS NextDay,
	    LastName+','+FirstName as Description, 
	    ('Birthday For ' + LastName+', '+ FirstName) as Topic,Phone as Phone 
	    from TBL_CONTACTS where BirthDay is not null
	    and CONVERT(DATETIME,CONVERT(varchar(10),BirthDay,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	        

	    Union

	    Select ContactsId as UniqueID, '' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(Anniversary) + 1,101)) AS NextDay,
	    LastName+','+FirstName as Description, 
	    ('Anniversary For ' + LastName+', '+ FirstName) as Topic,Phone as Phone
	    from TBL_CONTACTS  where Anniversary is not null
	    and CONVERT(DATETIME,CONVERT(varchar(10),Anniversary,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	    	    
	    Union

	    Select Id as UniqueID, StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, 
	    IsNull(Topic,'') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = @UserId 
	    and Topic is not null and Topic != ''
	    and CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	     	   

	 End

    

    if (@Role = 'Coach')

	 Begin

		 -- full access to all companies and contacts within their region

		Select c.CompaniesId as UniqueID,c.StartTime as StartTime,
		CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(c.NextContact_date) + 1,101)) AS NextDay,
		c.CompanyName as Description, 
		IsNull(c.DiscussionTopic,'') as Topic , c.POCPhone as Phone From TBL_Companies c 
		join TBL_FRANCHISEE f on c.FranchiseeId = f.ID   join TBL_COACH ch on f.CoachID = ch.ID  
		where c.NextContact_date is not null and ch.RegionID = @RegionId
		and c.DiscussionTopic is not null and c.DiscussionTopic != ''
		and CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
		

	    Union

	    Select ct.ContactsId as UniqueID, ct.StartTime as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    IsNull(ct.DiscussionTopic,'') as Topic, ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID 
	    where ct.Next_Contact_date is not null and ch.RegionID = @RegionId
	    and ct.DiscussionTopic is not null and ct.DiscussionTopic != ''
	    and CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	    
	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime, 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  
    	where ct.BirthDay is not null and ch.RegionID = @RegionId
    	and CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
    	    	

	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID   
    	where ct.Anniversary is not null and ch.RegionID = @RegionId
    	and CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
    	

	    Union

	    Select Id as UniqueID,StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, ISNULL(Topic,'') as Topic, Phone from Tbl_FollowUpItemsList 
	    where UserId = @UserId 
	    and Topic is not null and Topic != ''
	    and CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	    

	 End




    if (@Role = 'FranchiseeOwner' or @Role = 'Client')

    Begin

        Select c.CompaniesId as UniqueID,c.StartTime as StartTime,
        CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(c.NextContact_date) + 1,101)) AS NextDay,
        c.CompanyName as Description, 
        IsNull(c.DiscussionTopic,'') as Topic , c.POCPhone as Phone From TBL_Companies c 
    	join TBL_FRANCHISEE f on c.FranchiseeId = f.ID where c.NextContact_date is not null 
    	and f.ID = @FranchiseeId
    	and c.DiscussionTopic is not null and c.DiscussionTopic != ''
    	and CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
    	
    	

	    Union

	    Select ct.ContactsId as UniqueID,ct.StartTime as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct
 	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 
 	    where ct.Next_Contact_date is not null and f.ID = @FranchiseeId
 	    and ct.DiscussionTopic is not null and ct.DiscussionTopic != ''
 	    and CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
 	    
 	    

	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 
	    where ct.BirthDay is not null and f.ID = @FranchiseeId
	    and CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))

	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 
	    where ct.Anniversary is not null and f.ID = @FranchiseeId
	    and CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	    

	    Union

	    Select Id as UniqueID,StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, ISNULL(Topic,'') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = @UserId 
	    and Topic is not null and Topic != ''
	    and CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
 
    End

    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.ContactsId as UniqueID,ct.StartTime as StartTime, 
        CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
        ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,
        ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Next_Contact_date is not null and ct.CreatedBy = @UserId
	    and ct.DiscussionTopic is not null and ct.DiscussionTopic != ''
	    and CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	    
	    Union
 
	    Select ct.ContactsId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
 	    where ct.BirthDay is not null and ct.CreatedBy = @UserId
 	    and CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))

	    Union

	    Select ct.ContactsId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Anniversary is not null and ct.CreatedBy = @UserId
	    and CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))
	    
	    

	    Union

 	    Select Id as UniqueID,StartTime,
 	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
	    CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
 	    Description, 
 	    ISNULL(Topic,'') as Topic,Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 	    and Topic is not null and Topic != ''
 	    and CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) =  CONVERT(DATETIME,CONVERT(varchar(10),@SelDate,101))

    End

    

	 RETURN






GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllTasks]    Script Date: 03/09/2014 20:12:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllTasks]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int
 
	)

AS

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin' or @Role = 'HomeOfficeAdmin')

	 Begin

		 -- full access to all companies and contacts
		Select CompaniesId as UniqueID, StartTime,
		CONVERT(DATETIME,CONVERT(varchar(10),NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(NextContact_date) + 1,101)) AS NextDay,
		CompanyName as Description, IsNull(DiscussionTopic,'') as Topic,POCPhone as Phone From TBL_Companies 
		where NextContact_date is not null and DiscussionTopic is not null and DiscussionTopic != ''

	    Union

	    Select ContactsId as UniqueID, StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(Next_Contact_date) + 1,101)) AS NextDay,
	    LastName+','+FirstName as Description, IsNull(DiscussionTopic,'') as Topic,Phone as Phone 
	    from TBL_CONTACTS where Next_Contact_date is not null
	    and DiscussionTopic is not null and DiscussionTopic != ''

	    Union

	    Select ContactsId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(BirthDay) + 1,101)) AS NextDay,
	    LastName+','+FirstName as Description, 
	    ('Birthday For ' + LastName+', '+ FirstName) as Topic,Phone as Phone 
	    from TBL_CONTACTS where BirthDay is not null
	    

	    Union

	    Select ContactsId as UniqueID, '' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(Anniversary) + 1,101)) AS NextDay,
	    LastName+','+FirstName as Description, 
	    ('Anniversary For ' + LastName+', '+ FirstName) as Topic,Phone as Phone 
	    from TBL_CONTACTS  where Anniversary is not null
	    
	    Union

	    Select Id as UniqueID, StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, 
	    IsNull(Topic,'') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = @UserId 
	    and Topic is not null and Topic != ''
 
	   

	 End

    

    if (@Role = 'Coach')

	 Begin

		 -- full access to all companies and contacts within their region

		Select c.CompaniesId as UniqueID,c.StartTime as StartTime,
		CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(c.NextContact_date) + 1,101)) AS NextDay,
		c.CompanyName as Description, 
		IsNull(c.DiscussionTopic,'') as Topic , c.POCPhone as Phone From TBL_Companies c 
		join TBL_FRANCHISEE f on c.FranchiseeId = f.ID   join TBL_COACH ch on f.CoachID = ch.ID  
		where c.NextContact_date is not null and ch.RegionID = @RegionId
		and c.DiscussionTopic is not null and c.DiscussionTopic != ''

	    Union

	    Select ct.ContactsId as UniqueID, ct.StartTime as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    IsNull(ct.DiscussionTopic,'') as Topic, ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID 
	    where ct.Next_Contact_date is not null and ch.RegionID = @RegionId
	    and ct.DiscussionTopic is not null and ct.DiscussionTopic != ''

	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime, 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  
    	where ct.BirthDay is not null and ch.RegionID = @RegionId
    	

	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID   
    	where ct.Anniversary is not null and ch.RegionID = @RegionId
    	

	    Union

	    Select Id as UniqueID,StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, ISNULL(Topic,'') as Topic, Phone from Tbl_FollowUpItemsList 
	    where UserId = @UserId 
	    and Topic is not null and Topic != ''

	 End




    if (@Role = 'FranchiseeOwner' or @Role = 'Client')

    Begin

        Select c.CompaniesId as UniqueID,c.StartTime as StartTime,
        CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(c.NextContact_date) + 1,101)) AS NextDay,
        c.CompanyName as Description, 
        IsNull(c.DiscussionTopic,'') as Topic , c.POCPhone as Phone From TBL_Companies c 
    	join TBL_FRANCHISEE f on c.FranchiseeId = f.ID where c.NextContact_date is not null 
    	and f.ID = @FranchiseeId
    	and c.DiscussionTopic is not null and c.DiscussionTopic != ''

	    Union

	    Select ct.ContactsId as UniqueID,ct.StartTime as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct
 	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 
 	    where ct.Next_Contact_date is not null and f.ID = @FranchiseeId
 	    and ct.DiscussionTopic is not null and ct.DiscussionTopic != ''

	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 
	    where ct.BirthDay is not null and f.ID = @FranchiseeId
	    

	    Union

	    Select c.CompaniesId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 
	    where ct.Anniversary is not null and f.ID = @FranchiseeId
	    

	    Union

	    Select Id as UniqueID,StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, ISNULL(Topic,'') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = @UserId 
	    and Topic is not null and Topic != ''
	   
 
    End

    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.ContactsId as UniqueID,ct.StartTime as StartTime, 
        CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
        ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,
        ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Next_Contact_date is not null and ct.CreatedBy = @UserId
	    and ct.DiscussionTopic is not null and ct.DiscussionTopic != ''

	    Union
 
	    Select ct.ContactsId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
 	    where ct.BirthDay is not null and ct.CreatedBy = @UserId
 	    

	    Union

	    Select ct.ContactsId as UniqueID,'' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+','+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Anniversary is not null and ct.CreatedBy = @UserId
	    

	    Union

 	    Select Id as UniqueID,StartTime,
 	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
	    CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
 	    Description, 
 	    ISNULL(Topic,'') as Topic,Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 	    and Topic is not null and Topic != ''

    End

    

	 RETURN






GO


