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
using SandlerWeb = Sandler.Web;
using System.Text;
public partial class ChartUC : System.Web.UI.UserControl
{
    public string ChartIds { get; set; }
    public string SearchParameter { get; set; }
    public string ChartSubType { get; set; }
    public string ChartWidth { get; set; }
    public string ChartHeight { get; set; }
    public string UserName { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BasePage page = this.Page as BasePage;
            ChartIds = Request.QueryString[page.QUERYSTRINGPARAMDRILLCHARTIDS];
            ChartSubType = Request.QueryString["SubType"];
            ChartWidth = page.GENERICCHARTLITERALWIDTH;
            ChartHeight = page.GENERICCHARTLITERALHEIGHT;
            UserName = page.CurrentUser.UserName;
            SearchParameter = (!String.IsNullOrEmpty(Request.QueryString["searchParameter"])) ? Request.QueryString["searchParameter"] : "0";

            SetUpJScript();
            
        }
    }

    public void SetUpJScript()
    {
        StringBuilder jScript = new StringBuilder("<script type='text/javascript'>");
        jScript.Append("var chartIds='" + ChartIds + "';");
        jScript.Append("var chartSubType='" + ChartSubType + "';");
        jScript.Append("var userName='" + UserName + "';");
        jScript.Append("var chartWidth='" + ChartWidth + "';");
        jScript.Append("var chartHeight='" + ChartHeight + "';");
        jScript.Append("var searchParameter='" + SearchParameter + "';");
        jScript.Append("</script>");
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "setUpChartAPIProperties", jScript.ToString());
    }
}