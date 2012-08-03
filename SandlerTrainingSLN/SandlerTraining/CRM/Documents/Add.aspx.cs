﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient; 

public partial class DocumentADD : BasePage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvDocument_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Document attached Successfully!";

    }
    protected void ddlCompany_DataBound(object sender, System.EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select Company--", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }

    }
    protected void ddlOpportunity_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        dvDocument.Visible = false;
        if (!(ddlOpportunity.SelectedIndex == 0))
        {
            dvDocument.Visible = true;
        }
    }
    protected void ddlOpportunity_DataBound(object sender, System.EventArgs e)
    {
        if (!(ddlOpportunity.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select Opportunity--", "0");
            ddlOpportunity.Items.Insert(0, selectItem);
            
        }
        else
        {
            if (!(ddlCompany.SelectedIndex == 0))
            {
                dvDocument.Visible = false;
                ClientScript.RegisterStartupScript(this.GetType(), "NoOpp", ("<script> alert('Please add opportunity to the selected company prior to attaching the document.'); </script>"));
            }
        }


    }
    protected void dvDocument_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/Documents/Index.aspx");
        }
    }
    
    protected void dvDocument_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        string DocName = default(System.String);
        int DocStatus = default(System.Int32);
        System.DateTime LastModifyDate = default(System.DateTime);

        
        //for file
        FileUpload FileUploadControl = new FileUpload();
        FileUploadControl = (FileUpload)dvDocument.FindControl("Upload");
        if ((FileUploadControl != null))
        {
            DocName = FileUploadControl.FileName.ToString();
            //check if we have Document name
            if (!string.IsNullOrEmpty(DocName))
            {
                //Save the actual file in the documents folder
                FileUploadControl.SaveAs(Server.MapPath(DocName));
            }
            else
            {
                //There is not file to attach so inform the user
                ClientScript.RegisterStartupScript(this.GetType(), "NoDocument", ("<script> alert('Please click on Browse button and select document to attach.'); </script>"));
                e.Cancel = true;
            }
            
        }
        //For LastModifyDate
        {
            eWorld.UI.CalendarPopup LastModifyDateCal = new eWorld.UI.CalendarPopup();
            LastModifyDateCal = (eWorld.UI.CalendarPopup)dvDocument.FindControl("LastModifyDate");
            if ((LastModifyDateCal != null))
            {
                LastModifyDate = LastModifyDateCal.SelectedDate;

            }
        }
        //For Document Status
        DropDownList DocStatusDDList = new DropDownList();
        DocStatusDDList = (DropDownList)dvDocument.FindControl("ddlDocStatus");
        if ((DocStatusDDList != null))
        {
            DocStatus = Convert.ToInt32(DocStatusDDList.SelectedValue);

        }
        if (!e.Cancel)
        {
            new SandlerRepositories.DocumentsRepository().Insert(Convert.ToInt32(ddlOpportunity.SelectedValue), DocStatus, DocName, LastModifyDate);
            lblResult.Text = "Document attached Successfully!";
        }
        
    }
}