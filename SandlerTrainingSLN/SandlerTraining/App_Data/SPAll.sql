USE [SANDLERDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOpportunityDetailsSpecial]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateOpportunityDetailsSpecial]
	
	(
		@OppId int,@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@TotalActValue int
				
		
	)
	
	
AS
	
	Update tbl_Opportunity

	Set Company_id = @CompanyID, Opp_Name = @OppName, Weighted_Value = @WeightedValue,
	Win_Probability = @WinProbability, Rep_Phone = @SalesPhone, Sales_Rep = @SalesRep, Comp_contact = @CompContact,
	 Comp_Phone = @CompPhone
	 ,Email = @CompEmail
	 ,Acct_Opp_Status = @AcctOppStatus
	 ,Acct_id = @AcctID
	 ,Close_Date = null
	 ,Total_Value = @TotalActValue
	 where opp_id = @OppId

	
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOpportunityDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateOpportunityDetails]
	
	(
		@OppId int,@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@CloseDate datetime,@TotalActValue int
				
		
	)
	
	
AS
	
	Update tbl_Opportunity

	Set Company_id = @CompanyID, Opp_Name = @OppName, Weighted_Value = @WeightedValue,
	Win_Probability = @WinProbability, Rep_Phone = @SalesPhone, Sales_Rep = @SalesRep, Comp_contact = @CompContact,
	 Comp_Phone = @CompPhone
	 ,Email = @CompEmail
	 ,Acct_Opp_Status = @AcctOppStatus
	 ,Acct_id = @AcctID
	 ,Close_Date = @CloseDate
	 ,Total_Value = @TotalActValue
	 where opp_id = @OppId

	
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDocumentDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateDocumentDetails]
	(
				
		@DocID int,@DocStatus varchar(50),@DocName varchar(50),
		@LastModifyDate datetime
		
	)
AS
	
	Update tbl_documents

	Set Document_Status = @DocStatus, Doc_Name = @DocName,
	Last_Modify_Date = @LastModifyDate where Doc_ID = @DocID


	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetailsSpecial]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateContactDetailsSpecial]
	
	(
		@ContactID int,@FullName varchar(50),@Phone varchar(50),
		@Email varchar(50),@LastDate datetime,
		@CompanyID int,@Comment varchar(Max),@ActionStep varchar(50),
		@TotalActValue int
	)
	
AS
	Update Tbl_Contact

	Set Full_name = @FullName, Phone = @Phone, Email = @Email,
	Last_Contact_Date = @LastDate, Next_Contact_Date = null, 
	Comment = @Comment, Action_Step = @ActionStep, Total_Act_Value = @TotalActValue,
	Company_id = @CompanyID
	where Contact_id = @ContactID
	
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateContactDetails]
	
	(
		@ContactID int,@FullName varchar(50),@Phone varchar(50),
		@Email varchar(50),@LastDate datetime,@NextDate datetime,
		@CompanyID int,@Comment varchar(Max),@ActionStep varchar(50),
		@TotalActValue int
	)
	
AS
	Update Tbl_Contact

	Set Full_name = @FullName, Phone = @Phone, Email = @Email,
	Last_Contact_Date = @LastDate, Next_Contact_Date = @NextDate, 
	Comment = @Comment, Action_Step = @ActionStep, Total_Act_Value = @TotalActValue,
	Company_id = @CompanyID
	where Contact_id = @ContactID
	
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAccountDetailsSpecial]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateAccountDetailsSpecial]
	(
		@AccountID int,@CompanyName varchar(50),@AccountName varchar(50),
		@Product varchar(50),@LastDate datetime,
		@Comment varchar(Max),@ActionStep varchar(50),
		@ActValue int,@SalesRep varchar(50)
	)
AS
	
	Update tbl_company

	Set Company_Name = @CompanyName, Account_Name = @AccountName,Account_value = @ActValue,
	Last_Contact_Date = @LastDate, Sales_Rep = @SalesRep,Next_Contact_Date = null, 
	Action_Step = @ActionStep, Product = @Product,Comment = @Comment where ID = @AccountID


	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAccountDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateAccountDetails]
	(
		@AccountID int,@CompanyName varchar(50),@AccountName varchar(50),
		@Product varchar(50),@LastDate datetime,@NextDate datetime,
		@Comment varchar(Max),@ActionStep varchar(50),
		@ActValue int,@SalesRep varchar(50)
	)
AS
	
	Update tbl_company

	Set Company_Name = @CompanyName, Account_Name = @AccountName,Account_value = @ActValue,
	Last_Contact_Date = @LastDate, Next_Contact_Date = @NextDate,Sales_Rep = @SalesRep,
	Action_Step = @ActionStep, Product = @Product, Comment = @Comment where ID = @AccountID


	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOpportunitySpecial]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[sp_InsertOpportunitySpecial]
	
	(
		@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@TotalActValue int
				
		
	)
	
	
