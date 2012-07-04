<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Prod_Sold_By_Rep.aspx.cs" Inherits="Prod_Sold_By_Rep" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td width="50%" align="center">
                <asp:Literal ID="chartContainerValue" runat="server" />
            </td>
            <td width="50%" align="center">
                <asp:Literal ID="chartContainerQty" runat="server" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        //        $(document).ready(function () {
        //            var myChartValue = new FusionCharts("FusionChartLib/MSColumn3D.swf", "PSBRValue", "40%", "70%", "0", "1");
        //            myChartValue.setXMLData(chartXMLValue);
        //            myChartValue.render("chartContainerValue");

        //            var myChartQty = new FusionCharts("FusionChartLib/MSColumn3D.swf", "PSBRQty", "40%", "70%", "0", "1");
        //            myChartQty.setXMLData(chartXMLQty);
        //            myChartQty.render("chartContainerQty");
        //        });
    </script>
</asp:Content>
