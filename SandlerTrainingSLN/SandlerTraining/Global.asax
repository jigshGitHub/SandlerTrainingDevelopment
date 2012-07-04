<%@ Application Language="C#" %>
<%@ Import Namespace="Sandler.UI.ChartStructure" %>
<script runat="server">
     
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        List<Sandler.UI.ChartStructure.Chart> ChartCollection;
        try
        {
            ChartCollection = new List<Chart>();

            ChartCollection.Add(new Chart() { Id = ChartID.ReturnOnTrainingInvestment, SWF = @"FusionChartLib/MSColumn3d.swf", Caption = "Return On Training Investment", BGColor = "FFFFFF", BGAlpha = "100", NumberSuffix = "%", Width = "100%", Hight = "250" });
            ChartCollection.Add(new Chart() { Id = ChartID.CostOfSale, SWF = @"FusionChartLib/StackedColumn3D.swf", Caption = "Cost of Sale by Product", BGColor = "FFFFFF", BGAlpha = "100", CanvasBGColor = "FFFFFF", CanvasBGAlpha = "100", Width = "100%", Hight = "250", DrillLevel = 0 });
            ChartCollection.Add(new Chart() { Id = ChartID.RetentionRateByEff, SWF = @"FusionChartLib/MSColumn3D.swf", Caption = "Retention Rate Effectiveness", BGColor = "FFFFFF", BGAlpha = "100", CanvasBGColor = "FFFFFF", CanvasBGAlpha = "100", Width = "100%", Hight = "250", YaxisName = "Effectiveness in %", NumberSuffix = "%" });
            ChartCollection.Add(new Chart() { Id = ChartID.GapAnalysis, SWF = @"FusionChartLib/MSBar3D.swf", Caption = "Gap Analysis", CanvasBGColor = "FFFFFF", CanvasBGAlpha = "100", NumberSuffix = "%", Width = "100%", Hight = "250" });
            ChartCollection.Add(new BarChart() { Id = ChartID.ProspectingResults, SWF = @"FusionChartLib/Column3D.swf", Caption = "Prospecting Results", CanvasBGColor = "FFFFFF", CanvasBGAlpha = "100", Width = "100%", Hight = "250", YaxisName = "Clients" });
            ChartCollection.Add(new PieChart() { Id = ChartID.SalesCycleTimeMain, SWF = @"FusionChartLib/Pie3D.swf", Caption = "Sales Cycle Time", CanvasBGColor = "FFFFFF", CanvasBGAlpha = "100", Width = "100%", Hight = "250", showLabels = "0", showLegend = "1", NumberSuffix = "%", PieRadius = "100", enableRotation = "1" });

            //Session.Add("Charts", ChartCollection);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        Response.Redirect("Login.aspx");
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
