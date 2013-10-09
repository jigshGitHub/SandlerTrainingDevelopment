using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using SandlerRepositories;

public partial class CRM_HomeOffice_Detail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblModuleActionHeading.Text = (IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice)) ? "View Home Office Information:" : "View/Edit Home Office Information:";
            if ((PreviousPage != null))
            {
                //Find out CompanyID selected by the User
                hidFranchiseeID.Value = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidFranchiseeID")).Value;
                GetFranchiseeDetails();
            }
        }
    }
    public void GetFranchiseeDetails()
    {
        //Now get the details
        SandlerRepositories.FranchiseesRepository frRepo = new SandlerRepositories.FranchiseesRepository();
        System.Data.DataSet ds = frRepo.GetByFranchiseeId(Convert.ToInt32(hidFranchiseeID.Value));
        FranchiseeFW.DataSource = ds;
        //store lookup table values in the Hidden field
        hidWorkStateName.Value = ds.Tables[0].Rows[0]["WorkState"].ToString();
        hidHomeStateName.Value = ds.Tables[0].Rows[0]["HomeState"].ToString();
        hidWorkCountryName.Value = ds.Tables[0].Rows[0]["WorkCountry"].ToString();
        hidHomeCountryName.Value = ds.Tables[0].Rows[0]["HomeCountry"].ToString();
        hidSandlerRoleName.Value = ds.Tables[0].Rows[0]["SandlerRole"].ToString();
        hidBehindAmtName.Value = ds.Tables[0].Rows[0]["BehindAmount"].ToString();
        hidAwardLevelName.Value = ds.Tables[0].Rows[0]["AwardLevel"].ToString();
        hidPurchaseLevelName.Value = ds.Tables[0].Rows[0]["PurchaseLevel"].ToString();
        hidCertifiedLevelName.Value = ds.Tables[0].Rows[0]["CertifiedLevel"].ToString();
        hidPrimaryBusinessName.Value = ds.Tables[0].Rows[0]["PrimaryBusiness"].ToString();
        hidCostPlusAmtName.Value = ds.Tables[0].Rows[0]["CostPlusAmount"].ToString();
        hidMasterFranchiseeName.Value = ds.Tables[0].Rows[0]["MasterFrName"].ToString();
        //Now finally bind
        FranchiseeFW.DataBind();
    }

    protected void FranchiseeFW_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        FranchiseeFW.ChangeMode(FormViewMode.ReadOnly);
        GetFranchiseeDetails();
    }
    protected void FranchiseeFW_ItemCreated(object sender, EventArgs e)
    {
        FormView dv = sender as FormView;
        if (dv.CurrentMode == FormViewMode.ReadOnly)
            if (dv.FindControl("LinkButton1") != null)
                (dv.FindControl("LinkButton1") as LinkButton).Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice);
            if (dv.FindControl("LinkButton5") != null)
                (dv.FindControl("LinkButton5") as LinkButton).Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice);
    }
    protected void FranchiseeFW_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        //No code required
    }
    protected void FranchiseeFW_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            FranchiseeFW.ChangeMode(FormViewMode.Edit);
            LblStatus.Text = "";
            LblStatus1.Text = "";
            GetFranchiseeDetails();

        }
        else if (e.CommandName == "Update")
        {
            LblStatus.Text = "";
            LblStatus1.Text = "";
            UpdateFranchiseeDetails();
        }
        else if (e.CommandName == "Cancel")
        {
            FranchiseeFW.ChangeMode(FormViewMode.ReadOnly);
            LblStatus.Text = "";
            LblStatus1.Text = "";
            GetFranchiseeDetails();
        }
    }

    public string GetTextBoxData(string controlId)
    {
        //First Create the TextBox Control to store the Input Data
        string inputByUser = "";
        TextBox _tempTextBox = new TextBox();
        _tempTextBox = (TextBox)FranchiseeFW.FindControl(controlId);
        if ((_tempTextBox != null))
        {
            inputByUser = _tempTextBox.Text;
        }
        return inputByUser;
    }


    public int GetDropdownListBoxData(string controlId)
    {
        DropDownList _tempDDList = new DropDownList();
        _tempDDList = (DropDownList)FranchiseeFW.FindControl(controlId);
        //get the value
        return Convert.ToInt32(_tempDDList.SelectedValue.ToString());
    }

    public void UpdateFranchiseeDetails()
    {
        //TB Fields
        string LastName = default(System.String);
        string FirstName = default(System.String);
        string Title = default(System.String);
        string OfficePhone = default(System.String);
        string MobilePhone = default(System.String);
        string Fax = default(System.String);
        string WorkEmail = default(System.String);
        string WorkAddress = default(System.String);
        string WorkCity = default(System.String);
        string WorkZip = default(System.String);
        string SpouseName = default(System.String);
        string YearsWithCompany = default(System.String);
        string HomePhone = default(System.String);
        string AlternateEmail = default(System.String);
        string HomeAddress = default(System.String);
        string HomeCity = default(System.String);
        string HomeZip = default(System.String);
        string FranchiseName = default(System.String);

        string Territory = default(System.String);
        string BusinessFocusArea = default(System.String);
        string ClosestMetro = default(System.String);

        //Date Fields        
        System.DateTime InitialContractDate = default(System.DateTime);
        System.DateTime RenewalDate = default(System.DateTime);
        System.DateTime ContractFormDate = default(System.DateTime);
        System.DateTime DHSAwardDate = default(System.DateTime);
        System.DateTime InitialTrngDate = default(System.DateTime);
        System.DateTime BirthDay = default(System.DateTime);
        System.DateTime Anniversary = default(System.DateTime);
        //DDL Fields
        int SandlerRoleID = default(System.Int32);
        int IsPartOfMasterFranchisee = default(System.Int32);
        int MasterFranchiseeID = default(System.Int32);
        int IsCanPrintLocally = default(System.Int32);
        int IsBuyFromCustomer = default(System.Int32);
        int IsFixedPricePurchase = default(System.Int32);
        int CostPlusAmountID = default(System.Int32);
        int IsBehindInTerDev = default(System.Int32);
        int BehindAmountID = default(System.Int32);
        int CoachID = default(System.Int32);
        int AwardLevelID = default(System.Int32);
        int PurchaseLevelID = default(System.Int32);
        int PrimaryBusinessID = default(System.Int32);
        int CertifiedLevelID = default(System.Int32);
        int IsContractorsPermitted = default(System.Int32);
        int IsKOLMember = default(System.Int32);
        int IsAdvBoard = default(System.Int32);
        int IsMktgCommittee = default(System.Int32);
        int IsUsingSandlerCRM = default(System.Int32);
        int IsDHSAwardWinner = default(System.Int32);
        int IsSandlerMailRequired = default(System.Int32);
        int IsReqToSubmitFinancials = default(System.Int32);
        int IsRepAgreementForGlobalAcct = default(System.Int32);
        int WorkStateID = default(System.Int32);
        int WorkCountryID = default(System.Int32);
        int HomeStateID = default(System.Int32);
        int HomeCountryID = default(System.Int32);
        int IsSameHomeAddress = default(System.Int32);
        
        #region Data Collection
        SandlerRoleID = GetDropdownListBoxData("ddlSandlerRole");
        IsPartOfMasterFranchisee = GetDropdownListBoxData("ddlPartOfMF");
        MasterFranchiseeID = GetDropdownListBoxData("ddlMasterFranchisee");
        IsCanPrintLocally = GetDropdownListBoxData("ddlCanPrintLocally");
        IsBuyFromCustomer = GetDropdownListBoxData("ddlBuyFromCustomer");
        IsFixedPricePurchase = GetDropdownListBoxData("ddlFixedPricePurchase");
        CostPlusAmountID = GetDropdownListBoxData("ddlCostPlusAmt");
        IsBehindInTerDev = GetDropdownListBoxData("ddlBehindTerDev");
        BehindAmountID = GetDropdownListBoxData("ddlBehindAmt");
        CoachID = GetDropdownListBoxData("ddlCoach");
        AwardLevelID = GetDropdownListBoxData("ddlAwardLevel");
        PurchaseLevelID = GetDropdownListBoxData("ddlPurchaseLevel");
        PrimaryBusinessID = GetDropdownListBoxData("ddlPrimaryBusiness");
        CertifiedLevelID = GetDropdownListBoxData("ddlCertifiedLevel");
        IsContractorsPermitted = GetDropdownListBoxData("ddlContrPerm");
        IsKOLMember = GetDropdownListBoxData("ddlKOLMember");
        IsAdvBoard = GetDropdownListBoxData("ddlAdvBoard");
        IsMktgCommittee = GetDropdownListBoxData("ddlMktgComt");
        IsUsingSandlerCRM = GetDropdownListBoxData("ddlSandlerCRM");
        IsDHSAwardWinner = GetDropdownListBoxData("ddlDHSAward");
        IsSandlerMailRequired = GetDropdownListBoxData("ddlSandlerMail");
        IsReqToSubmitFinancials = GetDropdownListBoxData("ddlReqFinancials");
        IsRepAgreementForGlobalAcct = GetDropdownListBoxData("ddlRepAgreement");
        WorkStateID = GetDropdownListBoxData("ddlWorkState");
        WorkCountryID = GetDropdownListBoxData("ddlWorkCountry");
        HomeStateID = GetDropdownListBoxData("ddlHomeState");
        HomeCountryID = GetDropdownListBoxData("ddlHomeCountry");
        IsSameHomeAddress = GetDropdownListBoxData("ddlSameHomeAdrs");
        
        //For LastName 
        LastName = GetTextBoxData("LastNameTB");
        //For FirstName 
        FirstName = GetTextBoxData("FirstNameTB");
        //For Title 
        Title = GetTextBoxData("TitleTB");
        //For OfficePhone 
        OfficePhone = GetTextBoxData("txtOfficePhone");
        //For MobilePhone 
        MobilePhone = GetTextBoxData("txtMobilePhone");
        //For Fax 
        Fax = GetTextBoxData("txtFax");
        //For WorkEmail 
        WorkEmail = GetTextBoxData("txtWorkEmail");
        //For WorkAddress 
        WorkAddress = GetTextBoxData("txtWorkAddress");
        //For WorkCity
        WorkCity = GetTextBoxData("txtWorkCity");
        //For WorkZip 
        WorkZip = GetTextBoxData("txtWorkZip");
        //For SpouseName 
        SpouseName = GetTextBoxData("txtSpouseName");
        //For Years With Company 
        YearsWithCompany = GetTextBoxData("txtYrsCompany");
        //For HomePhone 
        HomePhone = GetTextBoxData("txtHomePhone");
        //For AlternateEmail 
        AlternateEmail = GetTextBoxData("txtAlternateEmail");
        //For HomeAddress 
        HomeAddress = GetTextBoxData("txtHomeAddress");
        //For HomeCity 
        HomeCity = GetTextBoxData("txtHomeCity");
        //For HomeZip 
        HomeZip = GetTextBoxData("txtHomeZip");
        //For Franchise Name
        FranchiseName = GetTextBoxData("txtFranchiseName");
        //For Territory
        Territory = GetTextBoxData("txtTerritory");
        //For BusinessFocusArea
        BusinessFocusArea = GetTextBoxData("txtBusinessFocusArea");
        //For ClosestMetro
        ClosestMetro = GetTextBoxData("txtClosestMetro");
        //For Initial Contract Date
        {
            TextBox IntCntDateCal = new TextBox();
            IntCntDateCal = (TextBox)FranchiseeFW.FindControl("InitialContractDate");
            if ((IntCntDateCal != null))
            {
                if (!string.IsNullOrEmpty(IntCntDateCal.Text))
                {
                    InitialContractDate = Convert.ToDateTime(IntCntDateCal.Text.Trim());
                }
            }
        }
        //For Renewal Date
        {
            TextBox RnwDateCal = new TextBox();
            RnwDateCal = (TextBox)FranchiseeFW.FindControl("RenewalDate");
            if ((RnwDateCal != null))
            {
                if (!string.IsNullOrEmpty(RnwDateCal.Text))
                {
                    RenewalDate = Convert.ToDateTime(RnwDateCal.Text.Trim());
                }
            }
        }
        //For Contract Form Date
        {
            TextBox CntFormDateCal = new TextBox();
            CntFormDateCal = (TextBox)FranchiseeFW.FindControl("ContractFormDate");
            if ((CntFormDateCal != null))
            {
                if (!string.IsNullOrEmpty(CntFormDateCal.Text))
                {
                    ContractFormDate = Convert.ToDateTime(CntFormDateCal.Text.Trim());
                }
            }
        }
        //For DHS Award Date
        {
            TextBox DHSAwardDateCal = new TextBox();
            DHSAwardDateCal = (TextBox)FranchiseeFW.FindControl("DHSAwardDate");
            if ((DHSAwardDateCal != null))
            {
                if (!string.IsNullOrEmpty(DHSAwardDateCal.Text))
                {
                    DHSAwardDate = Convert.ToDateTime(DHSAwardDateCal.Text.Trim());
                }
            }
        }
        //For Initial Trng Date
        {
            TextBox IntTrngDateCal = new TextBox();
            IntTrngDateCal = (TextBox)FranchiseeFW.FindControl("IntTrngDate");
            if ((IntTrngDateCal != null))
            {
                if (!string.IsNullOrEmpty(IntTrngDateCal.Text))
                {
                    InitialTrngDate = Convert.ToDateTime(IntTrngDateCal.Text.Trim());
                }
            }
        }
        //For BirthDay
        {
            TextBox BirthDayDateCal = new TextBox();
            BirthDayDateCal = (TextBox)FranchiseeFW.FindControl("BirthDay");
            if ((BirthDayDateCal != null))
            {
                if (!string.IsNullOrEmpty(BirthDayDateCal.Text))
                {
                    BirthDay = Convert.ToDateTime(BirthDayDateCal.Text.Trim());
                }
            }
        }
        //For Anniversary
        {
            TextBox AnniversaryDateCal = new TextBox();
            AnniversaryDateCal = (TextBox)FranchiseeFW.FindControl("Anniversary");
            if ((AnniversaryDateCal != null))
            {
                if (!string.IsNullOrEmpty(AnniversaryDateCal.Text))
                {
                    Anniversary = Convert.ToDateTime(AnniversaryDateCal.Text.Trim());
                }
            }
        }
        #endregion

        //Now make the Update

         //Get the User Session
        SandlerRepositories.FranchiseesRepository frRepository = new SandlerRepositories.FranchiseesRepository();
        //Update Franchisee Information
        frRepository.Update(LastName, FirstName, Title, OfficePhone, MobilePhone, Fax, WorkEmail, WorkAddress, WorkCity,
         WorkZip, SpouseName, Convert.ToInt32(YearsWithCompany), HomePhone,
         AlternateEmail, HomeAddress, HomeCity,
         HomeZip, InitialContractDate, RenewalDate,
         ContractFormDate, DHSAwardDate,
         InitialTrngDate, BirthDay, Anniversary,
         SandlerRoleID, IsPartOfMasterFranchisee, MasterFranchiseeID,
         IsCanPrintLocally, IsBuyFromCustomer, IsFixedPricePurchase,
         CostPlusAmountID, IsBehindInTerDev, BehindAmountID,
         CoachID, AwardLevelID, PurchaseLevelID, PrimaryBusinessID,
         CertifiedLevelID, IsContractorsPermitted, IsKOLMember,
         IsAdvBoard, IsMktgCommittee, IsUsingSandlerCRM,
         IsDHSAwardWinner, IsSandlerMailRequired, IsReqToSubmitFinancials,
         IsRepAgreementForGlobalAcct, WorkStateID, WorkCountryID,
         HomeStateID, HomeCountryID, IsSameHomeAddress, Convert.ToInt32(hidFranchiseeID.Value), FranchiseName,
         Territory,BusinessFocusArea,ClosestMetro);

        //Inform the Message
        LblStatus.Text = "Franchisee information updated successfully!";
        LblStatus1.Text = "Franchisee information updated successfully!";

    }

    public string ManageDateTimeValue(string _DatevalueFromDB)
    {
        if (_DatevalueFromDB == "1/1/1900 12:00:00 AM")
        {
            _DatevalueFromDB = default(System.String);
        }
        else
        {
            _DatevalueFromDB = _DatevalueFromDB.Replace("12:00:00 AM", "");
        }
        //send back
        return _DatevalueFromDB;
    }

    //protected void ddlPartOfMF_SelectedIndexChanged(object sender, System.EventArgs e)
    //{
        ////For Billing Adrs DDL
        //DropDownList ddlPartOfMFDropDownList = new DropDownList();
        //ddlPartOfMFDropDownList = (DropDownList)FranchiseeFW.FindControl("ddlPartOfMF");
        //if (ddlPartOfMFDropDownList != null)
        //{
        //    if (ddlPartOfMFDropDownList.SelectedValue == "0")
        //    {
        //        //Make them default
        //        (FranchiseeFW.FindControl("ddlMasterFranchisee") as DropDownList).SelectedIndex = -1;
        //        //And Now Enabled False
        //        (FranchiseeFW.FindControl("ddlMasterFranchisee") as DropDownList).Enabled = false;
        //    }
        //    else
        //    {
        //        //Make them default
        //        (FranchiseeFW.FindControl("ddlMasterFranchisee") as DropDownList).SelectedIndex = -1;
        //        //And Now Enabled False
        //        (FranchiseeFW.FindControl("ddlMasterFranchisee") as DropDownList).Enabled = true;
                
        //    }
        //}
    //}

    protected void FranchiseeFW_DataBound(object sender, EventArgs e)
    {
        //DHS Award Date
        Label dhsAwardDateLabel = new Label();
        dhsAwardDateLabel = (Label)FranchiseeFW.FindControl("lblDHSAwardDate");
        if (dhsAwardDateLabel != null)
        {
            dhsAwardDateLabel.Text = ManageDateTimeValue(dhsAwardDateLabel.Text);
        }
        //Initial Trng Date
        Label intTrngDateLabel = new Label();
        intTrngDateLabel = (Label)FranchiseeFW.FindControl("lblInitialTrngDate");
        if (intTrngDateLabel != null)
        {
            intTrngDateLabel.Text = ManageDateTimeValue(intTrngDateLabel.Text);
        }
        //Anniversary
        Label anvrsryLabel = new Label();
        anvrsryLabel = (Label)FranchiseeFW.FindControl("lblAnniversary");
        if (anvrsryLabel != null)
        {
            anvrsryLabel.Text = ManageDateTimeValue(anvrsryLabel.Text);
        }
        //Birthday
        Label bdayLabel = new Label();
        bdayLabel = (Label)FranchiseeFW.FindControl("lblBirthday");
        if (bdayLabel != null)
        {
            bdayLabel.Text = ManageDateTimeValue(bdayLabel.Text);
        }
        //Initial Contract Date
        Label intcntdateLabel = new Label();
        intcntdateLabel = (Label)FranchiseeFW.FindControl("lblInitialContractDate");
        if (intcntdateLabel != null)
        {
            intcntdateLabel.Text = ManageDateTimeValue(intcntdateLabel.Text);
        }
        //Renewal Date
        Label rnwaldateLabel = new Label();
        rnwaldateLabel = (Label)FranchiseeFW.FindControl("lblRenewalDate");
        if (rnwaldateLabel != null)
        {
            rnwaldateLabel.Text = ManageDateTimeValue(rnwaldateLabel.Text);
        }
        //Contract Form Date
        Label cntformdateLabel = new Label();
        cntformdateLabel = (Label)FranchiseeFW.FindControl("lblContractFormDate");
        if (cntformdateLabel != null)
        {
            cntformdateLabel.Text = ManageDateTimeValue(cntformdateLabel.Text);
        }
        //For DHS Award Date
        TextBox DHSAwardDateCal = new TextBox();
        DHSAwardDateCal = (TextBox)FranchiseeFW.FindControl("DHSAwardDate");
        if (DHSAwardDateCal != null)
        {
            DHSAwardDateCal.Text = ManageDateTimeValue(DHSAwardDateCal.Text);
        }
        //For DHS Award Date
        TextBox IntTrngDateCal = new TextBox();
        IntTrngDateCal = (TextBox)FranchiseeFW.FindControl("IntTrngDate");
        if (IntTrngDateCal != null)
        {
            IntTrngDateCal.Text = ManageDateTimeValue(IntTrngDateCal.Text);
        }
        //For Birthday
        TextBox BirthDayCal = new TextBox();
        BirthDayCal = (TextBox)FranchiseeFW.FindControl("BirthDay");
        if (BirthDayCal != null)
        {
            BirthDayCal.Text = ManageDateTimeValue(BirthDayCal.Text);
        }
        //For Anniversary
        TextBox AnniversaryCal = new TextBox();
        AnniversaryCal = (TextBox)FranchiseeFW.FindControl("Anniversary");
        if (AnniversaryCal != null)
        {
            AnniversaryCal.Text = ManageDateTimeValue(AnniversaryCal.Text);
        }
        //For Work State DDL
        DropDownList ddlWorkStateDDList = new DropDownList();
        ddlWorkStateDDList = (DropDownList)FranchiseeFW.FindControl("ddlWorkState");
        if (ddlWorkStateDDList != null)
        {
            ListItem selectItem = new ListItem("-- Select Work State --", "0");
            ddlWorkStateDDList.Items.Insert(0, selectItem);
            //Check if Work State is not empty
            if (string.IsNullOrEmpty(hidWorkStateName.Value))
            {
                ddlWorkStateDDList.SelectedIndex = -1;
            }
        }
        //For Work Country DDL
        DropDownList ddlWorkCountryDDList = new DropDownList();
        ddlWorkCountryDDList = (DropDownList)FranchiseeFW.FindControl("ddlWorkCountry");
        if (ddlWorkCountryDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Work Country--", "0");
            ddlWorkCountryDDList.Items.Insert(0, selectItem);
            //Check if Work Country is not empty
            if (string.IsNullOrEmpty(hidWorkCountryName.Value))
            {
                ddlWorkCountryDDList.SelectedIndex = -1;
            }
        }
        //For Home State DDL
        DropDownList ddlHomeStateDDList = new DropDownList();
        ddlHomeStateDDList = (DropDownList)FranchiseeFW.FindControl("ddlHomeState");
        if (ddlHomeStateDDList != null)
        {
            ListItem selectItem = new ListItem("-- Select Home State --", "0");
            ddlHomeStateDDList.Items.Insert(0, selectItem);
            //Check if Home State is not empty
            if (string.IsNullOrEmpty(hidHomeStateName.Value))
            {
                ddlHomeStateDDList.SelectedIndex = -1;
            }
        }
        //For Home Country DDL
        DropDownList ddlHomeCountryDDList = new DropDownList();
        ddlHomeCountryDDList = (DropDownList)FranchiseeFW.FindControl("ddlHomeCountry");
        if (ddlHomeCountryDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Home Country--", "0");
            ddlHomeCountryDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidHomeCountryName.Value))
            {
                ddlHomeCountryDDList.SelectedIndex = -1;
            }
        }
        //For Sandler Role DDL
        DropDownList ddlSandlerRoleDDList = new DropDownList();
        ddlSandlerRoleDDList = (DropDownList)FranchiseeFW.FindControl("ddlSandlerRole");
        if (ddlSandlerRoleDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Sandler Role--", "0");
            ddlSandlerRoleDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidSandlerRoleName.Value))
            {
                ddlSandlerRoleDDList.SelectedIndex = -1;
            }
        }
        //For Master Franchisee DDL
        DropDownList ddlMasterFranchiseeDDList = new DropDownList();
        ddlMasterFranchiseeDDList = (DropDownList)FranchiseeFW.FindControl("ddlMasterFranchisee");
        if (ddlMasterFranchiseeDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Master Franchisee--", "0");
            ddlMasterFranchiseeDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidMasterFranchiseeName.Value))
            {
                ddlMasterFranchiseeDDList.SelectedIndex = -1;
            }
        }
        //Cost Plus Amount DDL
        DropDownList ddlCostPlusAmtDDList = new DropDownList();
        ddlCostPlusAmtDDList = (DropDownList)FranchiseeFW.FindControl("ddlCostPlusAmt");
        if (ddlCostPlusAmtDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Cost + Amount--", "0");
            ddlCostPlusAmtDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidCostPlusAmtName.Value))
            {
                ddlCostPlusAmtDDList.SelectedIndex = -1;
            }
        }
        //Behind Amount DDL
        DropDownList ddlBehindAmtDDList = new DropDownList();
        ddlBehindAmtDDList = (DropDownList)FranchiseeFW.FindControl("ddlBehindAmt");
        if (ddlBehindAmtDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Behind Amount--", "0");
            ddlBehindAmtDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidBehindAmtName.Value))
            {
                ddlBehindAmtDDList.SelectedIndex = -1;
            }
        }
        //Award Level DDL
        DropDownList ddlAwardLevelDDList = new DropDownList();
        ddlAwardLevelDDList = (DropDownList)FranchiseeFW.FindControl("ddlAwardLevel");
        if (ddlAwardLevelDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Award Level--", "0");
            ddlAwardLevelDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidAwardLevelName.Value))
            {
                ddlAwardLevelDDList.SelectedIndex = -1;
            }
        }
        //Purchase Level DDL
        DropDownList ddlPurchaseLevelDDList = new DropDownList();
        ddlPurchaseLevelDDList = (DropDownList)FranchiseeFW.FindControl("ddlPurchaseLevel");
        if (ddlPurchaseLevelDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Purchase Level--", "0");
            ddlPurchaseLevelDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidPurchaseLevelName.Value))
            {
                ddlPurchaseLevelDDList.SelectedIndex = -1;
            }
        }
        //Certified Level DDL
        DropDownList ddlCertifiedLevelDDList = new DropDownList();
        ddlCertifiedLevelDDList = (DropDownList)FranchiseeFW.FindControl("ddlCertifiedLevel");
        if (ddlCertifiedLevelDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Certified Level--", "0");
            ddlCertifiedLevelDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidCertifiedLevelName.Value))
            {
                ddlCertifiedLevelDDList.SelectedIndex = -1;
            }
        }
        //Primary Business DDL
        DropDownList ddlPrimaryBusinessDDList = new DropDownList();
        ddlPrimaryBusinessDDList = (DropDownList)FranchiseeFW.FindControl("ddlPrimaryBusiness");
        if (ddlPrimaryBusinessDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Primary Business--", "0");
            ddlPrimaryBusinessDDList.Items.Insert(0, selectItem);
            //Check if Home Country is not empty
            if (string.IsNullOrEmpty(hidPrimaryBusinessName.Value))
            {
                ddlPrimaryBusinessDDList.SelectedIndex = -1;
            }
        }
        //Initial Contract Date
        TextBox InitialContractDateCal = new TextBox();
        InitialContractDateCal = (TextBox)FranchiseeFW.FindControl("InitialContractDate");
        if (InitialContractDateCal != null)
        {
            InitialContractDateCal.Text = ManageDateTimeValue(InitialContractDateCal.Text);
        }
        //Renewal Date
        TextBox RenewalDateCal = new TextBox();
        RenewalDateCal = (TextBox)FranchiseeFW.FindControl("RenewalDate");
        if (RenewalDateCal != null)
        {
            RenewalDateCal.Text = ManageDateTimeValue(RenewalDateCal.Text);
        }
        //Contract Form Date
        TextBox ContractFormDateCal = new TextBox();
        ContractFormDateCal = (TextBox)FranchiseeFW.FindControl("ContractFormDate");
        if (ContractFormDateCal != null)
        {
            ContractFormDateCal.Text = ManageDateTimeValue(ContractFormDateCal.Text);
        }
    }
}