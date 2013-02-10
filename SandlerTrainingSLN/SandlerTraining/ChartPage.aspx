<%@ Page Title="Chart" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ChartPage.aspx.cs" Inherits="ChartPage" %>

<%@ Register Assembly="SandlerControls" Namespace="SandlerControls" TagPrefix="SandlerChart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="chartPanel" runat="server" HorizontalAlign="Center" Width="100%">
    </asp:Panel>
    <div id="chartContainer" style="display:none">
        FusionCharts XT will load here!</div>
    <script type="text/javascript">
        $(document).ready(function () {
            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];
            //            $.ajax({
            //                url: baseUrl + "/api/Chart/",
            //                type: 'GET',
            //                contentType: 'application/json',
            //                data: { id: '', strChartIds: 'NewAppointmentsBySourceMonth', chartSubType: '', drillBy: '', userName: 'msipdarling' },
            //                success: function (data) {
            //                    log(data);
            //                    var myChart = new FusionCharts('FusionChartLib/' + data.SWF, 'myChartId', '70%', '400', '0', '1');
            //                    myChart.setXMLData(data.ChartXML);
            //                    myChart.render('chartContainer');
            //                }
            //            });
        });</script>
</asp:Content>