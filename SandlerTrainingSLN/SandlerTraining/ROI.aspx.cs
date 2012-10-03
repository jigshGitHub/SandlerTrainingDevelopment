using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataIntegration;
using SandlerRepositories;
using Sandler.UI.ChartStructure;
public partial class ROI : BasePage
{
    private bool ReadOnlyAccess;
    GapAnalysisRepository repository = null;

    public ROI()
    {
        repository = new GapAnalysisRepository();
    }

    public int GAId
    {
        get
        {
            return int.Parse(Session["GAId"].ToString());
        }
        set
        {
            Session["GAId"] = value;
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

    protected void Page_Load(object sender, EventArgs e)
    {
        lblResult.Text = "";
        if (!IsPostBack)
        {
            ReadOnlyAccess = IsUserReadOnly(SandlerModels.SandlerUserActions.Add, SandlerModels.SandlerEntities.Opportunity);
            (submitROIData.CustomNavigationTemplateContainer.FindControl("lnkNextStep") as LinkButton).Attributes.Add("style", "display:none");
            (submitROIData.CustomNavigationTemplateContainer.FindControl("editGA") as LinkButton).Attributes.Add("style", "display:none");
            BindCompanies();
            SetVisibility();

            if (!string.IsNullOrEmpty(Request.QueryString["companyId"]))
            {
                CompanyId = int.Parse(Request.QueryString["companyId"]);
                ContactId = int.Parse(Request.QueryString["contactId"]);
                BindContacts(CompanyId);

                drpLstCompanies.SelectedValue = CompanyId.ToString();
                drpLstContacts.SelectedValue = ContactId.ToString();

                //PopulateGAPS();
                drpLstContacts_SelectedIndexChanged(sender, e);
                (submitROIData.CustomNavigationTemplateContainer.FindControl("lnkNextStep") as LinkButton).Attributes.Add("style", "display:block");
                (submitROIData.CustomNavigationTemplateContainer.FindControl("editGA") as LinkButton).Attributes.Add("style", "display:block");
            
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
        if (drpLstCompanies.SelectedIndex > 0)
        {
            CompanyId = int.Parse(drpLstCompanies.SelectedValue);
            BindContacts(CompanyId);
            PopulateData(null, true);
        }
    }

    protected void drpLstContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpLstContacts.SelectedIndex > 0)
        {
            ContactId = int.Parse(drpLstContacts.SelectedValue);
            PopulateGAPS();
        }
        else
            PopulateData(null, true);
    }

    protected void lnlNextStep_Click(object sender, CommandEventArgs e)
    {
        string commandArg = e.CommandArgument.ToString();
        string commandName = e.CommandName;

        if (GAId > 0)
        {
            if (commandArg == "1")
            {
                (plotChart.CustomNavigationTemplateContainer.FindControl("editAsIsGA") as System.Web.UI.HtmlControls.HtmlAnchor).HRef = "GapAnalysisCreate.aspx?companyId=" + CompanyId.ToString() + "&contactId=" + ContactId.ToString();
                repository.UpdateYearExpenditures(GAId, txtBxYear1.Text, txtBxYear2.Text, txtBxYear3.Text);
                (plotChart.ContentTemplateContainer.FindControl("lblYear1") as Label).Text = string.Format("{0:C}", Convert.ToDouble(txtBxYear1.Text));
                (plotChart.ContentTemplateContainer.FindControl("lblYear2") as Label).Text = string.Format("{0:C}", Convert.ToDouble(txtBxYear2.Text));
                (plotChart.ContentTemplateContainer.FindControl("lblYear3") as Label).Text = string.Format("{0:C}", Convert.ToDouble(txtBxYear3.Text));
                wzROI.ActiveStepIndex = int.Parse(commandArg);

                RenderChart();
            }

        }
        else
        {
        }
    }

    protected void lnlPrevStep_Click(object sender, CommandEventArgs e)
    {
        string commandArg = e.CommandArgument.ToString();
        string commandName = e.CommandName;


        if (commandArg == "0")
        {
            wzROI.ActiveStepIndex = int.Parse(commandArg);

            (submitROIData.CustomNavigationTemplateContainer.FindControl("lnkNextStep") as LinkButton).Attributes.Add("style", "display:block");
            (submitROIData.CustomNavigationTemplateContainer.FindControl("editGA") as LinkButton).Attributes.Add("style", "display:block");
        }
    }

    protected void btnSaveGapAnalysisReport_Click(object sender, EventArgs e)
    {
        (plotChart.ContentTemplateContainer.FindControl("lblResult") as Label).Text = "Records saved successfully.";
        RenderChart();
    }

    private void SetVisibility()
    {
        if (ReadOnlyAccess)
        {
            //lblViewTitle.Text = "View Gap Analysis Report:";
            //lblAsIsSelectionTitle.Text = "As - Is Selected Data:";
            //lblToBeSelectionTitle.Text = "To - Be Selected Data:";
            //drpListEBGAsIS.Enabled = false;
            //drpListEBGToBe.Enabled = false;
            //drpListQAAsIs.Enabled = false;
            //drpListQAToBe.Enabled = false;
            //drpListSCTAsIs.Enabled = false;
            //drpListSCTToBe.Enabled = false;
            //drpListSEAsIs.Enabled = false;
            //drpListSEToBe.Enabled = false;
            //drpListSQAsIs.Enabled = false;
            //drpListSQToBe.Enabled = false;
            //drpListTCSAsIs.Enabled = false;
            //drpListTCSToBe.Enabled = false;
            //drpLstDAIEBG.Enabled = false;
            //drpLstDAIQA.Enabled = false;
            //drpLstDAIQA.Enabled = false;
            //drpLstDAISCT.Enabled = false;
            //drpLstDAISE.Enabled = false;
            //drpLstDAISQ.Enabled = false;
            //drpLstDAITCS.Enabled = false;
            ////btnReDo.Visible = false;
            //btnSave.Visible = false;
        }
    }

    private void BindCompanies()
    {
        drpLstCompanies.DataSource = UserEntitiesFactory.Get(this.CurrentUser).Companies;
        drpLstCompanies.DataTextField = "CompanyName";
        drpLstCompanies.DataValueField = "COMPANIESID";
        drpLstCompanies.DataBind();
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

    private void PopulateGAPS()
    {
        SandlerModels.TBL_GA_Tracker gaTracker = null;
        GAId = 0;
        gaTracker = repository.GetGATracker(CompanyId, ContactId);
        if (gaTracker != null)
        {
            GAId = gaTracker.Id;
            SandlerModels.GATracker gaTrackerVW = repository.GetGATrackerById(GAId);
            PopulateData(gaTrackerVW, false);
            //(submitROIData.CustomNavigationTemplateContainer.FindControl("editGA") as System.Web.UI.HtmlControls.HtmlAnchor).HRef = "GapAnalysisCreate.aspx?companyId=" + CompanyId.ToString() + "&contactId=" + ContactId.ToString();
            //(submitROIData.CustomNavigationTemplateContainer.FindControl("editGA") as System.Web.UI.HtmlControls.HtmlAnchor).Visible = true;
            //(submitROIData.CustomNavigationTemplateContainer.FindControl("lnkNextStep") as LinkButton).Visible = true;
        }
        else
        {
            //if (ReadOnlyAccess)
            PopulateData(null, true);
            lblResult.Text = "There is no report has been generated for the selected company and contact.";
        }
    }

    private void PopulateData(SandlerModels.GATracker gaTracker, bool makeItDefault)
    {
        try
        {
            txtBxEBGGap.Text = (makeItDefault) ? "" : (gaTracker.ToBeTrngBenefitsPercentVal - gaTracker.AsIsTrngBenefitsPercentVal).ToString();
            txtBxQAGap.Text = (makeItDefault) ? "" : (gaTracker.ToBeQuotaAchievementPercentVal - gaTracker.AsIsQuotaAchievementPercentVal).ToString();
            txtBxSCTGap.Text = (makeItDefault) ? "" : (gaTracker.ToBeSalesCycleTimePercentVal - gaTracker.AsIsSalesCycleTimePercentVal).ToString();
            txtBxSQGap.Text = (makeItDefault) ? "" : (gaTracker.ToBeSalesQualificationPercentVal - gaTracker.AsIsSalesQualificationPercentVal).ToString();
            txtBxTCSGap.Text = (makeItDefault) ? "" : (gaTracker.ToBeSalesRepRetentionPercentVal - gaTracker.AsIsSalesRepRetentionPercentVal).ToString();
            txtBxSEGap.Text = (makeItDefault) ? "" : (gaTracker.ToBeSalesEfficiencyPercentVal - gaTracker.AsIsSalesEfficiencyPercentVal).ToString();

            txtBxYear1.Text = (makeItDefault) ? "" : gaTracker.Year1.ToString();
            txtBxYear2.Text = (makeItDefault) ? "" : gaTracker.Year2.ToString();
            txtBxYear3.Text = (makeItDefault) ? "" : gaTracker.Year3.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
    }

    private void RenderChart()
    {
        BarChart chartToLoad = new BarChart() { Width = "100%", Hight = "450", GAId = GAId, BGColor = "FFFFFF", CanvasBGAlpha = "100", CanvasBGColor = "FFFFFF", Caption = "ROI", SWF = @"FusionChartLib/Column3D.swf", showLabels = "0", showLegend = "0", YaxisName = "%", Id = ChartID.ReturnOnTrainingInvestment };
        chartToLoad.LoadChart(CurrentUser);
        chartToLoad.CreateChart();
        plotChart.ContentTemplateContainer.FindControl("chartContainer").Controls.Add(new LiteralControl(InfoSoftGlobal.FusionCharts.RenderChart(chartToLoad.SWF, "", chartToLoad.ChartXML, "gaChartlots", chartToLoad.Width, chartToLoad.Hight, false, false)));

        (plotChart.CustomNavigationTemplateContainer.FindControl("lnkBtnPrint") as LinkButton).Visible = true;
        (plotChart.CustomNavigationTemplateContainer.FindControl("lnkBtnPrint") as LinkButton).OnClientClick = "window.open('ChartPrinter.aspx?drillChartIds=ReturnOnTrainingInvestment&GAId=" + GAId + "','_blank','height=450,width=800,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no');return false;";
    }

}