USE [SandlerDB]
GO

DECLARE @userId uniqueidentifier

--EXECUTE sp_CreateFranchisee_User @user_Name = 'ctfruser', @_email = 'ctfruser@sandler.com', @franchisee_Name = 'Connecticut Fr', @User_Id = @userId OUTPUT; 
--EXECUTE sp_CreateFranchisee_User @user_Name = 'flfruser', @_email = 'flfruser@sandler.com', @franchisee_Name = 'Florida Fr', @User_Id = @userId OUTPUT; 
--EXECUTE sp_CreateFranchisee_User @user_Name = 'chfruser', @_email = 'chfruser@sandler.com', @franchisee_Name = 'Chicago Fr', @User_Id = @userId OUTPUT; 

--EXECUTE sp_CreateFranchisee_User @user_Name = 'abcuser1', @_email = 'abcuser1@sandler.com', @franchisee_Name = 'ABC Training Center', @User_Id = @userId OUTPUT; 
--EXECUTE sp_CreateFranchisee_User @user_Name = 'xyzuser1', @_email = 'xyzuser1@sandler.com', @franchisee_Name = 'XYZ Training Center', @User_Id = @userId OUTPUT; 
EXECUTE sp_CreateFranchisee_User @user_Name = 'hnuser', @_email = 'chfruser@sandler.com', @franchiseeId=6, @User_Id = @userId OUTPUT; 
