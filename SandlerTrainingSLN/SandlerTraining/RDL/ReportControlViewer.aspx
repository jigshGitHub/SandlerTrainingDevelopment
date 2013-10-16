<%@ Page Language="C#" AutoEventWireup="true" EnableSessionState="True" CodeFile="ReportControlViewer.aspx.cs" Inherits="CRM_RDL_ReportControlViewer" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


    <div>
        <asp:Label ID="MessageLabel" runat="server"></asp:Label>
        <rsweb:ReportViewer   ID="ReportViewer1" runat="server"  Height="1000px" 
            Width="2100px" ondatabinding="ReportViewer1_DataBinding" 
            WaitControlDisplayAfter="500">
            
        </rsweb:ReportViewer>

    </div>
    
    </form>
</body>
</html>
