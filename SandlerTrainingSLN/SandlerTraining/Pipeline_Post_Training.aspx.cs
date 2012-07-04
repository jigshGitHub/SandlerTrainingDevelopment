using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Pipeline_Post_Training : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateChart();
        }
    }

    protected void CreateChart()
    {
        Chart ppTraining = new Chart();
        ppTraining.Id = ChartID.PipelinePostTraining;
        ppTraining.SWF = @"FusionChartLib/MSColumn3D.swf";
        ppTraining.Caption = "Pipeline Post Training";
        ppTraining.BGColor = "FFFFFF";
        ppTraining.BGAlpha = "100";
        ppTraining.CanvasBGColor = "FFFFFF";
        ppTraining.CanvasBGAlpha = "100";
        ppTraining.YaxisName = "Measurement Percentage";
        ppTraining.Width = "70%";
        ppTraining.Hight = "450";
        ppTraining.LoadChart();
        ppTraining.CreateChart();

        //string script = "var chartXML = \"" + ppTraining.ChartXML + "\";";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainer.Text = FusionCharts.RenderChart(ppTraining.SWF, "", ppTraining.ChartXML, "ppTrainingPlots", ppTraining.Width, ppTraining.Hight, false, false);
    }
}