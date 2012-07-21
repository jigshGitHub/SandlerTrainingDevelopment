using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;

public partial class UpdatedCRM_CRMViewCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((PreviousPage != null))
            {
                //Find out CompanyID selected by the User
                hidCompanyID.Value = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidCompanyID")).Value;
                GetCompanyDetails();
            }
        }
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("CRMCompanies.aspx");
    }
    public void GetCompanyDetails()
    {
        //Now get the details
        SandlerRepositories.CompaniesRepository companyRepository = new SandlerRepositories.CompaniesRepository();
        System.Data.DataSet ds = companyRepository.GetById(Convert.ToInt32(hidCompanyID.Value));
        CompanyDW.DataSource = ds;
        CompanyDW.DataBind();
    }
    protected void CompanyDW_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //No code required
    }
    protected void CompanyDW_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            CompanyDW.ChangeMode(DetailsViewMode.Edit);
            LblStatus.Text = "";
            GetCompanyDetails();

        }
        else if (e.CommandName == "Update")
        {
            LblStatus.Text = "";
            UpdateCompanyDetails();
        }
        else if (e.CommandName == "Cancel")
        {
            CompanyDW.ChangeMode(DetailsViewMode.ReadOnly);
            LblStatus.Text = "";
            GetCompanyDetails();
        }
    }
    public void UpdateCompanyDetails()
    {
        //TB Fields
        string COMPANYNAME="";
        string Address="";
        string City="";
        string State="";
        string Zip ="";
        string POCLastName="";
        string POCFirstName="";
        string POCPhone="";
        string COMPANYVALUEGOAL="";
        string RepLastName="";
        string RepFirstName=""; 
        string DiscussionTopic="";
        string ACTIONSTEP = "";
        //Date Fields        
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);
        System.DateTime CreationDate = default(System.DateTime);
        //DDL Fields
        int IndustryID=0;
        int ProductID=0;
        int NewItemID=0;
        
        //For Company Name
        {
            TextBox COMPANYNAMETextBox = new TextBox();
            COMPANYNAMETextBox = (TextBox)CompanyDW.FindControl("txtCompName");
            if ((COMPANYNAMETextBox != null))
            {
                COMPANYNAME = COMPANYNAMETextBox.Text;
            }
        }
        //For Address
        {
            TextBox AddressTextBox = new TextBox();
            AddressTextBox = (TextBox)CompanyDW.FindControl("txtAddress");
            if ((AddressTextBox != null))
            {
                Address = AddressTextBox.Text;
            }
        }
        //For City
        {
            TextBox CityTextBox = new TextBox();
            CityTextBox = (TextBox)CompanyDW.FindControl("txtCity");
            if ((CityTextBox != null))
            {
                City = CityTextBox.Text;
            }
        }
        //For State
        {
            TextBox StateTextBox = new TextBox();
            StateTextBox = (TextBox)CompanyDW.FindControl("txtState");
            if ((StateTextBox != null))
            {
                State = StateTextBox.Text;
            }
        }
        //For Zip
        {
            TextBox ZipTextBox = new TextBox();
            ZipTextBox = (TextBox)CompanyDW.FindControl("txtZip");
            if ((ZipTextBox != null))
            {
                Zip = ZipTextBox.Text;
            }
        }
        //For POC Last Name
        {
            TextBox POCLastNameTextBox = new TextBox();
            POCLastNameTextBox = (TextBox)CompanyDW.FindControl("txtPOCLastName");
            if ((POCLastNameTextBox != null))
            {
                POCLastName = POCLastNameTextBox.Text;
            }
        }
        //For POC First Name
        {
            TextBox POCFirstNameTextBox = new TextBox();
            POCFirstNameTextBox = (TextBox)CompanyDW.FindControl("txtPOCFirstName");
            if ((POCFirstNameTextBox != null))
            {
                POCFirstName = POCFirstNameTextBox.Text;
            }
        }
        //For POC First Name
        {
            TextBox POCFirstNameTextBox = new TextBox();
            POCFirstNameTextBox = (TextBox)CompanyDW.FindControl("txtPOCFirstName");
            if ((POCFirstNameTextBox != null))
            {
                POCFirstName = POCFirstNameTextBox.Text;
            }
        }
        //For POC Phone
        {
            TextBox POCPhoneTextBox = new TextBox();
            POCPhoneTextBox = (TextBox)CompanyDW.FindControl("txtPOCPhone");
            if ((POCPhoneTextBox != null))
            {
                POCPhone = POCPhoneTextBox.Text;
            }
        }
        //For COMPANY VALUE GOAL
        {
            TextBox CompValueGoalTextBox = new TextBox();
            CompValueGoalTextBox = (TextBox)CompanyDW.FindControl("txtCOMPANYVALUEGOAL");
            if ((CompValueGoalTextBox != null))
            {
                COMPANYVALUEGOAL = CompValueGoalTextBox.Text;
            }
        }
        //For Rep Last Name
        {
            TextBox RepLastNameTextBox = new TextBox();
            RepLastNameTextBox = (TextBox)CompanyDW.FindControl("txtRepLastName");
            if ((RepLastNameTextBox != null))
            {
                RepLastName = RepLastNameTextBox.Text;
            }
        }
        //For Rep First Name
        {
            TextBox RepFirstNameTextBox = new TextBox();
            RepFirstNameTextBox = (TextBox)CompanyDW.FindControl("txtRepFirstName");
            if ((RepFirstNameTextBox != null))
            {
                RepFirstName = RepFirstNameTextBox.Text;
            }
        }
        //For Discussion Topic 
        {
            TextBox DiscTopicTextBox = new TextBox();
            DiscTopicTextBox = (TextBox)CompanyDW.FindControl("txtDiscussionTopic");
            if ((DiscTopicTextBox != null))
            {
                DiscussionTopic = DiscTopicTextBox.Text;
            }
        }
        //For Action Step
        {
            TextBox ActionStepTextBox = new TextBox();
            ActionStepTextBox = (TextBox)CompanyDW.FindControl("txtACTIONSTEP");
            if ((ActionStepTextBox != null))
            {
                ACTIONSTEP = ActionStepTextBox.Text;
            }
        }
        //For Creation Date
        {
            eWorld.UI.CalendarPopup CreationDateCal = new eWorld.UI.CalendarPopup();
            CreationDateCal = (eWorld.UI.CalendarPopup)CompanyDW.FindControl("CreationDate");
            if ((CreationDateCal != null))
            {
                CreationDate = CreationDateCal.SelectedDate;

            }
        }
        //For Last Contact Date
        {
            eWorld.UI.CalendarPopup LastContactDateCal = new eWorld.UI.CalendarPopup();
            LastContactDateCal = (eWorld.UI.CalendarPopup)CompanyDW.FindControl("LastContactDate");
            if ((LastContactDateCal != null))
            {
                LastDate = LastContactDateCal.SelectedDate;

            }
        }
        //For Next Contact Date
        {
            eWorld.UI.CalendarPopup NextContactDateCal = new eWorld.UI.CalendarPopup();
            NextContactDateCal = (eWorld.UI.CalendarPopup)CompanyDW.FindControl("NextContactDate");
            if ((NextContactDateCal != null))
            {
                NextDate = NextContactDateCal.SelectedDate;

            }
        }
        //For Industry ID
        {
            DropDownList IndustryDDList = new DropDownList();
            IndustryDDList = (DropDownList)CompanyDW.FindControl("ddlIndustry");
            if ((IndustryDDList != null))
            {
                IndustryID = Convert.ToInt32(IndustryDDList.SelectedValue.ToString());
            }
        }

        //For Product ID
        {
            DropDownList ProductDDList = new DropDownList();
            ProductDDList = (DropDownList)CompanyDW.FindControl("ddlProduct");
            if ((ProductDDList != null))
            {
                ProductID = Convert.ToInt32(ProductDDList.SelectedValue.ToString());
            }
        }

        //For New Item  ID
        {
            DropDownList NewItemDDList = new DropDownList();
            NewItemDDList = (DropDownList)CompanyDW.FindControl("ddlNewItem");
            if ((NewItemDDList != null))
            {
                NewItemID = Convert.ToInt32(NewItemDDList.SelectedValue.ToString());
            }
        }
        //Get the User Session
        UserModel _user = (UserModel)Session["CurrentUser"];
        SandlerRepositories.CompaniesRepository companiesRepository = new SandlerRepositories.CompaniesRepository();
        //Update Company Information
        companiesRepository.Update(Convert.ToInt32(hidCompanyID.Value), COMPANYNAME, Address, City, State, Zip,POCLastName, POCFirstName, POCPhone, NewItemID, COMPANYVALUEGOAL, ProductID, IndustryID, RepLastName, RepFirstName, DiscussionTopic, ACTIONSTEP, LastDate, NextDate, CreationDate, _user.UserId.ToString());
        //Inform the Message
        LblStatus.Text = "Company informaton updated successfully!";

    }
    protected void CompanyDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        CompanyDW.ChangeMode(DetailsViewMode.ReadOnly);
        GetCompanyDetails();
    }
}