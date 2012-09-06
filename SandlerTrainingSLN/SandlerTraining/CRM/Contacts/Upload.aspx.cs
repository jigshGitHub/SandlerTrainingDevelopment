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
using System.Configuration;

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
        FileName = Server.MapPath(ConfigurationManager.AppSettings["DocumentsUploadLocation"] + fileToUpload.ResolveClientUrl(fileToUpload.FileName));
        //http://www.microsoft.com/en-us/download/confirmation.aspx?id=23734
        SandlerRepositories.ContactsRepository contactRepository;
        TBL_CONTACTS contact;
        DataRow excelRow = null;
        try
        {
            if (IsDataValid())
            {
                fileToUpload.SaveAs(FileName);

                SetUpExcel();

                SetUpLogData();

                contactRepository = new SandlerRepositories.ContactsRepository();

                for (int i = 0; i < ExcelData.Rows.Count; i++)
                {
                    try
                    {
                        excelRow = ExcelData.Rows[i];

                        contact = new SandlerModels.TBL_CONTACTS();

                        if (IsExcelDataValid(excelRow))
                        {
                            FillContact(contact, excelRow);

                            contactRepository.Add(contact);
                        }

                    }
                    catch (Exception ex)
                    {
                        excelRow["Errormessage"] = ex.Message;

                        CreateLogRow(excelRow);

                    }

                }

                showHideDialogFlag.Value = "0";

                System.IO.File.Delete(FileName);
                pnlFileUpload.Visible = false;

                if (LogData.Rows.Count > 0)
                {
                    BindLogGrid();
                }
                else
                {
                    UserEntitiesFactory.ReLoad();
                    Response.Redirect("~/CRM/Contacts/Index.aspx");
                }
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

    private bool IsExcelDataValid(DataRow excelRow)
    {
        bool excelDataValid = true;
        if (!string.IsNullOrEmpty(excelRow["IsRegisteredForTraining"].ToString()))
        {
            if (string.IsNullOrEmpty(excelRow["CourseId"].ToString()))
            {
                excelDataValid = false;
                excelRow["Errormessage"] = "Course Id is required.";
            }
            if (string.IsNullOrEmpty(excelRow["CourseTrainingDate"].ToString()))
            {
                excelDataValid = false;
                excelRow["Errormessage"] = "Course Training Date is required.";
            }
        }
        if (!excelDataValid)
            CreateLogRow(excelRow);

        return excelDataValid;
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
            if (!string.IsNullOrEmpty(excelRow["Anniversary"].ToString()))
                contact.Anniversary = Convert.ToDateTime(excelRow["Anniversary"].ToString());
            contact.ApptSourceId = int.Parse(excelRow["ApptSourceId"].ToString());
            if (!string.IsNullOrEmpty(excelRow["Birthday"].ToString()))
                contact.Birthday = Convert.ToDateTime(excelRow["Birthday"].ToString());
            contact.BossName = excelRow["BossName"].ToString();
            contact.COMPANYID = int.Parse(companyList.SelectedValue);
            
            contact.CreatedBy = CurrentUser.UserId.ToString();
            contact.CreatedDate = DateTime.Now;
            contact.DiscussionTopic = excelRow["DiscussionTopic"].ToString();
            contact.EMAIL = excelRow["EMAIL"].ToString();
            contact.FIRSTNAME = excelRow["FIRSTNAME"].ToString();
            contact.IsEmailSubscription = true;
            contact.IsNewAppointment = (excelRow["IsNewAppointment"].ToString() == "0") ? false : true;
            if (!string.IsNullOrEmpty(excelRow["IsRegisteredForTraining"].ToString()))
            {
                contact.IsRegisteredForTraining = (excelRow["IsRegisteredForTraining"].ToString() == "1") ? true : false;
                if (contact.IsRegisteredForTraining.HasValue == true)
                {
                    if (!string.IsNullOrEmpty(excelRow["CourseId"].ToString()))
                    {
                        contact.CourseId = int.Parse(excelRow["CourseId"].ToString());
                    }
                    else
                    {
                        throw new Exception("Course is required when contact is registered for training");
                    }
                    if (!string.IsNullOrEmpty(excelRow["CourseTrainingDate"].ToString()))
                    {
                        contact.CourseTrainingDate = Convert.ToDateTime(excelRow["CourseTrainingDate"].ToString());
                    }
                    else
                    {
                        throw new Exception("Course Training Date is required when contact is registered for training");
                    }
                }
            }
            if (!string.IsNullOrEmpty(excelRow["LAST_CONTACT_DATE"].ToString()))
                contact.LAST_CONTACT_DATE = Convert.ToDateTime(excelRow["LAST_CONTACT_DATE"].ToString());
            contact.LASTNAME = excelRow["LASTNAME"].ToString();
            if (!string.IsNullOrEmpty(excelRow["NEXT_CONTACT_DATE"].ToString()))
                contact.NEXT_CONTACT_DATE = Convert.ToDateTime(excelRow["NEXT_CONTACT_DATE"].ToString());
            
            if (!string.IsNullOrEmpty(excelRow["IsNeedCallBack"].ToString()))
            {
                contact.IsNeedCallBack = (excelRow["IsNeedCallBack"].ToString() == "1") ? true : false;
                if (!string.IsNullOrEmpty(excelRow["CallBackCreatedDate"].ToString()))
                {
                    contact.CallBackCreatedDate = Convert.ToDateTime(excelRow["CallBackCreatedDate"].ToString());
                }
            }

            contact.PHONE = excelRow["PHONE"].ToString();
            contact.IsActive = true;
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
            gvCompanies.DataSource = LogData;
            gvCompanies.DataBind();

            lblMessage.Text = "Following records are not being uploaded";

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}