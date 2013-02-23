using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRM_HomeOffice_Add : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void InsertOperation_Selecting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void FranchiseeFW_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        lblResult.Text = "Franchisee created Successfully!";

    }
    protected void FranchiseeFW_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/HomeOffice/Index.aspx");
        }
    }
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
        //For Coach DDL
        DropDownList ddlCoachDDList = new DropDownList();
        ddlCoachDDList = (DropDownList)FranchiseeFW.FindControl("ddlCoach");
        if (ddlCoachDDList != null)
        {
            ListItem selectItem = new ListItem("-- Select Coach-Region --", "0");
            ddlCoachDDList.Items.Insert(0, selectItem);

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