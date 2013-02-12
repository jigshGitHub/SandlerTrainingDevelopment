﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using SandlerRepositories;
using System.Data;
using SandlerModels.DataIntegration;

public partial class CRM_HomeOffice_Search : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["FranchiseeSearchCount"] = null;
            Session["FranchiseeSearchCriteria"] = null;

        }
    }
    protected void FranchiseeFW_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        //Clear All data entered by the User
        lblResult.Text = "";
    }

    protected void FranchiseeFW_DataBound(object sender, EventArgs e)
    {
        
        //For Work State DDL
        DropDownList ddlWorkStateDDList = new DropDownList();
        ddlWorkStateDDList = (DropDownList)FranchiseeFW.FindControl("ddlWorkState");
        if (ddlWorkStateDDList != null)
        {
            ListItem selectItem = new ListItem("-- Select Work State --", "0");
            ddlWorkStateDDList.Items.Insert(0, selectItem);
            
        }
        //For Work Country DDL
        DropDownList ddlWorkCountryDDList = new DropDownList();
        ddlWorkCountryDDList = (DropDownList)FranchiseeFW.FindControl("ddlWorkCountry");
        if (ddlWorkCountryDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Work Country--", "0");
            ddlWorkCountryDDList.Items.Insert(0, selectItem);
            
        }
        //For Home State DDL
        DropDownList ddlHomeStateDDList = new DropDownList();
        ddlHomeStateDDList = (DropDownList)FranchiseeFW.FindControl("ddlHomeState");
        if (ddlHomeStateDDList != null)
        {
            ListItem selectItem = new ListItem("-- Select Home State --", "0");
            ddlHomeStateDDList.Items.Insert(0, selectItem);
            
        }
        //For Home Country DDL
        DropDownList ddlHomeCountryDDList = new DropDownList();
        ddlHomeCountryDDList = (DropDownList)FranchiseeFW.FindControl("ddlHomeCountry");
        if (ddlHomeCountryDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Home Country--", "0");
            ddlHomeCountryDDList.Items.Insert(0, selectItem);
            
        }
        //For Sandler Role DDL
        DropDownList ddlSandlerRoleDDList = new DropDownList();
        ddlSandlerRoleDDList = (DropDownList)FranchiseeFW.FindControl("ddlSandlerRole");
        if (ddlSandlerRoleDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Sandler Role--", "0");
            ddlSandlerRoleDDList.Items.Insert(0, selectItem);
            
        }
        //For Master Franchisee DDL
        DropDownList ddlMasterFranchiseeDDList = new DropDownList();
        ddlMasterFranchiseeDDList = (DropDownList)FranchiseeFW.FindControl("ddlMasterFranchisee");
        if (ddlMasterFranchiseeDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Master Franchisee--", "0");
            ddlMasterFranchiseeDDList.Items.Insert(0, selectItem);
            
        }
        //Cost Plus Amount DDL
        DropDownList ddlCostPlusAmtDDList = new DropDownList();
        ddlCostPlusAmtDDList = (DropDownList)FranchiseeFW.FindControl("ddlCostPlusAmt");
        if (ddlCostPlusAmtDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Cost + Amount--", "0");
            ddlCostPlusAmtDDList.Items.Insert(0, selectItem);
            
        }
        //Behind Amount DDL
        DropDownList ddlBehindAmtDDList = new DropDownList();
        ddlBehindAmtDDList = (DropDownList)FranchiseeFW.FindControl("ddlBehindAmt");
        if (ddlBehindAmtDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Behind Amount--", "0");
            ddlBehindAmtDDList.Items.Insert(0, selectItem);
            
        }
        //Award Level DDL
        DropDownList ddlAwardLevelDDList = new DropDownList();
        ddlAwardLevelDDList = (DropDownList)FranchiseeFW.FindControl("ddlAwardLevel");
        if (ddlAwardLevelDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Award Level--", "0");
            ddlAwardLevelDDList.Items.Insert(0, selectItem);
            
        }
        //Purchase Level DDL
        DropDownList ddlPurchaseLevelDDList = new DropDownList();
        ddlPurchaseLevelDDList = (DropDownList)FranchiseeFW.FindControl("ddlPurchaseLevel");
        if (ddlPurchaseLevelDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Purchase Level--", "0");
            ddlPurchaseLevelDDList.Items.Insert(0, selectItem);
            
        }
        //Certified Level DDL
        DropDownList ddlCertifiedLevelDDList = new DropDownList();
        ddlCertifiedLevelDDList = (DropDownList)FranchiseeFW.FindControl("ddlCertifiedLevel");
        if (ddlCertifiedLevelDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Certified Level--", "0");
            ddlCertifiedLevelDDList.Items.Insert(0, selectItem);
            
        }
        //Primary Business DDL
        DropDownList ddlPrimaryBusinessDDList = new DropDownList();
        ddlPrimaryBusinessDDList = (DropDownList)FranchiseeFW.FindControl("ddlPrimaryBusiness");
        if (ddlPrimaryBusinessDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Primary Business--", "0");
            ddlPrimaryBusinessDDList.Items.Insert(0, selectItem);
            
        }
        
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


    public int GetDropdownListBoxData(string controlId)
    {
        DropDownList _tempDDList = new DropDownList();
        _tempDDList = (DropDownList)FranchiseeFW.FindControl(controlId);
        //get the value
        return Convert.ToInt32(_tempDDList.SelectedValue.ToString());
    }

    protected void FranchiseeFW_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //let us have search obj and store all user selection in it
        bool IsCriteriaExist = false;
        SandlerModels.DataIntegration.Franchisees searchObj = new SandlerModels.DataIntegration.Franchisees();
        //TB Fields
        string Name = default(System.String);
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

        SandlerRoleID = GetDropdownListBoxData("ddlSandlerRole");
        if (SandlerRoleID != 0)
        {
            IsCriteriaExist = true;
            searchObj.SandlerRoleId = SandlerRoleID.ToString();
        }
        else
        {
            searchObj.SandlerRoleId = "";
        }
        
        MasterFranchiseeID = GetDropdownListBoxData("ddlMasterFranchisee");
        if (MasterFranchiseeID != 0)
        {
            IsCriteriaExist = true;
            searchObj.MasterFranchiseeId = MasterFranchiseeID.ToString();
        }
        else
        {
            searchObj.MasterFranchiseeId = "";
        }
        
        IsBuyFromCustomer = GetDropdownListBoxData("ddlBuyFromCustomer");
        if (IsBuyFromCustomer != 0)
        {
            IsCriteriaExist = true;
            searchObj.IsBuyFromCustomer = IsBuyFromCustomer.ToString();
        }
        else
        {
            searchObj.IsBuyFromCustomer = "";
        }
        
        IsFixedPricePurchase = GetDropdownListBoxData("ddlFixedPricePurchase");
        if (IsFixedPricePurchase != 0)
        {
            IsCriteriaExist = true;
            searchObj.IsFixedPricePurchase = IsFixedPricePurchase.ToString();
        }
        else
        {
            searchObj.IsFixedPricePurchase = "";
        }

        CostPlusAmountID = GetDropdownListBoxData("ddlCostPlusAmt");
        if (CostPlusAmountID != 0)
        {
            IsCriteriaExist = true;
            searchObj.CostPlusAmountId = CostPlusAmountID.ToString();
        }
        else
        {
            searchObj.CostPlusAmountId = "";
        }

        IsBehindInTerDev = GetDropdownListBoxData("ddlBehindTerDev");
        if (IsBehindInTerDev != 0)
        {
            IsCriteriaExist = true;
            searchObj.IsBehindInTerDev = IsBehindInTerDev.ToString();
        }
        else
        {
            searchObj.IsBehindInTerDev = "";
        }

        BehindAmountID = GetDropdownListBoxData("ddlBehindAmt");
        if (BehindAmountID != 0)
        {
            IsCriteriaExist = true;
            searchObj.BehindAmtId = BehindAmountID.ToString();
        }
        else
        {
            searchObj.BehindAmtId = "";
        }
        
        CoachID = GetDropdownListBoxData("ddlCoach");
        if (CoachID != 0)
        {
            IsCriteriaExist = true;
            searchObj.CoachId = CoachID.ToString();
        }
        else
        {
            searchObj.CoachId = "";
        }

        AwardLevelID = GetDropdownListBoxData("ddlAwardLevel");
        if (AwardLevelID != 0)
        {
            IsCriteriaExist = true;
            searchObj.AwardLevelId = AwardLevelID.ToString();
        }
        else
        {
            searchObj.AwardLevelId = "";
        }

        PurchaseLevelID = GetDropdownListBoxData("ddlPurchaseLevel");
        if (PurchaseLevelID != 0)
        {
            IsCriteriaExist = true;
            searchObj.PurchaseLevelId = PurchaseLevelID.ToString();
        }
        else
        {
            searchObj.PurchaseLevelId = "";
        }
        
        PrimaryBusinessID = GetDropdownListBoxData("ddlPrimaryBusiness");
        if (PrimaryBusinessID != 0)
        {
            IsCriteriaExist = true;
            searchObj.PrimaryBusinessId = PrimaryBusinessID.ToString();
        }
        else
        {
            searchObj.PrimaryBusinessId = "";
        }
        
        CertifiedLevelID = GetDropdownListBoxData("ddlCertifiedLevel");
        if (CertifiedLevelID != 0)
        {
            IsCriteriaExist = true;
            searchObj.CertifiedLevelId = CertifiedLevelID.ToString();
        }
        else
        {
            searchObj.CertifiedLevelId = "";
        }
        
        WorkStateID = GetDropdownListBoxData("ddlWorkState");
        if (WorkStateID != 0)
        {
            IsCriteriaExist = true;
            searchObj.WorkState = WorkStateID.ToString();
        }
        else
        {
            searchObj.WorkState = "";
        }
        
        WorkCountryID = GetDropdownListBoxData("ddlWorkCountry");
        if (WorkCountryID != 0)
        {
            IsCriteriaExist = true;
            searchObj.WorkCountry = WorkCountryID.ToString();
        }
        else
        {
            searchObj.WorkCountry = "";
        }
        
        HomeStateID = GetDropdownListBoxData("ddlHomeState");
        if (HomeStateID != 0)
        {
            IsCriteriaExist = true;
            searchObj.HomeState = HomeStateID.ToString();
        }
        else
        {
            searchObj.HomeState = "";
        }
        
        HomeCountryID = GetDropdownListBoxData("ddlHomeCountry");
        if (HomeCountryID != 0)
        {
            IsCriteriaExist = true;
            searchObj.HomeCountry = HomeCountryID.ToString();
        }
        else
        {
            searchObj.HomeCountry = "";
        }

        IsPartOfMasterFranchisee = GetDropdownListBoxData("ddlPartOfMF");
        searchObj.IsMasterFranchiseeExists = IsPartOfMasterFranchisee.ToString();
        
        IsCanPrintLocally = GetDropdownListBoxData("ddlCanPrintLocally");
        searchObj.IsCanPrintLocally = IsCanPrintLocally.ToString();

        IsContractorsPermitted = GetDropdownListBoxData("ddlContrPerm");
        searchObj.IsContractorPermitted = IsContractorsPermitted.ToString();

        IsKOLMember = GetDropdownListBoxData("ddlKOLMember");
        searchObj.IsKOLMember = IsKOLMember.ToString();

        IsAdvBoard = GetDropdownListBoxData("ddlAdvBoard");
        searchObj.IsAdvBoard = IsAdvBoard.ToString(); 
        
        IsMktgCommittee = GetDropdownListBoxData("ddlMktgComt");
        searchObj.IsMktgCommittee = IsMktgCommittee.ToString(); 
        
        IsUsingSandlerCRM = GetDropdownListBoxData("ddlSandlerCRM");
        searchObj.IsUsingSandlerCRM = IsUsingSandlerCRM.ToString(); 
        
        IsDHSAwardWinner = GetDropdownListBoxData("ddlDHSAward");
        searchObj.IsDHSAwardWinner = IsDHSAwardWinner.ToString(); 
        
        IsSandlerMailRequired = GetDropdownListBoxData("ddlSandlerMail");
        searchObj.IsSandlerMailRequired = IsSandlerMailRequired.ToString(); 
        
        IsReqToSubmitFinancials = GetDropdownListBoxData("ddlReqFinancials");
        searchObj.IsReqToSubmitFinancial = IsReqToSubmitFinancials.ToString(); 
        
        IsRepAgreementForGlobalAcct = GetDropdownListBoxData("ddlRepAgreement");
        searchObj.IsRepAgreement = IsRepAgreementForGlobalAcct.ToString();

        IsSameHomeAddress = GetDropdownListBoxData("ddlSameHomeAdrs");
        searchObj.IsSameHomeAddress = IsSameHomeAddress.ToString();
        
        //For Initial Contract Date
        {
            TextBox InitialContractDateCal = new TextBox();
            InitialContractDateCal = (TextBox)FranchiseeFW.FindControl("InitialContractDate");
            if ((InitialContractDateCal != null))
            {
                if (!string.IsNullOrEmpty(InitialContractDateCal.Text))
                {
                    InitialContractDate = Convert.ToDateTime(InitialContractDateCal.Text.Trim());
                    searchObj.InitialContractDate = InitialContractDate;
                    IsCriteriaExist = true;
                }
           }
        }
        //For Renewal Date
        {
            TextBox RenewalDateCal = new TextBox();
            RenewalDateCal = (TextBox)FranchiseeFW.FindControl("RenewalDate");
            if ((RenewalDateCal != null))
            {
                if (!string.IsNullOrEmpty(RenewalDateCal.Text))
                {
                    RenewalDate = Convert.ToDateTime(RenewalDateCal.Text.Trim());
                    searchObj.RenewalDate = RenewalDate;
                    IsCriteriaExist = true;
                }
            }
        }
        //For Contract Form Date
        {
            TextBox ContractFormDateCal = new TextBox();
            ContractFormDateCal = (TextBox)FranchiseeFW.FindControl("ContractFormDate");
            if ((ContractFormDateCal != null))
            {
                if (!string.IsNullOrEmpty(ContractFormDateCal.Text))
                {
                    ContractFormDate = Convert.ToDateTime(ContractFormDateCal.Text.Trim());
                    searchObj.ContractFormDate = ContractFormDate;
                    IsCriteriaExist = true;
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
                    searchObj.DHSAwardDate = DHSAwardDate;
                    IsCriteriaExist = true;
                }
            }
        }
        //For Int Trng Date
        {
            TextBox IntTrngDateCal = new TextBox();
            IntTrngDateCal = (TextBox)FranchiseeFW.FindControl("IntTrngDate");
            if ((IntTrngDateCal != null))
            {
                if (!string.IsNullOrEmpty(IntTrngDateCal.Text))
                {
                    InitialTrngDate = Convert.ToDateTime(IntTrngDateCal.Text.Trim());
                    searchObj.InitialTrngDate = InitialTrngDate;
                    IsCriteriaExist = true;
                }
            }
        }
        //For BirthDay
        {
            TextBox BirthDayCal = new TextBox();
            BirthDayCal = (TextBox)FranchiseeFW.FindControl("BirthDay");
            if ((BirthDayCal != null))
            {
                if (!string.IsNullOrEmpty(BirthDayCal.Text))
                {
                    BirthDay = Convert.ToDateTime(BirthDayCal.Text.Trim());
                    searchObj.BirthDay = BirthDay;
                    IsCriteriaExist = true;
                }
            }
        }
        //For Anniversary
        {
            TextBox AnniversaryCal = new TextBox();
            AnniversaryCal = (TextBox)FranchiseeFW.FindControl("Anniversary");
            if ((AnniversaryCal != null))
            {
                if (!string.IsNullOrEmpty(AnniversaryCal.Text))
                {
                    Anniversary = Convert.ToDateTime(AnniversaryCal.Text.Trim());
                    searchObj.Anniversary = Anniversary;
                    IsCriteriaExist = true;
                }
            }
        }


        //For Franchisee Name
        {
            TextBox FranchiseeNameTBBox = new TextBox();
            FranchiseeNameTBBox = (TextBox)FranchiseeFW.FindControl("FranchiseeNameTB");
            if ((FranchiseeNameTBBox != null))
            {
                Name = FranchiseeNameTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(Name))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Name = Name;
            }
        }
        //For Last Name
        {
            TextBox LastNameTBBox = new TextBox();
            LastNameTBBox = (TextBox)FranchiseeFW.FindControl("LastNameTB");
            if ((LastNameTBBox != null))
            {
                LastName = LastNameTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(LastName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.LastName = LastName;
            }
        }
        //For First Name
        {
            TextBox FirstNameTBBox = new TextBox();
            FirstNameTBBox = (TextBox)FranchiseeFW.FindControl("FirstNameTB");
            if ((FirstNameTBBox != null))
            {
                FirstName = FirstNameTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(FirstName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.FirstName = FirstName;
            }
        }
        //For Title
        {
            TextBox TitleTBBox = new TextBox();
            TitleTBBox = (TextBox)FranchiseeFW.FindControl("TitleTB");
            if ((TitleTBBox != null))
            {
                Title = TitleTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(Title))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Title = Title;
            }
        }
        //For OfficePhone
        {
            TextBox OfficePhoneTBBox = new TextBox();
            OfficePhoneTBBox = (TextBox)FranchiseeFW.FindControl("txtOfficePhone");
            if ((OfficePhoneTBBox != null))
            {
                OfficePhone = OfficePhoneTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(OfficePhone))
                {
                    IsCriteriaExist = true;
                }
                searchObj.OfficePhone = OfficePhone;
            }
        }
        //For MobilePhone
        {
            TextBox MobilePhoneTBBox = new TextBox();
            MobilePhoneTBBox = (TextBox)FranchiseeFW.FindControl("txtMobilePhone");
            if ((MobilePhoneTBBox != null))
            {
                MobilePhone = MobilePhoneTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(MobilePhone))
                {
                    IsCriteriaExist = true;
                }
                searchObj.MobilePhone = MobilePhone;
            }
        }
        //For Fax
        {
            TextBox FaxTBBox = new TextBox();
            FaxTBBox = (TextBox)FranchiseeFW.FindControl("txtFax");
            if ((FaxTBBox != null))
            {
                Fax = FaxTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(Fax))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Fax = Fax;
            }
        }
        //For Work Email
        {
            TextBox txtWorkEmailTBBox = new TextBox();
            txtWorkEmailTBBox = (TextBox)FranchiseeFW.FindControl("txtWorkEmail");
            if ((txtWorkEmailTBBox != null))
            {
                WorkEmail = txtWorkEmailTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(WorkEmail))
                {
                    IsCriteriaExist = true;
                }
                searchObj.WorkEmail = WorkEmail;
            }
        }
        //For Work Address
        {
            TextBox txtWorkAddressTBBox = new TextBox();
            txtWorkAddressTBBox = (TextBox)FranchiseeFW.FindControl("txtWorkAddress");
            if ((txtWorkAddressTBBox != null))
            {
                WorkAddress = txtWorkAddressTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(WorkAddress))
                {
                    IsCriteriaExist = true;
                }
                searchObj.WorkAddress = WorkAddress;
            }
        }
        //For Work City
        {
            TextBox txtWorkCityTBBox = new TextBox();
            txtWorkCityTBBox = (TextBox)FranchiseeFW.FindControl("txtWorkCity");
            if ((txtWorkCityTBBox != null))
            {
                WorkCity = txtWorkCityTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(WorkCity))
                {
                    IsCriteriaExist = true;
                }
                searchObj.WorkCity = WorkCity;
            }
        }
        //For Work Zip
        {
            TextBox txtWorkZipTBBox = new TextBox();
            txtWorkZipTBBox = (TextBox)FranchiseeFW.FindControl("txtWorkZip");
            if ((txtWorkZipTBBox != null))
            {
                WorkZip = txtWorkZipTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(WorkZip))
                {
                    IsCriteriaExist = true;
                }
                searchObj.WorkZip = WorkZip;
            }
        }
        //For Spouse Name
        {
            TextBox txtSpouseNameTBBox = new TextBox();
            txtSpouseNameTBBox = (TextBox)FranchiseeFW.FindControl("txtSpouseName");
            if ((txtSpouseNameTBBox != null))
            {
                SpouseName = txtSpouseNameTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(SpouseName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.SpouseName = SpouseName;
            }
        }
        //For Years with Company
        {
            TextBox txtYrsCompanyTBBox = new TextBox();
            txtYrsCompanyTBBox = (TextBox)FranchiseeFW.FindControl("txtYrsCompany");
            if ((txtYrsCompanyTBBox != null))
            {
                YearsWithCompany = txtYrsCompanyTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(YearsWithCompany))
                {
                    IsCriteriaExist = true;
                }
                searchObj.YearsWithCompany = YearsWithCompany;
            }
        }
        //For Home Phone
        {
            TextBox txtHomePhoneTBBox = new TextBox();
            txtHomePhoneTBBox = (TextBox)FranchiseeFW.FindControl("txtHomePhone");
            if ((txtHomePhoneTBBox != null))
            {
                HomePhone = txtHomePhoneTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(HomePhone))
                {
                    IsCriteriaExist = true;
                }
                searchObj.HomePhone = HomePhone;
            }
        }
        //For Alternate Email
        {
            TextBox txtAlternateEmailTBBox = new TextBox();
            txtAlternateEmailTBBox = (TextBox)FranchiseeFW.FindControl("txtAlternateEmail");
            if ((txtAlternateEmailTBBox != null))
            {
                AlternateEmail = txtAlternateEmailTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(AlternateEmail))
                {
                    IsCriteriaExist = true;
                }
                searchObj.AlternateEmail = AlternateEmail;
            }
        }
        //For Home Address
        {
            TextBox txtHomeAddressTBBox = new TextBox();
            txtHomeAddressTBBox = (TextBox)FranchiseeFW.FindControl("txtHomeAddress");
            if ((txtHomeAddressTBBox != null))
            {
                HomeAddress = txtHomeAddressTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(HomeAddress))
                {
                    IsCriteriaExist = true;
                }
                searchObj.HomeAddress = HomeAddress;
            }
        }
        //For Home City
        {
            TextBox txtHomeCityTBBox = new TextBox();
            txtHomeCityTBBox = (TextBox)FranchiseeFW.FindControl("txtHomeCity");
            if ((txtHomeCityTBBox != null))
            {
                HomeCity = txtHomeCityTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(HomeCity))
                {
                    IsCriteriaExist = true;
                }
                searchObj.HomeCity = HomeCity;
            }
        }
        //For Home Zip
        {
            TextBox txtHomeZipTBBox = new TextBox();
            txtHomeZipTBBox = (TextBox)FranchiseeFW.FindControl("txtHomeZip");
            if ((txtHomeZipTBBox != null))
            {
                HomeZip = txtHomeZipTBBox.Text.Trim();
                if (!string.IsNullOrEmpty(HomeZip))
                {
                    IsCriteriaExist = true;
                }
                searchObj.HomeZip = HomeZip;
            }
        }

        if (!IsCriteriaExist)
        {
            e.Cancel = true;
            lblResult.Text = "Please enter/select at lease one criteria for search.";
        }
        else
        {
            Session["FranchiseeSearchCriteria"] = searchObj;
            //Now first check if data is available for the supplied search criteria
            SandlerRepositories.FranchiseesRepository frRepository = new SandlerRepositories.FranchiseesRepository();
            //Update Company Information
            DataSet ds = frRepository.GetFranchiseesForSearch();
            if (ds.Tables[0].Rows.Count > 0)
            {
                //we have data so go ahead and show the SearchResults page
                Session["FranchiseeSearchCount"] = ds.Tables[0].Rows.Count;
                lblResult.Text = "";
                //Now go the the Search Results Page
                Response.Redirect("~/CRM/HomeOffice/SearchResults.aspx");

            }
            else
            {
                e.Cancel = true;
                lblResult.Text = "There are no results matching with your criteria.";
            }

        }

    }
}