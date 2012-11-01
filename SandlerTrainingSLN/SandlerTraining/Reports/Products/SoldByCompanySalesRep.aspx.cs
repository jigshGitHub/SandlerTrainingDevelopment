using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataIntegration;
using System.Text;
public partial class Reports_Products_SoldByCompanySalesRep : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //hdnFrenchiseeID.Value = CurrentUser.FranchiseeID.ToString();
            BasePage page = this.Page as BasePage;
            
            if (string.IsNullOrEmpty(Request.QueryString[page.QUERYSTRINGPARAMDRILLBY]))
            {
                var data = (from opportunity in UserEntitiesFactory.Get(CurrentUser).Opportunities
                           select new { Name = opportunity.SALESREPFIRSTNAME + " " + opportunity.SALESREPLASTNAME}).Distinct();

                salesRepList.DataSource = data;
                salesRepList.DataTextField = "Name";
                salesRepList.DataValueField = "Name";
                salesRepList.DataBind();
                salesRepList.Items.Insert(0, new ListItem("Select Sales Rep", ""));
                salesRepList.Visible = true;
            }
            SetUpJScript(Request.QueryString[page.QUERYSTRINGPARAMDRILLCHARTIDS], page.CurrentUser.UserName, page.GENERICCHARTLITERALWIDTH, page.GENERICCHARTLITERALHEIGHT, Request.QueryString[page.QUERYSTRINGPARAMDRILLBY], Request.QueryString["companyId"]);
        }
    }

    public void SetUpJScript(string ChartIds, string UserName, string ChartWidth, string ChartHeight, string drillBy, string companyId)
    {
        StringBuilder jScript = new StringBuilder("<script type='text/javascript'>");
        jScript.Append("var chartIds='" + ChartIds + "';");
        jScript.Append("var userName='" + UserName + "';");
        jScript.Append("var chartWidth='" + ChartWidth + "';");
        jScript.Append("var chartHeight='" + ChartHeight + "';");
        jScript.Append("var chartSubType='';");
        jScript.Append("var drillBy='" + drillBy + "';");
        jScript.Append("var gaId='0';");
        jScript.Append("var searchParameter='" + companyId + "';");
        jScript.Append("</script>");
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "setUpChartAPIProperties", jScript.ToString());
    }
}