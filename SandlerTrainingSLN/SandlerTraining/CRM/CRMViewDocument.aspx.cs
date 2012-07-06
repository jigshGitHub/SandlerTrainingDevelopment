using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class CRMViewDocument : System.Web.UI.Page
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
        DocumentDW.DataBind();
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("CRMDocuments.aspx");
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
        string DocName = "";        
        string DocStatus = "";
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
        {
            TextBox DocStatusTB = new TextBox();
            DocStatusTB = (TextBox)DocumentDW.FindControl("txtDocStatus");
            if ((DocStatusTB != null))
            {
                DocStatus = DocStatusTB.Text;
            }
        }

        FileUpload FileUploadControl = new FileUpload();
        FileUploadControl = (FileUpload)DocumentDW.FindControl("Upload");
        if ((FileUploadControl != null))
        {
            DocName = FileUploadControl.FileName.ToString(); 
            //Save the actual file in the documents folder
            FileUploadControl.SaveAs(Server.MapPath("Documents\\" + DocName));
                        
        }
        //Now update the table
        //db.ExecuteNonQuery("sp_UpdateDocumentDetails", 
        //    new SqlParameter("@DocID", Convert.ToInt32(hidDocumentID.Value)),
        //    new SqlParameter("@DocStatus", DocStatus), 
        //    new SqlParameter("@DocName", DocName),
        //    new SqlParameter("@LastModifyDate", LastModifyDate));

        new SandlerRepositories.DocumentsRepository().Update(Convert.ToInt32(hidDocumentID.Value), DocStatus, DocName, LastModifyDate);
    }
}