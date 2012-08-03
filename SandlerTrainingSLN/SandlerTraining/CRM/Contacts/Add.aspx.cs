﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactADD : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvContact_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Contact created Successfully!";

    }
    protected void dvContact_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/Contacts/Index.aspx");
        }
    }
    protected void dvContact_DataBound(object sender, EventArgs e)
    {
        //For Course DDL
        DropDownList CourseDDList = new DropDownList();
        CourseDDList = (DropDownList)dvContact.FindControl("ddlCourse");
        if ((CourseDDList != null))
        {
            ListItem selectItem = new ListItem("--Select Course--", "0");
            CourseDDList.Items.Insert(0, selectItem);
        }

        //For Appointment Source
        DropDownList ApptSourceDDList = new DropDownList();
        ApptSourceDDList = (DropDownList)dvContact.FindControl("ddlApptSource");
        if ((ApptSourceDDList != null))
        {
            ListItem selectItem = new ListItem("--Select Appointment Source--", "0");
            ApptSourceDDList.Items.Insert(0, selectItem);
        }
        
    }
    protected void dvContact_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        //For Course DDL
        string selectedCourse = default(System.String);
        string IsRegistered = default(System.String);
        DateTime CourseTrgDate = default(System.DateTime);
        System.DateTime NextDate = default(System.DateTime);
        System.DateTime LastDate = default(System.DateTime);

        string IsNewAppt = default(System.String);
        string ApptSource = default(System.String);

        //ddlAccount
        //ddlApptSource

        string ErrorMessage = default(System.String);

        DropDownList CourseDDList = new DropDownList();
        CourseDDList = (DropDownList)dvContact.FindControl("ddlCourse");
        if ((CourseDDList != null))
        {
            selectedCourse = CourseDDList.SelectedValue; 
            
        }
        //For Is New Appt
        DropDownList NewApptDDList = new DropDownList();
        NewApptDDList = (DropDownList)dvContact.FindControl("ddlAccount");
        if ((NewApptDDList != null))
        {
            IsNewAppt = NewApptDDList.SelectedItem.Text;

        }
        //For Appt Source
        DropDownList ApptSourceDDList = new DropDownList();
        ApptSourceDDList = (DropDownList)dvContact.FindControl("ddlApptSource");
        if ((ApptSourceDDList != null))
        {
            ApptSource = ApptSourceDDList.SelectedValue;

        }

        DropDownList IsRegisteredDDList = new DropDownList();
        IsRegisteredDDList = (DropDownList)dvContact.FindControl("ddlRegForTraining");
        if ((IsRegisteredDDList != null))
        {
            IsRegistered = IsRegisteredDDList.SelectedValue;

        }
        //For Course Training Date
        {
            eWorld.UI.CalendarPopup CourseTrainingDateCal = new eWorld.UI.CalendarPopup();
            CourseTrainingDateCal = (eWorld.UI.CalendarPopup)dvContact.FindControl("CourseTrngDate");
            if ((CourseTrainingDateCal != null))
            {
                CourseTrgDate = CourseTrainingDateCal.SelectedDate;

            }
        }

        //For Last Contact Date
        {
            eWorld.UI.CalendarPopup LastContactDateCal = new eWorld.UI.CalendarPopup();
            LastContactDateCal = (eWorld.UI.CalendarPopup)dvContact.FindControl("LastContactDate");
            if ((LastContactDateCal != null))
            {
                LastDate = LastContactDateCal.SelectedDate;

            }
        }
        //For Next Contact Date
        {
            eWorld.UI.CalendarPopup NextContactDateCal = new eWorld.UI.CalendarPopup();
            NextContactDateCal = (eWorld.UI.CalendarPopup)dvContact.FindControl("NextContactDate");
            if ((NextContactDateCal != null))
            {
                NextDate = NextContactDateCal.SelectedDate;

            }
        }

        if (IsNewAppt == "No" && ApptSource != "0")
        {
            ErrorMessage = "New Appointment? is selected as No. Please change your selection to Proceed.";
        }

        if (IsNewAppt == "Yes" && ApptSource == "0")
        {
            ErrorMessage = "Please select Appointment Source to Proceed.";
        }

        //if (CourseTrgDate <= LastDate)
        //{
        //    ErrorMessage = "Course Training Date should be greater than the Last Contact date.";
        //}
        //if (NextDate <= LastDate)
        //{
        //    ErrorMessage = "Next Contact Date should be greater than the Last Contact Date.";
        //}
        if ((CourseTrgDate.ToString() != "1/1/0001 12:00:00 AM" && selectedCourse == "0") || (selectedCourse == "0" && IsRegistered == "1"))
        {
            ErrorMessage = "Please select Course Type to Proceed.";
        }
        //Course Training Date is not selected
        if ((CourseTrgDate.ToString() == "1/1/0001 12:00:00 AM" && selectedCourse != "0") || (CourseTrgDate.ToString() == "1/1/0001 12:00:00 AM" && IsRegistered == "1"))
        {
            ErrorMessage = "Please select Course Training Date to Proceed.";
        }
        
        if (selectedCourse != "0" && IsRegistered == "0" && CourseTrgDate.ToString() != "1/1/0001 12:00:00 AM")
        {
            ErrorMessage = "Registered for Training is selected as No. Please change your selection to Proceed.";
            
        }
        if (!string.IsNullOrEmpty(ErrorMessage))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ValidationIssue", ("<script> alert('" + ErrorMessage + "'); </script>"));
            e.Cancel = true;
        }

    }
}