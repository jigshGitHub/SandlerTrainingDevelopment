using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class DocumentDETAIL : BasePage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((PreviousPage != null))
            {
                //Find out ContactID selected by the User
                hidDocumentID.Value = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidDocumentID")).Value;
                GetDocumentDetails();
            }
        }
    }
    public void GetDocumentDetails()
    {
        //Now get the details
        System.Data.DataSet ds = new SandlerRepositories.DocumentsRepository().GetDetailsById(Convert.ToInt32(hidDocumentID.Value));
        DocumentDW.DataSource = ds;
        //Find the company ID for this Document and store in the Hidden field
        hidCompanyID.Value = ds.Tables[0].Rows[0]["COMPANIESID"].ToString();
        hidDocumentName.Value = ds.Tables[0].Rows[0]["DOCNAME"].ToString(); 
        DocumentDW.DataBind();
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/CRM/Documents/Index.aspx");
    }
    protected void DocumentDW_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //No code required
    }
    protected void DocumentDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        DocumentDW.ChangeMode(DetailsViewMode.ReadOnly);
        GetDocumentDetails();
    }
    protected void DocumentDW_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DocumentDW.ChangeMode(DetailsViewMode.Edit);
            LblStatus.Text = "";
            GetDocumentDetails();

        }
        else if (e.CommandName == "Update")
        {
            LblStatus.Text = "";
            UpdateDocumentDetails();
        }
        else if (e.CommandName == "Cancel")
        {
            DocumentDW.ChangeMode(DetailsViewMode.ReadOnly);
            LblStatus.Text = "";
            GetDocumentDetails();
        }
    }
    public void UpdateDocumentDetails()
    {
        string DocName = default(System.String);
        int DocStatus = default(System.Int32);
        int OppsID = default(System.Int32);
        System.DateTime LastModifyDate = default(System.DateTime);

        //For LastModifyDate
        {
            eWorld.UI.CalendarPopup LastModifyDateCal = new eWorld.UI.CalendarPopup();
            LastModifyDateCal = (eWorld.UI.CalendarPopup)DocumentDW.FindControl("LastModifyDate");
            if ((LastModifyDateCal != null))
            {
                LastModifyDate = LastModifyDateCal.SelectedDate;

            }
        }
        //For Document Status
        DropDownList DocStatusDDList = new DropDownList();
        DocStatusDDList = (DropDownList)DocumentDW.FindControl("ddlDocStatus");
        if ((DocStatusDDList != null))
        {
            DocStatus = Convert.ToInt32(DocStatusDDList.SelectedValue);

        }
        //For Opportunity
        DropDownList OpportunityDDList = new DropDownList();
        OpportunityDDList = (DropDownList)DocumentDW.FindControl("ddlOpportunity");
        if ((OpportunityDDList != null))
        {
            OppsID = Convert.ToInt32(OpportunityDDList.SelectedValue);

        }
        FileUpload FileUploadControl = new FileUpload();
        FileUploadControl = (FileUpload)DocumentDW.FindControl("Upload");
        if ((FileUploadControl != null))
        {
            DocName = FileUploadControl.FileName.ToString();
            if (string.IsNullOrEmpty(DocName))
            {
                //User has not uploaded new file so keep the same filename
                DocName = hidDocumentName.Value;
            }
            else
            {
                //Save the actual file in the documents folder
                FileUploadControl.SaveAs(Server.MapPath(DocName));
            }
                        
        }
        //Now Update
        new SandlerRepositories.DocumentsRepository().Update(Convert.ToInt32(hidDocumentID.Value), OppsID, DocName,DocStatus, LastModifyDate);
    }
}