
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

SELECT c.* FROM TBL_COMPANIES c 
INNER JOIN TBL_FRANCHISEE f on c.FranchiseeId = f.ID
INNER JOIN TBL_FRANCHISEE_USERS fu on fu.FranchiseeID = f.ID
INNER JOIN aspnet_Users u on u.UserId = fu.UserID
WHERE u.UserName = 'msi.andrew'

select  * from TBL_OPPORTUNITIES where CompanyId= 623067;
select  * from TBL_CONTACTS  where CompanyId= 623067;
select  * from TBL_COMPANIES where CompaniesID= 623067;


--delete from TBL_OPPORTUNITIES where CompanyId= 623067;
--delete from TBL_CONTACTS where CompanyId= 623067;
--delete from TBL_COMPANIES where CompaniesID= 623067;
