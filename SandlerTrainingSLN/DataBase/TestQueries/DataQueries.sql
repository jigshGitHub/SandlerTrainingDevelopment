
SELECT u.* from aspnet_Users u 
inner join aspnet_Membership m on m.UserId = u.UserId 
inner join aspnet_UsersInRoles ur on ur.UserId = u.UserId 
inner join aspnet_Roles r on r.RoleId = ur.RoleId 
where r.RoleName = 'Corporate'

--Country-Region-Coach
SELECT con.Name, r.Name, u.UserName, c.* FROM TBL_COACH c
INNER JOIN aspnet_Users u ON u.UserId = c.UserID
INNER JOIN TBL_REGION r ON r.ID = c.RegionID
INNER JOIN TBL_COUNTRY con ON con.ID = r.CountryID

--Region-Coach-Franchisee-FranchiseeUsers
SELECT  f.Id, f.CoachID ,  f.Name, u.UserName,u.UserId, r.Name
FROM TBL_FRANCHISEE_USERS AS fu 
INNER JOIN aspnet_Users AS u ON fu.UserID = u.UserId 
INNER JOIN TBL_FRANCHISEE AS f ON f.ID = fu.FranchiseeID
INNER JOIN TBL_COACH AS c ON f.CoachID = c.ID
INNER JOIN TBL_Region AS r ON r.ID = c.RegionID
--where f.CoachID=10
order by f.name;

select * from aspnet_Users where UserName='nectfo'
select *  from TBL_FRANCHISEE where CoachID = 42
select * from TBL_FRANCHISEE_USERS where FranchiseeID = 1

-- Companies/Contacts based on FRanchiseeID
SELECT cmp.COMPANYNAME, C.*
FROM TBL_CONTACTS AS C WITH (NOLOCK) 
INNER JOIN TBL_COMPANIES AS CMP WITH (NOLOCK) ON CMP.COMPANIESID = C.COMPANYID
WHERE     (CMP.FranchiseeId = 21)


SELECT u.UserName, cmp.COMPANYNAME, C.*
FROM TBL_CONTACTS AS C WITH (NOLOCK) 
INNER JOIN TBL_COMPANIES AS CMP WITH (NOLOCK) ON CMP.COMPANIESID = C.COMPANYID
INNER JOIN aspnet_Users AS U WITH(NOLOCK) ON U.UserId = C.CreatedBy 
WHERE     (CMP.FranchiseeId = 21)

SELECT u.UserName, cmp.COMPANYNAME, C.*
FROM TBL_CONTACTS AS C WITH (NOLOCK) 
INNER JOIN TBL_COMPANIES AS CMP WITH (NOLOCK) ON CMP.COMPANIESID = C.COMPANYID
INNER JOIN aspnet_Users AS U WITH(NOLOCK) ON U.UserId = C.CreatedBy 
WHERE     (CMP.FranchiseeId = 6 AND CMP.COMPANIESID = 7);


Select * from aspnet_membership 
where 
--DatePart(Year,CreateDate) = DatePart(Year,GetDate()) AND
--DatePart(Month,CreateDate) = DatePart(Month,GetDate()) AND
--DatePart(Day,CreateDate) = DatePart(Day,GetDate()) 
userid = '7a911b6a-20ca-4e64-8411-f10f7b2aa5fd'
Select * from tbl_franchisee
where DatePart(Year,CreatedDate) = DatePart(Year,GetDate()) AND
DatePart(Month,CreatedDate) = DatePart(Month,GetDate()) AND
DatePart(Day,CreatedDate) = DatePart(Day,GetDate()) 
--delete from tbl_franchisee where id = 24

Select * from tbl_franchisee_users
where userid='72305985-4171-4C6C-A796-4AFD870DA716'

Select * from tbl_companies where LASTCONTACT_DATE < GETDATE() - 90


select d.* FROM TBL_DOCS d INNER JOIN TBL_Opportunities o WITH(NOLOCK) ON o.Id = OppsId
					INNER JOIN TBL_Contacts c WITH(NOLOCK) ON c.CONTACTSID = o.CONTACTID
					INNER JOIN Tbl_Companies cmp WITH(NOLOCK) ON cmp.COMPANIESID = c.COMPANYID
					WHERE cmp.FranchiseeId = 1 AND c.CreatedBy = 'fd4cce62-2a92-4715-a804-03f5bb957b9b';

select o.* FROM TBL_Opportunities o WITH(NOLOCK) 
					INNER JOIN TBL_Contacts c WITH(NOLOCK) ON c.CONTACTSID = o.CONTACTID
					INNER JOIN Tbl_Companies cmp WITH(NOLOCK) ON cmp.COMPANIESID = c.COMPANYID
					WHERE cmp.FranchiseeId = 1 AND c.CreatedBy = 'fd4cce62-2a92-4715-a804-03f5bb957b9b';
					
select c.* FROM TBL_Contacts c WITH(NOLOCK) 
					INNER JOIN Tbl_Companies cmp WITH(NOLOCK) ON cmp.COMPANIESID = c.COMPANYID
					WHERE cmp.FranchiseeId = 1 AND c.CreatedBy = 'fd4cce62-2a92-4715-a804-03f5bb957b9b';

exec sp_DeleteDocumentsOfUser 1,'fd4cce62-2a92-4715-a804-03f5bb957b9b';

exec sp_DeleteOpportunitiesOfUser  1,'fd4cce62-2a92-4715-a804-03f5bb957b9b';

exec sp_DeleteContactsOfUser  1,'fd4cce62-2a92-4715-a804-03f5bb957b9b';

exec [sp_CompanyLookup] 'CompaniesID ASC',0,0,null,8,null,0
exec [sp_CompanyView] 'CompaniesID ASC',0,0,null,8,null,0
exec [sp_ContactView] @orderBy='LastName ASC' ,@pageSize=0,@pageNo=0,@franchiseeId=8,@userId='98428801-3032-4ef3-8ff4-4588f7876ece',@searchText=''

SELECT c.* FROM TBL_COMPANIES c 
INNER JOIN TBL_FRANCHISEE f on c.FranchiseeId = f.ID
INNER JOIN TBL_FRANCHISEE_USERS fu on fu.FranchiseeID = f.ID
INNER JOIN aspnet_Users u on u.UserId = fu.UserID
WHERE u.UserName = 'msi.andrew'

--update TBL_CONTACTS set createddate=updateddate, createdby=updatedby,isactive=1 where CompanyId= 623083;

select  * from TBL_OPPORTUNITIES where CompanyId= 623083;
select  * from TBL_CONTACTS  where CompanyId= 623083;
select   * from TBL_COMPANIES where CompaniesID= 623083;


--delete from TBL_OPPORTUNITIES where CompanyId= 623083;
--delete from TBL_CONTACTS where CompanyId= 623083;
--delete from TBL_COMPANIES where CompaniesID= 623083;


select 
	ct.LastName,
	ct.FirstName,
	ct.lastname + ', ' + ct.FirstName as FullName, 
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
    where ct.IsActive = 1   AND f.ID = 8 AND ct.CreatedBy = '98428801-3032-4ef3-8ff4-4588f7876ece'