using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using SandlerModels;
using SandlerModels.DataIntegration;
using SandlerRepositories;
public partial class Reports_Benchmarks_FranchiseeToRegion : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //hdnFrenchiseeID.Value = CurrentUser.FranchiseeID.ToString();
            BasePage page = this.Page as BasePage;

            if (string.IsNullOrEmpty(Request.QueryString[page.QUERYSTRINGPARAMDRILLBY]))
            {
                //var data = (from franchisee in new FranchiseeRepository().GetAll()
                //           from coach in new CoachRepository().GetAll().Where(r => r.ID == franchisee.CoachID)
                //           from region in new RegionRepository().GetAll().Where(r=> r.ID == coach.RegionID && r.ID == CurrentUser.RegionID)
                //            select new { Name = franchisee.Name, Id = franchisee.ID }).Distinct();
                UserEntities userEntities = UserEntitiesFactory.Get(this.CurrentUser);
                var data = (from franchisee in userEntities.Franchisees
                            select new { Name = franchisee.Name, Id = franchisee.ID }).Distinct();
                franchiseeList.DataSource = data;
                franchiseeList.DataTextField = "Name";
                franchiseeList.DataValueField = "Id";
                franchiseeList.DataBind();
                franchiseeList.Items.Insert(0, new ListItem("Select franchisee", ""));
                franchiseeList.Visible = true;
            }
            SetUpJScript(Request.QueryString[page.QUERYSTRINGPARAMDRILLCHARTIDS], page.CurrentUser.UserName, page.GENERICCHARTLITERALWIDTH, page.GENERICCHARTLITERALHEIGHT, Request.QueryString[page.QUERYSTRINGPARAMDRILLBY], Request.QueryString["searchParameter"]);
        }
    }

    public void SetUpJScript(string ChartIds, string UserName, string ChartWidth, string ChartHeight, string drillBy, string salesRep)
    {
        StringBuilder jScript = new StringBuilder("<script type='text/javascript'>");
        jScript.Append("var chartIds='" + ChartIds + "';");
        jScript.Append("var userName='" + UserName + "';");
        jScript.Append("var chartWidth='" + ChartWidth + "';");
        jScript.Append("var chartHeight='" + ChartHeight + "';");
        jScript.Append("var chartSubType='';");
        jScript.Append("var drillBy='" + drillBy + "';");
        jScript.Append("var searchParameter='" + salesRep + "';");
        jScript.Append("</script>");
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "setUpChartAPIProperties", jScript.ToString());
    }
}