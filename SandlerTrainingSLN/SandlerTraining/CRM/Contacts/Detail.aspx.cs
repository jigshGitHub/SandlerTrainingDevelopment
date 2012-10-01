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

    public string GetTextBoxData(string controlId)
    {
        //First Create the TextBox Control to store the Input Data
        string inputByUser = ""; 
        TextBox _tempTextBox = new TextBox();
        _tempTextBox = (TextBox)ContactDW.FindControl(controlId);
        if ((_tempTextBox != null))
        {
            inputByUser = _tempTextBox.Text;
        }
        return inputByUser;
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
        int NeedCallBack = default(System.Int32);
        string LastName = default(System.String);
        string FirstName = default(System.String);

        string Title = default(System.String);
        string ContactsDepartment = default(System.String);
        string ContactsRole = default(System.String);
        string MobilePhone = default(System.String);
        string HomePhone = default(System.String);
        string Fax = default(System.String);
        string PersonalEmail = default(System.String);
        string Address = default(System.String);
        string City = default(System.String);
        string State = default(System.String);
        string Zip = default(System.String);
        string Country = default(System.String);
        string SpouseName = default(System.String);
        string ReferredBy = default(System.String);
        string Notes = default(System.String);

        string Phone = default(System.String);
        string Email = default(System.String);
        string DiscussionTopic = default(System.String);
        string ActionStep = default(System.String);
        int CompanyYears = default(System.Int32);
        string BossName = default(System.String);

        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);
        System.DateTime CourseTrngDate = default(System.DateTime);
        System.DateTime BirthDayDate = default(System.DateTime);
        System.DateTime AnniversaryDate = default(System.DateTime);
        System.DateTime LastAttemptedDate = default(System.DateTime);
        System.DateTime LastEmailedDate = default(System.DateTime);
        System.DateTime LastMeetingDate = default(System.DateTime);
        System.DateTime LetterSentDate = default(System.DateTime);

        //For Notes
        Notes = GetTextBoxData("txtNotes");

        //For Referred By
        ReferredBy = GetTextBoxData("txtReferredBy");
        
        //For Spouse Name
        SpouseName = GetTextBoxData("txtSpouseName");
        
        //For Title
        Title = GetTextBoxData("txtTitle");

        //For Contacts Department  
        ContactsDepartment = GetTextBoxData("txtDepartment");

        //For Role
        ContactsRole = GetTextBoxData("txtRole");



        //For Mobile PhoneNumber 
        MobilePhone = GetTextBoxData("txtMobilePhone");
        
        //For Home PhoneNumber 
        HomePhone = GetTextBoxData("txtHomePhone");
        
        //For Fax
        Fax = GetTextBoxData("txtFax");
        
        //For PersonalEmail 
        PersonalEmail = GetTextBoxData("txtPersonalEmail");
        
        //For Address
        Address = GetTextBoxData("txtAddress");
        
        //For City
        City = GetTextBoxData("txtCity");
        
        //For State
        State = GetTextBoxData("txtState");
        
        //For Zip
        Zip = GetTextBoxData("txtZip");
        
        //For Country
        Country = GetTextBoxData("txtCountry");
        
        //For Action Step
        ActionStep = GetTextBoxData("txtActStep");
        
        //For Discussion Topic 
        DiscussionTopic = GetTextBoxData("txtDiscTopic");
        
        //For PhoneNumber
        Phone = GetTextBoxData("txtPhone");
        
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
        LastName = GetTextBoxData("txtLastName");
        
        //For First Name
        FirstName = GetTextBoxData("txtFirstName");
        
        //For Email Address
        Email = GetTextBoxData("txtEmail");
        
        //For Last Attempted  Date
        {
            TextBox LastAttemptedDateCal = new TextBox();
            LastAttemptedDateCal = (TextBox)ContactDW.FindControl("LastAttemptedDate");
            if ((LastAttemptedDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastAttemptedDateCal.Text))
                {
                    LastAttemptedDate = Convert.ToDateTime(LastAttemptedDateCal.Text.Trim());
                }
            }
        }
        //For Last Emailed Date
        {
            TextBox LastEmailedDateCal = new TextBox();
            LastEmailedDateCal = (TextBox)ContactDW.FindControl("LastEmailedDate");
            if ((LastEmailedDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastEmailedDateCal.Text))
                {
                    LastEmailedDate = Convert.ToDateTime(LastEmailedDateCal.Text.Trim());
                }
            }
        }
        //For Last Meeting Date
        {
            TextBox LastMeetingDateCal = new TextBox();
            LastMeetingDateCal = (TextBox)ContactDW.FindControl("LastMeetingDate");
            if ((LastMeetingDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastMeetingDateCal.Text))
                {
                    LastMeetingDate = Convert.ToDateTime(LastMeetingDateCal.Text.Trim());
                }
            }
        }
        //For Date Letter Sent Out
        {
            TextBox DateLetterSentOutCal = new TextBox();
            DateLetterSentOutCal = (TextBox)ContactDW.FindControl("DateLetterSentOut");
            if ((DateLetterSentOutCal != null))
            {
                if (!string.IsNullOrEmpty(DateLetterSentOutCal.Text))
                {
                    LetterSentDate = Convert.ToDateTime(DateLetterSentOutCal.Text.Trim());
                }
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
            TextBox BirthdayDateCal = new TextBox();
            BirthdayDateCal = (TextBox)ContactDW.FindControl("BirthdayDate");
            if ((BirthdayDateCal != null))
            {
                if (!string.IsNullOrEmpty(BirthdayDateCal.Text))
                {
                    BirthDayDate = Convert.ToDateTime(BirthdayDateCal.Text.Trim());
                }

            }
        }

        //For Anniversary
        {
            TextBox AnniversaryDateCal = new TextBox();
            AnniversaryDateCal = (TextBox)ContactDW.FindControl("AnniversaryDate");
            if ((AnniversaryDateCal != null))
            {
                if (!string.IsNullOrEmpty(AnniversaryDateCal.Text))
                {
                    AnniversaryDate = Convert.ToDateTime(AnniversaryDateCal.Text.Trim());
                }

            }
        }

        //For Company Years
        {
            TextBox CompanyYearsTB = new TextBox();
            CompanyYearsTB = (TextBox)ContactDW.FindControl("txtCompanyYears");
            if ((CompanyYearsTB != null))
            {
                if (!string.IsNullOrEmpty(CompanyYearsTB.Text))
                {
                    CompanyYears = Convert.ToInt32(CompanyYearsTB.Text);
                }

            }
        }

        //For Boss Name
        BossName = GetTextBoxData("txtBossName");
        

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
            ErrorMessage = "Please select Course Training Date to Proceed.";

        }
        if (CourseId != 0 && IsRegisteredForTrng == 0 && CourseTrngDate.ToString() != "1/1/0001 12:00:00 AM")
        {
            ErrorMessage = "Registered for Training is selected as No. Please change your selection to Proceed.";

        }
        if (string.IsNullOrEmpty(ErrorMessage))
        {
            //Now Update the Record as validation is Ok
            SandlerRepositories.ContactsRepository contactRepository = new SandlerRepositories.ContactsRepository();
            contactRepository.Update(Convert.ToInt32(hidContactID.Value), CompanyID, LastName, FirstName,Title,ContactsDepartment,ContactsRole,Phone,MobilePhone,HomePhone,Fax, Email,PersonalEmail,Address,City,State,Zip,Country,
                DiscussionTopic, ActionStep,LastAttemptedDate,LastEmailedDate,LastMeetingDate,LetterSentDate, IsRegisteredForTrng, IsNewAppt, CourseId, AppsSourceId, LastDate, NextDate, CourseTrngDate,
                BlastEmailSubscription, NeedCallBack, BirthDayDate, AnniversaryDate, CompanyYears, BossName,SpouseName,ReferredBy,Notes);
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

        //For Birthday
        TextBox BirthdayDateCal = new TextBox();
        BirthdayDateCal = (TextBox)ContactDW.FindControl("BirthdayDate");
        if (BirthdayDateCal != null)
        {
            if (BirthdayDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                BirthdayDateCal.Text = default(System.String);
            }
            else
            {
                BirthdayDateCal.Text = BirthdayDateCal.Text.Replace("12:00:00 AM", "");
            }

        }


        //For Anniversary
        TextBox AnniversaryDateCal = new TextBox();
        AnniversaryDateCal = (TextBox)ContactDW.FindControl("AnniversaryDate");
        if (AnniversaryDateCal != null)
        {
            if (AnniversaryDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                AnniversaryDateCal.Text = default(System.String);
            }
            else
            {
                AnniversaryDateCal.Text = AnniversaryDateCal.Text.Replace("12:00:00 AM", "");
            }

        }
        
        //For Date Last Attempted
        TextBox LastAttemptedDateCal = new TextBox();
        LastAttemptedDateCal = (TextBox)ContactDW.FindControl("LastAttemptedDate");
        if (LastAttemptedDateCal != null)
        {
            if (LastAttemptedDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                LastAttemptedDateCal.Text = default(System.String);
            }
            else
            {
                LastAttemptedDateCal.Text = LastAttemptedDateCal.Text.Replace("12:00:00 AM", "");
            }
        }


        //For Date Last Emailed
        TextBox LastEmailedDateCal = new TextBox();
        LastEmailedDateCal = (TextBox)ContactDW.FindControl("LastEmailedDate");
        if (LastEmailedDateCal != null)
        {
            if (LastEmailedDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                LastEmailedDateCal.Text = default(System.String);
            }
            else
            {
                LastEmailedDateCal.Text = LastEmailedDateCal.Text.Replace("12:00:00 AM", "");
            }
        }

        //For Date of Last Meeting
        TextBox LastMeetingDateCal = new TextBox();
        LastMeetingDateCal = (TextBox)ContactDW.FindControl("LastMeetingDate");
        if (LastMeetingDateCal != null)
        {
            if (LastMeetingDateCal.Text == "1/1/1900 12:00:00 AM")
            {
                LastMeetingDateCal.Text = default(System.String);
            }
            else
            {
                LastMeetingDateCal.Text = LastMeetingDateCal.Text.Replace("12:00:00 AM", "");
            }
        }
        
        //For Date Letter Sent
        TextBox DateLetterSentOutCal = new TextBox();
        DateLetterSentOutCal = (TextBox)ContactDW.FindControl("DateLetterSentOut");
        if (DateLetterSentOutCal != null)
        {
            if (DateLetterSentOutCal.Text == "1/1/1900 12:00:00 AM")
            {
                DateLetterSentOutCal.Text = default(System.String);
            }
            else
            {
                DateLetterSentOutCal.Text = DateLetterSentOutCal.Text.Replace("12:00:00 AM", "");
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


        //For Birthday - Label
        Label BirthdayDateLabel = new Label();
        BirthdayDateLabel = (Label)ContactDW.FindControl("lblBirthdayDate");
        if (BirthdayDateLabel != null)
        {
            if (BirthdayDateLabel.Text == "1/1/1900")
            {
                BirthdayDateLabel.Text = "";
            }
        }


        //For Anniversay - Label
        Label AnniversaryDateLabel = new Label();
        AnniversaryDateLabel = (Label)ContactDW.FindControl("lblAnniversaryDate");
        if (AnniversaryDateLabel != null)
        {
            if (AnniversaryDateLabel.Text == "1/1/1900")
            {
                AnniversaryDateLabel.Text = "";
            }
        }
        
        //For LastAttemptedDate - Label
        Label LastAttemptedDateLabel = new Label();
        LastAttemptedDateLabel = (Label)ContactDW.FindControl("lblLastAttemptedDate");
        if (LastAttemptedDateLabel != null)
        {
            if (LastAttemptedDateLabel.Text == "1/1/1900")
            {
                LastAttemptedDateLabel.Text = "";
            }
        }


        //For LastEmailedDate - Label
        Label LastEmailedDateLabel = new Label();
        LastEmailedDateLabel = (Label)ContactDW.FindControl("lblLastEmailedDate");
        if (LastEmailedDateLabel != null)
        {
            if (LastEmailedDateLabel.Text == "1/1/1900")
            {
                LastEmailedDateLabel.Text = "";
            }
        }

        //For LastMeetingDate - Label
        Label LastMeetingDateLabel = new Label();
        LastMeetingDateLabel = (Label)ContactDW.FindControl("lblLastMeetingDate");
        if (LastMeetingDateLabel != null)
        {
            if (LastMeetingDateLabel.Text == "1/1/1900")
            {
                LastMeetingDateLabel.Text = "";
            }
        }

        //For DateLetterSentOut - Label
        Label DateLetterSentOutLabel = new Label();
        DateLetterSentOutLabel = (Label)ContactDW.FindControl("lblDateLetterSentOut");
        if (DateLetterSentOutLabel != null)
        {
            if (DateLetterSentOutLabel.Text == "1/1/1900")
            {
                DateLetterSentOutLabel.Text = "";
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