AS
	
	Insert into tbl_Opportunity
	(Company_id, Opp_Name, Weighted_Value, Win_Probability,Rep_Phone,Sales_Rep,Comp_contact,Comp_Phone,Email,Acct_Opp_Status,Acct_id,Total_Value,Close_Date)
	values
	(@CompanyID,@OppName,@WeightedValue,@WinProbability,@SalesPhone,@SalesRep,@CompContact,@CompPhone,@CompEmail,@AcctOppStatus,@AcctID,@TotalActValue,null)
	
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOpportunity]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_InsertOpportunity]
	
	(
		@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@CloseDate datetime,@TotalActValue int
				
		
	)
	
	
AS
	
	Insert into tbl_Opportunity
	(Company_id, Opp_Name, Weighted_Value, Win_Probability,Rep_Phone,Sales_Rep,Comp_contact,Comp_Phone,Email,Acct_Opp_Status,Acct_id,Close_Date,Total_Value)
	values
	(@CompanyID,@OppName,@WeightedValue,@WinProbability,@SalesPhone,@SalesRep,@CompContact,@CompPhone,@CompEmail,@AcctOppStatus,@AcctID,@CloseDate,@TotalActValue)
	
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertContactSpecial]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_InsertContactSpecial]
	
	(
		@FullName varchar(50),@Phone varchar(50),
		@Email varchar(50),@LastDate datetime,
		@CompanyID int,@Comment varchar(Max),@ActionStep varchar(50),
		@TotalActValue int
	)
	
	
AS
	
	Insert into tbl_contact 
	(Company_id, Email, Phone, Full_Name, Last_Contact_Date, Comment,Action_Step,Total_Act_Value,Next_Contact_Date)
	values
	(@CompanyID,@Email,@Phone,@FullName,@LastDate,@Comment,@ActionStep,@TotalActValue,null)
	
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_InsertContact]
	
	(
		@FullName varchar(50),@Phone varchar(50),
		@Email varchar(50),@LastDate datetime,@NextDate datetime,
		@CompanyID int,@Comment varchar(Max),@ActionStep varchar(50),
		@TotalActValue int
	)
	
	
AS
	
	Insert into tbl_contact 
	(Company_id, Email, Phone, Full_Name, Last_Contact_Date,Next_Contact_Date, Comment,Action_Step,Total_Act_Value)
	values
	(@CompanyID,@Email,@Phone,@FullName,@LastDate,@NextDate,@Comment,@ActionStep,@TotalActValue)
	
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAccountSpecial]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_InsertAccountSpecial]
	
	(
		@CompanyName varchar(50), @ActName varchar(50),@Sales_Rep varchar(50),@LastDate datetime, 
	    @Comment varchar(max), @ActionStep varchar(50), @Account_Value int,@Product varchar(50)
	)
	

	
	
AS
	
	Insert into tbl_Company
	(Company_Name, Account_Name, Sales_Rep, Last_Contact_Date,Comment,Action_Step,Account_Value,Product,Next_contact_Date)
	values
	(@CompanyName , @ActName ,@Sales_Rep ,@LastDate,@Comment, @ActionStep , @Account_Value ,@Product,null)
	
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAccount]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_InsertAccount]
	
	(
		@CompanyName varchar(50), @ActName varchar(50),@Sales_Rep varchar(50),@LastDate datetime,@NextDate datetime, 
	    @Comment varchar(max), @ActionStep varchar(50), @Account_Value int,@Product varchar(50)
	)
	

	
	
AS
	
	Insert into tbl_Company
	(Company_Name, Account_Name, Sales_Rep, Last_Contact_Date,Next_Contact_Date, Comment,Action_Step,Account_Value,Product)
	values
	(@CompanyName , @ActName ,@Sales_Rep ,@LastDate ,@NextDate, 
	    @Comment, @ActionStep , @Account_Value ,@Product)
	
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOpportunityDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetOpportunityDetails]
	(
	@OppID int 
	)
AS
	
	Select op.Opp_ID,op.opp_name, op.acct_id, op.opp_name, op.sales_rep,
	op.total_value,op.email, op.comp_phone,op.comp_contact, op.rep_phone,
	op.weighted_value,op.win_probability,
	ISNULL(op.close_date, '') as close_date,
	cp.Company_Name, op.acct_opp_status,cp.id
	from tbl_opportunity op 
	join tbl_company cp on op.company_id = cp.id where op.opp_id = @OppID
	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetForecastDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetForecastDetails]
	
	(
		@CompID int
	)
	
AS
	/* SET NOCOUNT ON */

	Select *
	/* Comp_ID, Q2Total, Q3Total, Q4Total,Year, Season_Index,Growth_Index,Trained_Reps,Sales_Cycle_Time */
	from tbl_forecast where comp_id = @CompID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDocumentsById]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetDocumentsById]
	
	(
		@OppID int
	)
	
AS
	
	Select dc.doc_id, dc.doc_name, dc.last_modify_date,
	dc.document_status, dc.document_loaded,op.opp_name, cp.company_name
	from tbl_documents dc
	join tbl_opportunity op on dc.opp_id = op.opp_id
	join tbl_company cp on cp.id = op.company_id
	where dc.opp_id = @OppID

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDocumentDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetDocumentDetails]
	
	(
		@DocID int
	)
	
