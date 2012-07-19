<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ChartPage.aspx.cs" Inherits="ChartPage" %>

<%@ Register Assembly="SandlerControls" Namespace="SandlerControls" TagPrefix="SandlerChart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td width="100%" align="center">
                <SandlerChart:ChartLiteral ID="genericChartLiteral" runat="server" Width="70%"
                    Height="450"></SandlerChart:ChartLiteral>
            </td>
        </tr>
    </table>
</asp:Content>
