using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;
using SandlerRepositories;
using SandlerModels.DataIntegration;
public partial class GapAnalysisCreate : BasePage
{
    private IGapAnalysis gaData;
    private bool ReadOnlyAccess;

    public int GAId
    {
        get
        {
            return int.Parse(Session["GAId"].ToString());
        }
        set
        {
            Session["GAId"] = value.ToString();
        }
    }

    public int CompanyId
    {
        get
        {
            return int.Parse(Session["CompanyId"].ToString());
        }
        set
        {
            Session["CompanyId"] = value;
        }
    }

    public int ContactId
    {
        get
        {
            return int.Parse(Session["ContactId"].ToString());
        }
        set
        {
            Session["ContactId"] = value;
        }
    }    

    public GapAnalysisCreate()
    {
        gaData = new GapAnalysisRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblResult.Text = "";
        ReadOnlyAccess = IsUserReadOnly(SandlerModels.SandlerUserActions.Add, SandlerModels.SandlerEntities.Opportunity);
        if (!Page.IsPostBack)
        {
            BindDefaultControls();
            SetVisibility();

            if (!string.IsNullOrEmpty(Request.QueryString["companyId"]))
            {
                CompanyId = int.Parse(Request.QueryString["companyId"]);
                ContactId = int.Parse(Request.QueryString["contactId"]);
                BindContacts(CompanyId);

                drpLstCompanies.SelectedValue = CompanyId.ToString();
                drpLstContacts.SelectedValue = ContactId.ToString();
                drpLstContacts_SelectedIndexChanged(sender, e);
            }
        }

    }

    protected void ddlCreateDefaultSelection(object sender, EventArgs e)
    {
        DropDownList dropdownList = sender as DropDownList;
        if (!(dropdownList.Items.Count == 0))
        {
            string defaultSelection = "";
            switch (dropdownList.ID)
            {
                case "drpLstCompanies":
                    defaultSelection = "--Select company--";
                    break;
                case "drpLstContacts":
                    defaultSelection = "--Select contact--";
                    break;
                default:
                    defaultSelection = "";
                    break;
            }
            ListItem selectItem = new ListItem(defaultSelection, "0");
            dropdownList.Items.Insert(0, selectItem);
        }
    }

