<%@ Page Title="Reports-ProductsSoldByCompany" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="SoldByCompany.aspx.cs" Inherits="Reports_Products_SoldByCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="dialog" title="Report: Product Sold By Company">
        <table>
            <tr>
                <td>
                    <asp:DropDownList ID="companyList" runat="server" Visible="false">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="btnGetReport" class="sandlerButton" value="Get Report" />
                </td>
            </tr>
        </table>
    </div>
    <div id="chartContainer" style="display: none; text-align: center">
        <asp:Image ID="ajaxLoadNotificationImage" runat="server" ImageUrl="~/images/indicator_medium.gif" />Please
        wait...</div>
    <div id="chartContainer1" style="display: none; text-align: center">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/indicator_medium.gif" />Please
        wait...</div>
    <script type="text/javascript">
        $(document).ready(function () {
            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];
            var companyList = $('#<%=companyList.ClientID %>');

            chartIds = chartIds.split('_');

            $('#dialog').dialog({

                autoOpen: false,
                width: 500

            });

            $('#dialog').parent().appendTo($("form:first"));
            if (drillBy == '') {
                $('#dialog').dialog('open');
            }
            else {
                chartContainer.style.display = "block";
                loadChart(chartIds[0], drillBy, companyId, 'chartContainer', 'myChartId');
                chartContainer1.style.display = "block";
                loadChart(chartIds[1], drillBy, companyId, 'chartContainer1', 'myChartId1');
            }
            $('#btnGetReport').click(function () {
                if (companyList.val() > 0) {

                    $('#dialog').dialog('close');
                    chartContainer.style.display = "block";
                    loadChart(chartIds[0], '', companyList.val(), 'chartContainer', 'myChartId');
                    //                    $.ajax({
                    //                        url: baseUrl + "/api/Chart/",
                    //                        type: 'GET',
                    //                        contentType: 'application/json',
                    //                        data: { id: '', strChartIds: chartIds[0], strChartSubType: chartSubType, strDrillBy: '', strUserName: userName, strGaId: companyList.val() },
                    //                        success: function (data) {
                    //                            log(data);
                    //                            var myChart = new FusionCharts(baseUrl + '/FusionChartLib/' + data.SWF, 'myChartId', chartWidth, chartHeight, '0', '1');
                    //                            myChart.setXMLData(data.ChartXML);
                    //                            myChart.render('chartContainer');
                    //                        }
                    //                    });
                }
            });

            function loadChart(chartId, drillBy, companyId, chartContainer, myChartId) {
                $.ajax({
                    url: baseUrl + "/api/Chart/",
                    type: 'GET',
                    contentType: 'application/json',
                    data: { id: '', strChartIds: chartId, strChartSubType: chartSubType, strDrillBy: drillBy, strUserName: userName, strGaId: companyId },
                    success: function (data) {
                        log(data);
                        var myChart = new FusionCharts(baseUrl + '/FusionChartLib/' + data.SWF, myChartId, chartWidth, chartHeight, '0', '1');
                        myChart.setXMLData(data.ChartXML);
                        myChart.render(chartContainer);
                    }
                });
            }
        });</script>
</asp:Content>
