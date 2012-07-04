using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.Data.Utility;
using System.Data.SqlClient;
using System.Data;

public partial class CRMViewContact : System.Web.UI.Page
{
    DBUtility db = new DBUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((PreviousPage != null))
            {
                //Find out ContactID selected by the User
                hidContactID.Value   = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidContactID")).Value ;
                GetContactDetails();
            }
        }
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("CRMContacts.aspx"); 
    }
    protected void ContactDW_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //No code required
    }
    protected void ContactDW_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            ContactDW.ChangeMode(DetailsViewMode.Edit);
            LblStatus.Text = "";
            GetContactDetails();
            
        }
        else if (e.CommandName == "Update")
        {
            LblStatus.Text = "";
            UpdateContactDetails();
        }
        else if (e.CommandName == "Cancel")
        {
            ContactDW.ChangeMode(DetailsViewMode.ReadOnly);
            LblStatus.Text = "";
            GetContactDetails();
        }
    }
    public void UpdateContactDetails()
    {
        //Get all Details and then update the contact Information
        int CompanyID=0;
        string FullName="";
        string PhoneNumber ="";
        string EmailAdrs="";
        string Comment="";
        string TotalAccountValue="";
        string ActionStep="";
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);

        //For Action Step
        {
            TextBox ActionStepTextBox = new TextBox();
            ActionStepTextBox = (TextBox)ContactDW.FindControl("txtActStep");
            if ((ActionStepTextBox != null))
            {
                ActionStep = ActionStepTextBox.Text;
            }
        }
        //For Comment
        {
            TextBox CommentTextBox = new TextBox();
            CommentTextBox = (TextBox)ContactDW.FindControl("txtCOMMENT");
            if ((CommentTextBox != null))
            {
                Comment = CommentTextBox.Text;
            }
        }
        //For Total Account Value
        {
            TextBox TotalActValueTextBox = new TextBox();
            TotalActValueTextBox = (TextBox)ContactDW.FindControl("txtTotalActValue");
            if ((TotalActValueTextBox != null))
            {
                TotalAccountValue = TotalActValueTextBox.Text;
            }
        }
        
        //For PhoneNumber 
        {
            TextBox PhoneNoTextBox = new TextBox();
            PhoneNoTextBox = (TextBox)ContactDW.FindControl("txtPhone");
            if ((PhoneNoTextBox != null))
            {
                PhoneNumber = PhoneNoTextBox.Text;
            }
        }
        //For Company ID
        {
            DropDownList CompnayDDList = new DropDownList();
            CompnayDDList = (DropDownList)ContactDW.FindControl("ddlCompany");
            if ((CompnayDDList != null))
            {
                CompanyID = Convert.ToInt32(CompnayDDList.SelectedValue.ToString()) ;
            }
        }
        //For Full Name of the contact
        {
            TextBox FullNameTB = new TextBox();
            FullNameTB = (TextBox)ContactDW.FindControl("txtFullName");
            if ((FullNameTB != null))
            {
                FullName = FullNameTB.Text;
            }
        }
        //For Email Address
        {
            TextBox EmailTB = new TextBox();
            EmailTB = (TextBox)ContactDW.FindControl("txtEmail");
            if ((EmailTB != null))
            {
                EmailAdrs = EmailTB.Text;
            }
        }
        //For Last Contact Date
        {
            eWorld.UI.CalendarPopup LastContactDateCal = new eWorld.UI.CalendarPopup();
            LastContactDateCal = (eWorld.UI.CalendarPopup)ContactDW.FindControl("LastContactDate");
            if ((LastContactDateCal != null))
            {
                LastDate = LastContactDateCal.SelectedDate;
                                
            }
        }
        //For Next Contact Date
        {
            eWorld.UI.CalendarPopup NextContactDateCal = new eWorld.UI.CalendarPopup();
            NextContactDateCal = (eWorld.UI.CalendarPopup)ContactDW.FindControl("NextContactDate");
            if ((NextContactDateCal != null))
            {
                NextDate = NextContactDateCal.SelectedDate;

            }
        }
        //Now Update the Record

        if (string.IsNullOrEmpty(EmailAdrs))
        {
            EmailAdrs = "";
        }
        if (string.IsNullOrEmpty(PhoneNumber))
        {
            PhoneNumber = "";
        }
        if (string.IsNullOrEmpty(Comment))
        {
            Comment = "";
        }
        if (string.IsNullOrEmpty(ActionStep))
        {
            ActionStep = "";
        }
        if (string.IsNullOrEmpty(TotalAccountValue))
        {
            TotalAccountValue = "";
        }

        if (NextDate.ToString() == "1/1/0001 12:00:00 AM")
        {
            db.ExecuteNonQuery("sp_UpdateContactDetailsSpecial", new SqlParameter("@ContactID", Convert.ToInt32(hidContactID.Value)), new SqlParameter("@FullName", FullName), new SqlParameter("@Phone", PhoneNumber), new SqlParameter("@Email", EmailAdrs), new SqlParameter("@LastDate", LastDate), new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ActionStep), new SqlParameter("@TotalActValue", TotalAccountValue));
        }
        else
        {
            db.ExecuteNonQuery("sp_UpdateContactDetails", new SqlParameter("@ContactID", Convert.ToInt32(hidContactID.Value)), new SqlParameter("@FullName", FullName), new SqlParameter("@Phone", PhoneNumber), new SqlParameter("@Email", EmailAdrs), new SqlParameter("@LastDate", LastDate), new SqlParameter("@NextDate", NextDate), new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ActionStep), new SqlParameter("@TotalActValue", TotalAccountValue));

        }
        LblStatus.Text = "Contact updated successfully!";
                      
                
    }
    public void GetContactDetails()
    {
        //Now get the details
        System.Data.DataSet ds = db.ExecuteDataset("sp_GetContactDetails", "ContactByID", new SqlParameter("@ContactID", Convert.ToInt32(hidContactID.Value)));
        ContactDW.DataSource = ds;
        ContactDW.DataBind();
    }
    protected void ContactDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        ContactDW.ChangeMode(DetailsViewMode.ReadOnly);
        GetContactDetails();
    }
}