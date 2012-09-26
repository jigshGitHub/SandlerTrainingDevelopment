﻿using System;
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
        //Check for Industry Name - If it is Empty then it means that user have not selected the Industry Type
        hidIndName.Value = ds.Tables[0].Rows[0]["Industry"].ToString();
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
        string CompanyOwnership = default(System.String);
        string CompanyDescription = default(System.String);

        string Address = default(System.String);
        string City = default(System.String);
        string State = default(System.String);
        string Zip = default(System.String);
        string Country = default(System.String);

        string BillingAddress = default(System.String);
        string BillingCity = default(System.String);
        string BillingState = default(System.String);
        string BillingZip = default(System.String);
        string BillingCountry = default(System.String);

        string POCDepartment = default(System.String);
        string POCEmail = default(System.String);
        string POCFax = default(System.String);
        string AssistantLastName = default(System.String);
        string AssistantFirstName = default(System.String);
        string AssistantPhone = default(System.String);
        string Website = default(System.String);
        string Notes = default(System.String);
        string EmpQuantity  = default(System.String);
        
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
        int IsSameBillingId = default(System.Int32); 
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
        //For Company Ownership
        {
            TextBox CompOwnershipTextBox = new TextBox();
            CompOwnershipTextBox = (TextBox)CompanyDW.FindControl("txtOwnership");
            if ((CompOwnershipTextBox != null))
            {
                CompanyOwnership = CompOwnershipTextBox.Text.Trim();
            }
        }
        //For Company Description
        {
            TextBox CompDescriptionTextBox = new TextBox();
            CompDescriptionTextBox = (TextBox)CompanyDW.FindControl("txtCompanyDescription");
            if ((CompDescriptionTextBox != null))
            {
                CompanyDescription = CompDescriptionTextBox.Text.Trim();
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
        //For Country
        {
            TextBox CountryTextBox = new TextBox();
            CountryTextBox = (TextBox)CompanyDW.FindControl("txtCountry");
            if ((CountryTextBox != null))
            {
                Country = CountryTextBox.Text.Trim();
            }
        }
        //For Billing Address
        {
            TextBox BillingAddressTextBox = new TextBox();
            BillingAddressTextBox = (TextBox)CompanyDW.FindControl("txtBillingAddress");
            if ((BillingAddressTextBox != null))
            {
                BillingAddress = BillingAddressTextBox.Text.Trim();
            }
        }
        //For Billing City
        {
            TextBox BillingCityTextBox = new TextBox();
            BillingCityTextBox = (TextBox)CompanyDW.FindControl("txtBillingCity");
            if ((BillingCityTextBox != null))
            {
                BillingCity = BillingCityTextBox.Text.Trim();
            }
        }
        //For Billing State
        {
            TextBox BillingStateTextBox = new TextBox();
            BillingStateTextBox = (TextBox)CompanyDW.FindControl("txtBillingState");
            if ((BillingStateTextBox != null))
            {
                BillingState = BillingStateTextBox.Text.Trim();
            }
        }
        //For Billing Zip
        {
            TextBox BillingZipTextBox = new TextBox();
            BillingZipTextBox = (TextBox)CompanyDW.FindControl("txtBillingZip");
            if ((BillingZipTextBox != null))
            {
                BillingZip = BillingZipTextBox.Text.Trim();
            }
        }
        //For Billing Country
        {
            TextBox BillingCountryTextBox = new TextBox();
            BillingCountryTextBox = (TextBox)CompanyDW.FindControl("txtBillingCountry");
            if ((BillingCountryTextBox != null))
            {
                BillingCountry = BillingCountryTextBox.Text.Trim();
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
        //For POC Phone
        {
            TextBox POCPhoneTextBox = new TextBox();
            POCPhoneTextBox = (TextBox)CompanyDW.FindControl("txtPOCPhone");
            if ((POCPhoneTextBox != null))
            {
                POCPhone = POCPhoneTextBox.Text.Trim();
            }
        }
        //For POC Department
        {
            TextBox POCDepartmentTextBox = new TextBox();
            POCDepartmentTextBox = (TextBox)CompanyDW.FindControl("txtPOCDepartment");
            if ((POCDepartmentTextBox != null))
            {
                POCDepartment = POCDepartmentTextBox.Text.Trim();
            }
        }
        //For POC Email
        {
            TextBox POCEmailTextBox = new TextBox();
            POCEmailTextBox = (TextBox)CompanyDW.FindControl("txtPOCEmail");
            if ((POCEmailTextBox != null))
            {
                POCEmail = POCEmailTextBox.Text.Trim();
            }
        }
        //For POC Fax
        {
            TextBox POCFaxTextBox = new TextBox();
            POCFaxTextBox = (TextBox)CompanyDW.FindControl("txtPOCFax");
            if ((POCFaxTextBox != null))
            {
                POCFax = POCFaxTextBox.Text.Trim();
            }
        }
        //For Assistant Last Name
        {
            TextBox AssistantLastNameTextBox = new TextBox();
            AssistantLastNameTextBox = (TextBox)CompanyDW.FindControl("txtAssistantLastName");
            if ((AssistantLastNameTextBox != null))
            {
                AssistantLastName = AssistantLastNameTextBox.Text.Trim();
            }
        }
        //For Assistant First Name
        {
            TextBox AssistantFirstNameTextBox = new TextBox();
            AssistantFirstNameTextBox = (TextBox)CompanyDW.FindControl("txtAssistantFirstName");
            if ((AssistantFirstNameTextBox != null))
            {
                AssistantFirstName = AssistantFirstNameTextBox.Text.Trim();
            }
        }
        //For Assistant Phone
        {
            TextBox AssistantPhoneTextBox = new TextBox();
            AssistantPhoneTextBox = (TextBox)CompanyDW.FindControl("txtAssistantPhone");
            if ((AssistantPhoneTextBox != null))
            {
                AssistantPhone = AssistantPhoneTextBox.Text.Trim();
            }
        }
        //For Website
        {
            TextBox WebsiteTextBox = new TextBox();
            WebsiteTextBox = (TextBox)CompanyDW.FindControl("txtWebsite");
            if ((WebsiteTextBox != null))
            {
                Website = WebsiteTextBox.Text.Trim();
            }
        }
        //For Emp Quantity
        {
            TextBox EmpQunatityTextBox = new TextBox();
            EmpQunatityTextBox = (TextBox)CompanyDW.FindControl("txtEmpQuantity");
            if ((EmpQunatityTextBox != null))
            {
                EmpQuantity = EmpQunatityTextBox.Text.Trim();
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
        //For Notes
        {
            TextBox NotesTextBox = new TextBox();
            NotesTextBox = (TextBox)CompanyDW.FindControl("txtNotes");
            if ((NotesTextBox != null))
            {
                Notes = NotesTextBox.Text.Trim();
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
        //For Is New Billing Process ID
        {
            DropDownList BillingAdrsDDList = new DropDownList();
            BillingAdrsDDList = (DropDownList)CompanyDW.FindControl("ddlBillingAdrs");
            if ((BillingAdrsDDList != null))
            {
                IsSameBillingId = Convert.ToInt32(BillingAdrsDDList.SelectedValue.ToString());
            }
        }
        //Get the User Session
        SandlerRepositories.CompaniesRepository companiesRepository = new SandlerRepositories.CompaniesRepository();
        //Update Company Information
        companiesRepository.Update 
            (Convert.ToInt32(hidCompanyID.Value), COMPANYNAME, CompanyOwnership, CompanyDescription, 
            Address, City, State, Zip, Country, IsSameBillingId, 
            BillingAddress, BillingCity, BillingState, BillingZip, BillingCountry,
            POCLastName, POCFirstName, POCPhone, POCDepartment,POCEmail, POCFax,
            AssistantLastName,AssistantFirstName, AssistantPhone,
            NewItemID, Website, EmpQuantity, COMPANYVALUEGOAL, 
            IndustryID, RepLastName, RepFirstName, DiscussionTopic, ACTIONSTEP, LastDate, NextDate, CreationDate, CurrentUser.UserId.ToString(),Notes);
        //Inform the Message
        LblStatus.Text = "Company informaton updated successfully!";

    }
    protected void ddlBillingAdrs_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        //For Billing Adrs DDL
        DropDownList billingAddressDropDownList = new DropDownList();
        billingAddressDropDownList = (DropDownList)CompanyDW.FindControl("ddlBillingAdrs");
        if (billingAddressDropDownList != null)
        {
            if (billingAddressDropDownList.SelectedValue == "1")
            {
                //Find existing Address Info
                (CompanyDW.FindControl("txtBillingAddress") as TextBox).Text = (CompanyDW.FindControl("txtAddress") as TextBox).Text;
                (CompanyDW.FindControl("txtBillingCity") as TextBox).Text = (CompanyDW.FindControl("txtCity") as TextBox).Text;
                (CompanyDW.FindControl("txtBillingState") as TextBox).Text = (CompanyDW.FindControl("txtState") as TextBox).Text;
                (CompanyDW.FindControl("txtBillingZip") as TextBox).Text = (CompanyDW.FindControl("txtZip") as TextBox).Text;
                (CompanyDW.FindControl("txtBillingCountry") as TextBox).Text = (CompanyDW.FindControl("txtCountry") as TextBox).Text;
                //Also make them readonly true
                (CompanyDW.FindControl("txtBillingAddress") as TextBox).ReadOnly = true;
                (CompanyDW.FindControl("txtBillingCity") as TextBox).ReadOnly = true;
                (CompanyDW.FindControl("txtBillingState") as TextBox).ReadOnly = true;
                (CompanyDW.FindControl("txtBillingZip") as TextBox).ReadOnly = true;
                (CompanyDW.FindControl("txtBillingCountry") as TextBox).ReadOnly = true;
            }
            else
            {
                //Also make them readonly false
                (CompanyDW.FindControl("txtBillingAddress") as TextBox).ReadOnly = false;
                (CompanyDW.FindControl("txtBillingCity") as TextBox).ReadOnly = false;
                (CompanyDW.FindControl("txtBillingState") as TextBox).ReadOnly = false;
                (CompanyDW.FindControl("txtBillingZip") as TextBox).ReadOnly = false;
                (CompanyDW.FindControl("txtBillingCountry") as TextBox).ReadOnly = false;
            }
        }
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

        //For Industry DDL
        DropDownList IndDDList = new DropDownList();
        IndDDList = (DropDownList)CompanyDW.FindControl("ddlIndustry");
        if (IndDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Industry--", "0");
            IndDDList.Items.Insert(0, selectItem);
            //Check if coursename is not empty
            if (string.IsNullOrEmpty(hidIndName.Value))
            {
                IndDDList.SelectedIndex = -1;
            }

        }
        
        
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
        //For Next Contact Date - Label
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