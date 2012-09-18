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

public partial class CRM_Companies_Search : BasePage
{
    //string ErrorMessage = default(System.String);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["CompanySearchCount"] = null;
            Session["CompanySearchCriteria"] = null;

        }
    }
    protected void dvCompany_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //Clear All data entered by the User
        lblResult.Text = "";
    }
    protected void dvCompany_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        //let us have search obj and store all user selection in it
        bool IsCriteriaExist = false;
        SandlerModels.DataIntegration.Company searchObj = new SandlerModels.DataIntegration.Company();
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
        //LB Fields
        string IndustryID = "";
        string NewItemID = "";

        //For Company Name
        {
            TextBox COMPANYNAMETextBox = new TextBox();
            COMPANYNAMETextBox = (TextBox)dvCompany.FindControl("txtCompName");
            if ((COMPANYNAMETextBox != null))
            {
                COMPANYNAME = COMPANYNAMETextBox.Text.Trim();
                if (!string.IsNullOrEmpty(COMPANYNAME))
                {
                    IsCriteriaExist = true;
                }
                searchObj.CompanyName = COMPANYNAME;
            }
        }
        //For Address
        {
            TextBox AddressTextBox = new TextBox();
            AddressTextBox = (TextBox)dvCompany.FindControl("txtAddress");
            if ((AddressTextBox != null))
            {
                Address = AddressTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(Address))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Address = Address;
            }
        }
        //For City
        {
            TextBox CityTextBox = new TextBox();
            CityTextBox = (TextBox)dvCompany.FindControl("txtCity");
            if ((CityTextBox != null))
            {
                City = CityTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(City))
                {
                    IsCriteriaExist = true;
                }
                searchObj.City = City;
            }
        }
        //For State
        {
            TextBox StateTextBox = new TextBox();
            StateTextBox = (TextBox)dvCompany.FindControl("txtState");
            if ((StateTextBox != null))
            {
                State = StateTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(State))
                {
                    IsCriteriaExist = true;
                }
                searchObj.State = State;
            }
        }
        //For Zip
        {
            TextBox ZipTextBox = new TextBox();
            ZipTextBox = (TextBox)dvCompany.FindControl("txtZip");
            if ((ZipTextBox != null))
            {
                Zip = ZipTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(Zip))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Zip = Zip;
            }
        }
        //For POC Last Name
        {
            TextBox POCLastNameTextBox = new TextBox();
            POCLastNameTextBox = (TextBox)dvCompany.FindControl("txtPOCLastName");
            if ((POCLastNameTextBox != null))
            {
                POCLastName = POCLastNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(POCLastName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.POCLastName = POCLastName;
            }
        }
        //For POC First Name
        {
            TextBox POCFirstNameTextBox = new TextBox();
            POCFirstNameTextBox = (TextBox)dvCompany.FindControl("txtPOCFirstName");
            if ((POCFirstNameTextBox != null))
            {
                POCFirstName = POCFirstNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(POCFirstName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.POCFirstName = POCFirstName;
            }
        }

        //For POC Phone
        {
            TextBox POCPhoneTextBox = new TextBox();
            POCPhoneTextBox = (TextBox)dvCompany.FindControl("txtPOCPhone");
            if ((POCPhoneTextBox != null))
            {
                POCPhone = POCPhoneTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(POCPhone))
                {
                    IsCriteriaExist = true;
                }
                searchObj.POCPhone = POCPhone;
            }
        }
        //For COMPANY VALUE GOAL
        {
            TextBox CompValueGoalTextBox = new TextBox();
            CompValueGoalTextBox = (TextBox)dvCompany.FindControl("txtComValueGoal");
            if ((CompValueGoalTextBox != null))
            {
                COMPANYVALUEGOAL = CompValueGoalTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(COMPANYVALUEGOAL))
                {
                    IsCriteriaExist = true;
                }
                searchObj.CompValueGoal = COMPANYVALUEGOAL;
            }
        }
        //For Rep Last Name
        {
            TextBox RepLastNameTextBox = new TextBox();
            RepLastNameTextBox = (TextBox)dvCompany.FindControl("txtRepLastName");
            if ((RepLastNameTextBox != null))
            {
                RepLastName = RepLastNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(RepLastName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.RepLastName = RepLastName;
            }
        }
        //For Rep First Name
        {
            TextBox RepFirstNameTextBox = new TextBox();
            RepFirstNameTextBox = (TextBox)dvCompany.FindControl("txtRepFirstName");
            if ((RepFirstNameTextBox != null))
            {
                RepFirstName = RepFirstNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(RepFirstName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.RepFirstName = RepFirstName;
            }
        }
        //For Discussion Topic 
        {
            TextBox DiscTopicTextBox = new TextBox();
            DiscTopicTextBox = (TextBox)dvCompany.FindControl("txtDisTopic");
            if ((DiscTopicTextBox != null))
            {
                DiscussionTopic = DiscTopicTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(DiscussionTopic))
                {
                    IsCriteriaExist = true;
                }
                searchObj.DiscussionTopic = DiscussionTopic;
            }
        }
        //For Action Step
        {
            TextBox ActionStepTextBox = new TextBox();
            ActionStepTextBox = (TextBox)dvCompany.FindControl("txtActStep");
            if ((ActionStepTextBox != null))
            {
                ACTIONSTEP = ActionStepTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(ACTIONSTEP))
                {
                    IsCriteriaExist = true;
                }
                searchObj.ActionStep = ACTIONSTEP;

            }
        }
        //For Creation Date
        {
            TextBox CreationDateCal = new TextBox();
            CreationDateCal = (TextBox)dvCompany.FindControl("CreationDate");
            if ((CreationDateCal != null))
            {
                if (!string.IsNullOrEmpty(CreationDateCal.Text))
                {
                    CreationDate = Convert.ToDateTime(CreationDateCal.Text.Trim());
                    searchObj.CreationDate = CreationDate;
                    IsCriteriaExist = true;

                }


            }
        }
        //For Last Contact Date
        {
            TextBox LastContactDateCal = new TextBox();
            LastContactDateCal = (TextBox)dvCompany.FindControl("LastContactDate");
            if ((LastContactDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastContactDateCal.Text))
                {
                    LastDate = Convert.ToDateTime(LastContactDateCal.Text.Trim());
                    searchObj.LastContactDate = LastDate;
                    IsCriteriaExist = true;
                }


            }
        }
        //For Next Contact Date
        {
            TextBox NextContactDateCal = new TextBox();
            NextContactDateCal = (TextBox)dvCompany.FindControl("NextContactDate");
            if ((NextContactDateCal != null))
            {
                if (!string.IsNullOrEmpty(NextContactDateCal.Text))
                {
                    NextDate = Convert.ToDateTime(NextContactDateCal.Text.Trim());
                    searchObj.NextContactDate = NextDate;
                    IsCriteriaExist = true;
                }


            }
        }
        //For Industry ID
        {
            ListBox IndustryLB = new ListBox();
            IndustryLB = (ListBox)dvCompany.FindControl("lstIndustry");
            if ((IndustryLB != null))
            {
                foreach (ListItem listItem in IndustryLB.Items)
                {
                    if (listItem.Selected == true)
                    {

                        if (IndustryID.Length == 0)
                        {
                            IndustryID = listItem.Value;
                        }
                        else
                        {
                            IndustryID = IndustryID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IndId = IndustryID;
            }
        }
        //For New Item  ID
        {
            ListBox NewItemLB = new ListBox();
            NewItemLB = (ListBox)dvCompany.FindControl("lstAccount");
            if ((NewItemLB != null))
            {
                foreach (ListItem listItem in NewItemLB.Items)
                {
                    if (listItem.Selected == true)
                    {

                        if (NewItemID.Length == 0)
                        {
                            NewItemID = listItem.Value;
                        }
                        else
                        {
                            NewItemID = NewItemID + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsNewCompany = NewItemID;
            }
        }
        if (!IsCriteriaExist)
        {
            e.Cancel = true;
            lblResult.Text = "Please enter/select at lease one criteria for search.";
        }
        else
        {
            Session["CompanySearchCriteria"] = searchObj;
            //Now first check if data is available for the supplied search criteria
            SandlerRepositories.CompaniesRepository companiesRepository = new SandlerRepositories.CompaniesRepository();
            //Update Company Information
            DataSet ds = companiesRepository.GetCompaniesForSearch();
            if (ds.Tables[0].Rows.Count > 0)
            {
                //we have data so go ahead and show the SearchResults page
                Session["CompanySearchCount"] = ds.Tables[0].Rows.Count;
                lblResult.Text = "";
                //Now go the the Search Results Page
                Response.Redirect("~/CRM/Companies/SearchResults.aspx");

            }
            else 
            {
                e.Cancel = true;
                lblResult.Text = "There are no results matching with your criteria.";
            }
           
        }
        
    }
        
}