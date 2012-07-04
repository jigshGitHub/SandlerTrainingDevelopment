<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Pipeline_Post_Training.aspx.cs" Inherits="Pipeline_Post_Training" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <table width="100%">
        <tr>
            <td width="100%" align="center">
                <asp:Literal ID="chartContainer" runat="server" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
//            var myChart = new FusionCharts("FusionChartLib/MSColumn3D.swf", "pptID", "70%", "70%", "0", "1");
//            myChart.setXMLData(chartXML);
//            myChart.render("chartContainer");
        });
    </script>
</asp:Content>

