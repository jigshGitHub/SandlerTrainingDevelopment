using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;

public partial class ContactDETAIL : BasePage 
{
    string ErrorMessage = default(System.String);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblModuleActionHeading.Text = (IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Contact)) ? "View Contact:" : "View/Edit Contact:";
            if ((PreviousPage != null))
            {
                //Find out ContactID selected by the User
                hidContactID.Value = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidContactID")).Value;
                GetContactDetails();
            }
        }
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/CRM/Contacts/Index.aspx");
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
        int CompanyID = default(System.Int32);
        int IsNewAppt = default(System.Int32);
        int AppsSourceId = default(System.Int32);
        int CourseId = default(System.Int32);
        int IsRegisteredForTrng = default(System.Int32);
        int BlastEmailSubscription = default(System.Int32);
        int NeedCallBack  = default(System.Int32);
        string LastName = default(System.String);
        string FirstName = default(System.String);
        string Phone = default(System.String);
        string Email = default(System.String);
        string DiscussionTopic = default(System.String);
        string ActionStep = default(System.String); 
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);
        System.DateTime CourseTrngDate = default(System.DateTime);
        System.DateTime BirthDate = default(System.DateTime);
        System.DateTime AnniversaryDate = default(System.DateTime);
        int CompanyYrs = default(System.Int32);
        string Boss = default(System.String);
        
        //For Action Step
        {
            TextBox ActionStepTextBox = new TextBox();
            ActionStepTextBox = (TextBox)ContactDW.FindControl("txtActStep");
            if ((ActionStepTextBox != null))
            {
                ActionStep = ActionStepTextBox.Text;
            }
        }
        //For Discussion Topic 
        {
            TextBox DiscussionTopicTextBox = new TextBox();
            DiscussionTopicTextBox = (TextBox)ContactDW.FindControl("txtDiscTopic");
            if ((DiscussionTopicTextBox != null))
            {
                DiscussionTopic = DiscussionTopicTextBox.Text;
            }
        }
        //For PhoneNumber 
        {
            TextBox PhoneNoTextBox = new TextBox();
            PhoneNoTextBox = (TextBox)ContactDW.FindControl("txtPhone");
            if ((PhoneNoTextBox != null))
            {
                Phone = PhoneNoTextBox.Text;
            }
        }
        //For Company ID
        {
            DropDownList CompnayDDList = new DropDownList();
            CompnayDDList = (DropDownList)ContactDW.FindControl("ddlCompany");
            if ((CompnayDDList != null))
            {
                CompanyID = Convert.ToInt32(CompnayDDList.SelectedValue.ToString());
            }
        }
        //For Appt Source
        {
            DropDownList ApptSourceDDList = new DropDownList();
            ApptSourceDDList = (DropDownList)ContactDW.FindControl("ddlApptSource");
            if ((ApptSourceDDList != null))
            {
                AppsSourceId = Convert.ToInt32(ApptSourceDDList.SelectedValue.ToString());
            }
        }
        //For Course ID
        {
            DropDownList CourseDDList = new DropDownList();
            CourseDDList = (DropDownList)ContactDW.FindControl("ddlCourse");
            if ((CourseDDList != null))
            {
                CourseId = Convert.ToInt32(CourseDDList.SelectedValue.ToString());
            }
        }
        //For Is New Appointment
        {
            DropDownList ApptDDList = new DropDownList();
            ApptDDList = (DropDownList)ContactDW.FindControl("ddlAccount");
            if ((ApptDDList != null))
            {
                IsNewAppt = Convert.ToInt32(ApptDDList.SelectedValue.ToString());
            }
        }
        //For Need Call Back
        {
            DropDownList CallBackDDList = new DropDownList();
            CallBackDDList = (DropDownList)ContactDW.FindControl("ddlCallBack");
            if ((CallBackDDList != null))
            {
                NeedCallBack = Convert.ToInt32(CallBackDDList.SelectedValue.ToString());
            }
        }
        //For Registered for Training
        {
            DropDownList RegTrngDDList = new DropDownList();
            RegTrngDDList = (DropDownList)ContactDW.FindControl("ddlRegForTraining");
            if ((RegTrngDDList != null))
            {
                IsRegisteredForTrng = Convert.ToInt32(RegTrngDDList.SelectedValue.ToString());
            }
        }
        //For Blast Email Subcription
        {
            DropDownList BlastEmailDDList = new DropDownList();
            BlastEmailDDList = (DropDownList)ContactDW.FindControl("ddlBlastEmail");
            if ((BlastEmailDDList != null))
            {
                BlastEmailSubscription = Convert.ToInt32(BlastEmailDDList.SelectedValue.ToString());
            }
        }
        //For Last Name
        {
            TextBox LastNameTB = new TextBox();
            LastNameTB = (TextBox)ContactDW.FindControl("txtLastName");
            if ((LastNameTB != null))
            {
                LastName = LastNameTB.Text;
            }
        }
        //For First Name
        {
            TextBox FirstNameTB = new TextBox();
            FirstNameTB = (TextBox)ContactDW.FindControl("txtFirstName");
            if ((FirstNameTB != null))
            {
                FirstName = FirstNameTB.Text;
            }
        }
        //For Email Address
        {
            TextBox EmailTB = new TextBox();
            EmailTB = (TextBox)ContactDW.FindControl("txtEmail");
            if ((EmailTB != null))
            {
                Email = EmailTB.Text;
            }
        }
        //For Last Contact Date
        {
            TextBox LastContactDateCal = new TextBox();
            LastContactDateCal = (TextBox)ContactDW.FindControl("LastContactDate");
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
            NextContactDateCal = (TextBox)ContactDW.FindControl("NextContactDate");
            if ((NextContactDateCal != null))
            {
                if (!string.IsNullOrEmpty(NextContactDateCal.Text))
                {
                    NextDate = Convert.ToDateTime(NextContactDateCal.Text.Trim());
                }
            }
        }
        //For Course Trng Date
        {
            TextBox CourseTrainingDateCal = new TextBox();
            CourseTrainingDateCal = (TextBox)ContactDW.FindControl("CourseTrngDate");
            if ((CourseTrainingDateCal != null))
            {
                if (!string.IsNullOrEmpty(CourseTrainingDateCal.Text))
                {
                    CourseTrngDate = Convert.ToDateTime(CourseTrainingDateCal.Text.Trim());
                }

            }
        }

        //For Birthday
        {
            TextBox BirthDateCal = new TextBox();
            BirthDateCal = (TextBox)ContactDW.FindControl("Birthday");
            if ((BirthDateCal != null))
            {
                if (!string.IsNullOrEmpty(BirthDateCal.Text))
                {
                    BirthDate = Convert.ToDateTime(BirthDateCal.Text.Trim());
                }
            }

        }

        //For Anniversary
        {
            TextBox AnniversaryCal = new TextBox();
            AnniversaryCal = (TextBox)ContactDW.FindControl("Anniversary");
            if ((AnniversaryCal != null))
            {
                if (!string.IsNullOrEmpty(AnniversaryCal.Text))
                {
                    AnniversaryDate = Convert.ToDateTime(AnniversaryCal.Text.Trim());
                }
            }

        }
        //For Company Years
        {
            TextBox CompanyYears = new TextBox();
            CompanyYears = (TextBox)ContactDW.FindControl("CompanyYears");
            if ((CompanyYears != null))
            {
                CompanyYrs = Convert.ToInt32(CompanyYears.Text.ToString());
            }
        }
        //For Boss Name
        {
            TextBox BossName = new TextBox();
            BossName = (TextBox)ContactDW.FindControl("BossName");
            if ((BossName != null))
            {
                Boss = BossName.Text;
            }
        }
        if (IsNewAppt == 0 && AppsSourceId != 0)
        {
            ErrorMessage = "New Appointment? is selected as No. Please change your selection to Proceed.";
        }

        if (IsNewAppt == 1 && AppsSourceId == 0)
        {
            ErrorMessage = "Please select Appointment Source to Proceed.";
        }
        //Now check if all is well with the selection
        if ((CourseTrngDate.ToString() != "1/1/0001 12:00:00 AM" && CourseId == 0) || (CourseId == 0 && IsRegisteredForTrng == 1))
        {
            ErrorMessage = "Please select Course Type to Proceed.";
            
        }
        //Course Training Date is not selected
        if ((CourseTrngDate.ToString() == "1/1/0001 12:00:00 AM" && CourseId != 0) || (CourseTrngDate.ToString() == "1/1/0001 12:00:00 AM" && IsRegisteredForTrng == 1))
        {
            ErrorMessage =  "Please select Course Training Date to Proceed.";
            
        }
        if (CourseId != 0 && IsRegisteredForTrng == 0 && CourseTrngDate.ToString() != "1/1/0001 12:00:00 AM")
        {
            ErrorMessage = "Registered for Training is selected as No. Please change your selection to Proceed.";
            
        }
        if (string.IsNullOrEmpty(ErrorMessage))
        {
            //Now Update the Record as validation is Ok
            SandlerRepositories.ContactsRepository contactRepository = new SandlerRepositories.ContactsRepository();
            contactRepository.Update(Convert.ToInt32(hidContactID.Value), CompanyID, LastName, FirstName, Phone, Email, DiscussionTopic, ActionStep, IsRegisteredForTrng, IsNewAppt, CourseId, AppsSourceId, LastDate, NextDate, CourseTrngDate, BlastEmailSubscription,NeedCallBack,BirthDate,AnniversaryDate,CompanyYrs,Boss);
            LblStatus.Text = "Contact updated successfully!";
        }
               

    }
    public void GetContactDetails()
    {
        //Now get the details
        System.Data.DataSet ds = new SandlerRepositories.ContactsRepository().GetById(Convert.ToInt32(hidContactID.Value));
        ContactDW.DataSource = ds;
        hidCourseName.Value = ds.Tables[0].Rows[0]["COURSENAME"].ToString();
        hidApptSourceName.Value = ds.Tables[0].Rows[0]["ApptSourceName"].ToString();
        ContactDW.DataBind();
    }
    protected void ContactDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (string.IsNullOrEmpty(ErrorMessage))
        {
            //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
            ContactDW.ChangeMode(DetailsViewMode.ReadOnly);
            GetContactDetails();
        }
        else
        {
            //We have some validation issue
            ClientScript.RegisterStartupScript(this.GetType(), "ValidationIssue", ("<script> alert('" + ErrorMessage + "'); </script>"));
            e.Cancel = true;
        }
    }


    protected void ContactDW_DataBound(object sender, EventArgs e)
    {
        //For Course DDL
        DropDownList CourseDDList = new DropDownList();
        CourseDDList = (DropDownList)ContactDW.FindControl("ddlCourse");
        if (CourseDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Course--", "0");
            CourseDDList.Items.Insert(0, selectItem);
            //Check if coursename is not empty
            if (string.IsNullOrEmpty(hidCourseName.Value))
            {
                CourseDDList.SelectedIndex = -1;
            }
            
        }
        //For Appt Source DDL
        DropDownList ApptSourceDDList = new DropDownList();
        ApptSourceDDList = (DropDownList)ContactDW.FindControl("ddlApptSource");
        if (ApptSourceDDList != null)
        {
            ListItem selectItem = new ListItem("--Select Appointment Source--", "0");
            ApptSourceDDList.Items.Insert(0, selectItem);
            //Check if coursename is not empty
            if (string.IsNullOrEmpty(hidApptSourceName.Value))
            {
                ApptSourceDDList.SelectedIndex = -1;
            }

        }

        //For Course Trng Date - Calendar control
        TextBox CourseTrngDateCal = new TextBox();
        CourseTrngDateCal = (TextBox)ContactDW.FindControl("CourseTrngDate");
        if (CourseTrngDateCal != null)
        {
            if (CourseTrngDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                CourseTrngDateCal.Text = default(System.String);
            }
            else
            {
                CourseTrngDateCal.Text = CourseTrngDateCal.Text.Replace("12:00:00 AM", "");
            }
                
        }
        //For Last Contact Date
        TextBox LastContactDateCal = new TextBox();
        LastContactDateCal = (TextBox)ContactDW.FindControl("LastContactDate");
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
        //For Next  Contact Date
        TextBox NextContactDateCal = new TextBox();
        NextContactDateCal = (TextBox)ContactDW.FindControl("NextContactDate");
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
        //For Course Trng Date - Label
        Label CsTrngDateLabel = new Label();
        CsTrngDateLabel = (Label)ContactDW.FindControl("lblCourseTrngDate");
        if (CsTrngDateLabel != null)
        {
            if (CsTrngDateLabel.Text == "1/1/1900")
            {
                CsTrngDateLabel.Text = "";
            }
        }

        //For Course Trng Date - Label
        Label LastContDateLabel = new Label();
        LastContDateLabel = (Label)ContactDW.FindControl("lblLastContactDate");
        if (LastContDateLabel != null)
        {
            if (LastContDateLabel.Text == "1/1/1900")
            {
                LastContDateLabel.Text = "";
            }
        }


        //For Course Trng Date - Label
        Label NextContDateLabel = new Label();
        NextContDateLabel = (Label)ContactDW.FindControl("lblNextContactDate");
        if (NextContDateLabel != null)
        {
            if (NextContDateLabel.Text == "1/1/1900")
            {
                NextContDateLabel.Text = "";
            }
        }

    }

    protected void ContactDW_ItemCreated(object sender, EventArgs e)
    {
        DetailsView dv = sender as DetailsView;
        if (dv.CurrentMode == DetailsViewMode.ReadOnly)
            if (dv.FindControl("LinkButton1") != null)
                (dv.FindControl("LinkButton1") as LinkButton).Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Contact);
        
    }
}