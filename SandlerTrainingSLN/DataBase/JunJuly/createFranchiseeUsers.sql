USE [SandlerDB]
GO

DECLARE @userId uniqueidentifier

EXECUTE sp_CreateFranchisee_User @user_Name = 'ctfruser', @_email = 'ctfruser@sandler.com', @franchisee_Name = 'Connecticut Fr', @User_Id = @userId OUTPUT; 
PRINT CAST(@userId as VARCHAR(50));
EXECUTE sp_CreateFranchisee_User @user_Name = 'flfruser', @_email = 'flfruser@sandler.com', @franchisee_Name = 'Florida Fr', @User_Id = @userId OUTPUT; 
PRINT CAST(@userId as VARCHAR(50));
EXECUTE sp_CreateFranchisee_User @user_Name = 'chfruser', @_email = 'chfruser@sandler.com', @franchisee_Name = 'Chicago Fr', @User_Id = @userId OUTPUT; 
PRINT CAST(@userId as VARCHAR(50));

