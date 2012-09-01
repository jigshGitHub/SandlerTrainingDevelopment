using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using SandlerModels;
using SandlerModels.DataModels;

public partial class CRM_Contacts_Upload : UploaderBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hdnFrenchiseeID.Value = CurrentUser.FranchiseeID.ToString();

            var data = from company in UserEntitiesFactory.Get(CurrentUser).Companies
                       select new { Name = company.COMPANYNAME, Id = company.COMPANIESID };

            companyList.DataSource = data;
            companyList.DataTextField = "Name";
            companyList.DataValueField = "Id";
            companyList.DataBind();
            companyList.Items.Insert(0, "Select company");
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        FileName = fileToUpload.ResolveClientUrl(fileToUpload.FileName);
        //http://www.microsoft.com/en-us/download/confirmation.aspx?id=23734
        SandlerRepositories.ContactsRepository contactRepository;
        TBL_CONTACTS contact;
        DataRow excelRow = null;
        try
        {
            if (IsDataValid())
            {
                fileToUpload.SaveAs(Server.MapPath(FileName));

                SetUpExcel();

                SetUpLogData();

                contactRepository = new SandlerRepositories.ContactsRepository();

                for (int i = 0; i < ExcelData.Rows.Count; i++)
                {
                    try
                    {
                        excelRow = ExcelData.Rows[i];

                        contact = new SandlerModels.TBL_CONTACTS();

                        FillContact(contact, excelRow);

                        contactRepository.Add(contact);

                    }
                    catch (Exception ex)
                    {
                        excelRow["Errormessage"] = ex.Message;

                        CreateLogRow(excelRow);

                    }

                }

                showHideDialogFlag.Value = "0";

                System.IO.File.Delete(Server.MapPath(FileName));
                pnlFileUpload.Visible = false;

                BindLogGrid();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
    }

    private bool IsDataValid()
    {
        bool isDataValid = true;
        lblCompanyListRequired.Text = "";
        lblFileToUpload.Text = "";
        if (companyList.SelectedIndex == 0)
        {
            lblCompanyListRequired.Text = "Please select the company.";
            isDataValid = false;
        }
        else if (string.IsNullOrEmpty(fileToUpload.FileName))
        {
            lblFileToUpload.Text = "Please browse the file to upload the data.";
            isDataValid = false;
        }
        return isDataValid;
    }

    private void FillContact(TBL_CONTACTS contact, DataRow excelRow)
    {
        try
        {
            contact.ACTIONSTEP = excelRow["ACTIONSTEP"].ToString();
            //if (!string.IsNullOrEmpty(excelRow["Anniversary"].ToString()))
            //    contact.Anniversary = Convert.ToDateTime(excelRow["Anniversary"].ToString());
            contact.ApptSourceId = int.Parse(excelRow["ApptSourceId"].ToString());
            //if (!string.IsNullOrEmpty(excelRow["Birthday"].ToString()))
            //    contact.Birthday = Convert.ToDateTime(excelRow["Birthday"].ToString());
            //contact.BossName = excelRow["BossName"].ToString();
            contact.COMPANYID = int.Parse(companyList.SelectedValue);
            if (!string.IsNullOrEmpty(excelRow["CourseId"].ToString()))
                contact.CourseId = int.Parse(excelRow["CourseId"].ToString());
            if (!string.IsNullOrEmpty(excelRow["CourseTrainingDate"].ToString()))
                contact.CourseTrainingDate = Convert.ToDateTime(excelRow["CourseTrainingDate"].ToString());
            contact.CreatedBy = CurrentUser.UserId.ToString();
            contact.CreatedDate = DateTime.Now;
            contact.DiscussionTopic = excelRow["DiscussionTopic"].ToString();
            contact.EMAIL = excelRow["E-mail"].ToString();
            contact.FIRSTNAME = excelRow["FIRSTNAME"].ToString();
            contact.IsEmailSubscription = true;
            contact.IsNewAppointment = (excelRow["IsNewAppointment"].ToString() == "0") ? false : true;
            contact.IsRegisteredForTraining = (excelRow["IsRegisteredForTraining"].ToString() == "0") ? false : true;
            if (!string.IsNullOrEmpty(excelRow["LASTCONTACT_DATE"].ToString()))
                contact.LAST_CONTACT_DATE = Convert.ToDateTime(excelRow["LASTCONTACT_DATE"].ToString());
            contact.LASTNAME = excelRow["LASTNAME"].ToString();
            //if (!string.IsNullOrEmpty(excelRow["NEXTCONTACT_DATE"].ToString()))
            //    contact.NEXT_CONTACT_DATE = Convert.ToDateTime(excelRow["NEXTCONTACT_DATE"].ToString());

            contact.PHONE = excelRow["PHONE"].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindLogGrid()
    {
        try
        {
            if (LogData.Rows.Count > 0)
            {
                gvCompanies.DataSource = LogData;
                gvCompanies.DataBind();

                lblMessage.Text = "Following records are not being uploaded";
            }
            else
            {
                Response.Redirect("~/CRM/Contacts/Index.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}