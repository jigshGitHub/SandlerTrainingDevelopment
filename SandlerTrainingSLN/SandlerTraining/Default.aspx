<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="SandlerControls" Namespace="SandlerControls" TagPrefix="SandlerChart" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="100%">
        <tr>
            <td width="33%">
                <SandlerChart:ChartLiteral ID="CostOfSale" runat="server" Width="100%" Height="250"></SandlerChart:ChartLiteral>
            </td>
            <td width="34%">
                <SandlerChart:ChartLiteral ID="IndustryAveBenchmarks" runat="server" Width="100%"
                    Height="250">
                </SandlerChart:ChartLiteral>
            <td width="33%">
                <SandlerChart:ChartLiteral ID="PipelinePostTraining" runat="server" Width="100%"
                    Height="250">
                </SandlerChart:ChartLiteral>
            </td>
        </tr>
        <tr>
            <td width="33%">
                <SandlerChart:ChartLiteral ID="SalesCycleTimeMain" runat="server" Width="100%" Height="250">
                </SandlerChart:ChartLiteral>
            </td>
            <td width="34%">
                <SandlerChart:ChartLiteral ID="ProspectingResults" runat="server" Width="100%" Height="250">
                </SandlerChart:ChartLiteral>
            <td width="33%">
                <SandlerChart:ChartLiteral ID="SalesTotalsByMonthValue" runat="server" Width="100%"
                    Height="250">
                </SandlerChart:ChartLiteral>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
    </script>
</asp:Content>
