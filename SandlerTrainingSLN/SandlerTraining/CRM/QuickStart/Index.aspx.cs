using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRM_QuickStart_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvQuickStart_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Company,Contact and Opportunity record (All-in-one) created Successfully!";

    }
    protected void ProductTypesDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void InsertOperation_Selecting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void dvQuickStart_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void dvQuickStart_DataBound(object sender, EventArgs e)
    {
        //For Pain DDL
        DropDownList ddlPainDropDownList = new DropDownList();
        ddlPainDropDownList = (DropDownList)dvQuickStart.FindControl("ddlPain");
        if ((ddlPainDropDownList != null))
        {
            ListItem selectItem = new ListItem("--Select Pain--", "0");
            ddlPainDropDownList.Items.Insert(0, selectItem);
        }
        //For Product DDL
        DropDownList ddlProductsDropDownList = new DropDownList();
        ddlProductsDropDownList = (DropDownList)dvQuickStart.FindControl("ddlProducts");
        if ((ddlProductsDropDownList != null))
        {
            ListItem selectItem = new ListItem("--Select Product--", "0");
            ddlProductsDropDownList.Items.Insert(0, selectItem);
        }
        //For Opportunity Status DDL
        DropDownList ddlOppStatusDropDownList = new DropDownList();
        ddlOppStatusDropDownList = (DropDownList)dvQuickStart.FindControl("ddlOppStatus");
        if ((ddlOppStatusDropDownList != null))
        {
            ListItem selectItem = new ListItem("--Select Opportunity Status--", "0");
            ddlOppStatusDropDownList.Items.Insert(0, selectItem);
        }
        //For Opportunity Source DDL
        DropDownList ddlOppSourceDropDownList = new DropDownList();
        ddlOppSourceDropDownList = (DropDownList)dvQuickStart.FindControl("ddlOppSource");
        if ((ddlOppSourceDropDownList != null))
        {
            ListItem selectItem = new ListItem("--Select Opportunity Source--", "0");
            ddlOppSourceDropDownList.Items.Insert(0, selectItem);
        }
        //For Opportunity Type DDL
        DropDownList ddlOppTypeDropDownList = new DropDownList();
        ddlOppTypeDropDownList = (DropDownList)dvQuickStart.FindControl("ddlOppType");
        if ((ddlOppTypeDropDownList != null))
        {
            ListItem selectItem = new ListItem("--Select Opportunity Type--", "0");
            ddlOppTypeDropDownList.Items.Insert(0, selectItem);
        }
        ////For Is New Appt
        //DropDownList NewApptDDList = new DropDownList();
        //NewApptDDList = (DropDownList)dvQuickStart.FindControl("ddlAccount");
        //if ((NewApptDDList != null))
        //{
        //    ListItem selectItem = new ListItem("--Select New Appointment--", "0");
        //    NewApptDDList.Items.Insert(0, selectItem);            

        //}
        //For Appt Source
        DropDownList ApptSourceDDList = new DropDownList();
        ApptSourceDDList = (DropDownList)dvQuickStart.FindControl("ddlApptSource");
        if ((ApptSourceDDList != null))
        {
            ListItem selectItem = new ListItem("--Select Appointment Source--", "0");
            ApptSourceDDList.Items.Insert(0, selectItem);            

        }
        ////Is Registered for Training
        //DropDownList IsRegisteredDDList = new DropDownList();
        //IsRegisteredDDList = (DropDownList)dvQuickStart.FindControl("ddlRegForTraining");
        //if ((IsRegisteredDDList != null))
        //{
        //    ListItem selectItem = new ListItem("--Select Registered for Training--", "0");
        //    IsRegisteredDDList.Items.Insert(0, selectItem); 

        //}
        //Course Type
        DropDownList CourseType = new DropDownList();
        CourseType = (DropDownList)dvQuickStart.FindControl("ddlCourse");
        if ((CourseType != null))
        {
            ListItem selectItem = new ListItem("--Select Course Type--", "0");
            CourseType.Items.Insert(0, selectItem);

        }
             //Industry
        DropDownList Industry = new DropDownList();
        Industry = (DropDownList)dvQuickStart.FindControl("ddlIndustry");
        if ((Industry != null))
        {
            ListItem selectItem = new ListItem("--Select Industry--", "0");
            Industry.Items.Insert(0, selectItem);

        }
        
       



    }
}