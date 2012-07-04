<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="GapAnalysisCreate.aspx.cs" Inherits="GapAnalysisCreate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Button ID="noShowButton" runat="server" Style="display: none" />
    <asp:Panel ID="pnlChart" runat="server" CssClass="gaChartModalPopup" Width="60%"
        Style="display: block">
        <table width="100%">
            <tr>
                <td>
                    <input id="btnReDo" type="button" value="Re-Do Gap Analysis" class="blueButton" />
                    &nbsp;<input id="btnGoToDashBoard" type="button" value="Go to Dashboard" class="blueButton" />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="chartContainer" runat="server">
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ModalPopupExtender ID="pnlChart_ModalPopupExtender" runat="server" DynamicServicePath=""
        Enabled="True" TargetControlID="noShowButton" BackgroundCssClass="modalBackground"
        OkControlID="btnReDo" CancelControlID="btnGoToDashBoard" OnCancelScript="onCancel()"
        PopupControlID="pnlChart">
    </asp:ModalPopupExtender>
    <table align="center" width="80%" style="background-color: White">
        <tr>
            <td align="left" colspan="2">
                <b>Gap Analysis</b>
            </td>
            <td align="right">
                <b>(Note:Data compared to "Industry Averages")</b>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <b>Select the following "As - Is" data for your Gap Analysis:</b>
            </td>
        </tr>
        <tr>
            <td align="right">
                What is your current <b>Sales Cycle Time?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListSCTAsIs" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (months)
            </td>
        </tr>
        <tr>
            <td align="right">
                What is your current <b>Sales Efficiency?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListSEAsIs" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                How accurate is your <b>Sales Qualification?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListSQAsIs" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                What is your sales rep <b>Training Cost Savings?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListTCSAsIs" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                What is your sales rep <b>Quota Achievement?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListQAAsIs" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                What is your <b>Estimated Benifits Gained percent?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListEBGAsIS" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <b>Select the following "To - Be" data for your Gap Analysis:</b>
            </td>
        </tr>
        <tr>
            <td align="right">
                How short should your <b>Sales Cycle Time</b> be?
            </td>
            <td>
                <asp:DropDownList ID="drpListSCTToBe" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (months)
            </td>
        </tr>
        <tr>
            <td align="right">
                How large can your <b>Sales Efficiency</b> be?
            </td>
            <td>
                <asp:DropDownList ID="drpListSEToBe" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                Where should your <b>Sales Qualification</b> be?
            </td>
            <td>
                <asp:DropDownList ID="drpListSQToBe" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                How large can your <b>Training Cost Savings</b> be?
            </td>
            <td>
                <asp:DropDownList ID="drpListTCSToBe" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                How large is your sales rep <b>Quota Achievement?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListQAToBe" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td align="right">
                What is your <b>Estimated Benifits Gained percent?</b>
            </td>
            <td>
                <asp:DropDownList ID="drpListEBGToBe" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                (percentage)
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="btnViewGapAnalysisReport" runat="server" Text="View Gap Analysis Report"
                    CssClass="normalButton" OnClick="btnViewGapAnalysisReport_Click" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">

        function onCancel() {
            window.open('Default.aspx', '_self');
        }
    </script>
</asp:Content>
