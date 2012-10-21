<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChartPrinter.aspx.cs" Inherits="ChartPrinter" %>

<%@ Register Src="Chart.ascx" TagName="Chart" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/jquery-1.4.1.min.js") %>"></script>
     <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/plugins.js") %>"></script>
    
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/FusionChartLib/FusionCharts.js") %>"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Chart ID="Chart1" runat="server" />
    </div>
    </form>
</body>
</html>
<script type="text/javascript">    $(document).ready(function () {
        alert('To print the chart, right click on chart then select Print Chart.');

    });</script>
