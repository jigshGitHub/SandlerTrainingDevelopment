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
where f.CoachID=10
order by f.name;

select * from aspnet_Users where UserName='judah.domke'
select *  from TBL_FRANCHISEE where CoachID = 42
select * from TBL_FRANCHISEE_USERS where FranchiseeID = 33

-- Companies/Contacts based on FRanchiseeID
SELECT u.UserName, cmp.COMPANYNAME, C.*
FROM TBL_CONTACTS AS C WITH (NOLOCK) 
INNER JOIN TBL_COMPANIES AS CMP WITH (NOLOCK) ON CMP.COMPANIESID = C.COMPANYID
INNER JOIN aspnet_Users AS U WITH(NOLOCK) ON U.UserId = C.CreatedBy 
WHERE     (CMP.FranchiseeId = 6)

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
where userid='7A911B6A-20CA-4E64-8411-F10F7B2AA5FD'

