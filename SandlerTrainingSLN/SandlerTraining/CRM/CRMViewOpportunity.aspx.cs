using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class CRMViewOpportunity : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((PreviousPage != null))
            {
                //Find out ContactID selected by the User
                hidOpprtunityID.Value = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidOpprtunityID")).Value;
                GetOpportunityDetails();
            }
        }
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("CRMSalesPipeLine.aspx");
    }
    protected void OpportunityDW_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //No code required
    }
    protected void OpportunityDW_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            OpportunityDW.ChangeMode(DetailsViewMode.Edit);
            LblStatus.Text = "";
            GetOpportunityDetails();

        }
        else if (e.CommandName == "Update")
        {
            LblStatus.Text = "";
            UpdateOpportunityDetails();
        }
        else if (e.CommandName == "Cancel")
        {
            OpportunityDW.ChangeMode(DetailsViewMode.ReadOnly);
            LblStatus.Text = "";
            GetOpportunityDetails();
        }
    }
    public void UpdateOpportunityDetails()
    {
        //Get all Details and then update the contact Information
        int CompanyID = 0;
        string OppName = "";
        string SalesRep = "";
        string SalesRepPhone = "";
        string CompPhone = "";
        string CompContact = "";
        string CompEmailAdrs = "";
        string TotalValue = "";
        string WeightedValue = "";
        string WinProbability = "";
        string AcctOppStatus = "";
        string AcctID = "";
        System.DateTime CloseDate = default(System.DateTime);

              

        //For Next Contact Date
        {
            eWorld.UI.CalendarPopup CloseDateCal = new eWorld.UI.CalendarPopup();
            CloseDateCal = (eWorld.UI.CalendarPopup)OpportunityDW.FindControl("CloseDate");
            if ((CloseDateCal != null))
            {
                CloseDate = CloseDateCal.SelectedDate;

            }
        }

        //For Total Value
        {
            TextBox TotalActValueTextBox = new TextBox();
            TotalActValueTextBox = (TextBox)OpportunityDW.FindControl("txtTotalActValue");
            if ((TotalActValueTextBox != null))
            {
                TotalValue = TotalActValueTextBox.Text;
            }
        }
        //For Sales Rep PhoneNumber 
        {
            TextBox SalesPhoneNoTextBox = new TextBox();
            SalesPhoneNoTextBox = (TextBox)OpportunityDW.FindControl("txtSalesRepPhone");
            if ((SalesPhoneNoTextBox != null))
            {
                SalesRepPhone = SalesPhoneNoTextBox.Text;
            }
        }
        //For Comp PhoneNumber 
        {
            TextBox CompPhoneTB  = new TextBox();
            CompPhoneTB = (TextBox)OpportunityDW.FindControl("txtCompPhone");
            if ((CompPhoneTB != null))
            {
                CompPhone = CompPhoneTB.Text;
            }
        }
        //For Comp Contact
        {
            TextBox CompContactTB = new TextBox();
            CompContactTB = (TextBox)OpportunityDW.FindControl("txtCompContact");
            if ((CompContactTB != null))
            {
                CompContact = CompContactTB.Text;
            }
        }
        //For Sales Rep 
        {
            TextBox txtSalesRepTextBox = new TextBox();
            txtSalesRepTextBox = (TextBox)OpportunityDW.FindControl("txtSalesRep");
            if ((txtSalesRepTextBox != null))
            {
                SalesRep = txtSalesRepTextBox.Text;
            }
        }
        //For Opp Name
        {
            TextBox OppNameTB  = new TextBox();
            OppNameTB = (TextBox)OpportunityDW.FindControl("txtOppName");
            if ((OppNameTB != null))
            {
                OppName = OppNameTB.Text;
            }
        }
        //For Acct ID
        {
            TextBox AcctIDTB = new TextBox();
            AcctIDTB = (TextBox)OpportunityDW.FindControl("txtAcctID");
            if ((AcctIDTB != null))
            {
                AcctID = AcctIDTB.Text;
            }
        }
        //For Company ID
        {
            DropDownList CompnayDDList = new DropDownList();
            CompnayDDList = (DropDownList)OpportunityDW.FindControl("ddlCompany");
            if ((CompnayDDList != null))
            {
                CompanyID = Convert.ToInt32(CompnayDDList.SelectedValue.ToString());
            }
        }
        //For Company Email Address
        {
            TextBox EmailTB = new TextBox();
            EmailTB = (TextBox)OpportunityDW.FindControl("txtEmail");
            if ((EmailTB != null))
            {
                CompEmailAdrs = EmailTB.Text;
            }
        }
        //For Acct Opp Status
        {
            TextBox ActOppStatusTB = new TextBox();
            ActOppStatusTB = (TextBox)OpportunityDW.FindControl("txtActOppStatus");
            if ((ActOppStatusTB != null))
            {
                AcctOppStatus = ActOppStatusTB.Text;
            }
        }
        //For WinProbability
        {
            TextBox WinProbTB = new TextBox();
            WinProbTB = (TextBox)OpportunityDW.FindControl("txtWinProbabilityValue");
            if ((WinProbTB != null))
            {
                WinProbability = WinProbTB.Text;
            }
        }
        //For WeightedValue
        {
            TextBox WeightedValueTB = new TextBox();
            WeightedValueTB = (TextBox)OpportunityDW.FindControl("txtWeightedValue");
            if ((WeightedValueTB != null))
            {
                WeightedValue = WeightedValueTB.Text;
            }
        }

        if (string.IsNullOrEmpty(CompPhone))
        {
            CompPhone = "";
        }
        if (string.IsNullOrEmpty(SalesRepPhone))
        {
            SalesRepPhone = "";
        }
        if (string.IsNullOrEmpty(AcctOppStatus))
        {
            AcctOppStatus = "";
        }
        if (string.IsNullOrEmpty(WinProbability))
        {
            WinProbability = "";
        }
        if (string.IsNullOrEmpty(WeightedValue))
        {
            WeightedValue = "";
        }

        
        SandlerRepositories.OpportunityRepository repository = new SandlerRepositories.OpportunityRepository();
        repository.Update(Convert.ToInt32(hidOpprtunityID.Value), CompanyID, OppName, SalesRep, SalesRepPhone, CompContact, CompPhone, CompEmailAdrs, AcctOppStatus, TotalValue, WeightedValue, WinProbability, CloseDate);

        LblStatus.Text = "Opportunity updated successfully!";



    }
    public void GetOpportunityDetails()
    {
        //Now get the details
        SandlerRepositories.OpportunityRepository opportunityRepository = new SandlerRepositories.OpportunityRepository();

        OpportunityDW.DataSource = opportunityRepository.GetDetailsById( Convert.ToInt32(hidOpprtunityID.Value)); ;
        OpportunityDW.DataBind();
    }
    protected void OpportunityDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        OpportunityDW.ChangeMode(DetailsViewMode.ReadOnly);
        GetOpportunityDetails();
    }
}