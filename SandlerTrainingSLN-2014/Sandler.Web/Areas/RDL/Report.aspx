<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Sandler.Web.Areas.RDL.Report" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Sandler Metrics System - Report</title>
</head>
<body>
    <div>
        
        <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">          
        </asp:ScriptManager>
        <rsweb:reportviewer id="ReportViewer1" runat="server" height="800" width="1100"
             AsyncRendering="false"></rsweb:reportviewer>
        </form>        
    </div>
</body>
</html>
