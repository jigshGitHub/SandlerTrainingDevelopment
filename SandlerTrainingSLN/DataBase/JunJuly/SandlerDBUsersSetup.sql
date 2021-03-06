USE [SandlerDB]
GO
/****** Object:  Login [SandlerWebUser]    Script Date: 08/13/2012 23:02:32 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'SandlerWebUser')
DROP LOGIN [SandlerWebUser]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [SandlerWebUser]    Script Date: 08/13/2012 23:02:32 ******/
CREATE LOGIN [SandlerWebUser] WITH PASSWORD=N'pH@µsMlÄÈõ Wyû=8*4@+¡8Ipü;', DEFAULT_DATABASE=[SandlerDB], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [SandlerWebUser] DISABLE
GO

/****** Object:  User [SandlerWebUser]    Script Date: 08/13/2012 22:59:14 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SandlerWebUser')
DROP USER [SandlerWebUser]
GO

CREATE USER [SandlerWebUser] FOR LOGIN [SandlerWebUser] WITH DEFAULT_SCHEMA=[dbo]
GO

IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SandlerUser')
DROP USER [SandlerUser]
GO

CREATE USER [SandlerUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO

