using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;

public partial class CompanyDETAIL : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblModuleActionHeading.Text = (IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Company)) ? "View Company:" : "View/Edit Comnpany:";
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
        Server.Transfer("~/CRM/Companies/Index.aspx");
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
        string COMPANYNAME = default(System.String);
        string Address = default(System.String);
        string City = default(System.String);
        string State = default(System.String);
        string Zip = default(System.String);
        string POCLastName = default(System.String);
        string POCFirstName = default(System.String);
        string POCPhone = default(System.String);
        string COMPANYVALUEGOAL = default(System.String);
        string RepLastName = default(System.String);
        string RepFirstName = default(System.String);
        string DiscussionTopic = default(System.String);
        string ACTIONSTEP = default(System.String); 
        //Date Fields        
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);
        System.DateTime CreationDate = default(System.DateTime);
        //DDL Fields
        int IndustryID = default(System.Int32); 
        //int ProductID=0;
        int NewItemID = default(System.Int32); 
        
        //For Company Name
        {
            TextBox COMPANYNAMETextBox = new TextBox();
            COMPANYNAMETextBox = (TextBox)CompanyDW.FindControl("txtCompName");
            if ((COMPANYNAMETextBox != null))
            {
                COMPANYNAME = COMPANYNAMETextBox.Text.Trim();
            }
        }
        //For Address
        {
            TextBox AddressTextBox = new TextBox();
            AddressTextBox = (TextBox)CompanyDW.FindControl("txtAddress");
            if ((AddressTextBox != null))
            {
                Address = AddressTextBox.Text.Trim();
            }
        }
        //For City
        {
            TextBox CityTextBox = new TextBox();
            CityTextBox = (TextBox)CompanyDW.FindControl("txtCity");
            if ((CityTextBox != null))
            {
                City = CityTextBox.Text.Trim();
            }
        }
        //For State
        {
            TextBox StateTextBox = new TextBox();
            StateTextBox = (TextBox)CompanyDW.FindControl("txtState");
            if ((StateTextBox != null))
            {
                State = StateTextBox.Text.Trim();
            }
        }
        //For Zip
        {
            TextBox ZipTextBox = new TextBox();
            ZipTextBox = (TextBox)CompanyDW.FindControl("txtZip");
            if ((ZipTextBox != null))
            {
                Zip = ZipTextBox.Text.Trim();
            }
        }
        //For POC Last Name
        {
            TextBox POCLastNameTextBox = new TextBox();
            POCLastNameTextBox = (TextBox)CompanyDW.FindControl("txtPOCLastName");
            if ((POCLastNameTextBox != null))
            {
                POCLastName = POCLastNameTextBox.Text.Trim();
            }
        }
        //For POC First Name
        {
            TextBox POCFirstNameTextBox = new TextBox();
            POCFirstNameTextBox = (TextBox)CompanyDW.FindControl("txtPOCFirstName");
            if ((POCFirstNameTextBox != null))
            {
                POCFirstName = POCFirstNameTextBox.Text.Trim();
            }
        }
        //For POC First Name
        {
            TextBox POCFirstNameTextBox = new TextBox();
            POCFirstNameTextBox = (TextBox)CompanyDW.FindControl("txtPOCFirstName");
            if ((POCFirstNameTextBox != null))
            {
                POCFirstName = POCFirstNameTextBox.Text.Trim();
            }
        }
        //For POC Phone
        {
            TextBox POCPhoneTextBox = new TextBox();
            POCPhoneTextBox = (TextBox)CompanyDW.FindControl("txtPOCPhone");
            if ((POCPhoneTextBox != null))
            {
                POCPhone = POCPhoneTextBox.Text.Trim();
            }
        }
        //For COMPANY VALUE GOAL
        {
            TextBox CompValueGoalTextBox = new TextBox();
            CompValueGoalTextBox = (TextBox)CompanyDW.FindControl("txtCOMPANYVALUEGOAL");
            if ((CompValueGoalTextBox != null))
            {
                COMPANYVALUEGOAL = CompValueGoalTextBox.Text.Trim();
            }
        }
        //For Rep Last Name
        {
            TextBox RepLastNameTextBox = new TextBox();
            RepLastNameTextBox = (TextBox)CompanyDW.FindControl("txtRepLastName");
            if ((RepLastNameTextBox != null))
            {
                RepLastName = RepLastNameTextBox.Text.Trim();
            }
        }
        //For Rep First Name
        {
            TextBox RepFirstNameTextBox = new TextBox();
            RepFirstNameTextBox = (TextBox)CompanyDW.FindControl("txtRepFirstName");
            if ((RepFirstNameTextBox != null))
            {
                RepFirstName = RepFirstNameTextBox.Text.Trim();
            }
        }
        //For Discussion Topic 
        {
            TextBox DiscTopicTextBox = new TextBox();
            DiscTopicTextBox = (TextBox)CompanyDW.FindControl("txtDiscussionTopic");
            if ((DiscTopicTextBox != null))
            {
                DiscussionTopic = DiscTopicTextBox.Text.Trim();
            }
        }
        //For Action Step
        {
            TextBox ActionStepTextBox = new TextBox();
            ActionStepTextBox = (TextBox)CompanyDW.FindControl("txtACTIONSTEP");
            if ((ActionStepTextBox != null))
            {
                ACTIONSTEP = ActionStepTextBox.Text.Trim();
            }
        }
        //For Creation Date
        {
            TextBox CreationDateCal = new TextBox();
            CreationDateCal = (TextBox)CompanyDW.FindControl("CreationDate");
            if ((CreationDateCal != null))
            {
                if (!string.IsNullOrEmpty(CreationDateCal.Text))
                {
                    CreationDate = Convert.ToDateTime(CreationDateCal.Text.Trim());
                }
                

            }
        }
        //For Last Contact Date
        {
            TextBox LastContactDateCal = new TextBox();
            LastContactDateCal = (TextBox)CompanyDW.FindControl("LastContactDate");
            if ((LastContactDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastContactDateCal.Text))
                {
                    LastDate = Convert.ToDateTime(LastContactDateCal.Text.Trim());
                }
                

            }
        }
        //For Next Contact Date
        {
            TextBox NextContactDateCal = new TextBox();
            NextContactDateCal = (TextBox)CompanyDW.FindControl("NextContactDate");
            if ((NextContactDateCal != null))
            {
                if (!string.IsNullOrEmpty(NextContactDateCal.Text))
                {
                    NextDate = Convert.ToDateTime(NextContactDateCal.Text.Trim());
                }
                

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
        SandlerRepositories.CompaniesRepository companiesRepository = new SandlerRepositories.CompaniesRepository();
        //Update Company Information
        companiesRepository.Update(Convert.ToInt32(hidCompanyID.Value), COMPANYNAME, Address, City, State, Zip,POCLastName, POCFirstName, POCPhone, NewItemID, COMPANYVALUEGOAL, 
                                   IndustryID, RepLastName, RepFirstName, DiscussionTopic, ACTIONSTEP, LastDate, NextDate, CreationDate, CurrentUser.UserId.ToString());
        //Inform the Message
        LblStatus.Text = "Company informaton updated successfully!";

    }
    protected void CompanyDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        CompanyDW.ChangeMode(DetailsViewMode.ReadOnly);
        GetCompanyDetails();
    }
    protected void CompanyDW_ItemCreated(object sender, EventArgs e)
    {
        DetailsView dv = sender as DetailsView;
        if (dv.CurrentMode == DetailsViewMode.ReadOnly)
            if(dv.FindControl("LinkButton1")!= null)
                (dv.FindControl("LinkButton1")as LinkButton).Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Company);
    }
    protected void CompanyDW_DataBound(object sender, EventArgs e)
    {
        
        //For Next Contact Date - Calendar control
        TextBox NextContactDateCal = new TextBox();
        NextContactDateCal = (TextBox)CompanyDW.FindControl("NextContactDate");
        if (NextContactDateCal != null)
        {
            if (NextContactDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                NextContactDateCal.Text = default(System.String);
            }
            else
            {
                NextContactDateCal.Text = NextContactDateCal.Text.Replace("12:00:00 AM", "");
            }

        }
        
        //For Last Contact Date - Calendar control
        TextBox LastContactDateCal = new TextBox();
        LastContactDateCal = (TextBox)CompanyDW.FindControl("LastContactDate");
        if (LastContactDateCal != null)
        {
            if (LastContactDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                LastContactDateCal.Text = default(System.String);
            }
            else
            {
                LastContactDateCal.Text = LastContactDateCal.Text.Replace("12:00:00 AM", "");
            }

        }
        //For Creation Date - Calendar control
        TextBox CreationDateCal = new TextBox();
        CreationDateCal = (TextBox)CompanyDW.FindControl("CreationDate");
        if (CreationDateCal != null)
        {
            if (CreationDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                CreationDateCal.Text = default(System.String);
            }
            else
            {
                CreationDateCal.Text = CreationDateCal.Text.Replace("12:00:00 AM", "");
            }

        }
        //For Course Trng Date - Label
        Label NextContactDateLabel = new Label();
        NextContactDateLabel = (Label)CompanyDW.FindControl("lblNextContactDate");
        if (NextContactDateLabel != null)
        {
            if (NextContactDateLabel.Text == "1/1/1900")
            {
                NextContactDateLabel.Text = "";
            }
        }

        //Last Contact Date
        Label LastContactDateLabel = new Label();
        LastContactDateLabel = (Label)CompanyDW.FindControl("lblLastContactDate");
        if (LastContactDateLabel != null)
        {
            if (LastContactDateLabel.Text == "1/1/1900")
            {
                LastContactDateLabel.Text = "";
            }
        }

        //Creation Date
        Label CreationDateLabel = new Label();
        CreationDateLabel = (Label)CompanyDW.FindControl("lblCreationDate");
        if (CreationDateLabel != null)
        {
            if (CreationDateLabel.Text == "1/1/1900")
            {
                CreationDateLabel.Text = "";
            }
        }

    }
}