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
    protected void CompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void dvContact_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //Clear All data entered by the User
        lblResult.Text = "";
        lblResult1.Text = "";
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

        string TrainingCourseName = default(System.String);
        string HowManyAttended = default(System.String);
        string CompanyNameWhereTrainingConducted = default(System.String);
        
        //Date Fields        
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);
        System.DateTime CourseTrgDate = default(System.DateTime);
        System.DateTime BirthDay = default(System.DateTime);
        System.DateTime Anniversary = default(System.DateTime);
        System.DateTime LastAttemptedDate = default(System.DateTime);
        System.DateTime LastEmailedDate = default(System.DateTime);
        System.DateTime LastMeetingDate = default(System.DateTime);
        System.DateTime LetterSentDate = default(System.DateTime);
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
        //For Email Subscription List
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

        //For Last Attempted Date
        {
            TextBox LastAttemptedDateCal = new TextBox();
            LastAttemptedDateCal = (TextBox)dvContact.FindControl("LastAttemptedDate");
            if ((LastAttemptedDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastAttemptedDateCal.Text))
                {
                    LastAttemptedDate = Convert.ToDateTime(LastAttemptedDateCal.Text.Trim());
                    searchObj.LastAttemptedDate = LastAttemptedDate;
                    IsCriteriaExist = true;
                }

            }
        }
        //For Last Emailed Date
        {
            TextBox LastEmailedDateCal = new TextBox();
            LastEmailedDateCal = (TextBox)dvContact.FindControl("LastEmailedDate");
            if ((LastEmailedDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastEmailedDateCal.Text))
                {
                    LastAttemptedDate = Convert.ToDateTime(LastEmailedDateCal.Text.Trim());
                    searchObj.LastEmailedDate = LastEmailedDate;
                    IsCriteriaExist = true;
                }

            }
        }
        //For Last Meeting Date
        {
            TextBox LastMeetingDateCal = new TextBox();
            LastMeetingDateCal = (TextBox)dvContact.FindControl("LastMeetingDate");
            if ((LastMeetingDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastMeetingDateCal.Text))
                {
                    LastMeetingDate = Convert.ToDateTime(LastMeetingDateCal.Text.Trim());
                    searchObj.LastMeetingDate = LastMeetingDate;
                    IsCriteriaExist = true;
                }

            }
        }
        //For Date Letter Sent Out
        {
            TextBox DateLetterSentOutCal = new TextBox();
            DateLetterSentOutCal = (TextBox)dvContact.FindControl("DateLetterSentOut");
            if ((DateLetterSentOutCal != null))
            {
                if (!string.IsNullOrEmpty(DateLetterSentOutCal.Text))
                {
                    LetterSentDate = Convert.ToDateTime(DateLetterSentOutCal.Text.Trim());
                    searchObj.LetterSentDate = LetterSentDate;
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

        //For Notes
        {
            TextBox NotesTextBox = new TextBox();
            NotesTextBox = (TextBox)dvContact.FindControl("txtNotes");
            if ((NotesTextBox != null))
            {
                Notes = NotesTextBox.Text;
                if (!string.IsNullOrEmpty(Notes))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Notes = Notes;
            }
        }
        //For Referred By
        {
            TextBox ReferredByTextBox = new TextBox();
            ReferredByTextBox = (TextBox)dvContact.FindControl("txtReferredBy");
            if ((ReferredByTextBox != null))
            {
                ReferredBy = ReferredByTextBox.Text;
                if (!string.IsNullOrEmpty(ReferredBy))
                {
                    IsCriteriaExist = true;
                }
                searchObj.ReferredBy = ReferredBy;
            }
        }
        //For Spouse Name
        {
            TextBox SpouseNameTextBox = new TextBox();
            SpouseNameTextBox = (TextBox)dvContact.FindControl("txtSpouseName");
            if ((SpouseNameTextBox != null))
            {
                SpouseName = SpouseNameTextBox.Text;
                if (!string.IsNullOrEmpty(SpouseName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.SpouseName = SpouseName;
            }
        }
        //For Title
        {
            TextBox TitleTextBox = new TextBox();
            TitleTextBox = (TextBox)dvContact.FindControl("txtTitle");
            if ((TitleTextBox != null))
            {
                Title = TitleTextBox.Text;
                if (!string.IsNullOrEmpty(Title))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Title = Title;
            }
        }
        //For Contacts Department  
        {
            TextBox DepartmentTextBox = new TextBox();
            DepartmentTextBox = (TextBox)dvContact.FindControl("txtDepartment");
            if ((DepartmentTextBox != null))
            {
                ContactsDepartment = DepartmentTextBox.Text;
                if (!string.IsNullOrEmpty(ContactsDepartment))
                {
                    IsCriteriaExist = true;
                }
                searchObj.ContactsDepartment = ContactsDepartment;
            }
        }
        //For Contacts Role
        {
            TextBox RoleTextBox = new TextBox();
            RoleTextBox = (TextBox)dvContact.FindControl("txtRole");
            if ((RoleTextBox != null))
            {
                ContactsRole = RoleTextBox.Text;
                if (!string.IsNullOrEmpty(ContactsRole))
                {
                    IsCriteriaExist = true;
                }
                searchObj.ContactsRole = ContactsRole;
            }
        }
        //For Mobile PhoneNumber 
        {
            TextBox MobilePhoneNoTextBox = new TextBox();
            MobilePhoneNoTextBox = (TextBox)dvContact.FindControl("txtMobilePhone");
            if ((MobilePhoneNoTextBox != null))
            {
                MobilePhone = MobilePhoneNoTextBox.Text;
                if (!string.IsNullOrEmpty(MobilePhone))
                {
                    IsCriteriaExist = true;
                }
                searchObj.MobilePhone = MobilePhone;
            }
        }
        //For Home PhoneNumber 
        {
            TextBox HomePhoneNoTextBox = new TextBox();
            HomePhoneNoTextBox = (TextBox)dvContact.FindControl("txtHomePhone");
            if ((HomePhoneNoTextBox != null))
            {
                HomePhone = HomePhoneNoTextBox.Text;
                if (!string.IsNullOrEmpty(HomePhone))
                {
                    IsCriteriaExist = true;
                }
                searchObj.HomePhone = HomePhone;
            }
        }
        //For Fax
        {
            TextBox FaxTextBox = new TextBox();
            FaxTextBox = (TextBox)dvContact.FindControl("txtFax");
            if ((FaxTextBox != null))
            {
                Fax = FaxTextBox.Text;
                if (!string.IsNullOrEmpty(Fax))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Fax = Fax;
            }
        }
        //For PersonalEmail 
        {
            TextBox PersonalEmailTextBox = new TextBox();
            PersonalEmailTextBox = (TextBox)dvContact.FindControl("txtPersonalEmail");
            if ((PersonalEmailTextBox != null))
            {
                PersonalEmail = PersonalEmailTextBox.Text;
                if (!string.IsNullOrEmpty(PersonalEmail))
                {
                    IsCriteriaExist = true;
                }
                searchObj.PersonalEmail = PersonalEmail;
            }
        }
        //For Address
        {
            TextBox AddressTextBox = new TextBox();
            AddressTextBox = (TextBox)dvContact.FindControl("txtAddress");
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
            CityTextBox = (TextBox)dvContact.FindControl("txtCity");
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
            StateTextBox = (TextBox)dvContact.FindControl("txtState");
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
            ZipTextBox = (TextBox)dvContact.FindControl("txtZip");
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
        //For Country
        {
            TextBox CountryTextBox = new TextBox();
            CountryTextBox = (TextBox)dvContact.FindControl("txtCountry");
            if ((CountryTextBox != null))
            {
                Country = CountryTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(Country))
                {
                    IsCriteriaExist = true;
                }
                searchObj.Country = Country;
            }
        }

        //For Training Course Name
        {
            TextBox TrainingCourseNameTextBox = new TextBox();
            TrainingCourseNameTextBox = (TextBox)dvContact.FindControl("txtTrainingCourseName");
            if ((TrainingCourseNameTextBox != null))
            {
                TrainingCourseName = TrainingCourseNameTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(TrainingCourseName))
                {
                    IsCriteriaExist = true;
                }
                searchObj.TrainingCourseName = TrainingCourseName;
            }
        }

        //For Training Course Name
        {
            TextBox CompanyNameWhereTrainingConductedTextBox = new TextBox();
            CompanyNameWhereTrainingConductedTextBox = (TextBox)dvContact.FindControl("txtCompanyNameWhereTrainingConducted");
            if ((CompanyNameWhereTrainingConductedTextBox != null))
            {
                CompanyNameWhereTrainingConducted = CompanyNameWhereTrainingConductedTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(CompanyNameWhereTrainingConducted))
                {
                    IsCriteriaExist = true;
                }
                searchObj.CompanyNameWhereTrainingConducted = CompanyNameWhereTrainingConducted;
            }
        }

        //For How Many Attended?
        {
            TextBox HowManyAttendedTextBox = new TextBox();
            HowManyAttendedTextBox = (TextBox)dvContact.FindControl("txtHowManyAttended");
            if ((HowManyAttendedTextBox != null))
            {
                HowManyAttended = HowManyAttendedTextBox.Text.Trim();
                if (!string.IsNullOrEmpty(HowManyAttended))
                {
                    IsCriteriaExist = true;
                }
                searchObj.HowManyAttended = HowManyAttended;
            }
        }


        if (!IsCriteriaExist)
        {
            e.Cancel = true;
            lblResult.Text = "Please enter/select at lease one criteria for search.";
            lblResult1.Text = "Please enter/select at lease one criteria for search.";
        }
        else
        {
            Session["ContactSearchCriteria"] = searchObj;
            //Now first check if data is available for the supplied search criteria
            SandlerRepositories.ContactsRepository contactsRepository = new SandlerRepositories.ContactsRepository();
            //Update Company Information
            DataSet ds = contactsRepository.GetAllForSearch(CurrentUser); 
            if (ds.Tables[0].Rows.Count > 0)
            {
                //we have data so go ahead and show the SearchResults page
                Session["ContactSearchCount"] = ds.Tables[0].Rows.Count;
                lblResult.Text = "";
                lblResult1.Text = "";
                //Now go the the Search Results Page
                Response.Redirect("~/CRM/Contacts/SearchResults.aspx");

            }
            else
            {
                e.Cancel = true;
                lblResult.Text = "There are no results matching with your criteria.";
                lblResult1.Text = "There are no results matching with your criteria.";
            }

        }

    }
}