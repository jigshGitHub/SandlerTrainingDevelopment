select * from aspnet_users where username = 'shaun.thomson'
select * from aspnet_membership where userid = '534E1E2E-926A-4EC5-8CC3-C1E9E5409B7B'

update aspnet_membership set [password] = 'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=' where userid = '534E1E2E-926A-4EC5-8CC3-C1E9E5409B7B'
update aspnet_membership set islockedout = 0 where userid = '534E1E2E-926A-4EC5-8CC3-C1E9E5409B7B'