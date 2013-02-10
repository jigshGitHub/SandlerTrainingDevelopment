using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;
using SandlerControls;
using System.Web.UI.HtmlControls;
using System.Text;
public partial class ChartPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {       
        SetUpJScript(Request.QueryString[QUERYSTRINGPARAMDRILLCHARTIDS],CurrentUser.UserName,this.GENERICCHARTLITERALWIDTH,this.GENERICCHARTLITERALHEIGHT,Request.QueryString[QUERYSTRINGPARAMDRILLBY],Request.QueryString["SearchParameter"]);
    }
    public void SetUpJScript(string ChartIds, string UserName, string ChartWidth, string ChartHeight, string drillBy, string searchParameter)
    {
        StringBuilder jScript = new StringBuilder("<script type='text/javascript'>");
        jScript.Append("var chartIds='" + ChartIds + "';");
        jScript.Append("var userName='" + UserName + "';");
        jScript.Append("var chartWidth='" + ChartWidth + "';");
        jScript.Append("var chartHeight='" + ChartHeight + "';");
        jScript.Append("var chartSubType='';");
        jScript.Append("var drillBy='" + drillBy + "';");
        jScript.Append("var searchParameter='" + searchParameter + "';");
        jScript.Append("</script>");
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "setUpChartAPIProperties", jScript.ToString());
    }
}