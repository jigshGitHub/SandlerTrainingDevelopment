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
public partial class Reports_Benchmarks_CountryToAll : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //hdnFrenchiseeID.Value = CurrentUser.FranchiseeID.ToString();
            BasePage page = this.Page as BasePage;

            if (string.IsNullOrEmpty(Request.QueryString[page.QUERYSTRINGPARAMDRILLBY]))
            {
                var data = (from country in new CountryRepository().GetAll()
                            select new { Name = country.Name, Id = country.ID }).Distinct();

                countryList.DataSource = data;
                countryList.DataTextField = "Name";
                countryList.DataValueField = "Id";
                countryList.DataBind();
                countryList.Items.Insert(0, new ListItem("Select country", ""));
                countryList.Visible = true;
            }
            SetUpJScript(Request.QueryString[page.QUERYSTRINGPARAMDRILLCHARTIDS], page.CurrentUser.UserName, page.GENERICCHARTLITERALWIDTH, page.GENERICCHARTLITERALHEIGHT, Request.QueryString[page.QUERYSTRINGPARAMDRILLBY], Request.QueryString["searchParameter"]);
        }
    }

    public void SetUpJScript(string ChartIds, string UserName, string ChartWidth, string ChartHeight, string drillBy, string country)
    {
        StringBuilder jScript = new StringBuilder("<script type='text/javascript'>");
        jScript.Append("var chartIds='" + ChartIds + "';");
        jScript.Append("var userName='" + UserName + "';");
        jScript.Append("var chartWidth='" + ChartWidth + "';");
        jScript.Append("var chartHeight='" + ChartHeight + "';");
        jScript.Append("var chartSubType='';");
        jScript.Append("var drillBy='" + drillBy + "';");
        jScript.Append("var searchParameter='" + country + "';");
        jScript.Append("</script>");
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "setUpChartAPIProperties", jScript.ToString());
    }
}