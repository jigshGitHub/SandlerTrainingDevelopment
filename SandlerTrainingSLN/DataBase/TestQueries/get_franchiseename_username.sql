SELECT  f.Id,   f.Name, u.UserName,u.UserId, r.Name
FROM TBL_FRANCHISEE_USERS AS fu 
INNER JOIN aspnet_Users AS u ON fu.UserID = u.UserId 
INNER JOIN TBL_FRANCHISEE AS f ON f.ID = fu.FranchiseeID
INNER JOIN TBL_COACH AS c ON f.CoachID = c.ID
INNER JOIN TBL_Region AS r ON r.ID = c.RegionID
order by f.name;
                      
SELECT     c.Createdby, u.UserName
FROM         TBL_CONTACTS AS c INNER JOIN
                      aspnet_Users AS u ON c.Createdby = u.UserId 

-- Companies/Contacts based on FRanchiseeID
SELECT cmp.COMPANYNAME,    C.CONTACTSID, C.COMPANYID, C.LASTNAME, C.FIRSTNAME, C.PHONE, C.EMAIL, C.IsNewAppointment, C.ApptSourceId, C.IsRegisteredForTraining, 
                      C.CourseId, C.CourseTrainingDate, C.DiscussionTopic, C.ACTIONSTEP, C.LAST_CONTACT_DATE, C.NEXT_CONTACT_DATE, C.IsActive, C.UpdatedBy, 
                      C.CreatedBy, C.CreatedDate, C.UpdatedDate
FROM         TBL_CONTACTS AS C WITH (NOLOCK) INNER JOIN
                      TBL_COMPANIES AS CMP WITH (NOLOCK) ON CMP.COMPANIESID = C.COMPANYID
WHERE     (CMP.FranchiseeId = 9)