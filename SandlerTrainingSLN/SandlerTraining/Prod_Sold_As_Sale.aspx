<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Prod_Sold_As_Sale.aspx.cs" Inherits="Prod_Sold_As_Sale" %>

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
        //            var myChartValue = new FusionCharts("FusionChartLib/MSColumn3D.swf", "PSASValue", "40%", "70%", "0", "1");
        //            myChartValue.setXMLData(chartXMLValue);
        //            myChartValue.render("chartContainerValue");

        //            var myChartQty = new FusionCharts("FusionChartLib/MSColumn3D.swf", "PSASQty", "40%", "70%", "0", "1");
        //            myChartQty.setXMLData(chartXMLQty);
        //            myChartQty.render("chartContainerQty");
        //        });
    </script>
</asp:Content>
