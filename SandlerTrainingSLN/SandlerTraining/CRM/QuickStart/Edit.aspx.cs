using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SandlerRepositories;
using System.Globalization;

public partial class CRM_QuickStart_Index : OpportunityBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Binddropdowns();
        }
        BindData();
    }
  
    private void BindData()
    {
       DataTable _dt = new DataTable();
       _dt.Rows.Add(_dt.NewRow());
        //gvNotesHistory.DataSource = _dt;
        //gvNotesHistory.DataBind();
        //int columnsCount = gvNotesHistory.Columns.Count;
        //gvNotesHistory.Rows[0].Cells.Clear();// clear all the cells in the row
        //gvNotesHistory.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
        //gvNotesHistory.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

        ////You can set the styles here
        //gvNotesHistory.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        //gvNotesHistory.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Black;
        //gvNotesHistory.Rows[0].Cells[0].Font.Bold = true;
        ////set No Results found to the new added cell
        //gvNotesHistory.Rows[0].Cells[0].Text = "No Record Found.";
    }
    
   
   
     private void BindQuickStartInformation(int companyId,int opportunityID)
    {
        QuickStartRepository quickStartRepository = new QuickStartRepository();
        DataSet ds = new DataSet();
        ds = quickStartRepository.GetQuickStartInformationByCompanyandOpportunityIDs(companyId, opportunityID);
        //dvQuickStart.DataSource = ds;
        //dvQuickStart.DataBind();
     }

     private void BindNotesHistory()
     {
     }
    public void GetQuickStartInformation()
    {
        //Now get the details
        QuickStartRepository quickStartRepository = new QuickStartRepository();
        DataSet ds = new DataSet();
        ds = quickStartRepository.GetQuickStartInformationByCompanyandOpportunityIDs(int.Parse(ddlCompany.SelectedValue), int.Parse(ddlOpportunity.SelectedValue));
        txtCompName.Text = ds.Tables[0].Rows[0]["COMPANYNAME"].ToString();
        txtFirstName.Text = ds.Tables[0].Rows[0]["PrimaryContactFirstName"].ToString();

        txtLastName.Text = ds.Tables[0].Rows[0]["PrimaryContactLastName"].ToString();
        txtPhone.Text = ds.Tables[0].Rows[0]["PrimaryContactPhone"].ToString();
        txtEmail.Text = ds.Tables[0].Rows[0]["PrimaryContactEmail"].ToString();
        txtOppName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        txtSalesRepLastName.Text = ds.Tables[0].Rows[0]["SALESREPLASTNAME"].ToString();
        txtSalesRepFirstName.Text = ds.Tables[0].Rows[0]["SALESREPFIRSTNAME"].ToString();
        txtPain.Text = ds.Tables[0].Rows[0]["Pain"].ToString();
        txtLengthOfProblem.Text = ds.Tables[0].Rows[0]["LengthOfProblem"].ToString();
        txtAlternatives.Text = ds.Tables[0].Rows[0]["Alternatives"].ToString();
        txtCostToFix.Text = ds.Tables[0].Rows[0]["CostToFix"].ToString();
        if (ds.Tables[0].Rows[0]["IsBudgeIdentified"] != null && ds.Tables[0].Rows[0]["IsBudgeIdentified"] != "")
        {
            if(ds.Tables[0].Rows[0]["IsBudgeIdentified"].ToString() == "True")            
                ddlBudgeIdentified.SelectedValue = "1";            
            else
                ddlBudgeIdentified.SelectedValue="0";
        }
        if (ds.Tables[0].Rows[0]["IsMoveForward"] != null && ds.Tables[0].Rows[0]["IsMoveForward"] != "")
        {
            if (ds.Tables[0].Rows[0]["IsMoveForward"].ToString() == "True")
                ddlMoveForward.SelectedValue = "1";
            else
                ddlMoveForward.SelectedValue = "0";
        }
        if (ds.Tables[0].Rows[0]["ProductID"] != null && ds.Tables[0].Rows[0]["ProductID"] != "")
        {   
            ddlProducts.SelectedValue = ds.Tables[0].Rows[0]["ProductID"].ToString();           
        }
        if (ds.Tables[0].Rows[0]["STATUSID"] != null && ds.Tables[0].Rows[0]["STATUSID"] != "")
        {
           ddlOppStatus.SelectedValue = ds.Tables[0].Rows[0]["STATUSID"].ToString();
           
        }
        if (ds.Tables[0].Rows[0]["SourceID"] != null && ds.Tables[0].Rows[0]["SourceID"] != "")
        {
            ddlOppSource.SelectedValue = ds.Tables[0].Rows[0]["SourceID"].ToString();
            
        }
        if (ds.Tables[0].Rows[0]["TypeID"] != null && ds.Tables[0].Rows[0]["TypeID"] != "")
        {
            ddlOppType.SelectedValue = ds.Tables[0].Rows[0]["TypeID"].ToString();
            
        }
        
        if (ds.Tables[0].Rows[0]["IsNewCompany"] != null && ds.Tables[0].Rows[0]["IsNewCompany"] != "")
        {
            if (ds.Tables[0].Rows[0]["IsNewCompany"].ToString() == "True")
                ddlAccount.SelectedValue = "1";
            else
                ddlAccount.SelectedValue = "0";
        }
        if (ds.Tables[0].Rows[0]["ApptSourceId"] != null && ds.Tables[0].Rows[0]["ApptSourceId"] != "")
        {
            ddlApptSource.SelectedValue = ds.Tables[0].Rows[0]["ApptSourceId"].ToString();
            
        }
        if (ds.Tables[0].Rows[0]["IsRegisteredForTraining"] != null && ds.Tables[0].Rows[0]["IsRegisteredForTraining"] != "")
        {
            if (ds.Tables[0].Rows[0]["IsRegisteredForTraining"].ToString() == "True")
                ddlRegForTraining.SelectedValue = "1";
            else
                ddlRegForTraining.SelectedValue = "0";
        }
        if (ds.Tables[0].Rows[0]["CourseId"] != null && ds.Tables[0].Rows[0]["CourseId"].ToString().Trim() != "")
        {
            ddlCourse.SelectedValue = ds.Tables[0].Rows[0]["CourseId"].ToString();
            
        }
        if (ds.Tables[0].Rows[0]["IsNewCompany"] != null && ds.Tables[0].Rows[0]["IsNewCompany"] != "")
        {
            if (ds.Tables[0].Rows[0]["IsNewCompany"].ToString() == "True")
                ddlIsNewCompany.SelectedValue = "1";
            else
                ddlIsNewCompany.SelectedValue = "0";
        }
        if (ds.Tables[0].Rows[0]["IndustryId"] != null && ds.Tables[0].Rows[0]["IndustryId"] != "")
        {
            ddlIndustry.SelectedValue = ds.Tables[0].Rows[0]["IndustryId"].ToString();
            
        }
        
        txtOpportunityValue.Text = ds.Tables[0].Rows[0]["VALUE"].ToString();
        txtActStep.Text = ds.Tables[0].Rows[0]["ACTIONSTEP"].ToString();
        CourseTrngDate.Text = ds.Tables[0].Rows[0]["CourseTrainingDate"].ToString();
        txtTrngCourseName.Text = ds.Tables[0].Rows[0]["CourseName"].ToString();
        txtHowManyAttended.Text = ds.Tables[0].Rows[0]["HowManyAttended"].ToString();     
        NextContactDate.Text = ds.Tables[0].Rows[0]["NEXT_CONTACT_DATE"].ToString();
        OppCloseDate.Text = ds.Tables[0].Rows[0]["CLOSEDATE"].ToString();
        txtNotes.Text = "";

    }
    protected void ddlOpportunity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int opportunityID = int.Parse(ddlOpportunity.SelectedValue);

        if (opportunityID != 0)
        {
            GetQuickStartInformation();
            BindNotesHistory();
        }
        else
        {
            ClearFields();
        }

    }
    private void Binddropdowns()
    {
        QuickStartRepository quickStartRepository = new QuickStartRepository();
        OpprtunityStatusRepository oppStatusRep = new OpprtunityStatusRepository();
        OpprtunitySourceRepository oppSourceRep = new OpprtunitySourceRepository();
        OpprtunityTypesRepository oppTypesRep = new OpprtunityTypesRepository();
        CompaniesRepository companiesRep = new CompaniesRepository();
        ContactsRepository contactsRep = new ContactsRepository();


        ddlBudgeIdentified.DataSource = quickStartRepository.GetYesNoOptions();
        ddlBudgeIdentified.DataBind();

        ddlMoveForward.DataSource = quickStartRepository.GetYesNoOptions();
        ddlMoveForward.DataBind();


        ddlOppStatus.DataSource = oppStatusRep.GetAll();
        ddlOppStatus.DataBind();
        ListItem selectItemddlOppStatus = new ListItem("--Select Opportunity Status--", "0");
        ddlOppStatus.Items.Insert(0, selectItemddlOppStatus);

        ddlOppSource.DataSource = oppSourceRep.GetAll();
        ddlOppSource.DataBind();
        ListItem selectItemddlOppSource = new ListItem("--Select Opportunity Source--", "0");
        ddlOppSource.Items.Insert(0, selectItemddlOppSource);

        ddlOppType.DataSource = oppTypesRep.GetAll();
        ddlOppType.DataBind();
        ListItem selectItemddlOppType = new ListItem("--Select Opportunity Type--", "0");
        ddlOppType.Items.Insert(0, selectItemddlOppType);

        ddlAccount.DataSource = companiesRep.GetNewItemOptions();
        ddlAccount.DataBind();


        ddlIsNewCompany.DataSource = companiesRep.GetNewItemOptions();
        ddlIsNewCompany.DataBind();


        ddlApptSource.DataSource = contactsRep.GetApptSourceOptions();
        ddlApptSource.DataBind();
        ListItem selectItem = new ListItem("--Select Appointment Source--", "0");
        ddlApptSource.Items.Insert(0, selectItem);

        ddlRegForTraining.DataSource = contactsRep.GetRegForTrainingOptions();
        ddlRegForTraining.DataBind();



        ddlCourse.DataSource = contactsRep.GetCourseInfo();
        ddlCourse.DataBind();
        ListItem selectItemddlCourse = new ListItem("--Select Course Type--", "0");
        ddlCourse.Items.Insert(0, selectItemddlCourse);

        ddlIndustry.DataSource = companiesRep.GetAllIndustries();
        ddlIndustry.DataBind();
        ListItem selectItemddlIndustry = new ListItem("--Select Industry--", "0");
        ddlIndustry.Items.Insert(0, selectItemddlIndustry);

        ddlProducts.DataSource = quickStartRepository.GetProductTypeByRole(CurrentUser);
        ddlProducts.DataBind();
        ListItem selectItemddlProducts = new ListItem("--Select Product--", "0");
        ddlProducts.Items.Insert(0, selectItemddlProducts);

    }
    protected void CompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void OpportunityDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void ddlCompany_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlCompany = sender as DropDownList;
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select company--", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }
    }
    protected void ddlOpportunity_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlOpportunity = sender as DropDownList;
        if (!(ddlOpportunity.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select Opportunity--", "0");
            ddlOpportunity.Items.Insert(0, selectItem);
        }
        {
            if (!(ddlCompany.SelectedIndex == 0))
            {

                ClientScript.RegisterStartupScript(this.GetType(), "NoOpp", ("<script> alert('Please add opportunity to the selected company prior to attaching the document.'); </script>"));
            }
        }
    }
    protected void ddlRegForTraining_SelectedIndexChanged(object sender, EventArgs e)
    {

        if ((ddlRegForTraining != null))
        {
            if (ddlRegForTraining.SelectedValue == "1")
            {
                if (ddlCourse.SelectedValue == "0")
                {
                    rfvCourse.Enabled = true;
                    mandlbl48.Visible = true;
                }
                if (CourseTrngDate.Text == "")
                {
                    reqFieldCourseTrngDate.Enabled = true;
                    mandlbl49.Visible = true;

                }
                if (txtTrngCourseName.Text == "")
                {
                    rFVTrngCourseName.Enabled = true;
                    mandlbl50.Visible = true;
                }
                if (txtHowManyAttended.Text == "")
                {
                    rFVHowManyAttended.Enabled = true;
                    mandlbl51.Visible = true;
                }
            }
            else
            {
                rfvCourse.Enabled = false;
                mandlbl48.Visible = false;
                reqFieldCourseTrngDate.Enabled = false;
                mandlbl49.Visible = false;
                rFVTrngCourseName.Enabled = false;
                mandlbl50.Visible = false;
                rFVHowManyAttended.Enabled = false;
                mandlbl51.Visible = false;
            }
        }
    }
    private void BindOpportunitiesForAComnpany(int companyId)
    {
        var data = from record in GetOpportunities(companyId)
                   select new
                   {
                       ID = record.ID,
                       OPPORTUNITYID = record.OpportunityID.Value,
                       NAME = record.NAME,
                       CompanyName = GetCompany(record.COMPANYID).COMPANYNAME,

                   };
        DropDownList ddlOpportunity = new DropDownList();
        ddlOpportunity.DataSource = data;
        ddlOpportunity.DataBind();

        ListItem selectItem = new ListItem("--Select Opportunity--", "0");
        ddlOpportunity.Items.Insert(0, selectItem);

    }
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {

        CompanyID = int.Parse(ddlCompany.SelectedValue);
        if (CompanyID != 0)
            BindOpportunitiesForAComnpany(CompanyID);
        else
        {
            
            ClearFields();
        }

    }
    private void ClearFields()
    {
        if (ddlCompany.SelectedValue == "0")
        {
            ListItem selectItem = new ListItem("--Select Opportunity--", "0");
            ddlOpportunity.Items.Insert(0, selectItem);
            txtCompName.Text = "";
        }
        else
            ddlOpportunity.SelectedValue = "0";
        txtFirstName.Text="";
        txtLastName.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
        txtOppName.Text = "";
        txtSalesRepLastName.Text = "";
        txtSalesRepFirstName.Text = "";
         txtPain.Text = "";
         txtLengthOfProblem.Text = "";
         txtAlternatives.Text = "";
         txtCostToFix.Text = "";
         ddlBudgeIdentified.SelectedValue = "0";
        ddlMoveForward.SelectedValue = "0";
        ddlProducts.SelectedValue = "0";
        ddlOppStatus.SelectedValue = "0";
        ddlOppSource.SelectedValue = "0";
        ddlOppType.SelectedValue = "0";
        txtOpportunityValue.Text = "";
        txtActStep.Text = "";
        ddlAccount.SelectedValue = "0";
        ddlApptSource.SelectedValue = "0";
        ddlRegForTraining.SelectedValue = "0";
        ddlCourse.SelectedValue = "0";
        CourseTrngDate.Text = "";
        txtTrngCourseName.Text = "";
        txtHowManyAttended.Text = "";
        ddlIsNewCompany.SelectedValue = "0";
        ddlIndustry.SelectedValue = "0";
        NextContactDate.Text = "";
        OppCloseDate.Text = "";
        txtNotes.Text = "";       

    }

    private void UpdateQuickStartInformation()
    {
        QuickStartRepository quickStartRepositoryUpdate = new QuickStartRepository();
        quickStartRepositoryUpdate.UpdateQuickStartRecord(txtCompName.Text,
            txtFirstName.Text,txtLastName.Text,txtPhone.Text,
            txtEmail.Text,txtOppName.Text,txtSalesRepLastName.Text,txtSalesRepFirstName.Text,
            txtPain.Text,txtLengthOfProblem.Text,txtAlternatives.Text,txtCostToFix.Text,
            int.Parse(ddlBudgeIdentified.SelectedValue),int.Parse(ddlMoveForward.SelectedValue),int.Parse(ddlProducts.SelectedValue),
            int.Parse(ddlOppStatus.SelectedValue),int.Parse(ddlOppSource.SelectedValue),int.Parse(ddlOppType.SelectedValue),
            txtOpportunityValue.Text,txtActStep.Text,int.Parse(ddlAccount.SelectedValue),int.Parse(ddlApptSource.SelectedValue),
            int.Parse(ddlRegForTraining.SelectedValue),int.Parse(ddlCourse.SelectedValue),
            DateTime.Now,
            //DateTime.ParseExact(CourseTrngDate.Text, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture),
            txtTrngCourseName.Text,txtHowManyAttended.Text,
            int.Parse(ddlIsNewCompany.SelectedValue),
            int.Parse(ddlIndustry.SelectedValue), DateTime.Now,//DateTime.ParseExact(NextContactDate.Text, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture),
            //DateTime.ParseExact(OppCloseDate.Text, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture),
            DateTime.Now,
            txtNotes.Text,CurrentUser,
           int.Parse(ddlCompany.SelectedValue), int.Parse(ddlOpportunity.SelectedValue));
        //DateTime.ParseExact(NextContactDate, "yyyyMMddHHmm", CultureInfo.InvariantCulture);
        
         
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        UpdateQuickStartInformation();
        GetQuickStartInformation();

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        ddlCompany.SelectedValue = "0";
        ClearFields();
    }
}