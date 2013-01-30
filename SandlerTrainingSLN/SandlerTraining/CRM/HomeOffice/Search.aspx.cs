using System;
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
        string SandlerRoleID = "";
        string IsPartOfMasterFranchisee = "";
        string MasterFranchiseeID = "";
        string IsCanPrintLocally = "";
        string IsBuyFromCustomer = "";
        string IsFixedPricePurchase = "";
        string CostPlusAmountID = "";
        string IsBehindstringerDev = "";
        string BehindAmountID = "";
        string CoachID = "";
        string AwardLevelID = "";
        string PurchaseLevelID = "";
        string PrimaryBusinessID = "";
        string CertifiedLevelID = "";
        string IsContractorsPermitted = "";
        string IsKOLMember = "";
        string IsAdvBoard = "";
        string IsMktgCommittee = "";
        string IsUsingSandlerCRM = "";
        string IsDHSAwardWinner = "";
        string IsSandlerMailRequired = "";
        string IsReqToSubmitFinancials = "";
        string IsRepAgreementForGlobalAcct = "";
        string WorkStateID = "";
        string WorkCountryID = "";
        string HomeStateID = "";
        string HomeCountryID = "";
        string IsSameHomeAddress = "";

        //For Sandler Role Id
        {
            ListBox lstSandlerRoleLB = new ListBox();
            lstSandlerRoleLB = (ListBox)FranchiseeFW.FindControl("lstSandlerRole");
            if ((lstSandlerRoleLB != null))
            {
                foreach (ListItem listItem in lstSandlerRoleLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (SandlerRoleID.Length == 0)
                        {
                            SandlerRoleID = listItem.Value;
                        }
                        else
                        {
                            SandlerRoleID = SandlerRoleID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.SandlerRoleId = SandlerRoleID;
            }
        }
        //For Is Part of Master Franchisee
        {
            ListBox lstPartOfMFLB = new ListBox();
            lstPartOfMFLB = (ListBox)FranchiseeFW.FindControl("lstPartOfMF");
            if ((lstPartOfMFLB != null))
            {
                foreach (ListItem listItem in lstPartOfMFLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsPartOfMasterFranchisee.Length == 0)
                        {
                            IsPartOfMasterFranchisee = listItem.Value;
                        }
                        else
                        {
                            IsPartOfMasterFranchisee = IsPartOfMasterFranchisee + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsMasterFranchiseeExists = IsPartOfMasterFranchisee;
            }
        }
        //For Master Franchisee ID
        {
            ListBox lstMasterFranchiseeLB = new ListBox();
            lstMasterFranchiseeLB = (ListBox)FranchiseeFW.FindControl("lstMasterFranchisee");
            if ((lstMasterFranchiseeLB != null))
            {
                foreach (ListItem listItem in lstMasterFranchiseeLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (MasterFranchiseeID.Length == 0)
                        {
                            MasterFranchiseeID = listItem.Value;
                        }
                        else
                        {
                            MasterFranchiseeID = MasterFranchiseeID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.MasterFranchiseeId = MasterFranchiseeID;
            }
        }

        //For Can Print Locally
        {
            ListBox lstCanPrintLocallyLB = new ListBox();
            lstCanPrintLocallyLB = (ListBox)FranchiseeFW.FindControl("lstCanPrintLocally");
            if ((lstCanPrintLocallyLB != null))
            {
                foreach (ListItem listItem in lstCanPrintLocallyLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsCanPrintLocally.Length == 0)
                        {
                            IsCanPrintLocally = listItem.Value;
                        }
                        else
                        {
                            IsCanPrintLocally = IsCanPrintLocally + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsCanPrintLocally = IsCanPrintLocally;
            }
        }
        //For Buy From Customer
        {
            ListBox lstBuyFromCustomerLB = new ListBox();
            lstBuyFromCustomerLB = (ListBox)FranchiseeFW.FindControl("lstBuyFromCustomer");
            if ((lstBuyFromCustomerLB != null))
            {
                foreach (ListItem listItem in lstBuyFromCustomerLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsBuyFromCustomer.Length == 0)
                        {
                            IsBuyFromCustomer = listItem.Value;
                        }
                        else
                        {
                            IsBuyFromCustomer = IsBuyFromCustomer + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsBuyFromCustomer = IsBuyFromCustomer;
            }
        }

        //For Is Fixed Price Purchase
        {
            ListBox lstFixedPricePurchaseLB = new ListBox();
            lstFixedPricePurchaseLB = (ListBox)FranchiseeFW.FindControl("lstFixedPricePurchase");
            if ((lstFixedPricePurchaseLB != null))
            {
                foreach (ListItem listItem in lstFixedPricePurchaseLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsFixedPricePurchase.Length == 0)
                        {
                            IsFixedPricePurchase = listItem.Value;
                        }
                        else
                        {
                            IsFixedPricePurchase = IsFixedPricePurchase + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsFixedPricePurchase = IsFixedPricePurchase;
            }
        }
        //For Cost Plus Amount 
        {
            ListBox lstCostPlusAmtLB = new ListBox();
            lstCostPlusAmtLB = (ListBox)FranchiseeFW.FindControl("lstCostPlusAmt");
            if ((lstCostPlusAmtLB != null))
            {
                foreach (ListItem listItem in lstCostPlusAmtLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CostPlusAmountID.Length == 0)
                        {
                            CostPlusAmountID = listItem.Value;
                        }
                        else
                        {
                            CostPlusAmountID = CostPlusAmountID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.CostPlusAmountId = CostPlusAmountID;
            }
        }
        //For Behind in Territory Development
        {
            ListBox lstBehindTerDevLB = new ListBox();
            lstBehindTerDevLB = (ListBox)FranchiseeFW.FindControl("lstBehindTerDev");
            if ((lstBehindTerDevLB != null))
            {
                foreach (ListItem listItem in lstBehindTerDevLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsBehindstringerDev.Length == 0)
                        {
                            IsBehindstringerDev = listItem.Value;
                        }
                        else
                        {
                            IsBehindstringerDev = IsBehindstringerDev + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsBehindInTerDev = IsBehindstringerDev;
            }
        }
        //For Behind Amount
        {
            ListBox lstBehindAmtLB = new ListBox();
            lstBehindAmtLB = (ListBox)FranchiseeFW.FindControl("lstBehindAmt");
            if ((lstBehindAmtLB != null))
            {
                foreach (ListItem listItem in lstBehindAmtLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (BehindAmountID.Length == 0)
                        {
                            BehindAmountID = listItem.Value;
                        }
                        else
                        {
                            BehindAmountID = BehindAmountID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.BehindAmtId = BehindAmountID;
            }
        }
        //For Coach
        {
            ListBox lstCoachLB = new ListBox();
            lstCoachLB = (ListBox)FranchiseeFW.FindControl("lstCoach");
            if ((lstCoachLB != null))
            {
                foreach (ListItem listItem in lstCoachLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CoachID.Length == 0)
                        {
                            CoachID = listItem.Value;
                        }
                        else
                        {
                            CoachID = CoachID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.CoachId = CoachID;
            }
        }
        //For Award Level
        {
            ListBox lstAwardLevelLB = new ListBox();
            lstAwardLevelLB = (ListBox)FranchiseeFW.FindControl("lstAwardLevel");
            if ((lstAwardLevelLB != null))
            {
                foreach (ListItem listItem in lstAwardLevelLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (AwardLevelID.Length == 0)
                        {
                            AwardLevelID = listItem.Value;
                        }
                        else
                        {
                            AwardLevelID = AwardLevelID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.AwardLevelId = AwardLevelID;
            }
        }
        //For Purchase Level
        {
            ListBox lstPurchaseLevelLB = new ListBox();
            lstPurchaseLevelLB = (ListBox)FranchiseeFW.FindControl("lstPurchaseLevel");
            if ((lstPurchaseLevelLB != null))
            {
                foreach (ListItem listItem in lstPurchaseLevelLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (PurchaseLevelID.Length == 0)
                        {
                            PurchaseLevelID = listItem.Value;
                        }
                        else
                        {
                            PurchaseLevelID = PurchaseLevelID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.PurchaseLevelId = PurchaseLevelID;
            }
        }
        //For Certifield Level
        {
            ListBox lstCertifiedLevelLB = new ListBox();
            lstCertifiedLevelLB = (ListBox)FranchiseeFW.FindControl("lstCertifiedLevel");
            if ((lstCertifiedLevelLB != null))
            {
                foreach (ListItem listItem in lstCertifiedLevelLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CertifiedLevelID.Length == 0)
                        {
                            CertifiedLevelID = listItem.Value;
                        }
                        else
                        {
                            CertifiedLevelID = CertifiedLevelID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.CertifiedLevelId = CertifiedLevelID;
            }
        }
        //For Primary Business Level
        {
            ListBox lstPrimaryBusinessLB = new ListBox();
            lstPrimaryBusinessLB = (ListBox)FranchiseeFW.FindControl("lstPrimaryBusiness");
            if ((lstPrimaryBusinessLB != null))
            {
                foreach (ListItem listItem in lstPrimaryBusinessLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (PrimaryBusinessID.Length == 0)
                        {
                            PrimaryBusinessID = listItem.Value;
                        }
                        else
                        {
                            PrimaryBusinessID = PrimaryBusinessID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.PrimaryBusinessId = PrimaryBusinessID;
            }
        }
        //For Is Contractor Permitted
        {
            ListBox lstContrPermLB = new ListBox();
            lstContrPermLB = (ListBox)FranchiseeFW.FindControl("lstContrPerm");
            if ((lstContrPermLB != null))
            {
                foreach (ListItem listItem in lstContrPermLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsContractorsPermitted.Length == 0)
                        {
                            IsContractorsPermitted = listItem.Value;
                        }
                        else
                        {
                            IsContractorsPermitted = IsContractorsPermitted + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsContractorPermitted = IsContractorsPermitted;
            }
        }
        //For Is KOL Member
        {
            ListBox lstKOLMemberLB = new ListBox();
            lstKOLMemberLB = (ListBox)FranchiseeFW.FindControl("lstKOLMember");
            if ((lstKOLMemberLB != null))
            {
                foreach (ListItem listItem in lstKOLMemberLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsKOLMember.Length == 0)
                        {
                            IsKOLMember = listItem.Value;
                        }
                        else
                        {
                            IsKOLMember = IsKOLMember + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsKOLMember = IsKOLMember;
            }
        }
        //For Is Adv Board
        {
            ListBox lstAdvBoardLB = new ListBox();
            lstAdvBoardLB = (ListBox)FranchiseeFW.FindControl("lstAdvBoard");
            if ((lstAdvBoardLB != null))
            {
                foreach (ListItem listItem in lstAdvBoardLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsAdvBoard.Length == 0)
                        {
                            IsAdvBoard = listItem.Value;
                        }
                        else
                        {
                            IsAdvBoard = IsAdvBoard + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsAdvBoard = IsAdvBoard;
            }
        }
        //For Is Mktg Committee
        {
            ListBox lstMktgComtLB = new ListBox();
            lstMktgComtLB = (ListBox)FranchiseeFW.FindControl("lstMktgComt");
            if ((lstMktgComtLB != null))
            {
                foreach (ListItem listItem in lstMktgComtLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsMktgCommittee.Length == 0)
                        {
                            IsMktgCommittee = listItem.Value;
                        }
                        else
                        {
                            IsMktgCommittee = IsMktgCommittee + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsMktgCommittee = IsMktgCommittee;
            }
        }
        //For Is Using Sandler CRM
        {
            ListBox lstSandlerCRMLB = new ListBox();
            lstSandlerCRMLB = (ListBox)FranchiseeFW.FindControl("lstSandlerCRM");
            if ((lstSandlerCRMLB != null))
            {
                foreach (ListItem listItem in lstSandlerCRMLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsUsingSandlerCRM.Length == 0)
                        {
                            IsUsingSandlerCRM = listItem.Value;
                        }
                        else
                        {
                            IsUsingSandlerCRM = IsUsingSandlerCRM + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsUsingSandlerCRM = IsUsingSandlerCRM;
            }
        }
        //For Is DHS Award Winner
        {
            ListBox lstDHSAwardLB = new ListBox();
            lstDHSAwardLB = (ListBox)FranchiseeFW.FindControl("lstDHSAward");
            if ((lstDHSAwardLB != null))
            {
                foreach (ListItem listItem in lstDHSAwardLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsDHSAwardWinner.Length == 0)
                        {
                            IsDHSAwardWinner = listItem.Value;
                        }
                        else
                        {
                            IsDHSAwardWinner = IsDHSAwardWinner + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsDHSAwardWinner = IsDHSAwardWinner;
            }
        }
        //For Is Sandler Mail
        {
            ListBox lstSandlerMailLB = new ListBox();
            lstSandlerMailLB = (ListBox)FranchiseeFW.FindControl("lstSandlerMail");
            if ((lstSandlerMailLB != null))
            {
                foreach (ListItem listItem in lstSandlerMailLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsSandlerMailRequired.Length == 0)
                        {
                            IsSandlerMailRequired = listItem.Value;
                        }
                        else
                        {
                            IsSandlerMailRequired = IsSandlerMailRequired + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsSandlerMailRequired = IsSandlerMailRequired;
            }
        }
        //For Req to submit Financials
        {
            ListBox lstReqFinancialsLB = new ListBox();
            lstReqFinancialsLB = (ListBox)FranchiseeFW.FindControl("lstReqFinancials");
            if ((lstReqFinancialsLB != null))
            {
                foreach (ListItem listItem in lstReqFinancialsLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsReqToSubmitFinancials.Length == 0)
                        {
                            IsReqToSubmitFinancials = listItem.Value;
                        }
                        else
                        {
                            IsReqToSubmitFinancials = IsReqToSubmitFinancials + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsReqToSubmitFinancial = IsReqToSubmitFinancials;
            }
        }
        //For Rep Agreement
        {
            ListBox lstRepAgreementLB = new ListBox();
            lstRepAgreementLB = (ListBox)FranchiseeFW.FindControl("lstRepAgreement");
            if ((lstRepAgreementLB != null))
            {
                foreach (ListItem listItem in lstRepAgreementLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsRepAgreementForGlobalAcct.Length == 0)
                        {
                            IsRepAgreementForGlobalAcct = listItem.Value;
                        }
                        else
                        {
                            IsRepAgreementForGlobalAcct = IsRepAgreementForGlobalAcct + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsRepAgreement = IsRepAgreementForGlobalAcct;
            }
        }
        //For Work State
        {
            ListBox lstWorkStateLB = new ListBox();
            lstWorkStateLB = (ListBox)FranchiseeFW.FindControl("lstWorkState");
            if ((lstWorkStateLB != null))
            {
                foreach (ListItem listItem in lstWorkStateLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (WorkStateID.Length == 0)
                        {
                            WorkStateID = listItem.Value;
                        }
                        else
                        {
                            WorkStateID = WorkStateID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.WorkState = WorkStateID;
            }
        }

        //For Work Country
        {
            ListBox lstWorkCountryLB = new ListBox();
            lstWorkCountryLB = (ListBox)FranchiseeFW.FindControl("lstWorkCountry");
            if ((lstWorkCountryLB != null))
            {
                foreach (ListItem listItem in lstWorkCountryLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (WorkCountryID.Length == 0)
                        {
                            WorkCountryID = listItem.Value;
                        }
                        else
                        {
                            WorkCountryID = WorkCountryID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.WorkCountry = WorkCountryID;
            }
        }

        //For Is Same Home Address
        {
            ListBox lstSameHomeAdrsLB = new ListBox();
            lstSameHomeAdrsLB = (ListBox)FranchiseeFW.FindControl("lstSameHomeAdrs");
            if ((lstSameHomeAdrsLB != null))
            {
                foreach (ListItem listItem in lstSameHomeAdrsLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (IsSameHomeAddress.Length == 0)
                        {
                            IsSameHomeAddress = listItem.Value;
                        }
                        else
                        {
                            IsSameHomeAddress = IsSameHomeAddress + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsSameHomeAddress = IsSameHomeAddress;
            }
        }
        //For Home State
        {
            ListBox lstHomeStateLB = new ListBox();
            lstHomeStateLB = (ListBox)FranchiseeFW.FindControl("lstHomeState");
            if ((lstHomeStateLB != null))
            {
                foreach (ListItem listItem in lstHomeStateLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (HomeStateID.Length == 0)
                        {
                            HomeStateID = listItem.Value;
                        }
                        else
                        {
                            HomeStateID = HomeStateID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.HomeState = HomeStateID;
            }
        }

        //For Home Country
        {
            ListBox lstHomeCountryLB = new ListBox();
            lstHomeCountryLB = (ListBox)FranchiseeFW.FindControl("lstHomeCountry");
            if ((lstHomeCountryLB != null))
            {
                foreach (ListItem listItem in lstHomeCountryLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (HomeCountryID.Length == 0)
                        {
                            HomeCountryID = listItem.Value;
                        }
                        else
                        {
                            HomeCountryID = HomeCountryID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.HomeCountry = HomeCountryID;
            }
        }
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