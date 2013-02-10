<%@ Page Title="Chart" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ChartCustomPage.aspx.cs" Inherits="ChartPage" %>

<%@ Register Assembly="SandlerControls" Namespace="SandlerControls" TagPrefix="SandlerChart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="dialog" title="Select report criteria:">
        <table>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                Select Month
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <select data-bind="options:months,optionsValue:'Value', optionsCaption:' ',optionsText: 'Text',value:selectedMonth, enable:makeSelectionDisable">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Select Year
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <select data-bind="options:years,optionsValue:'Value', optionsCaption:' ',optionsText: 'Text',value:selectedYear,enable:makeSelectionDisable">
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <input type="button" id="btnAddToSelection" class="sandlerButton" value="Add to selection"
                        data-bind="click:addSelection" /><br />
                    <input type="button" class="sandlerButton" value="Remove from selection" data-bind="click:removeSelection" />
                </td>
                <td>
                    <select multiple="multiple" data-bind="options:selectedCombinations, selectedOptions:selectedCombinationToRemove">
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <input type="button" id="btnGetReport" class="sandlerButton" value="Get Report" data-bind="click:getReport,visible:visibleGetReport" />
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <table style="width:100%;border: 0px solid white">
            <tr>
                <td style="width: 100%">
                    <div id="chartContainer" data-bind='visible:visibleContainer' style="text-align: center">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/indicator_medium.gif" />Please
                        wait...</div>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" class="sandlerButton" value="Modify Selection" data-bind="visible:visibleModifySelection, click:openCriteria" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        var href = window.location.href.split('/');
        var baseUrl = href[0] + '//' + href[2] + '/' + href[3];
        var months = [{ Text: 'January', Value: '1' }, { Text: 'February', Value: '2' }, { Text: 'March', Value: '3' }, { Text: 'April', Value: '4' }, { Text: 'May', Value: '5' }, { Text: 'June', Value: '6' }, { Text: 'July', Value: '7' }, { Text: 'August', Value: '8' }, { Text: 'September', Value: '9' }, { Text: 'October', Value: '10' }, { Text: 'November', Value: '11' }, { Text: 'December', Value: '12'}];
        var years = [{ Text: new Date().getFullYear(), Value: new Date().getFullYear() }, { Text: new Date().getFullYear() - 1, Value: new Date().getFullYear() - 1}];
        var monthYearCombinations = [{ Color: '3300ff', Value: '11', YearVal: '2012' }, { Color: 'ff6600', Value: '12', YearVal: '2012' }, { Color: '32df00', Value: '1', YearVal: '2013'}];
        var colors = ['3300ff', 'ff6600', '32df00'];
        function monthYearCombination(month, year, color) {
            this.Value = month,
            this.YearVal = year,
            this.Color = color
        }
        function pageViewModel() {
            var self = this;
            self.months = ko.observableArray(months);
            self.years = ko.observableArray(years);
            self.visibleGetReport = ko.observable(false);
            self.visibleContainer = ko.observable(false);
            self.visibleModifySelection = ko.observable(false);
            self.selectedMonth = ko.observable('');
            self.selectedYear = ko.observable('');
            self.monthYearCombinations = ko.observableArray([]);
            self.selectedCombinations = ko.observableArray([]);
            self.selectedCombinationToRemove = ko.observable('');

            self.makeSelectionDisable = ko.computed(function () {
                log(self.selectedCombinations().length);
                if (self.selectedCombinations().length == 3) {
                    self.visibleGetReport(true);
                    return false;
                }
                else {
                    self.visibleGetReport(false);
                    return true;
                }
            }, self);
            self.addSelection = function () {
                log(self.selectedMonth());
                log(self.selectedYear());
                if (self.selectedMonth() != undefined & self.selectedYear() != undefined) {
                    $.each(months, function (i, item) {
                        if (self.selectedMonth() == item.Value) {
                            self.selectedCombinations.push(item.Text + ' ' + self.selectedYear());
                            return false;
                        }
                    });
                }
                else {
                    alert('Please select proper combination');
                }
            }

            self.removeSelection = function () {
                log(self.selectedCombinationToRemove());
                $.each(self.selectedCombinationToRemove(), function (i, item) {
                    self.selectedCombinations.remove(item);
                });

            }

            self.getReport = function () {
                self.closeCriteria();
                self.visibleContainer(true);
                var month, year;
                $.each(self.selectedCombinations(), function (i, item) {
                    //                    log(colors[i]);
                    //                    log(item);
                    month = item.split(' ')[0];
                    year = item.split(' ')[1];
                    $.each(months, function (i, item) {
                        if (month == item.Text) {
                            month = item.Value;
                            self.monthYearCombinations.push(new monthYearCombination(month, year, colors[i]));
                            return false;
                        }
                    });
                    //                    log(month)
                    //                    log(year);
                });
                //log(self.monthYearCombinations());
                loadChart(self.monthYearCombinations());
                //self.visibleModifySelection(true);
            }
            self.openCriteria = function () {
                $('#dialog').dialog('open');
            }
            self.closeCriteria = function () {
                $('#dialog').dialog('close');
            }

            function loadChart(monthYearCombinationsToServer) {
                $.ajax({
                    url: baseUrl + "/api/Chart/",
                    type: 'GET',
                    contentType: 'application/json',
                    //data: { id: '', strChartIds: chartIds, strChartSubType: chartSubType, strDrillBy: '', strUserName: userName, strSearchParameter: searchParameter, monthYearCombinations: monthYearCombinations },
                    data: { id: '', strChartIds: chartIds, strChartSubType: chartSubType, strDrillBy: '', strUserName: userName, strSearchParameter: searchParameter, monthYearCombinations: monthYearCombinationsToServer },
                    success: function (data) {
                        log(data);
                        var myChart = new FusionCharts(baseUrl + '/FusionChartLib/' + data.SWF, 'myChartId', chartWidth, chartHeight, '0', '1');
                        myChart.setXMLData(data.ChartXML);
                        myChart.render('chartContainer');
                    }
                });
            }
        }

        $(document).ready(function () {
            $('#dialog').dialog({ autoOpen: false, width: 600, modal: true });
            $('#dialog').parent().appendTo($("form:first"));
            var pageVM = new pageViewModel();
            ko.applyBindings(pageVM);
            pageVM.openCriteria();

        });</script>
</asp:Content>