    protected void drpLstCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpLstContacts.Items.Clear();
        PopulateValues(null, true);
        if (drpLstCompanies.SelectedIndex > 0)
        {
            //Bind drpLstContacts            
            BindContacts(int.Parse(drpLstCompanies.SelectedValue));
        }
    }

    protected void drpLstContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        GapAnalysisRepository repository = new GapAnalysisRepository();
        SandlerModels.TBL_GA_Tracker gaTracker = null;
        GAId = 0;
        if (drpLstContacts.SelectedIndex > 0)
        {
            gaTracker = repository.GetGATracker(int.Parse(drpLstCompanies.SelectedValue), int.Parse(drpLstContacts.SelectedValue));
        }
        if (gaTracker != null)
        {
            GAId = gaTracker.Id;
            PopulateValues(gaTracker, false);
        }
        else
        {
            PopulateValues(gaTracker, true);
            if (ReadOnlyAccess)
                lblResult.Text = "There is no report has been generated for the selected company and contact.";
        }
    }
    
    protected void btnSaveGapAnalysisReport_Click(object sender, EventArgs e)
    {
        SaveDesiredAnnualImprovements();
        RenderChart();
        (plotChart.ContentTemplateContainer.FindControl("lblResult") as Label).Text = "Records saved successfully.";
    }

    protected void lnlNextStep_Click(object sender, CommandEventArgs e)
    {
        string commandArg = e.CommandArgument.ToString();
        string commandName = e.CommandName;


        if (commandArg == "1")
        {
            (plotChart.ContentTemplateContainer.FindControl("lblResult") as Label).Text = "";
            int companyId = int.Parse(drpLstCompanies.SelectedValue);
            int contactId = int.Parse(drpLstContacts.SelectedValue);

            SaveGARecord(companyId, contactId);
            RenderChart();
            (plotChart.CustomNavigationTemplateContainer.FindControl("editRoi") as System.Web.UI.HtmlControls.HtmlAnchor).HRef = "Roi.aspx?companyId=" + companyId.ToString() + "&contactId=" + contactId;
            PopulateAsIsToBEFields();
            wzGapAnalysis.ActiveStepIndex = int.Parse(commandArg);

        }
    }

    protected void lnlPrevStep_Click(object sender, CommandEventArgs e)
    {
        string commandArg = e.CommandArgument.ToString();
        string commandName = e.CommandName;


        if (commandArg == "0")
        {            
            wzGapAnalysis.ActiveStepIndex = int.Parse(commandArg);
        }
    }

    private void SetVisibility()
    {
        if (ReadOnlyAccess)
        {
            lblViewTitle.Text = "View Gap Analysis Report:";
            lblAsIsSelectionTitle.Text = "As - Is Selected Data:";
            lblToBeSelectionTitle.Text = "To - Be Selected Data:";
            drpListEBGAsIS.Enabled = false;
            drpListEBGToBe.Enabled = false;
            drpListQAAsIs.Enabled = false;
            drpListQAToBe.Enabled = false;
            drpListSCTAsIs.Enabled = false;
            drpListSCTToBe.Enabled = false;
            drpListSEAsIs.Enabled = false;
            drpListSEToBe.Enabled = false;
            drpListSQAsIs.Enabled = false;
            drpListSQToBe.Enabled = false;
            drpListTCSAsIs.Enabled = false;
            drpListTCSToBe.Enabled = false;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAIEBG") as DropDownList).Enabled = false;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAIQA") as DropDownList).Enabled = false;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAIQA") as DropDownList).Enabled = false;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISCT") as DropDownList).Enabled = false;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISE") as DropDownList).Enabled = false;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISQ") as DropDownList).Enabled = false;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAITCS") as DropDownList).Enabled = false;
            //btnReDo.Visible = false;
            //(plotChart.ContentTemplateContainer.FindControl("btnSave") as LinkButton).Visible = false;
        }
    }

    private void BindContacts(int companyId)
    {
        IEnumerable<SandlerModels.Contact> companyContacts = UserEntitiesFactory.Get(this.CurrentUser).Contacts.Where(record => record.COMPANYID == companyId);
        if (companyContacts != null)
        {
            var data = from records in companyContacts
                       select new { Name = records.FIRSTNAME + " " + records.LASTNAME, ID = records.CONTACTSID };
            if (data.Count() > 0)
            {
                drpLstContacts.DataSource = data;
                drpLstContacts.DataTextField = "Name";
                drpLstContacts.DataValueField = "ID";
                drpLstContacts.DataBind();
            }
            else
            {
                lblResult.Text = "First create the contacts for the company selected.";
            }
        }
    }

    private void BindDefaultControls()
    {
        drpLstCompanies.DataSource = UserEntitiesFactory.Get(this.CurrentUser).Companies;
        drpLstCompanies.DataTextField = "CompanyName";
        drpLstCompanies.DataValueField = "COMPANIESID";
        drpLstCompanies.DataBind();

        DataSet data = gaData.GetData();
        if (data != null)
        {
            drpListSCTAsIs.DataSource = data.Tables[0];
            drpListSCTAsIs.DataTextField = "SalesCycleTime";
            drpListSCTAsIs.DataValueField = "Id";
            drpListSCTAsIs.DataBind();

            drpListSCTToBe.DataSource = data.Tables[0];
            drpListSCTToBe.DataTextField = "SalesCycleTime";
            drpListSCTToBe.DataValueField = "Id";
            drpListSCTToBe.DataBind();

            drpListSEAsIs.DataSource = data.Tables[1];
            drpListSEAsIs.DataTextField = "SalesEfficiency";
            drpListSEAsIs.DataValueField = "Id";
            drpListSEAsIs.DataBind();

            drpListSEToBe.DataSource = data.Tables[1];
            drpListSEToBe.DataTextField = "SalesEfficiency";
            drpListSEToBe.DataValueField = "Id";
            drpListSEToBe.DataBind();

            drpListSQAsIs.DataSource = data.Tables[2];
            drpListSQAsIs.DataTextField = "SalesQualification";
            drpListSQAsIs.DataValueField = "Id";
            drpListSQAsIs.DataBind();

            drpListSQToBe.DataSource = data.Tables[2];
            drpListSQToBe.DataTextField = "SalesQualification";
            drpListSQToBe.DataValueField = "Id";
            drpListSQToBe.DataBind();

            drpListTCSAsIs.DataSource = data.Tables[3];
            drpListTCSAsIs.DataTextField = "SalesRepRetention";
            drpListTCSAsIs.DataValueField = "Id";
            drpListTCSAsIs.DataBind();

            drpListTCSToBe.DataSource = data.Tables[3];
            drpListTCSToBe.DataTextField = "SalesRepRetention";
            drpListTCSToBe.DataValueField = "Id";
            drpListTCSToBe.DataBind();

            drpListQAAsIs.DataSource = data.Tables[4];
            drpListQAAsIs.DataTextField = "QuotaAchievement";
            drpListQAAsIs.DataValueField = "Id";
            drpListQAAsIs.DataBind();

            drpListQAToBe.DataSource = data.Tables[4];
            drpListQAToBe.DataTextField = "QuotaAchievement";
            drpListQAToBe.DataValueField = "Id";
            drpListQAToBe.DataBind();

            drpListEBGAsIS.DataSource = data.Tables[5];
            drpListEBGAsIS.DataTextField = "TrngBenefits";
            drpListEBGAsIS.DataValueField = "Id";
            drpListEBGAsIS.DataBind();

            drpListEBGToBe.DataSource = data.Tables[5];
            drpListEBGToBe.DataTextField = "TrngBenefits";
            drpListEBGToBe.DataValueField = "Id";
            drpListEBGToBe.DataBind();
        }

    }

    private void PopulateValues(SandlerModels.TBL_GA_Tracker gaTracker, bool makeItDefault)
    {
        try
        {
            drpListSCTAsIs.SelectedValue = (makeItDefault) ? "0" : gaTracker.AsIsSalesCycleTimeId.Value.ToString();
            drpListSEAsIs.SelectedValue = (makeItDefault) ? "0" : gaTracker.AsIsSalesEffId.Value.ToString();
            drpListSQAsIs.SelectedValue = (makeItDefault) ? "0" : gaTracker.AsIsSalesQualificationId.Value.ToString();
            drpListTCSAsIs.SelectedValue = (makeItDefault) ? "0" : gaTracker.AsIsSalesRepRetnId.Value.ToString();
            drpListQAAsIs.SelectedValue = (makeItDefault) ? "0" : gaTracker.AsIsQuotaAchtId.Value.ToString();
            drpListEBGAsIS.SelectedValue = (makeItDefault) ? "0" : gaTracker.AsIsTrngBenefitsId.Value.ToString();

            drpListSCTToBe.SelectedValue = (makeItDefault) ? "0" : gaTracker.ToBeSalesCycleTimeId.Value.ToString();
            drpListSEToBe.SelectedValue = (makeItDefault) ? "0" : gaTracker.ToBeSalesEffId.Value.ToString();
            drpListSQToBe.SelectedValue = (makeItDefault) ? "0" : gaTracker.ToBeSalesQualificationId.Value.ToString();
            drpListTCSToBe.SelectedValue = (makeItDefault) ? "0" : gaTracker.ToBeSalesRepRetnId.Value.ToString();
            drpListQAToBe.SelectedValue = (makeItDefault) ? "0" : gaTracker.ToBeQuotaAchtId.Value.ToString();
            drpListEBGToBe.SelectedValue = (makeItDefault) ? "0" : gaTracker.ToBeTrngBenefitsId.Value.ToString();

            (plotChart.ContentTemplateContainer.FindControl("drpLstDAIEBG") as DropDownList).SelectedValue = (makeItDefault) ? "0" : gaTracker.DesiredAnnualImptTrngBenefits;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAIQA") as DropDownList).SelectedValue = (makeItDefault) ? "0" : gaTracker.DesiredAnnualImptQuotaAcht;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISCT") as DropDownList).SelectedValue = (makeItDefault) ? "0" : gaTracker.DesiredAnnualImptSalesCycleTime;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISE") as DropDownList).SelectedValue = (makeItDefault) ? "0" : gaTracker.DesiredAnnualImptSalesEfficiency;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISQ") as DropDownList).SelectedValue = (makeItDefault) ? "0" : gaTracker.DesiredAnnualImptSalesQualfn;
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAITCS") as DropDownList).SelectedValue = (makeItDefault) ? "0" : gaTracker.DesiredAnnualImptSalesRepRetention;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
    }

    private void SaveGARecord(int companyId, int contactId)
    {
        GapAnalysisRepository repository = new GapAnalysisRepository();
        GAId = gaData.SaveGARecord(GAId,
            companyId,
            contactId,
            CurrentUser.UserId,
            int.Parse(drpListSCTAsIs.SelectedValue),
            int.Parse(drpListSEAsIs.SelectedValue),
            int.Parse(drpListSQAsIs.SelectedValue),
            int.Parse(drpListTCSAsIs.SelectedValue),
            int.Parse(drpListQAAsIs.SelectedValue),
            int.Parse(drpListEBGAsIS.SelectedValue),
            int.Parse(drpListSCTToBe.SelectedValue),
            int.Parse(drpListSEToBe.SelectedValue),
            int.Parse(drpListSQToBe.SelectedValue),
            int.Parse(drpListTCSToBe.SelectedValue),
            int.Parse(drpListQAToBe.SelectedValue),
            int.Parse(drpListEBGToBe.SelectedValue));
    }

    private void SaveDesiredAnnualImprovements()
    {
        GapAnalysisRepository repository = new GapAnalysisRepository();
        repository.UpdateDesiredAnnualmprovements(GAId,
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISCT") as DropDownList).SelectedValue,
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISE") as DropDownList).SelectedValue,
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAISQ") as DropDownList).SelectedValue,
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAITCS") as DropDownList).SelectedValue,
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAIQA") as DropDownList).SelectedValue,
            (plotChart.ContentTemplateContainer.FindControl("drpLstDAIEBG") as DropDownList).SelectedValue);
    }

    private void RenderChart()
    {
        Chart gaChart = new Chart();
        gaChart.Id = ChartID.GapAnalysis;
        gaChart.GAId = GAId;
        gaChart.SWF = @"FusionChartLib/MSBar3D.swf";
        gaChart.Caption = "Gap Analysis";
        gaChart.CanvasBGColor = "FFFFFF";
        gaChart.CanvasBGAlpha = "100";
        gaChart.NumberSuffix = "%";
        gaChart.Width = "80%";
        gaChart.Hight = "450";
        gaChart.LoadChart(this.CurrentUser);
        gaChart.CreateChart();
        (plotChart.ContentTemplateContainer.FindControl("pnlChart") as Panel).FindControl("chartContainer").Controls.Add(new LiteralControl(FusionCharts.RenderChart(gaChart.SWF, "", gaChart.ChartXML, "gaChartlots", gaChart.Width, gaChart.Hight, false, false)));
        //pnlChart_ModalPopupExtender.Show();
        (plotChart.CustomNavigationTemplateContainer.FindControl("lnkBtnPrint") as LinkButton).Visible = true;
        (plotChart.CustomNavigationTemplateContainer.FindControl("lnkBtnPrint") as LinkButton).OnClientClick = "window.open('ChartPrinter.aspx?drillChartIds=GapAnalysis&GAId=" + GAId + "','_blank','height=450,width=800,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no');return false;";
    }

    private void PopulateAsIsToBEFields()
    {
        SandlerModels.GATracker gaTracker = new GapAnalysisRepository().GetGATrackerById(GAId);

        (plotChart.ContentTemplateContainer.FindControl("lblAsIsEBG") as Label).Text = gaTracker.AsIsTrngBenefits;
        (plotChart.ContentTemplateContainer.FindControl("lblAsIsQA") as Label).Text = gaTracker.AsIsQuotaAchievement;
        (plotChart.ContentTemplateContainer.FindControl("lblAsIsSCT") as Label).Text = gaTracker.AsIsSalesCycleTime;
        (plotChart.ContentTemplateContainer.FindControl("lblAsIsSE") as Label).Text = gaTracker.AsIsSalesEfficiency;
        (plotChart.ContentTemplateContainer.FindControl("lblAsIsSQ") as Label).Text = gaTracker.AsIsSalesQualification;
        (plotChart.ContentTemplateContainer.FindControl("lblAsIsTCS") as Label).Text = gaTracker.AsIsSalesRepRetention;
        (plotChart.ContentTemplateContainer.FindControl("lblToBeEBG") as Label).Text = gaTracker.ToBeTrngBenefits;
        (plotChart.ContentTemplateContainer.FindControl("lblToBeQA") as Label).Text = gaTracker.ToBeQuotaAchievement;
        (plotChart.ContentTemplateContainer.FindControl("lblToBeSCT") as Label).Text = gaTracker.ToBeSalesCycleTime;
        (plotChart.ContentTemplateContainer.FindControl("lblToBeSE") as Label).Text = gaTracker.ToBeSalesEfficiency;
        (plotChart.ContentTemplateContainer.FindControl("lblToBeSQ") as Label).Text = gaTracker.ToBeSalesQualification;
        (plotChart.ContentTemplateContainer.FindControl("lblToBeTCS") as Label).Text = gaTracker.ToBeSalesRepRetention;

        (plotChart.ContentTemplateContainer.FindControl("drpLstDAIEBG") as DropDownList).SelectedValue = gaTracker.DesiredAnnualImptTrngBenefits;
        (plotChart.ContentTemplateContainer.FindControl("drpLstDAIQA") as DropDownList).SelectedValue = gaTracker.DesiredAnnualImptQuotaAcht;
        (plotChart.ContentTemplateContainer.FindControl("drpLstDAISCT") as DropDownList).SelectedValue = gaTracker.DesiredAnnualImptSalesCycleTime;
        (plotChart.ContentTemplateContainer.FindControl("drpLstDAISE") as DropDownList).SelectedValue = gaTracker.DesiredAnnualImptSalesEfficiency;
        (plotChart.ContentTemplateContainer.FindControl("drpLstDAISQ") as DropDownList).SelectedValue = gaTracker.DesiredAnnualImptSalesQualfn;
        (plotChart.ContentTemplateContainer.FindControl("drpLstDAITCS") as DropDownList).SelectedValue = gaTracker.DesiredAnnualImptSalesRepRetention;
    }


}