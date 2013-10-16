using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CRM_QuickStart_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }
    private void BindData()
    {
       DataTable _dt = new DataTable();
       _dt.Rows.Add(_dt.NewRow());
    //    gvNotesHistory.DataSource = _dt;
    //    gvNotesHistory.DataBind();
    //    int columnsCount = gvNotesHistory.Columns.Count;
    //    gvNotesHistory.Rows[0].Cells.Clear();// clear all the cells in the row
    //    gvNotesHistory.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
    //    gvNotesHistory.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

    //    //You can set the styles here
    //    gvNotesHistory.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
    //    gvNotesHistory.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Black;
    //    gvNotesHistory.Rows[0].Cells[0].Font.Bold = true;
    //    //set No Results found to the new added cell
    //    gvNotesHistory.Rows[0].Cells[0].Text = "No Record Found.";
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
    protected void ddlRegForTraining_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlRegForTraining = new DropDownList();
        ddlRegForTraining = (DropDownList)dvQuickStart.FindControl("ddlRegForTraining");
        if ((ddlRegForTraining != null))
        {
            if (ddlRegForTraining.SelectedValue == "1")
            {

                DropDownList ddlCourse = (DropDownList)dvQuickStart.FindControl("ddlCourse");
                if (ddlCourse.SelectedValue == "0")
                {
                    (dvQuickStart.FindControl("rfvCourse") as RequiredFieldValidator).Enabled = true;
                    (dvQuickStart.FindControl("mandlbl48") as Label).Visible = true;
                }
                TextBox CourseTrngDate = (TextBox)dvQuickStart.FindControl("CourseTrngDate");
                if (CourseTrngDate.Text == "")
                {
                    (dvQuickStart.FindControl("reqFieldCourseTrngDate") as RequiredFieldValidator).Enabled = true;
                    (dvQuickStart.FindControl("mandlbl49") as Label).Visible = true;

                }
                TextBox txtTrngCourseName = (TextBox)dvQuickStart.FindControl("txtTrngCourseName");
                if (txtTrngCourseName.Text == "")
                {
                    (dvQuickStart.FindControl("rFVTrngCourseName") as RequiredFieldValidator).Enabled = true;
                    (dvQuickStart.FindControl("mandlbl50") as Label).Visible = true;
                }
                TextBox txtHowManyAttended = (TextBox)dvQuickStart.FindControl("txtHowManyAttended");
                if (txtHowManyAttended.Text == "")
                {
                    (dvQuickStart.FindControl("rFVHowManyAttended") as RequiredFieldValidator).Enabled = true;
                    (dvQuickStart.FindControl("mandlbl51") as Label).Visible = true;
                }
            }
            else
            {                
                (dvQuickStart.FindControl("rfvCourse") as RequiredFieldValidator).Enabled = false;
                (dvQuickStart.FindControl("mandlbl48") as Label).Visible = false;                
                (dvQuickStart.FindControl("reqFieldCourseTrngDate") as RequiredFieldValidator).Enabled = false;
                (dvQuickStart.FindControl("mandlbl49") as Label).Visible = false;                
                (dvQuickStart.FindControl("rFVTrngCourseName") as RequiredFieldValidator).Enabled = false;
                (dvQuickStart.FindControl("mandlbl50") as Label).Visible = false;                
                (dvQuickStart.FindControl("rFVHowManyAttended") as RequiredFieldValidator).Enabled = false;
                (dvQuickStart.FindControl("mandlbl51") as Label).Visible = false;                
            }

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
         //Find out Loggedin User's First and Last Name for Auto Polulatation
        SandlerRepositories.CompaniesRepository companyRepository = new SandlerRepositories.CompaniesRepository();
        System.Data.DataSet ds = companyRepository.GetFirstLastNameInfo(CurrentUser.UserId.ToString());

        string FName = "";
        string LName = "";

        if (ds.Tables[0].Rows.Count > 0)
        {
            FName = ds.Tables[0].Rows[0].ItemArray[0].ToString();
            LName = ds.Tables[0].Rows[0].ItemArray[1].ToString();

        }

        TextBox SalesRepLastName = new TextBox();
        SalesRepLastName = (TextBox)dvQuickStart.FindControl("txtSalesRepLastName");
        if (SalesRepLastName != null)
        {
            SalesRepLastName.Text = LName;
        }
        TextBox SalesRepFirstName = new TextBox();
        SalesRepFirstName = (TextBox)dvQuickStart.FindControl("txtSalesRepFirstName");
        if (SalesRepFirstName != null)
        {
            SalesRepFirstName.Text = FName;
        }



    }

    
}