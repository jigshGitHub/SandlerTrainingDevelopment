begin tran
CREATE TABLE  LU_BillingState ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_CompanySource ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_CompanyStatus ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_ContactStatus ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_ExecBriefingTopic ( ID INT NOT NULL PRIMARY KEY, FranchiseeID INT, BriefingName VARCHAR(100) NOT NULL)
CREATE TABLE  LU_IndustrySubCategory ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_KAREDesignation ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_NextActionStep ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC1ApptSource ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC1CompanyRole ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC1NextActionStep ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC1OpportunityRole ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC2ApptSource ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC2CompanyRole ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC2NextActionStep ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC2OpportunityRole ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC3ApptSource ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC3CompanyRole ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC3NextActionStep ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POC3OpportunityRole ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POCCertificationLevel ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_POCCompanyRole ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_ProductService ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_State ( ID INT NOT NULL PRIMARY KEY, Name VARCHAR(100) NOT NULL)
CREATE TABLE  LU_WorkshopTopic ( ID INT NOT NULL PRIMARY KEY, FranchiseeId int, WorkshopName VARCHAR(100) NOT NULL)

ALTER TABLE Tbl_Opportunities add 
LU_CompanyStatusId int,
LU_IndustrySubCategoryId int,
LU_KAREDesignationId int,
LU_POC1ApptSourceId int,
LU_POC1CompanyRoleId int,
LU_POC1NextActionStepId int,
LU_POC1OpportunityRoleId int,
LU_POC2ApptSourceId int,
LU_POC2CompanyRoleId int,
LU_POC2NextActionStepId int,
LU_POC2OpportunityRoleId int,
LU_POC3ApptSourceId int,
LU_POC3CompanyRoleId int,
LU_POC3NextActionStepId int,
LU_POC3OpportunityRoleId int,
LU_ProductServiceId int,
POC1DISCDesignation varchar(100),
POC1DiscussionTopic varchar(100),
POC1Email varchar(50),
POC1FirstName varchar(50),
POC1LastContactDate datetime,
POC1LastName varchar(50),
POC1MobilePhone varchar(50),
POC1NextContactDate datetime,
POC1Notes varchar(1000),
POC1Phone varchar(50),
POC2DISCDesignation varchar(100),
POC2DiscussionTopic varchar(100),
POC2Email varchar(50),
POC2FirstName varchar(50),
POC2LastContactDate datetime,
POC2LastName varchar(50),
POC2MobilePhone varchar(50),
POC2NextContactDate datetime,
POC2Notes varchar(1000),
POC2Phone varchar(50),
POC3DISCDesignation varchar(100),
POC3DiscussionTopic varchar(100),
POC3Email varchar(50),
POC3FirstName varchar(50),
POC3LastContactDate datetime,
POC3LastName varchar(50),
POC3MobilePhone varchar(50),
POC3NextContactDate datetime,
POC3Notes varchar(1000),
POC3Phone varchar(50),
column_a varchar(100),
column_b varchar(100),
column_c varchar(100),
column_d varchar(100),
column_e varchar(100),
column_f int,
column_g int,
column_h int,
column_i int,
column_j int,
column_k datetime,
column_l datetime,
column_m datetime,
column_n datetime,
column_o datetime

ALTER TABLE Tbl_Contacts add 
Date_BootcampTraining datetime,
Date_CoachingTraining datetime,
Date_CoachingTrainingRenewal datetime,
Date_ExecutiveBriefing datetime,
Date_FoundationsTraining datetime,
Date_LeadershipTraining datetime,
Date_ManagementTraining datetime,
Date_ManagementTrainingRenewal datetime,
Date_PCTraining datetime,
Date_PCTrainingRenewal datetime,
Date_SCCTraining datetime,
Date_SCCTrainingRenewal datetime,
Date_SESTraining datetime,
Date_SESTrainingRenewal datetime,
Date_Workshop datetime,
DISC_ConscientiousnessValue int,
DISC_DominanceValue int,
DISC_InfluenceValue int,
DISC_SteadinessValue int,
DISCDesignation varchar(100),
LU_CompanySourceId int,
LU_CompanyStatusId int,
LU_ContactStatusId int,
LU_ExecBriefingTopicId int,
LU_KAREDesignationId int,
LU_NextActionStepId int,
LU_POCCertificationLevelId int,
LU_POCCompanyRoleId int,
LU_StateId int,
LU_WorkshopTopicId int,
YN_EmailOptOut bit,
YN_IsAlumnus bit,
column_a varchar(100),
column_b varchar(100),
column_c varchar(100),
column_d varchar(100),
column_e varchar(100),
column_f int,
column_g int,
column_h int,
column_i int,
column_j int,
column_k datetime,
column_l datetime,
column_m datetime,
column_n datetime,
column_o datetime

