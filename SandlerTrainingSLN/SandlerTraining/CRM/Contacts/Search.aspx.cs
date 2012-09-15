using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using SandlerModels;
using SandlerRepositories;
using System.Data;
using SandlerModels.DataIntegration;


public partial class CRM_Contacts_Search : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["ContactSearchCount"] = null;
            Session["ContactSearchCriteria"] = null;

        }
    }
    protected void dvContact_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //Clear All data entered by the User
        lblResult.Text = "";
    }
    protected void dvContact_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        //let us have search obj and store all user selection in it
        bool IsCriteriaExist = false;
        Contact searchObj = new Contact();
        //TB Fields
        string LastName = default(System.String);
        string FirstName = default(System.String);
        string Email = default(System.String);
        string Phone = default(System.String);
        string CompanyYears = default(System.String);
        string BossName = default(System.String);
        string DiscussionTopic = default(System.String);
        string ActionStep = default(System.String);
        //Date Fields        
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);
        System.DateTime CourseTrgDate = default(System.DateTime);
        System.DateTime BirthDay = default(System.DateTime);
        System.DateTime Anniversary = default(System.DateTime);
        //LB Fields
        string CompanyIDList = "";
        string NewApptIDList = "";
        string CourseIDList = "";
        string EmailSubscriptionList = "";
        string NeedCallBackList = "";
        string ApptSourceIDList = "";
        string RegForTrainingIDList = "";

        //For Reg for Training
        {
            ListBox RegForTrainingLB = new ListBox();
            RegForTrainingLB = (ListBox)dvContact.FindControl("lbRegForTraining");
            if ((RegForTrainingLB != null))
            {
                foreach (ListItem listItem in RegForTrainingLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CourseIDList.Length == 0)
                        {
                            RegForTrainingIDList = listItem.Value;
                        }
                        else
                        {
                            RegForTrainingIDList = RegForTrainingIDList + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsRegisteredForTrainingList = RegForTrainingIDList;
            }
        }
        
        
        //For Need Call Back List
        {
            ListBox ApptSourceLB = new ListBox();
            ApptSourceLB = (ListBox)dvContact.FindControl("lbApptSource");
            if ((ApptSourceLB != null))
            {
                foreach (ListItem listItem in ApptSourceLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CourseIDList.Length == 0)
                        {
                            ApptSourceIDList = listItem.Value;
                        }
                        else
                        {
                            ApptSourceIDList = ApptSourceIDList + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.ApptSourceList  = ApptSourceIDList;
            }
        }


        //For Need Call Back List
        {
            ListBox NeedCallBackLB = new ListBox();
            NeedCallBackLB = (ListBox)dvContact.FindControl("lbCallBack");
            if ((NeedCallBackLB != null))
            {
                foreach (ListItem listItem in NeedCallBackLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CourseIDList.Length == 0)
                        {
                            NeedCallBackList = listItem.Value;
                        }
                        else
                        {
                            NeedCallBackList = NeedCallBackList + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsNeedCallBackList = NeedCallBackList;
            }
        }
        //For Course ID List
        {
            ListBox EmailSubscriptionLB = new ListBox();
            EmailSubscriptionLB = (ListBox)dvContact.FindControl("lbEmailSubscription");
            if ((EmailSubscriptionLB != null))
            {
                foreach (ListItem listItem in EmailSubscriptionLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CourseIDList.Length == 0)
                        {
                            EmailSubscriptionList = listItem.Value;
                        }
                        else
                        {
                            EmailSubscriptionList = EmailSubscriptionList + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsEmailSubscriptionList  = EmailSubscriptionList;
            }
        }
        //For Course ID List
        {
            ListBox CourseTypeLB = new ListBox();
            CourseTypeLB = (ListBox)dvContact.FindControl("lbCourseType");
            if ((CourseTypeLB != null))
            {
                foreach (ListItem listItem in CourseTypeLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CourseIDList.Length == 0)
                        {
                            CourseIDList = listItem.Value;
                        }
                        else
                        {
                            CourseIDList = CourseIDList + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.CourseIdList = CourseIDList;
            }
        }
        //For New Appt List
        {
            ListBox NewApptLB = new ListBox();
            NewApptLB = (ListBox)dvContact.FindControl("lbAccount");
            if ((NewApptLB != null))
            {
                foreach (ListItem listItem in NewApptLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (NewApptIDList.Length == 0)
                        {
                            NewApptIDList = listItem.Value;
                        }
                        else
                        {
                            NewApptIDList = NewApptIDList + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.IsNewApptList = NewApptIDList;
            }
        }
        //For Company ID List
        {
            ListBox CompanyLB = new ListBox();
            CompanyLB = (ListBox)dvContact.FindControl("lbCompany");
            if ((CompanyLB != null))
            {
                foreach (ListItem listItem in CompanyLB.Items)
                {
                    if (listItem.Selected == true)
                    {
                        if (CompanyIDList.Length == 0)
                        {
                            CompanyIDList = listItem.Value;
                        }
                        else
                        {
                            CompanyIDList = CompanyIDList + "," + listItem.Value;
                        }
                        IsCriteriaExist = true;
                    }
                }
                searchObj.CompanyIdList = CompanyIDList;
            }
        }
        //For Course Training Date
        {
            TextBox CourseTrngDateCal = new TextBox();
            CourseTrngDateCal = (TextBox)dvContact.FindControl("CourseTrngDate");
            if ((CourseTrngDateCal != null))
            {
                if (!string.IsNullOrEmpty(CourseTrngDateCal.Text))
                {
                    CourseTrgDate = Convert.ToDateTime(CourseTrngDateCal.Text.Trim());
                    searchObj.CourseTrainingDate = CourseTrgDate;
                    IsCriteriaExist = true;
                }

            }
        }
        //For BirthDay Date
        {
            TextBox BirthDayDateCal = new TextBox();
            BirthDayDateCal = (TextBox)dvContact.FindControl("BirthDayDate");
            if ((BirthDayDateCal != null))
            {
                if (!string.IsNullOrEmpty(BirthDayDateCal.Text))
                {
                    BirthDay = Convert.ToDateTime(BirthDayDateCal.Text.Trim());
                    searchObj.BirthDay = BirthDay;
                    IsCriteriaExist = true;
                }

            }
        }
        //For Anniversary
        {
            TextBox AnniversaryDateCal = new TextBox();
            AnniversaryDateCal = (TextBox)dvContact.FindControl("AnniversaryDate");
            if ((AnniversaryDateCal != null))
            {
                if (!string.IsNullOrEmpty(AnniversaryDateCal.Text))
                {
                    Anniversary = Convert.ToDateTime(AnniversaryDateCal.Text.Trim());
                    searchObj.Anniversary = Anniversary;
                    IsCriteriaExist = true;
                }

            }
        }
        //For Last Contact Date
        {
            TextBox LastContactDateCal = new TextBox();
            LastContactDateCal = (TextBox)dvContact.FindControl("LastContactDate");
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
            NextContactDateCal = (TextBox)dvContact.FindControl("NextContactDate");
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

        //For Discussion Topic 
        {
            TextBox DiscTopicTextBox = new TextBox();
            DiscTopicTextBox = (TextBox)dvContact.FindControl("txtDiscTopic");
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
            ActionStepTextBox = (TextBox)dvContact.FindControl("txtActStep");
            if ((ActionStepTextBox != null))
            {
                ActionStep = ActionStepTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(ActionStep))
                {
                    IsCriteriaExist = true;
                }
                searchObj.ActionStep = ActionStep;

            }
        }
        //For Last Name
        {
            TextBox LastNameTextBox = new TextBox();
            LastNameTextBox = (TextBox)dvContact.FindControl("txtLastName");
            if ((LastNameTextBox != null))
            {
                LastName = LastNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(LastName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.LastName = LastName;
            }
        }
        //For First Name
        {
            TextBox FirstNameTextBox = new TextBox();
            FirstNameTextBox = (TextBox)dvContact.FindControl("txtFirstName");
            if ((FirstNameTextBox != null))
            {
                FirstName = FirstNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(FirstName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.FirstName = FirstName;
            }
        }
        //For Email
        {
            TextBox EmailTextBox = new TextBox();
            EmailTextBox = (TextBox)dvContact.FindControl("txtEmail");
            if ((EmailTextBox != null))
            {
                Email = EmailTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(Email))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Email = Email;
            }
        }
        //For Phone
        {
            TextBox PhoneTextBox = new TextBox();
            PhoneTextBox = (TextBox)dvContact.FindControl("txtPhone");
            if ((PhoneTextBox != null))
            {
                Phone  = PhoneTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(Phone))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Phone = Phone;
            }
        }
        //For Company Years
        {
            TextBox CompYearsTextBox = new TextBox();
            CompYearsTextBox = (TextBox)dvContact.FindControl("txtCompYears");
            if ((CompYearsTextBox != null))
            {
                CompanyYears = CompYearsTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(CompanyYears))
                {
                    IsCriteriaExist = true;
                }
                searchObj.CompanyYears = CompanyYears;
            }
        }
        //For Boss Name
        {
            TextBox BossNameTextBox = new TextBox();
            BossNameTextBox = (TextBox)dvContact.FindControl("txtBossName");
            if ((BossNameTextBox != null))
            {
                BossName = BossNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(BossName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.BossName = BossName;
            }
        }

        if (!IsCriteriaExist)
        {
            e.Cancel = true;
            lblResult.Text = "Please enter/select at lease one criteria for search.";
        }
        else
        {
            Session["ContactSearchCriteria"] = searchObj;
            //Now first check if data is available for the supplied search criteria
            SandlerRepositories.ContactsRepository contactsRepository = new SandlerRepositories.ContactsRepository();
            //Update Company Information
            DataSet ds = contactsRepository.GetAllForSearch(); 
            if (ds.Tables[0].Rows.Count > 0)
            {
                //we have data so go ahead and show the SearchResults page
                Session["ContactSearchCount"] = ds.Tables[0].Rows.Count;
                lblResult.Text = "";
                //Now go the the Search Results Page
                Response.Redirect("~/CRM/Contacts/SearchResults.aspx");

            }
            else
            {
                e.Cancel = true;
                lblResult.Text = "There are no results matching with your criteria.";
            }

        }

    }
}