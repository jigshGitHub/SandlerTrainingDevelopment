select * from aspnet_users where username = 'Kimberly.Greer'
select * from aspnet_membership where userid = '7F19722B-C76C-48ED-81B2-EFC1AECDE5CC'

update aspnet_membership set [password] = 'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=' where userid = '7F19722B-C76C-48ED-81B2-EFC1AECDE5CC'
update aspnet_membership set islockedout = 0 where userid = '534E1E2E-926A-4EC5-8CC3-C1E9E5409B7B'

update aspnet_membership set LastPasswordChangedDate = CreateDate where  userid = '72305985-4171-4C6C-A796-4AFD870DA716'

delete from aspnet_Membership where UserId in (select UserId from aspnet_Users where UserName like 'testfn%');
delete from aspnet_Profile where UserId in (select UserId from aspnet_Users where UserName like 'testfn%');
delete from aspnet_Users where UserName like 'testfn%'