ALTER TABLE Tbl_Companies add
ApptSourceId int,
AssistantEmail varchar(100),
LU_BillingStateId int,
LU_CompanySourceId int,
LU_CompanyStatusId int,
LU_ContactStatusId int,
LU_IndustrySubCategoryId int,
LU_KAREDesignationId int,
LU_NextActionStepId int,
LU_POCCompanyRoleId int,
LU_StateId int,
POCMobilePhone varchar(50),
YN_EmailOptOut bit,
IsEmailSubscription Bit,
column_a varchar(100),
column_b varchar(100),
column_c varchar(100),
column_d varchar(100),
column_e varchar(100),
column_f int,
column_g int,
column_h int,
column_i int,
column_j int,
column_k datetime,
column_l datetime,
column_m datetime,
column_n datetime,
column_o datetime

ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_BillingStateId FOREIGN KEY (LU_BillingStateId) REFERENCES LU_BillingState (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_CompanySourceId FOREIGN KEY (LU_CompanySourceId) REFERENCES LU_CompanySource (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_CompanyStatusId FOREIGN KEY (LU_CompanyStatusId) REFERENCES LU_CompanyStatus (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_ContactStatusId FOREIGN KEY (LU_ContactStatusId) REFERENCES LU_ContactStatus (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_IndustrySubCategoryId FOREIGN KEY (LU_IndustrySubCategoryId) REFERENCES LU_IndustrySubCategory (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_KAREDesignationId FOREIGN KEY (LU_KAREDesignationId) REFERENCES LU_KAREDesignation (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_NextActionStepId FOREIGN KEY (LU_NextActionStepId) REFERENCES LU_NextActionStep (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_POCCompanyRoleId FOREIGN KEY (LU_POCCompanyRoleId) REFERENCES LU_POCCompanyRole (Id)
ALTER TABLE TBL_Companies ADD CONSTRAINT FK_TBL_COMPANIES_LU_StateId FOREIGN KEY (LU_StateId) REFERENCES LU_State (Id)

ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_CompanySourceId FOREIGN KEY (LU_CompanySourceId) REFERENCES LU_CompanySource (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_CompanyStatusId FOREIGN KEY (LU_CompanyStatusId) REFERENCES LU_CompanyStatus (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_ContactStatusId FOREIGN KEY (LU_ContactStatusId) REFERENCES LU_ContactStatus (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_ExecBriefingTopicId FOREIGN KEY (LU_ExecBriefingTopicId) REFERENCES LU_ExecBriefingTopic (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_KAREDesignationId FOREIGN KEY (LU_KAREDesignationId) REFERENCES LU_KAREDesignation (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_NextActionStepId FOREIGN KEY (LU_NextActionStepId) REFERENCES LU_NextActionStep (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_POCCertificationLevelId FOREIGN KEY (LU_POCCertificationLevelId) REFERENCES LU_POCCertificationLevel (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_POCCompanyRoleId FOREIGN KEY (LU_POCCompanyRoleId) REFERENCES LU_POCCompanyRole (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_StateId FOREIGN KEY (LU_StateId) REFERENCES LU_State (Id)
ALTER TABLE TBL_CONTACTS ADD CONSTRAINT FK_TBL_CONTACTS_LU_WorkshopTopicId FOREIGN KEY (LU_WorkshopTopicId) REFERENCES LU_WorkshopTopic (Id)

ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_CompanyStatusId FOREIGN KEY (LU_CompanyStatusId) REFERENCES LU_CompanyStatus (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_IndustrySubCategoryId FOREIGN KEY (LU_IndustrySubCategoryId) REFERENCES LU_IndustrySubCategory (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_KAREDesignationId FOREIGN KEY (LU_KAREDesignationId) REFERENCES LU_KAREDesignation (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC1ApptSourceId FOREIGN KEY (LU_POC1ApptSourceId) REFERENCES LU_POC1ApptSource (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC1CompanyRoleId FOREIGN KEY (LU_POC1CompanyRoleId) REFERENCES LU_POC1CompanyRole (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC1NextActionStepId FOREIGN KEY (LU_POC1NextActionStepId) REFERENCES LU_POC1NextActionStep (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC1OpportunityRoleId FOREIGN KEY (LU_POC1OpportunityRoleId) REFERENCES LU_POC1OpportunityRole (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC2ApptSourceId FOREIGN KEY (LU_POC2ApptSourceId) REFERENCES LU_POC2ApptSource (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC2CompanyRoleId FOREIGN KEY (LU_POC2CompanyRoleId) REFERENCES LU_POC2CompanyRole (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC2NextActionStepId FOREIGN KEY (LU_POC2NextActionStepId) REFERENCES LU_POC2NextActionStep (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC2OpportunityRoleId FOREIGN KEY (LU_POC2OpportunityRoleId) REFERENCES LU_POC2OpportunityRole (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC3ApptSourceId FOREIGN KEY (LU_POC3ApptSourceId) REFERENCES LU_POC3ApptSource (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC3CompanyRoleId FOREIGN KEY (LU_POC3CompanyRoleId) REFERENCES LU_POC3CompanyRole (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC3NextActionStepId FOREIGN KEY (LU_POC3NextActionStepId) REFERENCES LU_POC3NextActionStep (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_POC3OpportunityRoleId FOREIGN KEY (LU_POC3OpportunityRoleId) REFERENCES LU_POC3OpportunityRole (Id)
ALTER TABLE TBL_OPPORTUNITIES ADD CONSTRAINT FK_TBL_OPPORTUNITIES_LU_ProductServiceId FOREIGN KEY (LU_ProductServiceId) REFERENCES LU_ProductService (Id)

GO
--rollback tran
commit tran