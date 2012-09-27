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

    public int GAId
    {
        get
        {
            return int.Parse(ViewState["GAId"].ToString());
        }
        set
        {
            ViewState["GAId"] = value;
        }
    }

    public GapAnalysisCreate()
    {
        gaData = new GapAnalysisRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblResult.Text = "";
        if (!Page.IsPostBack)
        {
            PopulateData();
            //PopulateSalesRepresentativeData();
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
            PopulateValues(gaTracker);
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
    protected void btnViewGapAnalysisReport_Click(object sender, EventArgs e)
    {
        int companyId = int.Parse(drpLstCompanies.SelectedValue);
        int contactId = int.Parse(drpLstContacts.SelectedValue);

        SaveGARecord(companyId, contactId);
        RenderChart(companyId, contactId);
        PopulateAsIsToBEFields();
    }

    protected void btnSaveGapAnalysisReport_Click(object sender, EventArgs e)
    {
        SaveDesiredAnnualImprovements();
    }
    private void PopulateData()
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
            drpListTCSAsIs.DataTextField = "TrngCostSavings";
            drpListTCSAsIs.DataValueField = "Id";
            drpListTCSAsIs.DataBind();

            drpListTCSToBe.DataSource = data.Tables[3];
            drpListTCSToBe.DataTextField = "TrngCostSavings";
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
            drpListEBGAsIS.DataTextField = "EstBenefitsGained";
            drpListEBGAsIS.DataValueField = "Id";
            drpListEBGAsIS.DataBind();

            drpListEBGToBe.DataSource = data.Tables[5];
            drpListEBGToBe.DataTextField = "EstBenefitsGained";
            drpListEBGToBe.DataValueField = "Id";
            drpListEBGToBe.DataBind();
        }

    }

    private void PopulateValues(SandlerModels.TBL_GA_Tracker gaTracker)
    {
        try
        {
            drpListSCTAsIs.SelectedValue = gaTracker.AsIsSalesCycleTimeId.Value.ToString();
            drpListSEAsIs.SelectedValue = gaTracker.AsIsSalesEffId.Value.ToString();
            drpListSQAsIs.SelectedValue = gaTracker.AsIsSalesQualificationId.Value.ToString();
            drpListTCSAsIs.SelectedValue = gaTracker.AsIsTrgCostSavingsId.Value.ToString();
            drpListQAAsIs.SelectedValue = gaTracker.AsIsQuotaAchtId.Value.ToString();
            drpListEBGAsIS.SelectedValue = gaTracker.AsIsEstBenGainedId.Value.ToString();

            drpListSCTToBe.SelectedValue = gaTracker.ToBeSalesCycleTimeId.Value.ToString();
            drpListSEToBe.SelectedValue = gaTracker.ToBeSalesEffId.Value.ToString();
            drpListSQToBe.SelectedValue = gaTracker.ToBeSalesQualificationId.Value.ToString();
            drpListTCSToBe.SelectedValue = gaTracker.ToBeTrgCostSavingsId.Value.ToString();
            drpListQAToBe.SelectedValue = gaTracker.ToBeQuotaAchtId.Value.ToString();
            drpListEBGToBe.SelectedValue = gaTracker.ToBeEstBenGainedId.Value.ToString();
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
            drpLstDAISCT.SelectedItem.Text, 
            drpLstDAISE.SelectedItem.Text, 
            drpLstDAISQ.SelectedItem.Text, 
            drpLstDAITCS.SelectedItem.Text, 
            drpLstDAIQA.SelectedItem.Text, 
            drpLstDAIEBG.SelectedItem.Text);
    }
    private void RenderChart(int companyId, int contactId)
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
        pnlChart.FindControl("chartContainer").Controls.Add(new LiteralControl(FusionCharts.RenderChart(gaChart.SWF, "", gaChart.ChartXML, "gaChartlots", gaChart.Width, gaChart.Hight, false, false)));
        pnlChart_ModalPopupExtender.Show();
    }

    private void PopulateAsIsToBEFields()
    {
        SandlerModels.GATracker gaTracker = new GapAnalysisRepository().GetGATrackerById(GAId);

        lblAsIsEBG.Text = gaTracker.AsIsEstBenefitsGained;
        lblAsIsQA.Text = gaTracker.AsIsQuotaAchievement;
        lblAsIsSCT.Text = gaTracker.AsIsSalesCycleTime;
        lblAsIsSE.Text = gaTracker.AsIsSalesEfficiency;
        lblAsIsSQ.Text = gaTracker.AsIsSalesQualification;
        lblAsIsTCS.Text = gaTracker.AsIsTrngCostSavings;
        lblToBeEBG.Text = gaTracker.ToBeEstBenefitsGained;
        lblToBeQA.Text = gaTracker.ToBeQuotaAchievement;
        lblToBeSCT.Text = gaTracker.ToBeSalesCycleTime;
        lblToBeSE.Text = gaTracker.ToBeSalesEfficiency;
        lblToBeSQ.Text = gaTracker.ToBeSalesQualification;
        lblToBeTCS.Text = gaTracker.ToBeTrngCostSavings;
    }


}