AS
	
	Select dc.doc_id, dc.doc_name, dc.last_modify_date,
	dc.document_status, dc.document_loaded,op.opp_name, cp.company_name
	from tbl_documents dc
	join tbl_opportunity op on dc.opp_id = op.opp_id
	join tbl_company cp on cp.id = op.company_id
	where dc.doc_id = @DocID

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetContactDetails]
	(
	@ContactID int 
	)
AS
	select 
	ct.full_name, ct.Phone, ct.Email, ct.company_id, 
	ct.contact_id,ct.total_act_value, cp.company_name,
	ct.comment, ct.action_step, cp.ID, ct.last_contact_date,
	ISNULL(ct.next_contact_date, '') as next_contact_date
	from tbl_contact ct join tbl_company cp on ct.company_id = cp.id 
	where ct.contact_id = @ContactID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunitiesByID]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetAllOpportunitiesByID]
	
	(
		@CompanyID int
	)
	
AS
	
	Select op.opp_id,op.acct_id, op.opp_name, cp.company_name, op.weighted_value, op.win_probability,
	op.total_value, op.close_date,op.sales_rep, op.acct_opp_status
	from tbl_opportunity op join tbl_company cp on op.company_id = cp.id 
	where op.company_id = @CompanyID
	order by op.opp_name

	
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunities]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetAllOpportunities]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	
	Select op.opp_id,op.acct_id, op.opp_name, cp.company_name, op.weighted_value, op.win_probability,
	op.total_value, op.close_date,op.sales_rep, op.acct_opp_status
	from tbl_opportunity op join tbl_company cp on op.company_id = cp.id order by op.opp_name

	
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByID]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetAllContactsByID]
	
	(
	@CompanyID int 
	)
	
AS
	
	select 
	ct.full_name, ct.Phone, ct.Email, ct.company_id, 
	ct.contact_id,ct.total_act_value, cp.company_name 
	from tbl_contact ct join tbl_company cp on ct.company_id = cp.id 
	where ct.company_id = @CompanyID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetAllContacts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	select 
	ct.full_name, ct.Phone, ct.Email, ct.company_id, 
	ct.contact_id,ct.total_act_value, cp.company_name 
	from tbl_contact ct join tbl_company cp on ct.company_id = cp.id 
	Order by ct.full_name
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetAllCompanies]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	Select * from tbl_Company order by Company_Name
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAccounts]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetAllAccounts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_COMPANY ORDER BY ACCOUNT_NAME/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccountDetails]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetAccountDetails]
	(
	@AccountID int 
	)
AS
	select ID, ISNULL(next_contact_date, '') as next_contact_date, last_contact_date,
	Product, Account_name, Account_Value, Comment, Company_Name,Sales_Rep, Action_Step 
	from tbl_company where id = @AccountID

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_createForecast]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_createForecast]
	
	(
		@CompanyID int, 
		@Q2Total int, @Q3Total int, @Q4Total int, @Year int,
		@QuotaTotal int, @BestCaseTotal int, @SalesPLTotal int,
		@Q2Quota bigint,@Q2BestCase bigint,@Q2SalesPL bigint,
		@Q3Quota bigint,@Q3BestCase bigint,@Q3SalesPL bigint,
		@Q4Quota bigint,@Q4BestCase bigint,@Q4SalesPL bigint,
		@SeasonIndex varchar(50), @GrowthIndex varchar(50), 
		@Trained_Reps varchar(50),@SalesCycle varchar(50)
	)
	

	
	
AS
	
	Insert into tbl_Forecast
	(Comp_ID, Q2Total, Q3Total, Q4Total,
	 Year, QuotaTotal,BestCaseTotal,SalesPLTotal,
	 Q2Quota,Q2BestCase,Q2SalesPL,
	 Q3Quota,Q3BestCase,Q3SalesPL,
	 Q4Quota,Q4BestCase,Q4SalesPL,
	 Season_Index,Growth_Index,Trained_Reps,Sales_Cycle_Time)
	values
	(@CompanyID,@Q2Total,@Q3Total,@Q4Total,@Year, 
		@QuotaTotal,@BestCaseTotal,@SalesPLTotal,
		@Q2Quota,@Q2BestCase ,@Q2SalesPL,
		@Q3Quota,@Q3BestCase ,@Q3SalesPL,
		@Q4Quota,@Q4BestCase ,@Q4SalesPL,
	 @SeasonIndex,@GrowthIndex , @Trained_Reps ,@SalesCycle)
	
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_AttachDocument]    Script Date: 02/20/2012 18:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_AttachDocument]
	
	(
		@OppID int, @Document_Name varchar(50),@Document_Status varchar(50),@Document_Loaded varchar(50),
		@LastModifyDate datetime

	)
	
	
AS
	
	Insert into tbl_documents
	(opp_id, doc_name,document_status,document_loaded,last_modify_date)
	values
	(@OppID,@Document_Name,@Document_Status,@Document_Loaded,@LastModifyDate)
	
	/* SET NOCOUNT ON */
	RETURN
GO
