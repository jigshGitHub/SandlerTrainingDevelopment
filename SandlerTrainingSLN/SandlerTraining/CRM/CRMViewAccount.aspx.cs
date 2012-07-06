using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CRMViewAccount : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((PreviousPage != null))
            {
                //Find out ContactID selected by the User
                hidAccountID.Value = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidAccountID")).Value;
                GetAccountDetails();
            }
        }
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("CRMAccounts.aspx");
    }
    public void GetAccountDetails()
    {
        //Now get the details
        SandlerRepositories.AccountsRepository accountRepository = new SandlerRepositories.AccountsRepository();
        System.Data.DataSet ds = accountRepository.GetById(Convert.ToInt32(hidAccountID.Value));
        AccountDW.DataSource = ds;
        AccountDW.DataBind();
    }
    protected void AccountDW_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //No code required
    }
    protected void AccountDW_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            AccountDW.ChangeMode(DetailsViewMode.Edit);
            LblStatus.Text = "";
            GetAccountDetails();

        }
        else if (e.CommandName == "Update")
        {
            LblStatus.Text = "";
            UpdateAccountDetails();
        }
        else if (e.CommandName == "Cancel")
        {
            AccountDW.ChangeMode(DetailsViewMode.ReadOnly);
            LblStatus.Text = "";
            GetAccountDetails();
        }
    }
    public void UpdateAccountDetails()
    {
        string CompanyName = "";
        string AccountName = "";
        string Product = "";
        string Comment = "";
        string AccountValue = "";
        string ActionStep = "";
        string SalesRep = "";
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);

        //For Last Contact Date
        {
            eWorld.UI.CalendarPopup LastContactDateCal = new eWorld.UI.CalendarPopup();
            LastContactDateCal = (eWorld.UI.CalendarPopup)AccountDW.FindControl("LastContactDate");
            if ((LastContactDateCal != null))
            {
                LastDate = LastContactDateCal.SelectedDate;

            }
        }
        //For Next Contact Date
        {
            eWorld.UI.CalendarPopup NextContactDateCal = new eWorld.UI.CalendarPopup();
            NextContactDateCal = (eWorld.UI.CalendarPopup)AccountDW.FindControl("NextContactDate");
            if ((NextContactDateCal != null))
            {
                NextDate = NextContactDateCal.SelectedDate;

            }
        }
        //For Comment
        {
            TextBox CommentTextBox = new TextBox();
            CommentTextBox = (TextBox)AccountDW.FindControl("txtCOMMENT");
            if ((CommentTextBox != null))
            {
                Comment = CommentTextBox.Text;
            }
        }
        //For Total Account Value
        {
            TextBox TotalActValueTextBox = new TextBox();
            TotalActValueTextBox = (TextBox)AccountDW.FindControl("txtTotalActValue");
            if ((TotalActValueTextBox != null))
            {
                AccountValue = TotalActValueTextBox.Text;
            }
        }
        //For Sales Rep
        {
            TextBox SalesRepTB = new TextBox();
            SalesRepTB = (TextBox)AccountDW.FindControl("txtSalesRep");
            if ((SalesRepTB != null))
            {
                SalesRep = SalesRepTB.Text;
            }
        }
        //For Company Name
        {
            TextBox CompanyTB = new TextBox();
            CompanyTB = (TextBox)AccountDW.FindControl("txtComName");
            if ((CompanyTB != null))
            {
                CompanyName = CompanyTB.Text;
            }
        }
        //For Account Name
        {
            TextBox ActNameTB = new TextBox();
            ActNameTB = (TextBox)AccountDW.FindControl("txtAccountName");
            if ((ActNameTB != null))
            {
                AccountName = ActNameTB.Text;
            }
        }
        //For Product
        {
            TextBox ProductTB = new TextBox();
            ProductTB = (TextBox)AccountDW.FindControl("txtProduct");
            if ((ProductTB != null))
            {
                Product = ProductTB.Text;
            }
        }
        //For Action Step
        {
            TextBox ActionStepTextBox = new TextBox();
            ActionStepTextBox = (TextBox)AccountDW.FindControl("txtActStep");
            if ((ActionStepTextBox != null))
            {
                ActionStep = ActionStepTextBox.Text;
            }
        }

        if (string.IsNullOrEmpty(Comment))
        {
            Comment = "";
        }
        if (string.IsNullOrEmpty(ActionStep))
        {
            ActionStep = "";
        }
        if (string.IsNullOrEmpty(AccountValue))
        {
            AccountValue = "";
        }
        
        SandlerRepositories.AccountsRepository accountRepository = new SandlerRepositories.AccountsRepository();
        accountRepository.Update(Convert.ToInt32(hidAccountID.Value), CompanyName, AccountName, SalesRep, AccountValue, Comment, ActionStep, LastDate, NextDate, Product);
        LblStatus.Text = "Account updated successfully!";
        

    }
    protected void AccountDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        AccountDW.ChangeMode(DetailsViewMode.ReadOnly);
        GetAccountDetails();
    }
}