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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:reportviewer id="ReportViewer1" runat="server" height="800" width="1100" AsyncRendering="false"></rsweb:reportviewer>

        <iframe id="frmPrint" name="frmPrint" runat="server" style = "display:none"></iframe> 

        <div id="spinner" class="spinner" style="display:none;">
            <table style="height:100%;width:100%;vertical-align:middle;">
            <tr>
                <td><img id="img-spinner" src="../Images/ajax-loader.gif" alt="Printing"/></td>
                <td><span style="font-family:Verdana; font-weight:bold;font-size:10pt;width:86px;">Printing...</span></td>
            </tr>
            </table>
        </div>

        </form>        
    </div>

   <%-- Reference : http://api.jqueryui.com/datepicker/#option-defaultDate--%>
    
<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        $("#spinner").bind("ajaxSend", function () {
            $(this).show();
        }).bind("ajaxStop", function () {
            $(this).hide();
        }).bind("ajaxError", function () {
            $(this).hide();
        });
        $(function () {
            showDatePicker();
        });
    });

    function showDatePicker() {

        //var parameterRow = $("#ParametersRowrvREXReport");
        var parameterRow = $("#ParametersRowReportViewer1");
        
        var innerTable = $(parameterRow).find("table").find("table");
        //var span = innerTable.find("span:contains('From Date (dd/mm/yyyy):')");
        var span = innerTable.find("span:contains('Select Start Date')");
        if (span) {
            var innerRow = $(span).parent().parent();
            var innerCell = innerRow.find("td").eq(1);
            var textFrom = innerCell.find("input[type=text]");
            innerCell = innerRow.find("td").eq(4);
            var textTo = innerCell.find("input[type=text]");

            $(textFrom).datepicker({
                defaultDate: "w",
                dateFormat: 'mm/dd/yy',
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $(textTo).datepicker("option", "StartDate", selectedDate);
                }
            });
            $(textFrom).focus(function (e) {
                e.preventDefault();
                $(textFrom).datepicker("show");
            });
            $(textTo).datepicker({
                defaultDate: "w",
                dateFormat: 'mm/dd/yy',
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $(textFrom).datepicker("option", "EndDate", selectedDate);
                }
            });
            $(textTo).focus(function () {
                $(textTo).datepicker("show");
            });
        }
    }

</script>
    
</body>
</html>
