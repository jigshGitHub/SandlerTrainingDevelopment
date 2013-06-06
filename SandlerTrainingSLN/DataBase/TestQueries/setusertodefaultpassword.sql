select * from aspnet_users where username = 'michael.norton'
select * from aspnet_membership where userid = '864C216C-F8F9-4392-BC2F-C25E96D4E8BC'

update aspnet_membership set [password] = 'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=' where userid = '864C216C-F8F9-4392-BC2F-C25E96D4E8BC'
update aspnet_membership set islockedout = 0 where userid = '864C216C-F8F9-4392-BC2F-C25E96D4E8BC'

update aspnet_membership set LastPasswordChangedDate = CreateDate where  userid = '864C216C-F8F9-4392-BC2F-C25E96D4E8BC'

delete from aspnet_Membership where UserId in (select UserId from aspnet_Users where UserName like 'testfn%');
delete from aspnet_Profile where UserId in (select UserId from aspnet_Users where UserName like 'testfn%');
delete from aspnet_Users where UserName like 'testfn%'