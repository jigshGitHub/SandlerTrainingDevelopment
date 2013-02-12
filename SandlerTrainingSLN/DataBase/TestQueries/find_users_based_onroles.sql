select u.* from 
aspnet_Roles r inner join aspnet_UsersInRoles ur inner join aspnet_Users u on u.UserId = ur.UserId
on ur.RoleId = r.RoleId 
where r.RoleName = 'corporate';

select u.* from 
aspnet_Roles r inner join aspnet_UsersInRoles ur inner join aspnet_Users u on u.UserId = ur.UserId
on ur.RoleId = r.RoleId 
where r.RoleName = 'franchiseeowner';